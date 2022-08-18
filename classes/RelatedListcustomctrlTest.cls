@isTest(seeAllData = false)
public class RelatedListcustomctrlTest {
    @testSetup
    public static void createTestData() {
        List<Opportunity> opList=new  List<Opportunity>();
        List<Account> acList=new List<Account>();
        List<entities__c> enlist=new List<entities__c>();
        List<task> taskList=new List<task>();
        List<Case> Clist=new List<Case>();
        List<Feedback__c> FList = new List<Feedback__c>();
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
        Id devoppGeneralFeedbackRecordTypeId = Schema.SObjectType.Feedback__c.getRecordTypeInfosByName().get('General Feedback').getRecordTypeId();
        Id devoppPlatinumFeedbackRecordTypeId = Schema.SObjectType.Feedback__c.getRecordTypeInfosByName().get('Platinum Feedback').getRecordTypeId();
        
        
        
        Id AdvisorAdminProfileID=[Select Id,name from profile where name='Anderson Profile' limit 1].id;
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
                
        Case c1=new Case();
        c1.Subject='Test As Case';
        C1.RecordTypeId=devoppAsRecordTypeId;
        c1.Info_Sent_to_ABA_By__c='Access';
        c1.QuickBooks_Version__c='QBO'; 
        c1.Account=a;
        c1.Status='New';
        insert c1;
        
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
        
       Meeting_Minutes__c mm=new Meeting_Minutes__c();
        mm.Name='Test Meeting min 1';
        mm.Client__c=a.id;
       insert mm;
        
        Set_of_Books__c sb=new Set_of_Books__c();
        sb.Name='Testing set of books1';
        sb.Client__c=a.Id;
        insert sb;
        
        Feedback__c fb=new Feedback__c();
        fb.Name='Testing set of books1';
        fb.Client__c=a.Id;
        insert fb;
        
/*task t=new task ();
        t.WhatId=a.id;
        t.Subject='Test call Task';
        t.ownerID=Advisoreuser;
        t.RecordTypeId=devoppcallRecordTypeId;
        insert t; */
        
        
        
        H2S__HarvestProject__c hp=new H2S__HarvestProject__c();
        hp.H2S__Account__c=a.id;
        hp.H2S__Archived__c=False;
        hp.name='Test';
        insert hp;
        
       Strategy_Session_Questionnaire__c st=new Strategy_Session_Questionnaire__c();
        st.Account_Lookup__c=a.id;
        st.name='Test';
        insert st;
        
        Refund__c r=new Refund__c();
        r.Client__c=a.id;
        r.Name='Test Refund';
        insert r;
        
        Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
        ccd.Account__c = a.id;
        ccd.Card_Month__c = '04';
        ccd.Card_Number__c = '1234567896541236';
        ccd.Card_Security__c = '777';
        ccd.Card_Type__c = 'visa';
        ccd.Card_Year__c = '2020'; 
        ccd.Platinum_Subscription_Card__c = true;
        insert ccd;

        Dissolution__c dis = new Dissolution__c();
        dis.Name='Test';
        dis.Client__c = a.id;
        insert dis;
        
    }
    @isTest
    static void TestRealtedList(){
        Account a =[Select id,Name from account where First_Name__c='Bob' ];
        Credit_Card_Detail__c ccd1=[select id,name from Credit_Card_Detail__c where Account__c=:a.id];
        Refund__c rf=[select id from Refund__c where Client__c=:a.id];
        Strategy_Session_Questionnaire__c ssq=[select id from Strategy_Session_Questionnaire__c where Account_Lookup__c=:a.id];
        H2S__HarvestProject__c project=[select id from H2S__HarvestProject__c where H2S__Account__c=:a.id];
        Set_of_Books__c setb=[select id from Set_of_Books__c where Client__c=:a.id];
        Feedback__c fbc = [select id,name from Feedback__c where Client__c=:a.id];
        //task tsk=[select id from task where WhatId=:a.id];
        Meeting_Minutes__c mm1=[select id from Meeting_Minutes__c where Client__c=:a.id];
        Dissolution__c dis=[select id from Dissolution__c where Client__c=:a.id];
        
        test.startTest();
        RelatedListcustomctrl.getCOntactData('contact',5,1,a.id);
        RelatedListcustomctrl.getcountsale(a.id);
        RelatedListcustomctrl.getcountcontact(a.id);
        RelatedListcustomctrl.getcountEntity(a.id);
        RelatedListcustomctrl.getcountcase(a.id);
        RelatedListcustomctrl.getcountTrust(a.id);
        RelatedListcustomctrl.getcountRefund(a.id);
        RelatedListcustomctrl.getcountBookR(a.id);
        RelatedListcustomctrl.getcountCCd(a.id);
        RelatedListcustomctrl.getcounttaskd(a.id);
        RelatedListcustomctrl.getcountFeedback(a.id);
        RelatedListcustomctrl.getSalesData('opportunity',5,1,a.id);
        RelatedListcustomctrl.getEntityData('Entities__c',5,1,a.id);
        RelatedListcustomctrl.getCaseData('case',5,1,a.id);
        RelatedListcustomctrl.getTrustDataResult('Trust__c',5,1,a.id);
        RelatedListcustomctrl.getRefundData('Refund__c',5,1,a.id);
        RelatedListcustomctrl.getBookkeepinRecordsData('Bookkeeping__c',5,1,a.id);
        RelatedListcustomctrl.getccDetailsData('Credit_Card_Detail__c',5,1,a.id);
        RelatedListcustomctrl.getActivityData('task',5,1,a.id);
        RelatedListcustomctrl.getIconName('task');
        RelatedListcustomctrl.getAssIntrestData('Assignment_of_Interest__c',5,1,a.id);
        RelatedListcustomctrl.getMeetingMinData('Meeting_Minutes__c',5,1,a.id);
        RelatedListcustomctrl.getorderData('Order',5,1,a.id);
        RelatedListcustomctrl.getFeedbackData('Feedback__c', 5, 1, a.id);
        RelatedListcustomctrl.getDissolutionData('Dissolution__c', 5, 1, a.id);
        RelatedListcustomctrl.getcountorderd(a.id);
        RelatedListcustomctrl.fetchit();
        RelatedListcustomctrl.getcountAssIntd(a.id);
        RelatedListcustomctrl.getcountMeetingMind(a.id);
        RelatedListcustomctrl.getcountSetofBooksd(a.id);
        RelatedListcustomctrl.getcountProjects(a.id);
        RelatedListcustomctrl.getcountStrategySessionQuestionnaires(a.id);
        RelatedListcustomctrl.getSalesData('opportunity',5,1,a.id);
        RelatedListcustomctrl.getCreditdetails();
        RelatedListcustomctrl.fetchRecordTypeValues();
        RelatedListcustomctrl.fetchTrustRecordTypeValues();
        RelatedListcustomctrl.fetchTrustRecordTypeValues();
        RelatedListcustomctrl.fetchSalesRecordTypeValues();
        RelatedListcustomctrl.fetchCaseRecordTypeValues();
        RelatedListcustomctrl.fetchFeedbackRecordTypeValues();
        RelatedListcustomctrl.getSetofBooksData('Set_of_Books__c ',5,1,a.id);
        RelatedListcustomctrl.getProjectsData('H2S__HarvestProject__c ',5,1,a.id);
        RelatedListcustomctrl.getStrategySessionQuestionnairesData('Strategy_Session_Questionnaire__c',5,1,a.id);
        RelatedListcustomctrl.getListOfRecordType();
        RelatedListcustomctrl.getListOfSalesRecordType();
        RelatedListcustomctrl.getListOfTrustRecordType();
        RelatedListcustomctrl.deleteFeedbackRecord(fbc.id);
        RelatedListcustomctrl.deleteRecord(ccd1.id);
        RelatedListcustomctrl.salesRecTypeId('Bookkeeping');
        RelatedListcustomctrl.feedbackRecTypeId('General Feedback');
        RelatedListcustomctrl.trustRecTypeId('Living Trust');
        RelatedListcustomctrl.getRecTypeId('DBA');
        RelatedListcustomctrl.caseRecTypeId('Help Desk Case');
        //RelatedListcustomctrl.deleteEntRecord(Ent.id);
        
       // RelatedListcustomctrl.deleteCaseRecord(cs.id);
        RelatedListcustomctrl.deleteRefundRecord(rf.id);
        ///RelatedListcustomctrl.deleteTrustRecord(ccd1.id);
        //RelatedListcustomctrl.deleteActivityRecord(tsk.id);
        RelatedListcustomctrl.deleteSetOfBooksRecord(setb.id);
        RelatedListcustomctrl.deleteMeetingMinRecord(mm1.id);
        RelatedListcustomctrl.deleteProjetsRecord(project.id);
        RelatedListcustomctrl.deleteSSQRecord(ssq.id);
        RelatedListcustomctrl.deleteDissolutionRecord(dis.id);
        
        test.stopTest();
    }
}