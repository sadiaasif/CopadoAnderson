@isTest
private class PensionMonthEndCrtRobsSalesTest {
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
     static testMethod void emptyConstructor()
    {
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales();
        Test.stopTest();
        
    }
    static testMethod void robsJanuary()
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
            myEnt.Year_End__c = date.newInstance(2020,01, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,01, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'ROBS Solo 401(k)';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 03, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
        
    }
     static testMethod void robsFebruary()
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
            myEnt.Year_End__c = date.newInstance(2020,02, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,02, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Solo 401(k)';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 04, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsMarch()
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
            myEnt.Year_End__c = date.newInstance(2020,03, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,03, 20);
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Solo 401(k)';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 05, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsApril()
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
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Origin__c = 'Anderson';
            myEnt.Year_End__c = date.newInstance(2020,04, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,04, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 06, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsMay()
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
            myEnt.Year_End__c = date.newInstance(2020,05, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,05, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 07, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
         
     }
     static testMethod void robsJune()
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
            myEnt.Year_End__c = date.newInstance(2020,06, 20);
            myEnt.Current_Plan_Year_End__c= date.newInstance(2021,06, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 08, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
         
     }
     static testMethod void robsJulyNextYearNotLeapYear()
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
            myEnt.Year_End__c = date.newInstance(2020,07, 20);
            myEnt.Current_Plan_Year_End__c= date.newInstance(2021,07, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            myEnt.Business_Purpose_2__c ='Holding';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 09, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsJulyNextYearIsLeapYear()
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
            myEnt.Year_End__c = date.newInstance(2020,07, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2023,07, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2023, 09, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsAugust()
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
            myEnt.Year_End__c = date.newInstance(2022,08, 20);
            myEnt.Current_Plan_Year_End__c= date.newInstance(2023,08, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2023, 10, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsSeptember()
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
            myEnt.Year_End__c = date.newInstance(2020,09, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,09, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 11, 30));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
         
     }
     static testMethod void robsOctober()
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
            myEnt.Year_End__c = date.newInstance(2020,10, 20);
            myEnt.Current_Plan_Year_End__c = date.newInstance(2021,10, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            myEnt.Business_Purpose_2__c ='Holding';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2021, 12, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsNovember()
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
            myEnt.Year_End__c = date.newInstance(2022,11, 20);
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Current_Plan_Year_End__c = date.newInstance(2023,11, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2023, 01, 31));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsDecemberCurrentYearNotLeapYear()
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
            myEnt.Year_End__c = date.newInstance(2022,12, 20);
            myEnt.Current_Plan_Year_End__c= date.newInstance(2023,12, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2023, 02, 28));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }
     static testMethod void robsDecemberCurrentYearIsLeapYear()
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
            myEnt.Year_End__c = date.newInstance(2020,12, 20);
            myEnt.Business_Purpose_2__c ='Holding';
            myEnt.Current_Plan_Year_End__c = date.newInstance(2024,12, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Robs';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
        Product2 prod2 = new Product2(Name = 'Tax Prep, 5500 Return',
                                      Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 500, IsActive = true);
        insert standardPrice2;
        
        Test.startTest();
        //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
        PensionMonthEndCrtRobsSales createSale = new PensionMonthEndCrtRobsSales(Date.newInstance(2024, 02, 29));
        Id batchId = Database.executeBatch(createSale);
        List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
        System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
        {
            System.assertEquals(query.size(), 5);
            
        }
        Test.stopTest();
         
     }

}