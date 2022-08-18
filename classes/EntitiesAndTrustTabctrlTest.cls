@isTest
public class EntitiesAndTrustTabctrlTest {
Public static Account a = new Account();
Public static   List <Entities__c> enlist=new List <Entities__c>();
    Public static    Trust__c t=new Trust__c();
         Public static    Case c1=new Case();
   Public static   Opportunity opp=new Opportunity();
       Public static task t1=new task ();
     
   @testSetup
    public static void createTestData() {
        Id devoppLivingTrustRecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
         Id devoppEntityRecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Limited Liability Company (LLC)').getRecordTypeId();
         Id devoppLivingTrustobjRecordTypeId = Schema.SObjectType.Trust__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
         Id devoppLivingCRecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
          Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
          Id devoppLivingTRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        insert a;
        
        Entities__c en=new Entities__c();
         en.RecordTypeId=devoppLivingTrustRecordTypeId;
        en.Name='Test Living Entity';
        en.Organization_State__c='Alabama';
        en.Primary_Client__c=a.id;
        
       
        enlist.add(en);
        
         Entities__c en1=new Entities__c();
        
        en1.Name='Test Living Entity';
        en1.Organization_State__c='Alabama';
        en1.Primary_Client__c=a.id;
        
          en1.RecordTypeId=devoppEntityRecordTypeId;
        en1.Name='Test New';
        en1.Organization_State__c='Alabama';
        en1.Primary_Client__c=a.id;
        enlist.add(en1);
        insert enlist;
       
        
        t.RecordTypeId=devoppLivingTrustobjRecordTypeId;
        t.Name='Test Living Trust';
     
        t.Primary_Client__c=a.id;
        insert t;
        

      
        
  
    }
     @isTest
    static void TestaccordionDisplay(){
         Account a =[Select id,Name from account where First_Name__c='Bob' ];
        test.startTest();
        EntitiesAndTrustTabctrl.getEntity(a.id);
        EntitiesAndTrustTabctrl.getTrust(a.id);
       List<Entities__c> enresult= EntitiesAndTrustTabctrl.findByEntityName('New',a.id);
        EntitiesAndTrustTabctrl.findByEntityName('',a.id);
 System.assertEquals(1, enresult.size(), 'Please check!');   
       List<Trust__c> tlist= EntitiesAndTrustTabctrl.findByTrustName('res',a.id);
        EntitiesAndTrustTabctrl.findByTrustName('',a.id);
        EntitiesAndTrustTabctrl.insideCommunity();
        System.assert(tlist.size()==0);   
        test.stopTest();
    }
}