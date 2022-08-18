@isTest
public class createServicesUserCalloutTest {
    
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
        insert c;
        
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        insert o;
        
    }
    
    @isTest static void testPrepareCalloutFunction() {

        List<Id> conIdList = new List<Id>();
        Id conId = [SELECT Id FROM Contact].id;
        conIdList.add(conId);
      
        createServicesUser.prepareCallout(conIdList);
       
    }
    
     @isTest static void testPostCallout() {
        
        Id accId = [SELECT Id FROM Account].id;
        Id conId = [SELECT Id FROM Contact].id;
        Id oppId = [SELECT Id FROM Opportunity].id;
        
        
        Test.setMock(HttpCalloutMock.class, new createServicesUserCalloutMock());
        test.startTest();
         createServicesUser.makePostCallout('bazam', 'bazam@gmail.com', accId, conId, 'bob', 'apples');
        test.stopTest();
       
    }
    
}