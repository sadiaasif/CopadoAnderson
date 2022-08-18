@isTest
public class unlimitedNomineeWYNVTest {
    
    public static String CRON_EXP = '0 0 0 1 1 ? 2024';
    
    static testmethod void testScheduledJob() {
        Test.startTest();
        
        List<Opportunity> opplist = new List<Opportunity>();
        List<SaleEntity__c> saleEnts = new List<SaleEntity__c>();
        Campaign camp = new Campaign(Name = 'Test Campaign', IsActive = TRUE);
        
        Account a = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountA');
        insert a;
        
        Opportunity CAP = new Opportunity();
        CAP.Name = 'Corporate Assistance Program Renewal';
        CAP.StageName = 'Qualification';
        CAP.CloseDate = Date.today().addDays(7);
        CAP.Amount = 1092;
        CAP.AccountId = a.Id;
        CAP.Sale_Campaign__c = camp.Id;
        CAP.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
        CAP.Pricebook2Id = Test.getStandardPricebookId();
        oppList.add(CAP);
        
        Opportunity NOM = new Opportunity();
        NOM.Name = 'WY Nom';
        NOM.StageName = 'Qualification';
        NOM.CloseDate = Date.today().addDays(7);
        NOM.Amount = 500;
        NOM.AccountId = a.Id;
        NOM.Sale_Campaign__c = camp.Id;
        NOM.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
        NOM.Pricebook2Id = Test.getStandardPricebookId();
        oppList.add(NOM);
        insert oppList;
        
        Entities__c entity = new Entities__c(
            Organization_State__c = 'Wyoming',
            Name = 'Test Entity');
        insert entity;
        
        SaleEntity__c se = new SaleEntity__c(
            Opportunity__c = CAP.Id,
            Entity__c = entity.Id,
            Type__c = 'Corporation'
        );
        saleEnts.add(se);
        
        SaleEntity__c se2 = new SaleEntity__c(
            Opportunity__c = NOM.Id,
            Entity__c = entity.Id,
            Type__c = 'Corporation'
        );
        saleEnts.add(se2);
        insert saleEnts;
        
        Product2 p = new Product2(
            Name = 'Nominee Service Annual Renewal',
            Service_Fulfillment_Weight__c = '1',
            Type__c = 'LAW',
            IsActive = TRUE,
            Subscription_Product__c = TRUE
        );
        insert p;
        
        PricebookEntry pe = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = p.Id,
            UnitPrice = 500,
            IsActive = TRUE);
        insert pe;
        
        OpportunityLineItem li = new OpportunityLineItem(
            OpportunityId = NOM.Id,
            Product2Id = p.Id,
            PricebookEntryId = pe.Id,
            UnitPrice = 500,
            Quantity = 1);
        insert li;
        
        
        
        unlimitedNomineeWYNV sh1 = new unlimitedNomineeWYNV();
        String jobId = system.schedule('Test unlimitedNomineeWYNV class', CRON_EXP, sh1);
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2024-01-01 00:00:00', string.valueof(ct.NextFireTime));
        
        Test.stopTest();
        
    }
}