@isTest
public class bookkeepingFieldsFromTasksTest {
    
    @testSetup static void createData() {
        
        Account a = new account();
        a.Name = '123';
        insert a;
        
        Case c = new Case();
        c.Subject = 'Test Case';
        C.AccountId = a.id;
        c.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('Bookkeeping').getRecordTypeId();
        insert c;
        
        Bookkeeping__c bk = new Bookkeeping__c();
        bk.Name = 'Bk 123';
        bk.Client_Name__c = a.id;
        bk.Case__c = c.id;
        insert bk;
        
        Contact ct = new Contact();
        ct.LastName = 'todd';
        ct.AccountId = a.id;
        insert ct;
        
        Id bookkeepingTaskid = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Bookkeeping_Task').getRecordTypeId();
        
		Task t = new Task();
        t.Subject = 'Test Task 2';
        t.RecordTypeId = bookkeepingTaskid;
        t.WhatId = c.id;
        t.WhoId = ct.id;
        t.Bookkeeping_Admin__c = 'Ashley Cloutier';
        t.Status = 'Not Started';
        t.Priority = 'Normal';
        t.OwnerId = [SELECT Id FROM User WHERE Name = 'Anderson Advisors'].id;
        t.Team_Lead__c = 'Jasmine Licitra';
        t.Bookkeeping_IC__c = 'Bookkeeper 1';
        insert t;        
        
    }
    
    @isTest
    public static void createTasks() {
        
        Case c = [SELECT Id FROM Case];
        Contact ct = [SELECT Id FROM Contact];
        
        Id bookkeepingTaskid = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Bookkeeping_Task').getRecordTypeId();
        
        Task t = new Task();
        t.Subject = 'Test Task 1';
        t.RecordTypeId = bookkeepingTaskid;
        t.WhatId = c.id;
        t.WhoId = ct.id;
        t.Bookkeeping_Admin__c = 'Ashley Cloutier';
        t.Status = 'Not Started';
        t.Priority = 'Normal';
        t.OwnerId = [SELECT Id FROM User WHERE Name = 'Anderson Advisors'].id;
        t.Team_Lead__c = 'Jasmine Licitra';
        t.Bookkeeping_IC__c = 'Bookkeeper 1';
        insert t;
        
        Bookkeeping__c bk = [SELECT Id, Team_Lead__c, Bookkeeping_IC__c FROM Bookkeeping__c];
        
        System.assertEquals('Jasmine Licitra', bk.Team_Lead__c);
        System.assertEquals('Bookkeeper 1', bk.Bookkeeping_IC__c);
    
    }
    
    @isTest
    public static void updateTasks() {
        
		Task t2 = [SELECT Id From Task WHERE Subject = 'Test Task 2']; 
        t2.Team_Lead__c = 'Maria Boone';
        t2.Bookkeeping_IC__c = 'Bookkeeper 2';
        
        update t2;
        
        Bookkeeping__c bk2 = [SELECT Id, Team_Lead__c, Bookkeeping_IC__c FROM Bookkeeping__c];
        
        System.assertEquals('Maria Boone', bk2.Team_Lead__c);
        System.assertEquals('Bookkeeper 2', bk2.Bookkeeping_IC__c);
   
    }

}