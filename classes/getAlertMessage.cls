public class getAlertMessage {
    
    @AuraEnabled
    public static string findAlertMessage(String accountId) {
        
        String alertmessage;
        
        Account a = [SELECT rrpu__Alert_Message__c FROM Account WHERE Id = :accountId LIMIT 1];
        
        alertmessage = a.rrpu__Alert_Message__c;
        
        return alertmessage;
        
    }

}