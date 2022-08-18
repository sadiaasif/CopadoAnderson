@isTest(seeAllData=false)
public class ChangePasswordCalloutTest {
    
    @isTest static void testChagepasswordCallout(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('staticChangePassword');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId,ContactId from User where UserRoleId = :portalRole.Id Limit 1]; 
        //Contact primaryCon = [SELECT Id From Contact WHERE Account_Roles__c = 'Primary Contact' Limit 1];
         
        Id pp = [select id from profile where name='Partner Community User'].id;
        Integer cseLstSze = 15;
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
        //testAccount.Assigned_CAM__c = 'Sara Winter';
        //testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount;
        
        Contact cont = new Contact();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        cont.Account_Roles__c = 'Primary Contact';
        
        insert cont;
       
        User uzr = new User();
        uzr.FirstName='Chistrian';
        uzr.LastName='Abraham';
        uzr.Email='Chistrian@gmail.com';
        uzr.Username='Chistrian@gmail.com';
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
        //uzr.AccountId = testAccount.Id;
        insert uzr; 
        
        Test.startTest();
        system.runAs(uzr) {
            ChangePasswordCallout.sendNewPwdToWordpress('kaushar@gmail.com', 'Chetu@1231');
            ChangePasswordCallout.preUsername();
        }
        
        Test.stopTest();
        
    }
}