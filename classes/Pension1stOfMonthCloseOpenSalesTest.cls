@isTest
private class Pension1stOfMonthCloseOpenSalesTest 
{
    @testSetup
    static void setup()
    {
        insert new BatchRetryAttempts__c(Name='BatchableSaleStageUpdate',Current_Iteration__c=1,Maximum_Iteration__c=3);
        Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
        Campaign camp = new Campaign();
        camp.Name = 'Pension Renewals';
        camp.Status='planned';
        camp.IsActive=true;
        insert camp;
        Entities__c myEnt = new Entities__c();
        myEnt.Primary_Client__c = acc.id;    
        myEnt.Name = 'Pension - Annual Maintenance';
        myEnt.Origin__c = 'Anderson';
       // myEnt.Year_End__c = date.newInstance(2020, 03, 20);
        myEnt.Organization_State__c = 'Maine';
        myEnt.SLA__c ='Prepaid Admin';
        myEnt.PlanType__c = 'Money Purchase Plan';
        Date mydate = date.parse('4/24/2021');
        myEnt.Prepaid_SLA_Date__c = mydate;
        myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
        insert myEnt;
        List<Opportunity> lstOpp = new List<Opportunity>();
        for (Integer i = 0; i<10; i++)
        {
            Opportunity op = new Opportunity();
            op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Qualification';
            lstOpp.add(op);
            
        }
        insert lstOpp;
        
        
        
    }
    static testMethod void testMethodJanuary()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 01, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 09, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodFebruary()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 02, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 10, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
     static testMethod void testMethodMarch()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 03, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 11, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
      static testMethod void testMethodApril()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 04, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 12, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
     static testMethod void testMethodMay()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 05, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 01, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
     static testMethod void testMethodJune()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 06, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 02, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodJuly()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 07, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 03, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodAugust()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 08, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 04, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
      static testMethod void testMethodSeptember()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 09, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 05, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodOctober()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 10, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 06, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodNovember()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 11, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 07, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodDecember()
    {
        Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance' Limit 1];
        qEntity.Year_End__c = date.newInstance(2020, 12, 20);
        update qEntity;
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales(Date.newInstance(2021, 08, 01));  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
        
    }
    static testMethod void testMethodEmptyConstructor()
    {
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
       
        
    }



}