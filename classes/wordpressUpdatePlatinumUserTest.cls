@isTest
public class wordpressUpdatePlatinumUserTest {
    
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
        c.Platinum_Wordpress_Id__c = '1';
        c.Platinum_Email__c = 'bazam123@gmail.com';
        c.Platinum_Password__c = 'supersecurepassword';
        insert c;
        
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        insert o;
        
    }
    
    @isTest
    public static void runTestOne() {
        
        List<Contact> conList = [SELECT Platinum_Wordpress_Id__c, Platinum_Email__c, Platinum_Password__c, FirstName, LastName FROM Contact];
        
        wordpressUpdatePlatinumUser.processContacts(conList);
             wordpressUpdatePlatinumUser.processContactsforreset(conList);
        
    }
    
    @isTest static void testPostCallout() {
		
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new wordpressUpdatePlatinumUserCalloutMock());
        
        HttpResponse response = wordpressUpdatePlatinumUser.serverSendmessage('1','Bob','Apples', 'bazam123@gmail.com');
        // HttpResponse response = wordpressUpdatePlatinumUser.serverSendmessage('1','Bob','Apples', 'bazam123@gmail.com', 'masterpassword');
        String contentType = response.getHeader('Content-Type');
        system.assert(contentType == 'application/json');
        System.assertEquals(201, response.getStatusCode());
        test.stopTest();
        
    }
     @isTest static void testPostCalloutReset() {
		
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new wordpressUpdatePlatinumUserCalloutMock());
        
       // HttpResponse response = wordpressUpdatePlatinumUser.serverSendmessage('1','Bob','Apples', 'bazam123@gmail.com');
       HttpResponse response = wordpressUpdatePlatinumUser.serverSendmessageforreset('1','Bob','Apples', 'masterpassword');
        String contentType = response.getHeader('Content-Type');
        system.assert(contentType == 'application/json');
        System.assertEquals(201, response.getStatusCode());
        test.stopTest();
        
    }

}