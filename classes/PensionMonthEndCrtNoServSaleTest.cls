@isTest
private class PensionMonthEndCrtNoServSaleTest 
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
        
    }
    static testMethod void servMarch()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 03, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 03, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.FU__c = False;
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 05, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servJanuary()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 01, 20);
            myEnt.Current_Plan_Year_End__c =  date.newInstance(2021, 01, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 03, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
     static testMethod void servFebruary()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 02, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 02, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 04, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servApril()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 04, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 04, 20);
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 06, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servMay()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 05, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 05, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 07, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servJune()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 06, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 06, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 08, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servJulyNextYearIsNotLeapYear()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 08, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 07, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 07, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 09, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servJulyNextYearIsLeapYear()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 07, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2023, 07, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2023, 09, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
     static testMethod void servAugust()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 08, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 08, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 08, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 10, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
     static testMethod void servSeptember()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 09, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 09, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 11, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
     static testMethod void servOctober()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 10, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 10, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 12, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    
    /* static testMethod void testMethod12()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 07, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 07, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='No Service';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2023, 09, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);
    } */
    static testMethod void servNovember()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 11, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 11, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 01, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servDecemberThisYearIsNotLeapYear()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 12, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021, 12, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2021, 02, 28));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void servDecemberThisYearIsLeapYear()
    {
        Account acc = [Select id from Account];
        Campaign camp =[Select id from Campaign ];
        List<Entities__c> updateList = new List<Entities__c>();
        Date todayDte = Date.today();
        Date januaryEnd = date.newInstance(2021, 05, 31);
        Integer janLstDay = januaryEnd.day();
        todayDte = januaryEnd;
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020, 12, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2024, 12, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='No Service';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale(Date.newInstance(2024, 02, 29));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        /*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
System.debug('Opportunity'+query);   
System.assertEquals(query.size(),15);*/
    }
    static testMethod void emptyConstructor()
    {
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale();
        Test.stopTest();
        
    }
}