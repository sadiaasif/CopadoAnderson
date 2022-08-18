//SCH-0034
@iStest
public class UpdateSSNTest {
    
    
    @testSetup
    public static void createData() {
        
        Contact c = new contact();
        c.FirstName = 'Ted';
        c.LastName = 'Excellent Adventure';
        c.SSN__c = '123456789';
        insert c;
        
    }
    
    @isTest
    public static void updateSSN() {
        
        Contact c = [SELECT Id, UpdateSSN__c, LastName FROM Contact WHERE LastName = 'Excellent Adventure'];
        
        c.UpdateSSN__c = true;
        update c;
        
        Contact con = [SELECT Id, SSN_Text__c, UpdateSSN__c, LastName FROM Contact WHERE LastName = 'Excellent Adventure'];
        
        system.assertEquals('123456789', con.SSN_Text__c);
        
    }

}