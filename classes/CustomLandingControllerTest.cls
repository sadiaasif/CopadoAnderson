@isTest(SeeAllData=false)
private class CustomLandingControllerTest {
    
    public static testmethod void testEntityFetchMethod()
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
        //testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Accounting_Coordinators__c='Marissa Yadao';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        try{
        insert testAccount;  
        }
        catch (DMLException e){
            System.debug('DML exception:::: ' + e);
        }
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
            Test.StartTest();
            User u = [select Name from user where id=:testAccount.Bookkeeper__c];        
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            CustomLandingController customLandingController = new CustomLandingController(controller);
            customLandingController.getEntityRecord();
            Test.stopTest();
        }
    }
    public static testmethod void testGetLinkMethod()
    {
        Test.StartTest();
        User uzr = new User();
        ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
        CustomLandingController customLandingController = new CustomLandingController(controller);
        customLandingController.GetLink();
        Test.stopTest();
    }
    public static testmethod void testGroupFetchMethod()
    {
        Test.StartTest();
        GroupMember gm = new GroupMember(Id = '011U0000003hNo7IAE');
        ApexPages.StandardController controller = new ApexPages.StandardController(gm);
        CustomLandingController customLandingController = new CustomLandingController(controller);
        customLandingController.getClientGroup();
        Test.stopTest();
    }
    
    public static testmethod void testUpdateUserMethod()
    {
        Id p = [select id from profile where name='Partner Community User'].id;
        Test.StartTest();
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
        uzr.IsActive =true;        
        try {
            insert uzr;
        } catch (DMLException e){
            System.debug('DML exception:::: ' + e);
        }
        PageReference pageRef = Page.MyEntities;
        Test.setCurrentPage(pageRef);
        User conv=new User();
        ApexPages.StandardController controller = new ApexPages.StandardController(conv);
        CustomLandingController customLandingController = new CustomLandingController(controller);
        customLandingController.updateUser();
        Test.stopTest();
        
    }
    
    public static testmethod void testUpdateAccountMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id p = [select id from profile where name='Partner Community User'].id;
        Test.StartTest();
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
        
        try {
            insert testAccount;
        } catch (DMLException e){
            System.debug('DML exception:::: ' + e);
        }
        /*Account a =[select Id,First_Name__c from Account where Id =: testAccount.Id ];          
        a.First_Name__c = 'Testing';
        try {
            update a;
        } catch (DMLException e){
            System.debug('DML exception:::: ' + e);
        }*/
        PageReference pageRef = Page.MyEntities;
        Test.setCurrentPage(pageRef);
        Account conv = new Account();
        ApexPages.StandardController controller = new ApexPages.StandardController(conv);
        CustomLandingController customLandingController = new CustomLandingController(controller);
        customLandingController.updateAccount();
        Test.stopTest();
        
    }
    
    public static testmethod void testCountentitiesMethod()
    { 
        Test.StartTest();
        User uzr=new User(); 
        ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
        CustomLandingController customLandingController = new CustomLandingController(controller);
        customLandingController.getCountentities();
        Test.stopTest();
    }
    
    public static testmethod void testforwardToCustomAuthPageMethod()
    {
        Test.StartTest();
        User uzr=new User(); 
        ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
        CustomLandingController customLandingController = new CustomLandingController(controller);
        customLandingController.forwardToCustomAuthPage();
        Test.stopTest();       
    }
}