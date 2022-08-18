@isTest
public class testCommunityPlatinumCase {
    
    @testSetup static void setup() {
    
        Case c = new Case();
        C.RecordTypeId = '0120B000000N93u';
        c.Subject = 'Test Case';
        c.Type = 'Tax Package';
        c.Status = 'New';
        c.OwnerId = '005U0000001DC1y';
        insert c;
        
        
    }
    
    @isTest
    public static void changeOwner() {
        
        Case c = [SELECT Id, OwnerId, Status FROM Case];
        
        c.OwnerId = '0050B000006okJa';
        update c;
        
        Case c1 = [SELECT Id, OwnerId, Status FROM Case];
        
        system.assertEquals('In Progress', c1.Status);
        
    }

}