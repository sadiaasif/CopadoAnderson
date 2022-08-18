public class updateWordpress {
    
    @AuraEnabled
    public static void sendUpdate(Id conId){
        
        List<Contact> conList = [SELECT Platinum_Wordpress_Id__c, Platinum_Password__c, FirstName, LastName, Platinum_Email__c FROM Contact WHERE Id = :conId];
        
        wordpressUpdatePlatinumUser.processContacts(conList);
    }

    @AuraEnabled
    public static void resetPassword (Id conId){
        
        List<Contact> conList = [SELECT Platinum_Wordpress_Id__c, Platinum_Password__c, FirstName, LastName, Platinum_Email__c FROM Contact WHERE Id = :conId];
        
        wordpressUpdatePlatinumUser.processContactsforreset(conList);
    }
}