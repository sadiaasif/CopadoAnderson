global class UpdateAccountsPrimaryContactBatchcall  implements Schedulable{
 global void execute(SchedulableContext sc) {
      Id batchJobId1 = Database.executeBatch(new UpdateAccountsPrimaryContact('Select id,Name,(select id,Account_Roles__c from contacts) from Account where (Primary_Contact_Count__c=null or Primary_Contact_Count__c=0)  and CreatedDate = LAST_WEEK'), 200);
System.debug('Batch1--'+batchJobId1);
    

    }
}