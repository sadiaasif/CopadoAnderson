@isTest(SeeAllData=false)
public class TaskUpdatecommentTestClass {
    
    public static testMethod  void testTaskUpdateComment()
    {
        
        Account acc = new Account();
        acc.Name='Test Account' ;
        acc.First_Name__c='Edward';
        acc.Last_Name__c='Lee';
        acc.phone='123456782';
        insert acc;
        Entities__c et = new Entities__c();
        et.Name ='Test Dec Entity';
        et.Origin__c = 'Anderson';
        et.Primary_Client__c =acc.id;
        et.Organization_State__c = 'Wyoming';
        et.Status__c = 'Sent To Processing';
        insert et;
        Entities__c et1 = new Entities__c();
        et1.Name ='Test Dec Entity1';
        et1.Origin__c = 'Anderson';
        et1.Primary_Client__c =acc.id;
        et1.Organization_State__c = 'Wyoming';
        et1.Status__c = 'Sent To Processing';
        insert et1;
        
        List<Entities__c> lstEntity=[select id,name from Entities__c where id=:et.id];
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Task' and Name = 'Processing'].Id;
        List<task> lstTask=new List<Task>();
        for(Integer i = 0 ; i<3 ; i++){
            Task t=new Task();
            t.Subject='Filing '+i;        
            t.Priority='Normal';
            t.WhatId=et.id;
            t.Description='Testing description 111 MOdified by';
            t.RecordTypeId=strRecordTypeId;
            lstTask.add(t);
        }
        
        if(lstTask != null){            
             insert lstTask;            
        }
        Related_Parties__c rel1=new Related_Parties__c();
        rel1.Name='Testing Related1';
        rel1.Entities__c=et.id;
        rel1.Other_Entity_Member_1__c=true;
        rel1.Other_Entity_Member_2__c=true;
        rel1.Other_Entity_Member_3__c=true;
        rel1.Other_Entity_Member_4__c=true;
        rel1.Other_1st_Member_Name__c='Testing 1';
        rel1.Other_2nd_Member_Name__c='Testing 2';
        rel1.Blueprint_Modifier_Name__c='Test modifier1';
        insert rel1;
        List<Related_Parties__c> lstRel=[select id from Related_Parties__c where id=:Rel1.id];
        if(lstRel.size()>0){
            System.assertEquals(1, lstRel.size());
        }
        test.startTest();
        TaskUpdateCommentsClass tuc=new TaskUpdateCommentsClass();
        tuc.taskUpdated(lstTask); 
        test.stopTest();
    }
}