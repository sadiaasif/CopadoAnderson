@isTest
private class PensionMonthEndUpdateRecapTest {
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
        List<Entities__c> updateList = new List<Entities__c>();
        for(Integer i=0;i<5;i++)
        {
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Pension - Annual Maintenance';
            myEnt.Origin__c = 'Anderson';
            //myEnt.Year_End__c = date.newInstance(2020, 03, 20);
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Prepaid Admin';
            myEnt.PlanType__c = 'Money Purchase Plan';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            updateList.add(myEnt);
        }
        insert updateList;
        
    }
    static testMethod void testMethodJanuary()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 01, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 01, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap firstPen = new PensionMonthEndUpdateRecap( 'SELECT Id, Name, SLA__c,Current_Plan_Year_End__c, Updated_Tax_Year_End__c,X5500_Due_Date__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND FU__c!=True AND Year_End_Month__c = \'June\' Limit 10', date.parse('8/31/2021') );
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 03, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND Current_Plan_Year_End__c<THIS_YEAR',Date.newInstance(2021, 03, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodFebruaryNextYearLeapTrue()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 02, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 02, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2023, 04, 30));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2023, 04, 30));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodFebruaryNextYearLeapFalse()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 02, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 02, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2022, 04, 30));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2022, 04, 30));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodMarch()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 03, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 03, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 05, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 05, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodApril()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 04, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 04, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 06, 30));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 06, 30));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodMay()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 05, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 05, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 07, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 07, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodJune()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 06, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 06, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 08, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 08, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodJuly()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 07, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 07, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 9, 30));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 09, 30));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodAugust()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 08, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 08, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 10, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 10, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodSeptember()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 09, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 09, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 11, 30));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 11, 30));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodOctober()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 10, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 10, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 12, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 12, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodNovember()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 11, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 11, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 01, 31));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 01, 31));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodDecemberLeapFalse()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 12, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 12, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2021, 02, 28));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2021, 02, 28));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testMethodDecemberLeapTrue()
    {	
        List<Entities__c> lstEnt = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        //Entities__c qEntity = [Select id from Entities__c where Name='Pension - Annual Maintenance'];
        List<Entities__c> qLst = new List<Entities__c>();
        for(Entities__c e: lstEnt)
        {
            e.Year_End__c = date.newInstance(2020, 12, 20);
            e.Current_Plan_Year_End__c = date.newInstance(2020, 12, 20);
            qLst.add(e);
            
        }
        
        update qLst;
        
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap(Date.newInstance(2024, 02, 29));
        ManualPensionMonthEndUpdateRecap b2 = new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\'',Date.newInstance(2024, 02, 29));
        Id batchId2 = Database.executeBatch(b2);
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
    }
    static testMethod void testEmptyConstructor()
    {
        Test.startTest();
        PensionMonthEndUpdateRecap b = new PensionMonthEndUpdateRecap();
        Id batchId = Database.executeBatch(b);
        Test.stopTest();
        
        
    }
    
}