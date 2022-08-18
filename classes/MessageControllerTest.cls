@isTest(SeeAllData=false)
private class MessageControllerTest {
    
    public static testmethod void testIncomingTaskMethod()
    {        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id p = [select id from profile where name='Partner Community User'].id;        
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
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
        uzr.IsActive =true;
        insert uzr;
        Task t = new Task();
        t.OwnerId = UserInfo.getUserId();
        t.Subject='Donni';
        t.Status='Completed';
        t.WhatId = testAccount.Id;
        t.Priority='Normal';
        insert t;
        Task tskObj = [Select Id, WhatId, Subject from Task where Id = :t.Id];
        Id tskId = tskObj.Id;
        system.runAs(uzr){
            Test.StartTest();
            ApexPages.StandardController controller = new ApexPages.StandardController(t);
            MessageController MsgController = new MessageController(controller);
            MsgController.getIncomingTaskHistory();
            MessageController.getTaskDescription(tskId,cont.AccountId);
            Test.stopTest();     
        }
    }
    
}