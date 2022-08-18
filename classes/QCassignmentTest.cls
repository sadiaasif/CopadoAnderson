@isTest
public class QCassignmentTest {
    public static String CRON_EXP = '0 0 0 1 1 ? 2024';
    static testmethod void testScheduledJob() {
        
        Test.startTest();
        
        List<Opportunity> opps = new List<Opportunity>();
        Campaign camp = new Campaign(Name = 'Test Campaign', IsActive = TRUE);
        Id EFtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id Plattype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        Id clienttype = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        
        Date date_today = Date.today();
        Date adj_date = date_today.addMonths(-10);
        
        
        Account a = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountA', 
            RecordTypeId = clienttype,
            Auditor__c = NULL);
        
        insert a;
        
        Contact c = new Contact(
            FirstName = 'TestFirst',
            LastName = 'TestLast',
            Account_Roles__c = 'Primary Contact',
            AccountId = a.Id);
        insert c;
        
        
        Opportunity o = new Opportunity(
            Name = 'EF Sale',
            CloseDate = adj_date,
            StageName = 'Closed Won',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = EFtype,
            Amount = 500,
            AccountId = a.Id);
        opps.add(o);
        
        Opportunity o2 = new Opportunity(
            Name = 'Plat Sale',
            CloseDate = date_today,
            StageName = 'Closed Won',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = Plattype,
            Amount = 35,
            AccountId = a.Id);
        opps.add(o2);
        
        insert opps;
        
        ChargentSFA__Transaction__c t = new ChargentSFA__Transaction__C(
            ChargentSFA__Gateway_Date__c = adj_date,
            ChargentSFA__Gateway_ID__c = '11111111111111111',
            ChargentSFA__Opportunity__c = o.Id,
            ChargentSFA__Type__c = 'Charge',
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Amount__c = 500,
            ChargentSFA__Payment_Method__c = 'Credit Card');
        
        insert t;
        
        ChargentSFA__Transaction__c t2 = new ChargentSFA__Transaction__C(
            ChargentSFA__Gateway_Date__c = adj_date,
            ChargentSFA__Gateway_ID__c = '11111111111111111',
            ChargentSFA__Opportunity__c = o2.Id,
            ChargentSFA__Type__c = 'Charge',
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Amount__c = 35,
            ChargentSFA__Payment_Method__c = 'Credit Card');
        
        insert t2;
        
        Task tt = new Task(
            Subject = 'Email',
            WhatId = a.Id,
            WhoId = c.Id,
            ActivityDate = date_today,
            Status = 'Completed'
        );
        insert tt;
            
            
        QCassignment_Scheduled sh1 = new QCassignment_Scheduled();
        
        String jobId = system.schedule('Test QC client assignment Scheduled', CRON_EXP, sh1);
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2024-01-01 00:00:00', string.valueof(ct.NextFireTime));
        
        Test.stopTest();
        
        
    }
}