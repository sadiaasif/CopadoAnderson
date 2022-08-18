public class DisplayPlatinumUserInfo {
    
    @AuraEnabled
    public static user getPlatinumUser(Id contactId){
        
        return [SELECT Id, Email, IsActive, Name, Username FROM User WHERE ContactId = :contactId LIMIT 1];
   
    }

}