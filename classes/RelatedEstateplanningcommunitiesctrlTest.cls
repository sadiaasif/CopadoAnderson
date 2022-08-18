@isTest
public class RelatedEstateplanningcommunitiesctrlTest {
Public static Account a = new Account();
Public static    Entities__c en=new Entities__c();
    Public static    Trust__c t=new Trust__c();
         Public static    Case c1=new Case();
   Public static   Opportunity opp=new Opportunity();
       Public static task t1=new task ();
   @testSetup
    public static void createTestData() {
        Id devoppLivingTrustRecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
         Id devoppLivingTrustobjRecordTypeId = Schema.SObjectType.Trust__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
         Id devoppLivingCRecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
          Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
          Id devoppLivingTRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        insert a;
        
         en.RecordTypeId=devoppLivingTrustRecordTypeId;
        en.Name='Test Living Trust';
        en.Organization_State__c='Alabama';
        en.Primary_Client__c=a.id;
        insert en;
        
        t.RecordTypeId=devoppLivingTrustobjRecordTypeId;
        t.Name='Test Living Trust';
     
        t.Primary_Client__c=a.id;
        insert t;
        

        c1.Subject='TEst As Case-Living Trust';
        C1.RecordTypeId=devoppLivingCRecordTypeId;
        c1.Info_Sent_to_ABA_By__c='Access';
        c1.QuickBooks_Version__c='QBO'; 
        c1.AccountId=a.id;
        c1.Status='New';
        Insert c1;
        
        
        opp.RecordTypeId=devoppBkRecordTypeId;
        opp.CloseDate=system.today();
        opp.StageName='Closed Won';
        opp.AccountId=a.id;
        opp.Name='Test Living Trust';
        Insert opp;
        
         
        
        t1.WhatId=a.id;
   
        t1.Subject='Test call Living trust';
        t1.RecordTypeId=devoppLivingTRecordTypeId;
insert t1;
    }
     @isTest
    static void TestaccordionDisplay(){
         Account a =[Select id,Name from account where First_Name__c='Bob' ];
        test.startTest();
        RelatedEstateplanningcommunitiesctrl.getEntityObjectLivingTrust(a.id);
        RelatedEstateplanningcommunitiesctrl.getTrust(a.id);
        RelatedEstateplanningcommunitiesctrl.getSalesRecord(a.id);
        RelatedEstateplanningcommunitiesctrl.getlvtasks(a.id);
        RelatedEstateplanningcommunitiesctrl.getlvcase(a.id);
        test.stopTest();
    }
}