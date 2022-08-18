@isTest
public class ClientStrategyPaheCtrlCopyTest {

      @testSetup
    public static void createTestData() {
        List<Opportunity> opList=new  List<Opportunity>();
        List<Account> acList=new List<Account>();
        List<contact> conList=new List<contact>();
        List<entities__c> enlist=new List<entities__c>();
        List<task> taskList=new List<task>();
        List<Case> Clist=new List<Case>();
          Id devBKCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
           Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
         Id devoppAsRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Anderson System Case').getRecordTypeId();
          Id devoppEFRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
          Id devoppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
         Id devoppstateRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
          Id devoppStdRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
          Id devoppPenRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
         Id devoppEntityFormRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id devoppEFSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
          Id devoppTaxRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Id devoppEnLandTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Land Trust').getRecordTypeId();
        Id devoppEnLivingTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
       
        
          Id serviceProfileID=[Select Id,name from profile where name='Law Coordinator' limit 1].id;
        Id serviceuser=[select id from user where profileId=:serviceProfileID limit 1].id;
         Id AdvisorAdminProfileID=[Select Id,name from profile where name='Advisor Admins' limit 1].id;
        Id Advisoreuser=[select id from user where profileId=:AdvisorAdminProfileID limit 1].id;
           Account a = new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        
       acList.add(a);
           Account a1 = new Account();
        a1.Name = 'Bob2 Apples2';
        a1.First_Name__c='Bob2';
        a1.Last_Name__c='Apples2';
        a1.Date_User_Advisor_Notes__c='Test Advisor notes';
        a1.Date_User_Partner_Notes__c='Test Partner Notes';
        a1.Bookkeeping_Notes__c='Test Bk Notes';
        a1.Service_Notes__c='Test Service Notes';
        a1.Tax_Notes__c='Test Tax Notes';
        a1.Renewal_Notes__c='Test Renewal Notes';
          a1.Update_Tax_Consult_Notes__c='Test tax consult Notes';
          a1.Update_Structure_Comments__c='Test Structure Notes';
          a1.Update_Keep_more_Solution__c='Test Keep more Solution Notes';
       acList.add(a1);
        insert acList;
              Contact con=new Contact();
        con.firstname='Bob';
        con.LastName='Apples';
        con.AccountId=a.id;
       conList.add(con);
        
        Contact con1=new Contact();
        con1.firstname='Bob';
        con1.LastName='Apples';
        con1.AccountId=a1.id;
           conList.add(con1);
    insert conList;
        
        Case c=new Case();
        c.Subject='TEst BK Case';
        C.RecordTypeId=devBKCaseRecordTypeId;
        c.Info_Sent_to_ABA_By__c='Access';
        c.QuickBooks_Version__c='QBO';
        c.Account=a;
      c.Status='New';
        Clist.add(c) ;
       
           Case c1=new Case();
        c1.Subject='TEst As Case';
        C1.RecordTypeId=devoppAsRecordTypeId;
        c1.Info_Sent_to_ABA_By__c='Access';
        c1.QuickBooks_Version__c='QBO'; 
        c1.Account=a;
        c1.Status='New';
       Clist.add(c1);
        
       Entities__c en=new Entities__c();
        en.RecordTypeId=devoppEnLivingTrustRecordTypeId;
        en.Name='Test Living Trust';
        en.Organization_State__c='Alabama';
        en.Primary_Client__c=a.id;
       enlist.add(en);
           Entities__c en1=new Entities__c();
        en1.RecordTypeId=devoppEnLandTrustRecordTypeId;
        en1.Name='Test Land Trust';
         en1.Primary_Client__c=a.id;
        en1.Organization_State__c='Alabama';
        enlist.add(en1);

         
        insert enlist;
         
        Opportunity opp=new Opportunity();
        opp.RecordTypeId=devoppBkRecordTypeId;
        opp.CloseDate=system.today();
        opp.StageName='Closed Won';
        opp.AccountId=a.id;
        opp.Name='Test Bk Sale';
       opList.add(opp);
        
         Opportunity opp1=new Opportunity();
        opp1.RecordTypeId=devoppRecordTypeId;
        opp1.CloseDate=system.today();
        opp1.StageName='Closed Won';
        opp1.AccountId=a.id;
        opp1.Name='Platinum Subscription';
        opList.add(opp1);
        
        Opportunity opp2=new Opportunity();
        opp2.RecordTypeId=devoppRecordTypeId;
        opp2.CloseDate=system.today()+4;
        opp2.StageName='Fulfillment/Partial Payment';
        opp2.AccountId=a.id;
        opp2.Name='Test Std Renewal';
        opList.add(opp2);
       
        Opportunity opp3=new Opportunity();
        opp3.RecordTypeId=devoppTaxRecordTypeId;
        opp3.CloseDate=system.today();
        opp3.StageName='Closed Won';
        opp3.AccountId=a.id;
        opp3.Name='Test Tax Sale';
      opList.add(opp3);
        
          Opportunity opp4=new Opportunity();
        opp4.RecordTypeId=devoppEFSalesRecordTypeId;
        opp4.CloseDate=system.today();
        opp4.StageName='Fulfillment/Partial Payment';
        opp4.AccountId=a.id;
        opp4.Name='Test Bk Sale';
       opList.add(opp4);
        insert opList;
        
        task t=new task ();
        t.WhatId=a.id;
        t.Subject='Test call Task';
          t.ownerID=Advisoreuser;
        t.RecordTypeId=devoppcallRecordTypeId;
       taskList.add(t); 
        
         task t1=new task ();
        t1.WhatId=a.id;
        t1.ownerID=serviceuser;
        t1.Subject='Test call Task';
        t1.RecordTypeId=devoppcallRecordTypeId;
        taskList.add(t1); 
        insert taskList;
        
        H2S__HarvestProject__c hp=new H2S__HarvestProject__c();
        hp.H2S__Account__c=a.id;
        hp.H2S__Archived__c=False;
        hp.name='Test';
        insert hp;
        
        Refund__c r=new Refund__c();
        r.Client__c=a.id;
        r.Name='Test Refund';
        insert r;
        
        
    }
    @isTest
    static void TestaccordionDisplay(){
          createTestData();
        Account a =[Select id,Name from account where First_Name__c='Bob' limit 1];
        test.startTest();
        ClientStrategyPaheCtrlCopy.getClientSales(a.Id);
        ClientStrategyPaheCtrlCopy.getTotalValueofTaxSales(a.Id);
         ClientStrategyPaheCtrlCopy.getTotalValueofBKSales(a.Id);
         ClientStrategyPaheCtrlCopy.getTotalValueofSales(a.Id);
      
        ClientStrategyPaheCtrlCopy.getEFSalesRecord(a.Id);
        ClientStrategyPaheCtrlCopy.getAdvisorcalltasks(a.Id);
        ClientStrategyPaheCtrlCopy.getServicecalltasks(a.Id);
      
          ClientStrategyPaheCtrlCopy.getEntitieswithTaxreturn(a.Id);
        
        ClientStrategyPaheCtrlCopy.getsalePlatinumSalesRecord(a.Id);
        ClientStrategyPaheCtrlCopy.getRenewalSalesRecord(a.Id);
          ClientStrategyPaheCtrlCopy.getsaleFillingFeeSalesRecord(a.Id);
          ClientStrategyPaheCtrlCopy.getProjectsNotArchived(a.Id);
        ClientStrategyPaheCtrlCopy.getTaxSalesRecord(a.Id);
        ClientStrategyPaheCtrlCopy.getslectedEntitieswithTaxreturn(a.Id,'All');
         ClientStrategyPaheCtrlCopy.getEntitieswithTaxNamePicklict(a.Id);
        ClientStrategyPaheCtrlCopy.getRefundRecord(a.Id);
        ClientStrategyPaheCtrlCopy.getNotesTypepicklist();
         ClientStrategyPaheCtrlCopy.getsetSSQ(a.Id);
        ClientStrategyPaheCtrlCopy.CheckEvetLisence(UserInfo.getUserId());
        ClientStrategyPaheCtrlCopy.getAttendee(a.Id,UserInfo.getUserId());
        ClientStrategyPaheCtrlCopy.getComplaints(a.Id);
        ClientStrategyPaheCtrlCopy.getBaseUrl(a.Id);
        test.stopTest();
    }
     @isTest
    static void TestupdateNotes(){
          createTestData();
          Account a =[Select id,Advisor_Notes__c,Partner_Notes__c,Update_Tax_Consult_Notes__c,Update_Structure_Comments__c,Structure_Comments__c,Tax_Consult_Notes__c,Date_User_Partner_Notes__c,Date_User_Advisor_Notes__c,Tax_Notes__c,Update_Tax_Notes__c,Update_Bookkeeping_Notes__c,Bookkeeper__c,Bookkeeping_Notes__c,Service_Notes__c,Update_Service_Notes__c,Renewal_Notes__c,Update_Renewal_Notes__c,Keep_More_Solution_Notes__c,Update_Keep_more_Solution__c from account where First_Name__c='Bob'limit 1 ];
        User u =[Select id,Name from user where name='Anderson Advisors' and IsActive=True];
        test.startTest();
        a.Partner_Notes__c='Test partner';
        a.Advisor_Notes__c='Test Advisor';
        a.Update_Bookkeeping_Notes__c='Test Bk Notes';
        a.Update_Renewal_Notes__c='Test Renewal Notes';
        a.Update_Service_Notes__c='Test Service Notes';
        a.Update_Tax_Notes__c='Test tax Notes';
     a.Update_Tax_Consult_Notes__c='Test tax consult Notes';
          a.Update_Structure_Comments__c='Test Structure Notes';
          a.Update_Keep_more_Solution__c='Test Keep more Solution Notes';
        ClientStrategyPaheCtrlCopy.updatedAccRecords(a.Id, a, u.id);
        system.assertEquals('Test Advisor', a.Advisor_Notes__c, 'Please Check !');
        test.stopTest();
        
    }
     @isTest
     static void TestappendupdateNotes(){
           createTestData();
          Account a =[Select id,Advisor_Notes__c,Partner_Notes__c,Update_Tax_Consult_Notes__c,Update_Structure_Comments__c,Structure_Comments__c,Tax_Consult_Notes__c,Date_User_Partner_Notes__c,Date_User_Advisor_Notes__c,Tax_Notes__c,Update_Tax_Notes__c,Update_Bookkeeping_Notes__c,Bookkeeper__c,Bookkeeping_Notes__c,Service_Notes__c,Update_Service_Notes__c,Renewal_Notes__c,Update_Renewal_Notes__c,Keep_More_Solution_Notes__c,Update_Keep_more_Solution__c from account where First_Name__c='Bob2'limit 1 ];
        User u =[Select id,Name from user where name='Anderson Advisors' and IsActive=True];
        test.startTest();
        a.Partner_Notes__c='Test partner';
        a.Advisor_Notes__c='Test Advisor';
        a.Update_Bookkeeping_Notes__c='Test Bk Notes';
        a.Update_Renewal_Notes__c='Test Renewal Notes';
        a.Update_Service_Notes__c='Test Service Notes';
        a.Update_Tax_Notes__c='Test tax Notes';
          a.Update_Tax_Consult_Notes__c='Test tax consult Notes';
          a.Update_Structure_Comments__c='Test Structure Notes';
          a.Update_Keep_more_Solution__c='Test Keep more Solution Notes';
        ClientStrategyPaheCtrlCopy.updatedAccRecords(a.Id, a, u.id);
        test.stopTest();
        
    }
}