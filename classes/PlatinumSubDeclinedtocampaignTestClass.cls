@isTest
public class PlatinumSubDeclinedtocampaignTestClass {
 static testmethod void testdeclinedPlatinumsaletocampainInsert() {        
    campaign cm=new campaign();
     cm.name='Platinum Subscription Declined';
     insert cm;
     
     
     ChargentBase__Gateway__c gateway=new ChargentBase__Gateway__c();
        gateway.name='Platinum';
        gateway.ChargentBase__Merchant_ID__c='abc123Test';
        gateway.ChargentBase__Security_Key__c='test123';
        gateway.ChargentBase__Active__c=true;
        insert gateway;
        ChargentBase__Gateway__c gateway1=new ChargentBase__Gateway__c();
        gateway1.name='LV';
        gateway1.ChargentBase__Merchant_ID__c='abc123Test';
        gateway1.ChargentBase__Security_Key__c='test123';
        gateway1.ChargentBase__Active__c=true;
        insert gateway1;

     
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
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
      o.ChargentSFA__Payment_Status__c = 'Error';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        insert o;
     List<Opportunity> opplist=[Select id,ChargentSFA__Payment_Status__c from opportunity where name='Platinum Subscription'];
     opplist[0].ChargentSFA__Payment_Status__c='Error';
     update opplist;

     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new PlatinumSubDeclinedtocampaignbatchClass());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);

        Test.stopTest();
     }
}