public class PlatinumSale {
    
    @AuraEnabled @future(callout=true)
    public static void prepareCallout(Id accountId, Id opportunityId) {

        Account a = [SELECT Id, First_Name__c, Last_Name__c, E_Mail__c FROM Account WHERE Id = :accountId];
        contact c = getPrimaryOrOldestContact(accountId);
        
        if(c.Platinum_Wordpress_Id__c == null) {
        
        	String username = a.E_mail__c;
        	String email = a.E_mail__c;
            String firstName = a.First_Name__c;
            String lastName = a.Last_Name__c;
        	String password;
        	String accId = accountId;
        	String oppId = opportunityId;
        	String conId = c.Id;
        
       	 if(!Test.isRunningTest()) {
            try{ 
        		createPlatinumUserCallout.makePostCallout(username, email, password, accId, oppId, conId, firstName, lastName);
            } catch (Exception e) {
            debugInfo.createDebugLog(e);
            }
         }
       }
    }
    
    private static Contact getPrimaryOrOldestContact(Id accountId) {

        List<Contact> conList = new List<Contact>();
        
        for (Contact con : [SELECT Id, Account_Roles__c, Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC]) {
            
            if (con.Account_Roles__c == 'Primary Contact') {
                conList.add(con);
            } 
            
            if (conList.size() == 0) {
                conList.add(con);
            }
         
        }
        
        return conList[0];

    }

}