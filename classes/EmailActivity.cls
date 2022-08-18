@RestResource(urlmapping='/AccountEmailActivity/*')
global class EmailActivity {
    
    @HttpGet
    global static List<ActivityHistory> getActivityHistory()
    {
        
        List<ActivityHistory> lstActivities;
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        String accountid=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug('account id:'+accountid);
        try{      
            //system.debug('==== con.Accountid  ====' + con.Accountid);
            List<Account>lstaccounthist=[SELECT id,(SELECT Id, Status, ActivityType, Description, Subject, CreatedDate FROM ActivityHistories where ActivityType = 'Email' ORDER BY ActivityDate DESC, LastModifiedDate DESC LIMIT 200) FROM Account WHERE id =:accountid
                                         LIMIT 1000]; 
            system.debug('lstaccount==='+lstaccounthist);
            List<ActivityHistory>listacti=new List<ActivityHistory>();	
            for(Account acc: lstaccounthist){
                listacti.addall(acc.ActivityHistories);
            }
            system.debug('==== listacti  ====' + listacti);
            system.debug('=====listacti size=='+listacti.size());
            return listacti;
        } catch(Exception e){
            system.debug('==== Exception  ====' + e);
            return null;
        }
        //return lstActivities;  
    }
}