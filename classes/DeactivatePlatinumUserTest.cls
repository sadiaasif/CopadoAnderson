@isTest(SeeAllData=false)
public class DeactivatePlatinumUserTest {
    @isTest
    public static void testUserMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
       // User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'opportunity' and name = 'Platinum Subscription'].Id;
        // System.runAs ( thisUser ) {
        Test.StartTest(); 
        Integer cseLstSze = 10;
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.Campaign__c = cmp.Id;
       // testAccount.OwnerId = thisUser.Id;
       // testAccount.Assigned_CAM__c = 'Sara Winter';
        //testAccount.Assigned_CSR__c = 'Ambria Tibbs';
      //  testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        testAccount.Platinum_Client_View__c = 'Platinum';
        insert testAccount; 
        Contact cont = new Contact();
        cont.FirstName = 'FirstNames';
        cont.LastName = 'LastNames';
        cont.Email='email@email.coms';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        User uzr = new User();
        uzr.FirstName='Steves';
        uzr.LastName='Marks';
        uzr.Email='stevemark@gmail.coms';
        uzr.Username='stevemark@gmail.coms';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.LanguageLocaleKey='en_US'; 
        uzr.IsActive =true;
        uzr.ProfileId = p;
        uzr.ContactId = cont.Id;
        insert uzr; 
        Set<Id> usr = new Set<Id>();
        usr.add(uzr.id);
        Opportunity opp = new Opportunity();
        opp.AccountId = testAccount.Id;
        opp.RecordTypeId = strRecordTypeId;
        opp.Name = 'Dummyy Opportunity';
        opp.CloseDate = Date.today();
        opp.StageName = 'Closed Lost';
        opp.Override_Automation__c = True;
        insert opp; 
        testAccount.Platinum_Client_View__c = '';
        update testAccount;
        DeactivateUser.UserInactiveMethod(usr);
        Test.stopTest();  
        // }
    }
    
    @isTest
    public static void testUserMethodTwo()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
      //  User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'opportunity' and name = 'Platinum Subscription'].Id;
        // System.runAs ( thisUser ) {
        Test.StartTest(); 
        Integer cseLstSze = 10;
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Accounts' ;
        testAccount.First_Name__c='Edwards';
        testAccount.Last_Name__c='Lees';
        testAccount.Campaign__c = cmp.Id;
       // testAccount.OwnerId = thisUser.Id;
      //  testAccount.Assigned_CAM__c = 'Sara Winter';
        //testAccount.Assigned_CSR__c = 'Ambria Tibbs';
      //  testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='1234567829';
        testAccount.Platinum_Client_View__c = 'Infinity Only';
        insert testAccount;    
        Contact cont = new Contact();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        User uzr = new User();
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.LanguageLocaleKey='en_US'; 
        uzr.IsActive =true;
        uzr.ProfileId = p;
        uzr.ContactId = cont.Id;
        insert uzr; 
        Set<Id> usr = new Set<Id>();
        usr.add(uzr.id);
        Opportunity opp = new Opportunity();
        opp.AccountId = testAccount.Id;
        opp.RecordTypeId = strRecordTypeId;
        opp.Name = 'Dummy Opportunity';
        opp.CloseDate = Date.today();
        opp.StageName = 'Closed Won';            
        insert opp; 
        testAccount.Platinum_Client_View__c = 'Platinum Elite';
        update testAccount;
        DeactivateUser.UserActiveMethod(usr);
        Test.stopTest();  
        // }
    }
}