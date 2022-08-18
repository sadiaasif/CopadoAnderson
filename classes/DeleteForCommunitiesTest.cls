@isTest
public class DeleteForCommunitiesTest {
   public static Account a = new Account();
   public static   Opportunity opp=new Opportunity();
     public static  Entities__c en=new Entities__c();
     public static  task t=new task ();
     public static SaleEntity__c se=new SaleEntity__c();
    public static Credit_Card_Detail__c cc=new Credit_Card_Detail__c();
    public static Lead l=new Lead();
   public static  Contact cont = new Contact();
      public static  order o = new order();
      public static  Case c = new Case ();
    public static User u ;
    public static List<string> arecordIDs=new List<string>();
      public static List<string> opprecordIDs=new List<string>();
      public static List<string> enrecordIDs=new List<string>();
      public static List<string> trecordIDs=new List<string>();
      public static List<string> ccrecordIDs=new List<string>();
    public static List<string> lrecordIDs=new List<string>();
    public static List<string> serecordIDs=new List<string>();
     public static List<string> CrecordIDs=new List<string>();
     public static List<string> orderrecordIDs=new List<string>();
     public static List<string> CaserecordIDs=new List<string>();
    
    @testSetup
    public static void createTestData() {
       
           Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
         Id devoppAsRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Anderson System Case').getRecordTypeId();
          Id devoppEnLandTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Land Trust').getRecordTypeId();
           Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Id devCaseEfRecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();  
        Id profileId = [select id from profile where name='System Administrator'].id;
         u=[Select id ,name from user where profileId=:profileId and isActive=true limit 1];
             
       
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        
		insert a;
        arecordIDs.add(a.id);
      
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
       
        cont.AccountId=a.Id;
      
        
        insert cont;
        CrecordIDs.add(cont.id);
        
     
        
        opp.RecordTypeId=devoppBkRecordTypeId;
        opp.CloseDate=system.today();
        opp.StageName='Qualification';
        opp.AccountId=a.id;
        opp.Name='Test Bk Sale';
       insert opp;
        opprecordIDs.add(opp.id);
       en.RecordTypeId=devoppEnLandTrustRecordTypeId;
        en.Name='Test Land Trust';
         en.Primary_Client__c=a.id;
        en.Organization_State__c='Alabama';
        insert en;
        enrecordIDs.add(en.id);
        /* t.WhatId=a.id;
        t.Subject='Test call Task';

        t.RecordTypeId=devoppcallRecordTypeId;
        insert t;
        trecordIDs.add(t.Id);*/
        
        l.FirstName='Bobby';
        l.LastName='Apples test';
        insert l;
        lrecordIDs.add(l.Id);
        cc.Account__c=a.id;
		cc.Name='test';
        insert cc;
        ccrecordIDs.add(cc.id);
        
        se.Name='test';
        se.Opportunity__c=opp.id;
        se.Entity__c=en.Id;
        insert se;
        serecordIDs.add(se.Id);
       o.EffectiveDate=system.today();
        o.AccountId=a.id;
        o.Status='Draft';
        insert o;
        orderrecordIDs.add(o.Id);
        
         c.Subject='Test As Case';
        C.RecordTypeId=devoppAsRecordTypeId;
        c.Info_Sent_to_ABA_By__c='Access';
        c.QuickBooks_Version__c='QBO'; 
        c.Account=a;
        c.Status='New';
        
        insert c;
        CaserecordIDs.add(c.Id);
        
    }
    @isTest
    static void TestDeleteForCommunitiesMethod(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

        DeleteForCommunities.DeleteForCommunitiesMethod(arecordIDs);
            
       }
        test.stopTest();
    }
    
    @isTest
    static void TestDeleteForCommunitiesMethodopp(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

        DeleteForCommunities.DeleteForCommunitiesMethod(opprecordIDs);
          
          
       }
        test.stopTest();
    }
    @isTest
    static void TestDeleteForCommunitiesMethodcc(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

       
            DeleteForCommunities.DeleteForCommunitiesMethod(ccrecordIDs);
          
          
       }
        test.stopTest();
    }
    @isTest
    static void TestDeleteForCommunitiesMethodt(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

      
            DeleteForCommunities.DeleteForCommunitiesMethod(trecordIDs);
            
       }
        test.stopTest();
    }
    @isTest
    static void TestDeleteForCommunitiesMethoden(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

    
             DeleteForCommunities.DeleteForCommunitiesMethod(enrecordIDs);
          
       }
        test.stopTest();
    }
    @isTest
    static void TestDeleteForCommunitiesMethodse(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

        DeleteForCommunities.DeleteForCommunitiesMethod(lrecordIDs);
           DeleteForCommunities.DeleteForCommunitiesMethod(serecordIDs);
          
       }
        test.stopTest();
    }
     @isTest
    static void TestDeleteForCommunitiesMethodl(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

        DeleteForCommunities.DeleteForCommunitiesMethod(lrecordIDs);
          
          
       }
        test.stopTest();
    }
    
    @isTest
    static void TestDeleteForCommunitiesMethodorder(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

        DeleteForCommunities.DeleteForCommunitiesMethod(orderrecordIDs);
          
          
       }
        test.stopTest();
    }
      @isTest
    static void TestDeleteForCommunitiesMethcase(){
         
        test.startTest();
        createTestData();
       System.runAs(u) {

        DeleteForCommunities.DeleteForCommunitiesMethod(CaserecordIDs);
            DeleteForCommunities.DeleteForCommunitiesMethod(CrecordIDs);
          
          
       }
        test.stopTest();
    }
       
}