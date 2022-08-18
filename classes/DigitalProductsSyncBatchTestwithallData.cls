@istest(seealldata=true)
public class DigitalProductsSyncBatchTestwithallData {
  @isTest
    static  void BatchscheduleclassTest() {        

 String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
  
        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new DigitalProductsSyncBatchcall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        
        Test.stopTest();
        
      
      
     }
     @isTest
    static  void testbatchclass() {        

    
 String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0 limit 20';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
      
        Test.stopTest();
        

      
     }
}