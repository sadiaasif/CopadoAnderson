@isTest
private class PensionJuly31FlipEntSLANoServTest {
    @testSetup
    static void setup() {
        insert new BatchRetryAttempts__c(Name='PensionJuly31FlipEntSLANoServ',Current_Iteration__c=1,Maximum_Iteration__c=3);
        //List<Account> accounts = new List<Account>();
        Account acc = new Account();
        acc.Name = 'sfdcpoint';
        insert acc;
        //List<Entities__c> ent = new List<Entities__c>();
        List<Entities__c> updateList = new List<Entities__c>(); 
        
        for (Integer i = 0; i<5; i++){
            Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Entity_'+i;
            myEnt.Origin__c = 'Anderson';
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Prepaid Admin';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
            
            
            updateList.add(myEnt);
        }
        
        insert updateList;
        
    }
    static testMethod void test1() {
        Test.StartTest();
        PensionJuly31FlipEntSLANoServ emt = new  PensionJuly31FlipEntSLANoServ(false);
        Id batchId = Database.executeBatch(emt);
        Test.StopTest();        
    }
    static testMethod void positiveTestCase() 
    {
        insert new BatchRetryAttempts__c(Name='PensionJuly31FlipEntSLANoServ',Current_Iteration__c=1,Maximum_Iteration__c=3);
        
        List<Entities__c> updateList = new List<Entities__c>();
        List<Entities__c> flipSLA = new List<Entities__c>();
        for(Entities__c e: [Select Id,Name,SLA__c,Prepaid_SLA_Date__c from Entities__c])
        {
           // Date SelectedDate = Date.today();
           // Date SelectedDate = Date.newInstance(2021, 7, 31);
            //date mydate = date.parse('7/31/2021');
            e.Prepaid_SLA_Date__c = Date.newInstance(2021, 7, 31);
            e.SLA__c = 'No Service';
            updateList.add(e);          
        }
        update updateList;
        Test.startTest();
        PensionJuly31FlipEntSLANoServ updateEntity = new PensionJuly31FlipEntSLANoServ(false);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();
        
    }
  /*  static testMethod void negativeTestCaseForDatabase() 
    {
        Account acc = new Account();
        acc.Name = 'sfdcpoint2';
        insert acc;
        List<Entities__c> updateList = new List<Entities__c>(); 
         for (Integer i = 0; i<5; i++)
         {
        Entities__c myEnt = new Entities__c();
        myEnt.Primary_Client__c = acc.id;    
        myEnt.Name = 'Entity_Testing'+i;
        myEnt.Origin__c = 'Anderson';
        myEnt.Organization_State__c = 'Maine';
        myEnt.SLA__c =' ';
        Date mydate = date.parse('4/24/2021');
        myEnt.Prepaid_SLA_Date__c = mydate;
        //myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
         updateList.add(myEnt);
         }
             insert updateList;
        Test.startTest();
        BatchableBLogicEntityForPensionSLA myEnt = new BatchableBLogicEntityForPensionSLA(null);
        Id batchId = Database.executeBatch(myEnt);
        Test.stopTest();
        
    }*/
    static testMethod void negativeTestCase() 
    {
        insert new BatchRetryAttempts__c(Name='PensionJuly31FlipEntSLANoServ',Current_Iteration__c=1,Maximum_Iteration__c=3);
            String cronExpr = '0 0 0 15 8 ? 2022';
        List<Entities__c> updateList = new List<Entities__c>();
        for(Entities__c e: [Select Id,Name,SLA__c,Prepaid_SLA_Date__c from Entities__c])
        {
            date mydate = date.parse('8/31/2021');
            e.Prepaid_SLA_Date__c = mydate;
            e.SLA__c = 'Negative Case Value';
            updateList.add(e);
            
        }
        update updateList;
        Test.startTest();
        PensionJuly31FlipEntSLANoServ updateEntity = new PensionJuly31FlipEntSLANoServ(false);
        String jobId = System.schedule('PensionJuly31FlipEntSLANoServ', cronExpr, updateEntity);
		updateEntity.execute(null);
        //Id batchId = Database.executeBatch(updateEntity,10);
        Test.stopTest();
        
    }
    /*static testMethod void negativeTestCase2() 
    {
        insert new BatchRetryAttempts__c(Name='PensionJuly31FlipEntSLANoServ',Current_Iteration__c=1,Maximum_Iteration__c=3);
        
        List<Entities__c> updateList = new List<Entities__c>();
        List<Entities__c> flipSLA = new List<Entities__c>();
        for(Entities__c e: [Select Id,Name,SLA__c,Prepaid_SLA_Date__c from Entities__c])
        {
           // Date SelectedDate = Date.today();
           // Date SelectedDate = Date.newInstance(2021, 7, 31);
            //date mydate = date.parse('7/31/2021');
            e.Prepaid_SLA_Date__c = Date.newInstance(2021, 1, 29);
            e.SLA__c = 'Admin Service';
            e.PlanType__c = 'Solo 401(k)';
            updateList.add(e);          
        }
        update updateList;
        Test.startTest();
        PensionJuly31FlipEntSLANoServ updateEntity = new PensionJuly31FlipEntSLANoServ(null);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();
        
    }*/
    private static void testClass()
    {
        Test.startTest();
        PensionJuly31FlipEntSLANoServ controller = new PensionJuly31FlipEntSLANoServ(false);
        PensionJuly31FlipEntSLANoServ updateEntity = new PensionJuly31FlipEntSLANoServ(false);
        Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();
        
        
    }
    
    
}