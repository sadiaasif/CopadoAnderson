@RestResource(urlMapping='/ClientTeam/*')
global class FetchPlatinumTeam {
    
    public static string teamNumber;
    public static string msg;
    public static Map<String,String> msgMap = new Map<String,String>();
    @HttpGet
    global static void getTeamDetails(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        res.addHeader('Content-Type', 'application/json');
        Id clientId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug('Client Id: ' + clientId);
        try{
            if(clientId != null){
                if(isUsingTeams(clientId)){
                    List<Map<String,String>> teamDetails = fetchTeamInfo(teamNumber);
                    if(teamDetails.size() > 0){
                    	res.responseBody = Blob.valueOf(JSON.serialize(teamDetails));
                    }
                    else{
                        msgMap.put('Message','No members found against ' + teamNumber);
                        res.responseBody = Blob.valueOf(JSON.serialize(msgMap));
                    }
                }
                else{
                    msgMap.put('Message','Client not set for using Teams yet!');
                    res.responseBody = Blob.valueOf(JSON.serialize(msgMap));
                }
            }
            else{
                msgMap.put('Message','Invalid Request');
            	res.responseBody = Blob.valueOf(JSON.serialize(msgMap));
            }
        }
        catch(Exception e){
            msgMap.put('Message','Exception Occurred, failed to process request: ' + e);
            res.responseBody = Blob.valueOf(JSON.serialize(msgMap));
        }
    }
    
    public static boolean isUsingTeams(Id clientId){
        Account acc = [select teams__c, using_Teams__c from account where id =: clientId limit 1];
        if(acc.using_Teams__c == 'Yes' && acc.teams__c != null){
            teamNumber = acc.teams__c;
            return true;
        }
        return false;
        
    }
    
    public static List<Map<String,String>> fetchTeamInfo(String teamNo){
        List<Map<String,String>> userMapList = new List<Map<String,String>>();
        Map<String, String> userMap = new Map<String,String>();
        try{
            PlatinumTeamDetail__mdt teamData = [select masterlabel, team_image__c, team_phone__c from PlatinumTeamDetail__mdt where masterlabel =: teamNo limit 1];
            for(User usr : [select id,name,team__c,title,image_URL__c from user where team__c =: teamNo and isActive = true limit 1000]){
                userMap.put('Name',usr.Name);
                String title = usr.title != null ? usr.title : 'N/A';
                userMap.put('Title', usr.title);
                String img = usr.image_URL__c != null ? usr.image_URL__c : 'https://drive.google.com/uc?&id=0B05cYQRrxSNYZHRNN2R3RUZQUE0';
                userMap.put('Image', img);
                userMap.put('Team Phone', String.valueOf(teamData.Team_Phone__c));
                userMap.put('Team Name', teamNo);
                userMapList.add(userMap);
                userMap = new Map<String,String>();
            }
        }
        catch(Exception e){
            userMapList = new List<Map<String,String>>();
        }
    
        return userMapList;
        
    }

}