public class ResetPlatinumPassword {

    @InvocableMethod
    public static void contactToBeReset(List<Id> contactIds) {
        
    List<Contact> contactList = [SELECT Id,Email,LastName FROM Contact Where Id IN :contactIds LIMIT 1];
        
    List<User> platinumUser = [SELECT Id FROM User WHERE Contactid = :contactList[0].id LIMIT 1];
    
    system.resetPassword(platinumUser[0].id, True);
        
    }
    
}