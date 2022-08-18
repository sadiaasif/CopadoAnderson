@isTest
private class BatchableBLogicEntityTest {
    /*@TestVisible static Integer currentMonth = Date.today().month();
    @TestVisible static Integer currentYear = Date.today().Year();
    @TestVisible static Date SelectedDate = Date.today();*/
    
    
    @testSetup
    static void setup() {
        insert new BatchRetryAttempts__c(Name='BatchableBLogicEntity',Current_Iteration__c=1,Maximum_Iteration__c=3);
        //List<Account> accounts = new List<Account>();
        Account acc = new Account();
        acc.Name = 'sfdcpoint';
        insert acc;
        //List<Entities__c> ent = new List<Entities__c>();
        List<Entities__c> updateList = new List<Entities__c>(); 
        
        for (Integer i = 0; i<20; i++){
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Entity_'+i;
            myEnt.Origin__c = 'Anderson';
            myEnt.Organization_State__c = 'Maine';
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();


            updateList.add(myEnt);
        }
        
        insert updateList;
        
    }
    static testMethod void testMethod1() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 1;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2021, 1, 31);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('11/30/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,null,null,null);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
    static testMethod void testMethod2() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 10;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2021, 10, 31);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('10/31/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
     static testMethod void testMethod3() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 3;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2021, 3, 31);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('3/31/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
     static testMethod void testMethod4() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 4;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2021, 4, 30);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('2/29/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
      static testMethod void testMethod5() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 4;
        currentYear = 2020;
        SelectedDate = Date.newInstance(2020, 4, 30);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('2/28/2019');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
   
      static testMethod void testMethod6() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 8;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2020, 8, 31);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('8/31/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
      static testMethod void testMethod7() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 6;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2020, 6, 30);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('6/30/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
      static testMethod void testMethod8() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 5;
        currentYear = 2020;
        SelectedDate = Date.newInstance(2020, 5, 31);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('5/31/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
     static testMethod void testMethod9() 
    {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        Date SelectedDate = Date.today();
        currentMonth = 9;
        currentYear = 2021;
        SelectedDate = Date.newInstance(2020, 9, 30);
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select id,Year_End__c,  Current_Plan_Year_End__c from Entities__c])
        {
            
            date mydate = date.parse('9/30/2020');
            e.Year_End__c = mydate;
            updateList.add(e);
            
            
        }
        update updateList;
        Test.startTest();
        BatchableBLogicEntity updateEntity = new BatchableBLogicEntity(null,currentYear,currentMonth,SelectedDate);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();

        
    }
    
}