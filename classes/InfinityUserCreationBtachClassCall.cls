public class InfinityUserCreationBtachClassCall implements Schedulable {
    public void execute(SchedulableContext sc) {
        
       String taskQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        taskQuery='select id, Name, CreatedBy.Name, Infinity_Memebership__c, Account.name, Sale_Campaign__c,Infinity_Sale_Dataload__c from opportunity where Infinity_Memebership__c=\'Free\' and RecordTypeID=\'0120B000000N8E5QAK\' and  Service_User_Created__c=false and Infinity_Sale_Dataload__c=true and Account.Platinum_Sale_Count__c=0  limit 50'; 
        }else{
              taskQuery='select id, Name, CreatedBy.Name, Infinity_Memebership__c, Account.name, Sale_Campaign__c,Infinity_Sale_Dataload__c from opportunity where Infinity_Memebership__c=\'Free\' and RecordTypeID=\'0120B000000N8E5QAK\' and  Service_User_Created__c=false and Infinity_Sale_Dataload__c=true and Account.Platinum_Sale_Count__c=0 limit 50 ';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new InfinityUserCreationBatch(taskQuery), 1);
         }else{
              batchJobId1 = Database.executeBatch(new InfinityUserCreationBatch(taskQuery), 200);
         }
    }
}