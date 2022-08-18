@isTest
public class LoginCountTest {
    
    @isTest
    public static void userUpdate() {
        User u = [Select Id,UpdateLoginCount__c FROM User WHERE Name = 'Nick Frates'];
        
        u.UpdateLoginCount__c = true;
        update u;
        
        
    }
}