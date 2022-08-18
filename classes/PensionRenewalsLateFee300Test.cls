@isTest
private class PensionRenewalsLateFee300Test 
{
    @testSetup
    static void setup() 
    {
        
        Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;

        Campaign camp = new Campaign();
        camp.Name = 'Pension Renewals';
        camp.Status='planned';
        camp.IsActive=true;
        insert camp;
        
        Opportunity sale = new Opportunity();
        sale.name = 'Test Sale';
        sale.AccountId = acc.Id;
        sale.CloseDate = Date.today();
        sale.StageName = 'Qualification';
        insert sale;
        
        Entities__c myEnt = new Entities__c();
        myEnt.Primary_Client__c = acc.id;
        myEnt.Sale__c = sale.Id;
        myEnt.Name = 'Entity_1';
        myEnt.Origin__c = 'Anderson';
        myEnt.Organization_State__c = 'Maine';
        myEnt.SLA__c ='Admin Service';
        myEnt.PlanType__c = 'ROBS Profit Sharing';
        Date mydate = date.parse('4/24/2021');
        myEnt.Prepaid_SLA_Date__c = mydate;
        myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
        insert myEnt;
        
        Product2 prod = new Product2(Name = 'Anderson Rush Processing Fee - 5500 Prep',
                                     Family = 'Pension',Type__c='Renewals', Service_Fulfillment_Weight__c='2');
        insert prod;
        
        Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 300, IsActive = true);
        insert standardPrice;
        

        
    }
    static testMethod void januaryTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 01, 20);
        update qEntity;

        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 06, 01);
        insert op;

        String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'January\'';
        String yearEndMonth = 'January';
        Date paramDate = Date.parse('6/2/2021');
        
        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
    }
    static testMethod void februaryTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 02, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 07, 01);
        insert op;

		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'February\'';
        String yearEndMonth = 'February';
        Date paramDate = Date.parse('7/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void marchTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 03, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 08, 01);
        insert op;
	
		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'March\'';
        String yearEndMonth = 'March';
        Date paramDate = Date.parse('8/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }    
    static testMethod void aprilTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 04, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 09, 01);
        insert op;

		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'April\'';
        String yearEndMonth = 'April';
        Date paramDate = Date.parse('9/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void mayTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 05, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 10, 01);
        insert op;

		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'May\'';
        String yearEndMonth = 'May';
        Date paramDate = Date.parse('10/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void juneTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 06, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 11, 01);
        insert op;
	
		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'June\'';
        String yearEndMonth = 'June';
        Date paramDate = Date.parse('11/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void julyTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 07, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 12, 01);
        insert op;
        
		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'July\'';
        String yearEndMonth = 'July';
        Date paramDate = Date.parse('12/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void augustTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 08, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2022, 01, 01);
        insert op;

		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'August\'';
        String yearEndMonth = 'August';
        Date paramDate = Date.parse('1/2/2022');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void septemberTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 09, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2022, 02, 01);
        insert op;

		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'September\'';
        String yearEndMonth = 'September';
        Date paramDate = Date.parse('2/2/2022');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void octoberTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 10, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2022, 03, 01);
        insert op;
	
		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'October\'';
        String yearEndMonth = 'October';
        Date paramDate =  Date.parse('3/2/2022');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void novemberTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 11, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 04, 01);
        insert op;
	
		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'November\'';
        String yearEndMonth = 'November';
        Date paramDate = Date.parse('4/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    static testMethod void decemberTest()
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 12, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 05, 01);
        insert op;
		
		String query = 'SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL AND year_end_month__c = \'December\'';
        String yearEndMonth = 'December';
        Date paramDate = Date.parse('5/2/2021');

        Test.startTest();
            String jobId = Database.executeBatch(new PensionRenewalsLateFee300(query, paramDate, yearEndMonth), 25);
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: jobId];
            System.assertEquals(0, job.NumberOfErrors);
        Test.stopTest();
        
    }
    
    static testMethod void schedulerTest(){
        String CRON_EXP = '0 0 0 15 3 ? *';
        Account acc = [Select id from Account Limit 1];
        Campaign camp = [Select id from Campaign Limit 1];
        Entities__c qEntity = [Select id from Entities__c where Name='Entity_1' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 12, 20);
        update qEntity;
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
        op.AccountId = acc.Id;
        op.Name ='Annual Plan Maintenance';
        op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
        op.Entity__c = qEntity.Id;
        op.Campaign__c = camp.Id;
        op.StageName ='Qualification';
        op.Pension_Due_Date_2__c = Date.newInstance(2021, 05, 01);
        insert op;

        Test.startTest();
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new PensionRenewalsLateFee300());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        Test.stopTest();
    }
}