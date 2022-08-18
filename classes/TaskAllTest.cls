@isTest
public class TaskAllTest {

    public static testmethod void Test1() {
       user u=[Select id ,name from user where name = 'Anderson Advisors'];
                    Account acc=new account();
            acc.Name='test name';
            acc.Important_Notes__c='test important notes';
            insert acc;
        Case c = new Case();
        If(u!=null){
            c.OwnerId=u.id;
            
        }
        c.AccountId=acc.id;
        c.RecordTypeId='012U0000000g6UJIAY';
        c.Subject='Test Anderson System Case';
        C.Type='Coordinator';
        insert c;
       
        
        Task t=[Select id,subject from task where WhatID=:c.Id and subject ='Anderson System Task'Limit 1];
        t.status = 'Completed';
        update t;
       
    }

}