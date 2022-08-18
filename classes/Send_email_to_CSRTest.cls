@isTest(SeeAllData = false)
public class Send_email_to_CSRTest {
	private static testMethod void sendEmailToCSRTest(){
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, Name,  AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        RecordType rt = [SELECT Id, Name, SobjectType FROM RecordType where name = 'Community Platinum Case' and SobjectType = 'Case'];
        //System.runAs ( thisUser ) {
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
            testAccount.OwnerId = thisUser.Id;
            testAccount.Assigned_CAM__c = 'Sara Winter';
            testAccount.Bookkeeper__c = thisUser.Id;
            testAccount.phone='123456782';
        	testAccount.Assigned_CSR__c = 'Alexandria Lessard';
            insert testAccount;              
            Contact cont = new Contact ();
            cont.FirstName = 'FirstName';
            cont.LastName = 'LastName';
            cont.Email='email@email.com';
            cont.phone='12345678';
            cont.AccountId=testAccount.Id;
            insert cont;
            Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
            ccd.Account__c = testAccount.Id;
            ccd.Card_Month__c = '04';
            ccd.Card_Number__c = '1234567896541236';
            ccd.Card_Security__c = '777';
            ccd.Card_Type__c = 'visa';
            ccd.Card_Year__c = '2020'; 
        	ccd.Mail_Check__c = 1;
        	ccd.Platinum_Subscription_Card__c = true;
            insert ccd;
            Test.stopTest();
       // }
        
    }
    	private static testMethod void sendEmailToCSRTest2(){
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, Name,  AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        RecordType rt = [SELECT Id, Name, SobjectType FROM RecordType where name = 'Community Platinum Case' and SobjectType = 'Case'];
        //System.runAs ( thisUser ) {
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
            testAccount.OwnerId = thisUser.Id;
            testAccount.Assigned_CAM__c = 'Sara Winter';
            testAccount.Bookkeeper__c = thisUser.Id;
            testAccount.phone='123456782';
        	testAccount.Assigned_CSR__c = 'Alexandria Lessard';
            insert testAccount;              
            Contact cont = new Contact ();
            cont.FirstName = 'FirstName';
            cont.LastName = 'LastName';
            cont.Email='email@email.com';
            cont.phone='12345678';
            cont.AccountId=testAccount.Id;
            insert cont;
            Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
            ccd.Account__c = testAccount.Id;
            ccd.Card_Month__c = '04';
            ccd.Card_Number__c = '1234567896541236';
            ccd.Card_Security__c = '777';
            ccd.Card_Type__c = 'visa';
            ccd.Card_Year__c = '2020'; 
        	ccd.Platinum_Subscription_Card__c = true;
            insert ccd;
            ccd.Card_Month__c = '05';
            update ccd;
            Test.stopTest();
       // }
        
    }
    
    
    private static testMethod void sendEmailToCSRTest3(){
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, Name,  AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        RecordType rt = [SELECT Id, Name, SobjectType FROM RecordType where name = 'Community Platinum Case' and SobjectType = 'Case'];
        //System.runAs ( thisUser ) {
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
            testAccount.OwnerId = thisUser.Id;
            testAccount.Assigned_CAM__c = 'Sara Winter';
            testAccount.Bookkeeper__c = thisUser.Id;
            testAccount.phone='123456782';
        	testAccount.Assigned_CSR__c = '';
            insert testAccount;              
            Contact cont = new Contact ();
            cont.FirstName = 'FirstName';
            cont.LastName = 'LastName';
            cont.Email='email@email.com';
            cont.phone='12345678';
            cont.AccountId=testAccount.Id;
            insert cont;
            Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
            ccd.Account__c = testAccount.Id;
            ccd.Card_Month__c = '04';
            ccd.Card_Number__c = '1234567896541236';
            ccd.Card_Security__c = '777';
            ccd.Card_Type__c = 'visa';
            ccd.Card_Year__c = '2020'; 
        	ccd.Mail_Check__c = 1;
        	ccd.Platinum_Subscription_Card__c = true;
            insert ccd;
        	ccd.Card_Number__c = '1234577896541236';
        	update ccd;
            Test.stopTest();
       // }
        
    }
}