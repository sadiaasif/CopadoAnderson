@isTest
public class updateWordpressTest {
    
    @testSetup static void createTestData() {
        
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.FirstName = 'Bob';
        c.LastName = 'Apples';
        c.Email = 'bazam123@gmail.com';
        c.Account_Roles__c = 'Primary Contact';
        c.Platinum_Email__c = 'bazam123@gmail.com';
        c.Platinum_Wordpress_Id__c = '1';
        c.Platinum_Password__c = 'securepassword';
        insert c;
        
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        insert o;
        
    }
    
    @isTest static void callMethod() {
        
        Id c = [SELECT Id FROM Contact].id;
        
        updateWordpress.sendUpdate(c);
                updateWordpress.resetPassword(c);
        
    }

}