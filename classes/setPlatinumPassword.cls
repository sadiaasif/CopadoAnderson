public class setPlatinumPassword {

    @InvocableMethod
    public static void contactToBeSet(List<Id> contactIds) {
    
	List<Contact> contactList = [SELECT Id,Email,LastName,Password__c FROM Contact Where Id IN :contactIds LIMIT 1];
        
    List<User> platinumUser = [SELECT Id FROM User WHERE Contactid = :contactList[0].id LIMIT 1];
    
    system.setPassword(platinumUser[0].id, contactList[0].Password__c);
        
    }
    
}