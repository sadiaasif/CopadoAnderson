@istest(SeeAllData=true)
public with sharing class EmailPlatClientsListTest {
    public static testmethod void  EmailPlatClientsTest() {
           String CRON_EXP = '0 0 0 15 3 ? *';
        Test.startTest();
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new SendPlatinumClientList());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        test.stopTest();
       
    }
    
    public static testmethod void  EmailTitaniumClientsTest() {
           String CRON_EXP = '0 0 0 15 3 ? *';
        Test.startTest();
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new SendTitaniumClientList());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        test.stopTest();
       
    }
    
    public static testmethod void  EmailPlatClientswithoutAddressTest() {
        String CRON_EXP = '0 0 0 15 3 ? *';
     Test.startTest();
         String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new SendPlatinumwithoutAdress());
         CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
         System.assertEquals(CRON_EXP, ct.CronExpression);
         System.assertEquals(0, ct.TimesTriggered);
     test.stopTest();
    
 }
    
}