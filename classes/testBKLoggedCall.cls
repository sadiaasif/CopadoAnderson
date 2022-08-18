@isTest
public class testBKLoggedCall
{
    @testSetup
    public static void taskTest()
    {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Account acc=new account();
        acc.Name='Bob Apples';
        insert acc;
        
        Contact con=new Contact();
        con.firstname='John';
        con.LastName='Roberts';
        con.AccountId=acc.id;
        con.phone='4457778888';
        insert con;
        
        case c = new Case();
        C.Subject = 'Bookkeeping Case';
        C.Status = 'New';
        c.accountid = acc.id;
        c.ContactId = con.id;
        c.Status = 'New';
        c.Type = 'Coordinator';
        insert c;
        
        Set_Of_Books__c bookset = new Set_Of_Books__c();
        bookset.Name = 'Test Set of Books';
        insert bookset;
        
        Bookkeeping__c bk = new Bookkeeping__c();
        bk.case__c = c.id;
        bk.Name = 'Test Bk';
        bk.Client_Name__c = acc.id;
        insert bk;
        
        Bookkeeping__c bk1 = new Bookkeeping__c();
        bk1.case__c = c.id;
        bk1.Name = 'Test Bk';
        bk1.Client_Name__c = acc.id;
        bk1.Set_of_Books__c = bookset.id;
        insert bk1;
        
    }
    
    @isTest
    public static void createTasks1() {
        
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t1=new task();
        t1.OwnerId = userInfo.getUserId();    
        t1.Subject='test task';
        t1.Status='Completed';
        t1.Priority='Normal';
        t1.WhatId = c.id;
        t1.RecordTypeId=recordTypeID;
        t1.Fee_Quote__c = 1;
        insert t1;
    }
    @isTest
    public static void createTasks2() {
        
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];        
        Task t2=new task();
        t2.OwnerId = userInfo.getUserId();    
        t2.Subject='test task';
        t2.Status='Completed';
        t2.Priority='Normal';
        t2.WhatId = c.id;
        t2.RecordTypeId=recordTypeID;
        t2.Fee_Quote__c = 2;
        insert t2;
        
    }
    
    @isTest
    public static void createTasks3() {
        
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t3=new task();
        t3.OwnerId = userInfo.getUserId();    
        t3.Subject='test task';
        t3.Status='Completed';
        t3.Priority='Normal';
        t3.WhatId = c.id;
        t3.RecordTypeId=recordTypeID;
        t3.Fee_Quote__c = 3;
        insert t3;
    }
    @isTest
    public static void createTasks4() {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t4=new task();
        t4.OwnerId = userInfo.getUserId();    
        t4.Subject='test task';
        t4.Status='Completed';
        t4.Priority='Normal';
        t4.WhatId = c.id;
        t4.RecordTypeId=recordTypeID;
        t4.Fee_Quote__c = 4;
        insert t4;
    }
    
    @isTest
    public static void createTasks5() {
        
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t5=new task();
        t5.OwnerId = userInfo.getUserId();    
        t5.Subject='test task';
        t5.Status='Completed';
        t5.Priority='Normal';
        t5.WhatId = c.id;
        t5.RecordTypeId=recordTypeID;
        t5.Fee_Quote__c = 5;
        insert t5;
    }
    @isTest
    public static void createTasks6() {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t6=new task();
        t6.OwnerId = userInfo.getUserId();    
        t6.Subject='test task';
        t6.Status='Completed';
        t6.Priority='Normal';
        t6.WhatId = c.id;
        t6.RecordTypeId=recordTypeID;
        t6.Fee_Quote__c = 6;
        insert t6;
    }
    @isTest
    public static void createTasks7() {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t7=new task();
        t7.OwnerId = userInfo.getUserId();    
        t7.Subject='test task';
        t7.Status='Completed';
        t7.Priority='Normal';
        t7.WhatId = c.id;
        t7.RecordTypeId=recordTypeID;
        t7.Fee_Quote__c = 7;
        insert t7;
    }
    
    @isTest
    public static void createTasks8() {
        
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t5=new task();
        t5.OwnerId = userInfo.getUserId();    
        t5.Subject='test task';
        t5.Status='Completed';
        t5.Priority='Normal';
        t5.WhatId = c.id;
        t5.RecordTypeId=recordTypeID;
        t5.Fee_Quote__c = 8;
        insert t5;
    }
    @isTest
    public static void createTasks9() {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case]; 
        Task t6=new task();
        t6.OwnerId = userInfo.getUserId();    
        t6.Subject='test task';
        t6.Status='Completed';
        t6.Priority='Normal';
        t6.WhatId = c.id;
        t6.RecordTypeId=recordTypeID;
        t6.Fee_Quote__c = 9;
        insert t6;
    }
    @isTest
    public static void createTasks10() {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];  
        Task t7=new task();
        t7.OwnerId = userInfo.getUserId();    
        t7.Subject='test task';
        t7.Status='Completed';
        t7.Priority='Normal';
        t7.WhatId = c.id;
        t7.RecordTypeId=recordTypeID;
        t7.Fee_Quote__c = 10;
        insert t7;
    }
    
    @isTest
    public static void createTasks11() {
        
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];
        
        Task t11=new task();
        t11.OwnerId = userInfo.getUserId();    
        t11.Subject='test task';
        t11.Status='Completed';
        t11.Priority='Normal';
        t11.WhatId = c.id;
        t11.RecordTypeId=recordTypeID;
        t11.Fee_Quote__c = 11;
        insert t11;
    }
    @isTest
    public static void createTasks12() {
        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
        Case c = [SELECT Id From Case];        
        Task t12=new task();
        t12.OwnerId = userInfo.getUserId();    
        t12.Subject='test task';
        t12.Status='Completed';
        t12.Priority='Normal';
        t12.WhatId = c.id;
        t12.RecordTypeId=recordTypeID;
        t12.Fee_Quote__c = 12;
        insert t12;
    }
}