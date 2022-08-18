@isTest(SeeAllData=false)
public class PlatinumInvoiceControllerTest {
  
        /**
* This method is used to get code coverage of saveCardDetails,saveEditCardDetails, invoice pagination, save edit card details and many more method .
* 
* @author prateeks
* @date Dec 11, 2018
*/
     public static testmethod void testPlatinumMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId,ContactId from User where UserRoleId = :portalRole.Id Limit 1]; 
        //Contact primaryCon = [SELECT Id From Contact WHERE Account_Roles__c = 'Primary Contact' Limit 1];
         
        Id pp = [select id from profile where name='Partner Community User'].id;
        Integer cseLstSze = 15;
        Test.startTest();
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
        insert uzr; 

        Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
        ccd.Account__c = testAccount.Id;
        ccd.Card_Month__c = '04';
        ccd.Card_Number__c = '1234567896541236';
        ccd.Card_Security__c = '777';
        ccd.Card_Type__c = 'visa';
        ccd.Card_Year__c = '2020'; 
        ccd.Platinum_Subscription_Card__c = true;
        insert ccd;
        
        ChargentBase__Gateway__c cb = new ChargentBase__Gateway__c ();
        cb.Name = 'AuthorizeNetTestPayment';
        cb.ChargentBase__Active__c = true;
        cb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        insert cb;
        ChargentBase__Gateway__c cbb = new ChargentBase__Gateway__c ();
        cbb.Name = 'Platinum';
        cbb.ChargentBase__Active__c = true;
        cbb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        insert cbb;
        
        String nameVal= 'Edward Lee';
        String typeVal= 'Visa';
        String cardnumberVal= '1234567891234567';
        String expiryMonthVal= '05';
        String expiryYearVal= '2020';
        String cvvVal= '800';
        String noteVal= 'Test Card';
        String zipcodeVal= '110096';
        Boolean isChk = false;
        Id accId = testAccount.Id;
        String objName = 'opportunity';
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Closed Won';
        opp.AccountId = testAccount.Id;
        opp.CloseDate = Date.newInstance(2018, 09, 1);
        //opp.QB_Invoice_Number__c = '1234';
        opp.ChargentSFA__Card_Number__c = cardnumberVal;
        insert opp;
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Testing';
        opp2.StageName = 'Closed Won';
        opp2.AccountId = testAccount.Id;
        opp2.CloseDate = Date.newInstance(2018, 09, 10);
        //opp.QB_Invoice_Number__c = '12345';
        opp.ChargentSFA__Card_Number__c = cardnumberVal;
        insert opp2;
        
        Id crd = ccd.Id;
        
        List<Opportunity> commaSepIds = [select Id from Opportunity LIMIT 10];
        String[] tmp1 = New String[]{};
            for(Opportunity op : commaSepIds){
                tmp1.add(op.id);
            }
        String idString = string.join(tmp1,',');
        system.debug(' == idString === ' + idString);
      /*  ChargentSFA__Transaction__c ct = new ChargentSFA__Transaction__c();
        ct.ChargentSFA__Amount__c = 0.05;
        ct.ChargentSFA__Response_Status__c = 'Approved';
        ct.ChargentSFA__Response_Message__c = 'This transaction has been approved.';
        ct.ChargentSFA__Opportunity__c = opp.id;
        insert ct;     */      
        
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        User usr = new User(
            LastName = 'Abraham',
            FirstName='Christian ',
            Alias = 'cabraham',
            Email = 'cabraham@test.com',
            Username = 'cabraham.liveston@test.com',
            ProfileId = profileId.id,
            TimeZoneSidKey = 'GMT',
            LanguageLocaleKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LocaleSidKey = 'en_US'
		);
        insert usr;
        
        ApexPages.StandardController controller = new ApexPages.StandardController(opp);
        PlatinumInvoiceController PlatinumController = new PlatinumInvoiceController(controller);
        PlatinumController.ObjectFields(objName);
        PlatinumInvoiceController.getCardDetailsId(crd);
        PlatinumInvoiceController.saveCardDetails(nameVal, zipcodeVal,typeVal, cardnumberVal, expiryMonthVal, expiryYearVal, cvvVal, noteVal, accId, true);
        PlatinumInvoiceController.saveEditCardDetails(nameVal,zipcodeVal, typeVal, cardnumberVal, expiryMonthVal, expiryYearVal, cvvVal, noteVal, accId,crd,isChk);
        PlatinumInvoiceController.saveEditCardDetails(nameVal,zipcodeVal, typeVal, cardnumberVal, expiryMonthVal, expiryYearVal, cvvVal, noteVal, accId,crd,true);
        PlatinumInvoiceController.MyOpportunities(idString,crd);
        PlatinumController.getBillingHistory();
        PlatinumController.getcardList();
        PlatinumController.getInvoicePaginationButtons();
        PlatinumController.refreshGridInvoice();
        PlatinumController.PreviousInvoice();
        PlatinumController.NextInvoice();
        PlatinumController.End();
        PlatinumInvoiceController.deleteCard(crd);
        PlatinumController.getDisablePreviousInvoice();
        PlatinumController.getDisableNextInvoice();
        PlatinumController.getTotal_sizeInvoice();
        PlatinumController.getPageNumberInvoice();
        PlatinumController.getCountInvoice();
        PlatinumController.getTotalPagesInvoice();
        PlatinumController.getListSizeInvoice();
        PlatinumController.setListSizeInvoice(cseLstSze);
        PlatinumInvoiceController.Charge(opp.id);
        PlatinumController.TestCall();
        PlatinumController.CardCall();
        Test.stopTest();  
    }   
    
    /**
* This method is used to get code coverage of else part of platinum save edit card details method .
* 
* @author prateeks
* @date Dec 11, 2018
*/
    public static testmethod void testPlatinumCoverCreditMethod()
    {
        Test.startTest();
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        system.debug('=== portalRole ===' + portalRole);
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];
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
        //testAccount.Assigned_CAM__c = 'Sara Winter';
       // testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456789654123435';
        insert testAccount; 
        Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
        ccd.Account__c = testAccount.Id;
        ccd.Card_Month__c = '04';
        ccd.Card_Number__c = '12345678965412362';
        ccd.Card_Security__c = '777';
        ccd.Card_Type__c = 'visa';
        ccd.Card_Year__c = '2020';
        ccd.Billing_Zip_Postal__c = '110096';
        ccd.Platinum_Subscription_Card__c = false;
        insert ccd;
        
        String nameVal= 'Edward Lee';
        String typeVal= 'Visa';
        String cardnumberVal= '1234567891234567';
        String expiryMonthVal= '05';
        String expiryYearVal= '2020';
        String cvvVal= '800';
        String noteVal= 'Test Card';
        String zipcodeVal = '110096';
        Id accId = testAccount.Id;
        Id crd = ccd.Id;
        ApexPages.StandardController controller = new ApexPages.StandardController(thisUser);
        PlatinumInvoiceController PlatinumController = new PlatinumInvoiceController(controller);
        PlatinumController.selectedPageInvoice = '1';
        PlatinumController.total_sizeInvoice = 10;		
        PlatinumInvoiceController.saveEditCardDetails(nameVal, zipcodeVal,typeVal, cardnumberVal, expiryMonthVal, expiryYearVal, cvvVal, noteVal, accId,crd,true);
        PlatinumController.getInvoicePaginationButtons();
        test.stopTest();
    }
    
    /**
* This method is mainly used to get code coverage of My oppprtunities method .
* 
* @author prateeks
* @date Dec 11, 2018
*/
    public static testmethod void testPlatinumSecondMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];
        //Contact primaryCon = [SELECT Id From Contact WHERE Account_Roles__c = 'Primary Contact' Limit 1];
        Test.startTest();
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
        //testAccount.Assigned_CAM__c = 'Sara Winter';
        //testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount; 
        Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
        ccd.Account__c = testAccount.Id;
        ccd.Card_Month__c = '04';
        ccd.Card_Number__c = '1234567891234567';
        ccd.Card_Security__c = '777';
        ccd.Card_Type__c = 'visa';
        ccd.Card_Year__c = '2020';
        ccd.Billing_Zip_Postal__c='110096';
        insert ccd;
        ChargentBase__Gateway__c cb = new ChargentBase__Gateway__c ();
        cb.Name = 'AuthorizeNetTestPayment';
        cb.ChargentBase__Active__c = true;
        cb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        insert cb;
        ChargentBase__Gateway__c cbb = new ChargentBase__Gateway__c ();
        cbb.Name = 'Platinum';
        cbb.ChargentBase__Active__c = true;
        cbb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        insert cbb;
        String nameVal= 'Edward Lee';
        String typeVal= 'Visa';
        String cardnumberVal= '1234567891234567';
        String expiryMonthVal= '05';
        String expiryYearVal= '2020';
        String cvvVal= '800';
        String noteVal= 'Test Card';
        String zipcodeVal = '110096';
        Id accId = testAccount.Id;
        String objName = 'opportunity';
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Closed Won';
        opp.AccountId = testAccount.Id;
        opp.CloseDate = Date.newInstance(2018, 09, 1);
        insert opp;            
        Id crd = ccd.Id;
        
        List<Opportunity> commaSepIds = [select Id from Opportunity LIMIT 10];
        system.debug(' == commaSepIds === ' + commaSepIds);
        String[] tmp1 = New String[]{};
            for(Opportunity op : commaSepIds){
                tmp1.add(op.id);
            }
        String idString = string.join(tmp1,',');
        system.debug(' == idString === ' + idString);
        ApexPages.StandardController controller = new ApexPages.StandardController(opp);
        PlatinumInvoiceController PlatinumController = new PlatinumInvoiceController(controller);
        PlatinumInvoiceController.MyOpportunities(idString,crd);
        Test.stopTest();  
    } 
    
    
    /**
* This method is used to get code coverage of billing history method and entity wrapper class.
* 
* @author prateeks
* @date Dec 11, 2018
*/
    public static testMethod void billingHistory(){
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];
        Test.startTest();
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
        //testAccount.Assigned_CAM__c = 'Sara Winter';
       // testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount; 
        
        RecordType rt = [SELECT Id FROM RecordType WHERE sObjectType = 'Entities__c' AND Name = 'Foreign Qualification'];
        system.debug(rt);
        
        Entities__c ent = new Entities__c();
        ent.recordtypeid = rt.id;
        ent.Origin__c = 'Anderson';
        ent.Organization_State__c = 'Alabama';
        ent.Name = 'test';
        insert ent;
        
        String objName = 'opportunity';
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Closed Won';
        opp.AccountId = testAccount.Id;
        opp.CloseDate = Date.newInstance(2018, 09, 1);
        opp.Entity__c = ent.id;
        insert opp;
        
        ApexPages.StandardController controller = new ApexPages.StandardController(opp);
        PlatinumInvoiceController PlatinumController = new PlatinumInvoiceController(controller);
        
        ChargentSFA__Transaction__c obj = new ChargentSFA__Transaction__c();
        obj.ChargentSFA__Type__c = 'Charge';
        obj.ChargentSFA__Response_Status__c = 'Success';
        obj.ChargentSFA__Amount__c = 100;
        
        PlatinumInvoiceController.EntityWrapper ent1 = new PlatinumInvoiceController.EntityWrapper(obj,'Hello');
      
        PlatinumController.getBillingHistory();
        Test.stopTest();
    }
    
}