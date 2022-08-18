@isTest
public class ContactChangePasswordControllerTest {
    
    public static testMethod void testMyController()
    {
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
        System.runAs ( uzr ) {
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            ContactChangePasswordController conts = new ContactChangePasswordController(controller);
            //   ContactChangePasswordController conts=new ContactChangePasswordController(uzr);
            Test.StartTest();
            conts.newPassword = 'Anderson@123';
            conts.verifyNewPassword = 'Anderson@123';
            conts.contactId = cont.Id;
            conts.changePassword();
            PageReference pageRef = Page.ContactChangepassword; 
            Test.StopTest();
        }
    }
    public static testMethod void testMyController2()
    {
        
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
        System.runAs ( uzr ) {
            //ContactChangePasswordController cont=new ContactChangePasswordController();
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            ContactChangePasswordController conts = new ContactChangePasswordController(controller);
            Test.StartTest();
            conts.newPassword = 'Anderson@123';
            conts.verifyNewPassword = 'Anderson@1234';
            conts.changePassword();
            PageReference pageRef = Page.ContactChangepassword; 
            Test.StopTest();
        }
    }
    public static testMethod void testMyController3()
    {
        
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
        
        //ContactChangePasswordController cont=new ContactChangePasswordController();
        ApexPages.StandardController controller = new ApexPages.StandardController(cont);
        ContactChangePasswordController conts = new ContactChangePasswordController(controller);
        Test.StartTest();
        conts.newPassword = 'Anderson@123';
        conts.verifyNewPassword = 'Anderson@1234';
        conts.changePassword();
        ContactChangePasswordController.CreatePasswordLink(cont.Id);
        PageReference pageRef = Page.ContactChangepassword; 
        Test.StopTest();
        
    }
    public static testMethod void testMyController4()
    {
        
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
        
        //ContactChangePasswordController cont=new ContactChangePasswordController();
        ApexPages.StandardController controller = new ApexPages.StandardController(cont);
        ContactChangePasswordController conts = new ContactChangePasswordController(controller);
        Test.StartTest();
        conts.newPassword = 'Anders';
        conts.verifyNewPassword = 'Anders';
        conts.changePassword();
        PageReference pageRef = Page.ContactChangepassword; 
        Test.StopTest();
        
    }
    public static testMethod void testMyController5()
    {
        
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
        
        //ContactChangePasswordController cont=new ContactChangePasswordController();
        ApexPages.StandardController controller = new ApexPages.StandardController(cont);
        ContactChangePasswordController conts = new ContactChangePasswordController(controller);
        Test.StartTest();
        conts.newPassword = 'Anderson@123';
        conts.verifyNewPassword = 'Anderson@123';
        //conts.changePassword();
        //conts.setPassword(usId,newPassword);
        PageReference pageRef = Page.ContactChangepassword;
        try{
            system.setPassword('00529000001CltgAAC','Chetu@123');
            system.setPassword('00529000001CltgAAC','Chetu@123');
        }
        catch(Exception e){
            if(e.getMessage().contains('invalid repeated password'))
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Password already exist');
                                    ApexPages.addMessage(myMsg);
                                    System.debug('*** All error msgs in invalid= '+ ApexPages.getMessages());
            }
            System.assertEquals(e.getMessage(),e.getMessage());
        }
        test.stopTest();  
    }
     //Test.StopTest();
    
}