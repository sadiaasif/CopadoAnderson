@isTest
public class Team3StalledProcessingTask2DaysctrlTest {
@testSetup
    public static void createTestData() {
       
        List<Account> acList=new List<Account>();
        List<entities__c> enlist=new List<entities__c>();
        List<task> taskList=new List<task>();
        
        Id devoppEnLandTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Land Trust').getRecordTypeId();
        Id devoppEnLivingTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();
       
        Id LawProfileID=[Select Id,name from profile where name='Law Coordinator' limit 1].id;
          Id lawCommunityProfileID=[Select Id,name from profile where name='Service Comm-Service Manager' limit 1].id;
          Id LawCorduser=[select id from user where profileId=:LawProfileID limit 1].id;
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
         
      
        task t=new task ();
        t.WhatId=a.id;
        t.Subject='Test call Task';
          t.ownerID=LawCorduser;
        t.RecordTypeId=devoppcallRecordTypeId;
       taskList.add(t); 
        
         task t1=new task ();
        t1.WhatId=a.id;
      
        t1.Subject='Test call Task';
        t1.RecordTypeId=devoppcallRecordTypeId;
        taskList.add(t1); 
        insert taskList;
     
        
        
    }
      @isTest
    static void TestRealtedList(){
         createTestData();
        Team3StalledProcessingTask2Daysctrl.getAlltasks();
         Team3StalledProcessingTask2Daysctrl.findByName('2020-06-11','2020-06-18');
         Team3StalledProcessingTask2Daysctrl.getCounttasks();
           Team3StalledProcessingTask2Daysctrl.getCounttasksFilter('2020-06-11','2020-06-18');
    }
}