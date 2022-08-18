@isTest(seealldata=true)
public class ProcessingConsoleTest {
@isTest
    static void TestgetEntityId(){
         Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Test';
        testAccount.Last_Name__c='Account';
      
        insert testAccount; 
         
        Id EntityrecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByDeveloperName().get('Limited_Liability_Company_LLC').getRecordTypeId();
     Entities__c en=new Entities__c();
    en.Primary_Client__c=testAccount.id;
    en.Name='Top Entity';
    en.RecordTypeId=EntityrecordTypeId;
    en.Organization_State__c='Georgia';
    en.Structure__c='Manager-managed';
    insert en;
            id standardRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
    id stateRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
        Opportunity opp = new Opportunity(name='test',AccountId=testAccount.Id,stagename = 'Qualification', closeDate = system.today(), recordTypeId = standardRecordTypeId, Renewal_effective_Date__c = system.today(), ChargentSFA__Payment_Start_Date__c = system.today(),Renewal_State__c='Alaska');
        insert opp;
        SaleEntity__c se=new SaleEntity__c(name='test sale Entity',Entity__c=en.id,Opportunity__c=opp.id);
        insert se; 
       Id ProcesstaskrecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Processing').getRecordTypeId();
        Task t=new task();
        t.WhatId= en.Id;
        t.Client__c=testAccount.id;
        t.Subject='Test Task';
        t.RecordTypeId=ProcesstaskrecordTypeId;
        t.Related_Entity__c=en.id;
        insert t;
          Test.startTest();
      ID Taskid;
        List<Task> Tsks=[Select id from Task where Subject ='Test Task'];
        for(task ts:Tsks){
          Taskid=ts.id;
            
        }
        
       ProcessingConsoleCtrl.getEntityId(Taskid);
         ProcessingConsoleCtrl.getSaleEntities(Taskid);
         ProcessingConsoleCtrl.getRelatedSales(Taskid);
        test.stopTest();
        
        
    }
      @isTest
     static void TestgetClientId(){
         Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Test';
        testAccount.Last_Name__c='Account';
      
        insert testAccount; 
         contact con=new contact();
         con.LastName='contact';
         con.FirstName='Test';
         con.AccountId=testAccount.id;
         insert con;
         
        Id EntityrecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByDeveloperName().get('Limited_Liability_Company_LLC').getRecordTypeId();
     Entities__c en=new Entities__c();
    en.Primary_Client__c=testAccount.id;
    en.Name='Top Entity';
    en.RecordTypeId=EntityrecordTypeId;
    en.Organization_State__c='Georgia';
    en.Structure__c='Manager-managed';
    insert en;
       Id ProcesstaskrecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Processing').getRecordTypeId();
        Task t=new task();
        t.WhatId= en.Id;
        t.Client__c=testAccount.id;
        t.Subject='Test Task';
        t.RecordTypeId=ProcesstaskrecordTypeId;
          t.Related_Entity__c=en.id;
        insert t;
          Test.startTest();
      ID Taskid;
        List<Task> Tsks=[Select id from Task where Subject ='Test Task'];
        for(task ts:Tsks){
          Taskid=ts.id;
            
        }
       ProcessingConsoleCtrl.getClientId(Taskid);
         ProcessingConsoleCtrl.getRelatedContact(Taskid);
        ProcessingConsoleCtrl.getRelatedSales(Taskid);
        test.stopTest();
        
        
    }
    @isTest
    static void TestgetnullEntityId(){
         Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Test';
        testAccount.Last_Name__c='Account';
      
        insert testAccount; 
         
        Id EntityrecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByDeveloperName().get('Limited_Liability_Company_LLC').getRecordTypeId();
     Entities__c en=new Entities__c();
    en.Primary_Client__c=testAccount.id;
    en.Name='Top Entity';
    en.RecordTypeId=EntityrecordTypeId;
    en.Organization_State__c='Georgia';
    en.Structure__c='Manager-managed';
    insert en;
       Id ProcesstaskrecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Processing').getRecordTypeId();
        Task t=new task();
      
        t.Client__c=testAccount.id;
        t.Subject='Test Task';
        t.RecordTypeId=ProcesstaskrecordTypeId;
        insert t;
          Test.startTest();
      ID Taskid;
        List<Task> Tsks=[Select id from Task where Subject ='Test Task'];
        for(task ts:Tsks){
          Taskid=ts.id;
            
        }
       ProcessingConsoleCtrl.getEntityId(Taskid);
         ProcessingConsoleCtrl.getSaleEntities(Taskid);
        test.stopTest();
        
        
    }
       @isTest
     static void TestgetnullClientId(){
         Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Test';
        testAccount.Last_Name__c='Account';
      
        insert testAccount; 
         
        Id EntityrecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByDeveloperName().get('Limited_Liability_Company_LLC').getRecordTypeId();
     Entities__c en=new Entities__c();
    en.Primary_Client__c=testAccount.id;
    en.Name='Top Entity';
    en.RecordTypeId=EntityrecordTypeId;
    en.Organization_State__c='Georgia';
    en.Structure__c='Manager-managed';
    insert en;
       Id ProcesstaskrecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Processing').getRecordTypeId();
        Task t=new task();
        t.WhatId= en.Id;
        t.Subject='Test Task';
        t.RecordTypeId=ProcesstaskrecordTypeId;
        insert t;
          Test.startTest();
      ID Taskid;
        List<Task> Tsks=[Select id from Task where Subject ='Test Task'];
        for(task ts:Tsks){
          Taskid=ts.id;
            
        }
       ProcessingConsoleCtrl.getClientId(Taskid);
         ProcessingConsoleCtrl.getRelatedContact(Taskid);
        test.stopTest();
        
        
    }
}