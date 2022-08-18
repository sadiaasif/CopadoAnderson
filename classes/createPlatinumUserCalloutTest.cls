@isTest
public class createPlatinumUserCalloutTest {
    
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
    
    @isTest static void testPostCallout() {
        
        Id accId = [SELECT Id FROM Account].id;
        Id conId = [SELECT Id FROM Contact].id;
        Id oppId = [SELECT Id FROM Opportunity].id;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new createPlatinumUserCalloutMock());
        
        HttpResponse response = createPlatinumUserCallout.makePostCallout('bazam','bazam@gmail.com','password', accId, oppId, conId, 'bob', 'apples');
        String contentType = response.getHeader('Content-Type');
        system.assert(contentType == 'application/json');
        System.assertEquals(201, response.getStatusCode());
        
        test.stopTest();
       
    }
    
      @isTest static void testPostCalloutFromCmp() {
        
        Id accId = [SELECT Id FROM Account].id;
        Id conId = [SELECT Id FROM Contact].id;
        Id oppId = [SELECT Id FROM Opportunity].id;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new createPlatinumUserCalloutMock());
        
        HttpResponse response = createPlatinumUserFromCmpCallout.makePostCallout('bazam','bazam@gmail.com','password', accId, oppId, conId, 'bob', 'apples');
        String contentType = response.getHeader('Content-Type');
        system.assert(contentType == 'application/json');
        System.assertEquals(201, response.getStatusCode());
        test.stopTest();
       
    }
    
     @isTest static void testPostCalloutserviceuser() {
        
        Id accId = [SELECT Id FROM Account].id;
        Id conId = [SELECT Id FROM Contact].id;
        Id oppId = [SELECT Id FROM Opportunity].id;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new createPlatinumUserCalloutMock());
        
       createPlatinumUserCallout.makePostCallouttoaddServiceUser('bazam','bazam@gmail.com','password', accId, oppId, conId, 'bob', 'apples');
                
      
      
        
        test.stopTest();
       
    }
    
      @isTest static void testPostCalloutFromCmpserviceuser() {
       
        Id accId = [SELECT Id FROM Account].id;
        Id conId = [SELECT Id FROM Contact].id;
        Id oppId = [SELECT Id FROM Opportunity].id;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new createPlatinumUserCalloutMock());
        
      createPlatinumUserCallout.makePostCallouttoaddServiceUser('bazam','bazam@gmail.com','password', accId, oppId, conId, 'bob', 'apples');
       
        test.stopTest();
       
    }
      @isTest static void testPostCalloutFromCmpSyncserviceuser() {
       
        Id accId = [SELECT Id FROM Account].id;
        Id conId = [SELECT Id FROM Contact].id;
        Id oppId = [SELECT Id FROM Opportunity].id;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new createPlatinumUserCalloutMock());
        
     createPlatinumUserFromCmpCallout.makePostCallouttoaddServiceUser('bazam','bazam@gmail.com','password', accId, oppId, conId, 'bob', 'apples');
       
        test.stopTest();
       
    } 
    
}