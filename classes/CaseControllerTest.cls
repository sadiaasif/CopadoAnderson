@isTest(SeeAllData=false)
private class CaseControllerTest {

    public static testmethod void testQuestionItemMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
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
        cse.CreatedDate = system.now();
        cse.Status = 'New';
        cse.OwnerId = thisUser.Id;
        insert cse;
        String cN = cse.Case_Number__c;        
        CaseComment cc = new CaseComment();
        cc.CommentBody = 'Testing Comment';
        cc.CreatedById = UserInfo.getUserId();
        cc.ParentId = cse.Id;
        insert cc;  
        Integer Casetotal_size=[Select count() From Case where AccountId = :thisUser.AccountId];
        ApexPages.StandardController controller = new ApexPages.StandardController(cse);
        CaseController CseController = new CaseController(controller);
        CseController.getItems();
        CseController.getMonths();
        CseController.getYears();
        CseController.refreshGridCase();
        CseController.PreviousCase();
        CseController.NextCase();
        CseController.End();
        CseController.getCaseDisablePrevious();
        CseController.setCaseListSize(cseLstSze);
        CseController.getCaseDisableNext();
        CseController.getCaseTotal_size();
        CseController.getCasePageNumber();
        CseController.getCaseCount();
        CseController.getCaseTotalPages();
        CseController.getCaseListSize();
        CseController.getCasePaginationButtons();
        CseController.getCaseAnswer();
        Test.stopTest();  
       // }
    }

    public static testmethod void testCaseDetailMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];
        //User sap = [SELECT id, Name FROM User where UserType = 'PowerPartner' Limit 1]; 
      //  System.runAs ( thisUser ) {
        Test.StartTest();        
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
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        //testAccount.isPartner = true;
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
        insert cse;
        Case caseObj = [select id, casenumber from case where id = : cse.id];
        String cN =  caseObj.casenumber;
        CaseComment cc = new CaseComment();
        cc.CommentBody = 'Testing Comment';
        cc.CreatedById = UserInfo.getUserId();
        cc.ParentId = cse.Id;
        insert cc;
        ApexPages.StandardController controller = new ApexPages.StandardController(cse);
        CaseController CseController = new CaseController(controller);
        CaseController.getCaseDetails(cN);
        Test.stopTest();  
      //  }
    }
    
    public static testmethod void testClientQuestionMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];
        //User sap = [SELECT id, Name FROM User where UserType = 'PowerPartner' Limit 1]; 
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Case' and Name = 'Community Platinum Case'].Id;
      //  System.runAs ( thisUser ) {
        Test.StartTest(); 
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
        ChargentSFA__Transaction__c cSFA = new ChargentSFA__Transaction__c();
        cSFA.ChargentSFA__Amount__c = 10.00;
        cSFA.ChargentSFA__Response_Status__c = 'Approved';
        cSFA.ChargentSFA__Response_Message__c = 'Testing';
        cSFA.ChargentSFA__Opportunity__c = opp.Id;
		insert cSFA;
        String subj = 'Platinum Insurance Question';
        String cseDesc = 'New India Insurance Company Limited';
        String usrAccId = thisUser.AccountId;
        String recId = strRecordTypeId ;
        String cmnt = 'Testing Comment';
        String parentId = cse.Id;        
        String  crdNo = '123456789';
        String  expYear = '2020';
        String  expMonth = '05';
        String  cardHolderName = 'Justin Campese';
        String  cardSecurity = '900';
        CaseComment cseCmt = new CaseComment();
        ApexPages.StandardController controller = new ApexPages.StandardController(cse);
        CaseController CseController = new CaseController(controller);
        CaseController.saveClientQuestion(subj,cseDesc,usrAccId,recId);
        CaseController.saveClientQuestionWithPayment(usrAccId,crdNo,expYear,expMonth,cardHolderName,cardSecurity);
        CaseController.saveClientCase(cmnt,parentId);
        CaseController.ChargeExpedited(opp.Id,subj,cseDesc,usrAccId,recId);
        Test.stopTest();        
     //   }
    } 
    
}