public class DigitalProductsSyncBatchcall implements Schedulable {
    public void execute(SchedulableContext sc) {

     String accountQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        accountQuery='Select id,Name from account where Digital_Products_count__c>0';
        }else{
             accountQuery='Select id,Name from account where Digital_Products_count__c>0 limit 20';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery), 20);
         }else{
              batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery), 200);
         }
      
    }
}