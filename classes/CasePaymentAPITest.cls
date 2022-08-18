@isTest(SeeAllData=false)
public class CasePaymentAPITest {
    @testSetup
    static void dataSetup() {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];
        //User sap = [SELECT id, Name FROM User where UserType = 'PowerPartner' Limit 1]; 
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Case' and Name = 'Community Platinum Case'].Id;
      //  System.runAs ( thisUser ) {
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account';
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount;              
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;        
        Case cse = new Case();
        cse.AccountId = testAccount.Id;
        cse.ContactId = cont.Id;
        cse.Subject = 'Platinum Bookkeeping Question';
        cse.Description = 'Testing Descritpion';
        cse.Status = 'New';
        cse.Origin = 'Phone';
        cse.Priority = 'Expedited';
        insert cse;            
        ChargentBase__Gateway__c cbg = new ChargentBase__Gateway__c();
        cbg.ChargentBase__Active__c = true;
        cbg.Name = 'AuthorizeNetTestPayment';
        cbg.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        
        insert cbg;
        Opportunity opp = new Opportunity();
        opp.AccountId = testAccount.Id;
        opp.RecordTypeId = '012U0000000DFSxIAO';
        opp.Name = 'Case Opportunity';
        opp.CloseDate = Date.today();
        opp.StageName = 'Agreement Sent';            
        opp.ChargentSFA__Card_Month__c = '05';
        opp.ChargentSFA__Card_Name__c = 'Justin Campese';
        opp.ChargentSFA__Card_Number__c = '1234565';
        opp.ChargentSFA__Card_Year__c = '2020';
        opp.Amount = 250.00;
        opp.ChargentSFA__Charge_Amount__c = 250.00;
        insert opp; 
        
    }
    static testMethod void testCasePayment() {
        Account acc = [ SELECT Id FROM Account LIMIT 1 ];
        Opportunity opp=[select id,RecordTypeId from Opportunity LIMIT 1];
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Case' and Name = 'Community Platinum Case'].Id;
        RecordType rId = [SELECT Id, Name FROM RecordType where Id = :opp.RecordTypeId LIMIT 1];
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/CasePayment';
        request.httpMethod = 'POST';
        RestContext.request = request;
        test.startTest();
        String oppId = CasePaymentApi.getCaseDetails(acc.id,'4007000000027','2020','09','juned','900');
        test.stopTest();
        
    }
}