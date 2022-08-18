//SCH-0036
@iStest
public class SyncSSNTest {
    
    
    @testSetup
    public static void createData() {
        
        Contact c = new contact();
        c.FirstName = 'Ted';
        c.LastName = 'Excellent Adventure';
        c.SSN__c = '123456789';
        insert c;
        
    }
    
    @isTest
    public static void SyncEncryptToTextSSN() {
        
        Contact c = [SELECT Id, UpdateSSN__c, SSN__c, LastName FROM Contact WHERE LastName = 'Excellent Adventure'];
        
        c.SSN__c = '448559667';
        update c;
        
        Contact con = [SELECT Id, SSN_Text__c, UpdateSSN__c, LastName FROM Contact WHERE LastName = 'Excellent Adventure'];
        system.assertEquals('448559667', con.SSN_Text__c);
        
    }
    
    @isTest
    public static void SyncTextToEncryptSSN() {
        
        Contact c = [SELECT Id, UpdateSSN__c, SSN__c, SSN_Text__c, LastName FROM Contact WHERE LastName = 'Excellent Adventure'];
        
        c.SSN_Text__c = '221133448';
        update c;
        
        Contact con = [SELECT Id, SSN_Text__c, UpdateSSN__c, SSN__c, LastName FROM Contact WHERE LastName = 'Excellent Adventure'];
        system.assertEquals('221133448', con.SSN__c);
        
    }

}