@isTest
private class FormControllerTest {
    @testSetup
    static void initTestData() {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id pp = [select id from profile where name='Partner Community User'].id;
        
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;
        Account testAccount = new Account();
        testAccount.Name='Test Account';
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
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
        uzr.ProfileId=pp;
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = pp;     
        uzr.IsActive =true;
        insert uzr; 
        //User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];          
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];     
        // Knowledge__kav newArticle = new Knowledge__kav(Title='test article', Knowledge_Article_Category__c = 'Tax Organizers', UrlName='testarticleurl', Language='en_US');
        // Insert Article        
        // insert newArticle;
        // knowledge__kav obj1 = [SELECT Id,Title,KnowledgeArticleId FROM knowledge__kav WHERE id =: newArticle.Id];
        // KbManagement.PublishingService.publishArticle(obj1.KnowledgeArticleId, true);
    }
    static testMethod void TestMakeArticle() {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
       User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        User uzr = [select id from User where Username='stevemark@gmail.com' ];
        system.runAs(thisUser){
            Test.StartTest();
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            FormController FrmController = new FormController(controller);
            FrmController.getPrevRequired(); 
            FrmController.getNextRequired();
            FrmController.getCurrentPageNumber();
            FrmController.next();
            FrmController.previous();
            FrmController.search();
            FrmController.searchVideos();
            FrmController.fakeMethod();
            FrmController.fakeMethod1();
            FrmController.fakeMethod2();
            FrmController.fakeMethod3();
            Test.stopTest();
        }
    }
    
  static testMethod void testSearchFAQVideos() {
       UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
       User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
       User uzr = [select id from User where Username='stevemark@gmail.com' ];
        system.runAs(thisUser){
            Test.StartTest();
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            FormController FrmController = new FormController(controller);
            
            FrmController.searchFAQVideos();
            
            Test.stopTest();
        }
    }
}