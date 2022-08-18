public class PlatinumCreationHandler {
    
    
    public static void updatePrimaryContact(string accountId, String responseBody,string contactID) {
        
        PlatinumUser.newUser brandNewUser = (PlatinumUser.newUser)JSON.deserialize(responseBody, PlatinumUser.newUser.class);
        String wordPressId = brandNewUser.Id;
        
        updateContact(accountId, wordPressId,contactID);
        
    }
    
 
    public static void updateContact(String accountId, String wordPressId,string contactID){
        Contact c=[select Id, Email, Account_Roles__c, Platinum_Email__c, Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and id=:contactID limit 1 ];
        if(c!=null){
          c.Platinum_Wordpress_Id__c = wordPressId;
        if(c.Platinum_Email__c == null) c.Platinum_Email__c = c.Email; 
               update c;
        }
       // Contact c = getPrimaryOrOldestContact(accountId,contactID);
       
     
        
    }

   /* private static Contact getPrimaryOrOldestContact(Id accountId) {
        
        List<Contact> conList = new List<Contact>();
        
        for (Contact con : [SELECT Id, Email, Account_Roles__c, Platinum_Email__c, Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC]) {
            
            if (con.Account_Roles__c == 'Primary Contact') {
                conList.add(con);
            } 
            
            if (conList.size() == 0) {
                conList.add(con);
            }
            
        }
        
        return conList[0];
        
    }*/
    
}