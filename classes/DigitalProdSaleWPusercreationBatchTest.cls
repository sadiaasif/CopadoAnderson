@isTest
public class DigitalProdSaleWPusercreationBatchTest {
@testSetup static void createTestData() {
   
      
    }
    @isTest
    public static void makeserviceUser() {
         Test.startTest();
              String CRON_EXP = '0 0 0 15 3 ? *';
         Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.FirstName = 'Bob';
        c.LastName = 'Apples';
        c.Email = 'bazam123@gmail.com';
        c.Account_Roles__c = 'Primary Contact';
        insert c;
        
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'Infinity Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
    	o.Infinity_Memebership__c = '360';
    o.Service_User_Created__c=false;
    o.Infinity_Sale_Dataload__c=true;
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Infinity Subscription').getRecordTypeId();
        insert o;
        
     String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new InfinityUserCreationBtachClassCall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
test.stopTest();
        
    }
}