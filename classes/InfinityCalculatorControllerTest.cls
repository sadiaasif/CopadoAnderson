@isTest(SeeAllData=true)
private class InfinityCalculatorControllerTest {
    
    public static testMethod void testInfiniteCalCulator(){
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c = 'Edward';
        testAccount.Last_Name__c = 'Lee';
        testAccount.Name='Test Account' ;
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
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
        uzr.ProfileId=p;
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = p;
        // uzr.AccountId = testAccount.Id;
        uzr.IsActive =true;
        insert uzr;
        Infinity_Calculator__c infinite = new Infinity_Calculator__c();
        infinite.Name ='Test Infinite';
        infinite.Account__c = testAccount.id;
        infinite.first_name__c='Test';
        insert infinite;
        system.runAs(uzr) // normally you want to verify the list has data first as this could cause null exception
        {
        ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
        InfinityCalculatorController infiniteController = new InfinityCalculatorController(controller);
        infiniteController.saveInfinity();
        }
        
    }
}