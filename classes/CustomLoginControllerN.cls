/**
* A controller class to used to login into anderson community site. 
*/
global class CustomLoginControllerN {
    //public String username {get; set;}
    //public String password {get; set;}
    
    webservice static String login(String AccountId) {
        
        //List<User> Usr = [SELECT Id,ContactId FROM User WHERE AccountId = : AccountId]; 
        List<User> usr = [SELECT Id, ContactId FROM User where ContactId in (select Id from Contact where AccountId=:AccountId and Account_Roles__c='Primary Contact') LIMIT 1]; 
        system.debug('output' + usr);
        
        if(Usr.size()>0){
            String ContactId = usr.get(0).ContactId;
            system.debug('contactid' + ContactId);
            //String URL = '/servlet/servlet.su?oid=00D29000000DMwA&retURL=%252F'+Usr.get(0).ContactId+'&sunetworkid=0DB2900000000ED&sunetworkuserid='+Usr.get(0).Id;
            String URL = '/servlet/servlet.su?oid=00DU0000000JQSo&retURL=%252F'+usr.get(0).ContactId+'&sunetworkid=0DB0B0000004EF4&sunetworkuserid='+usr.get(0).Id;
            system.debug('url' + URL);
            return URL;
        }else{
            return null;
        }
    }
}