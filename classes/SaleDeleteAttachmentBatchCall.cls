global class  SaleDeleteAttachmentBatchCall implements Schedulable {
     global void execute(SchedulableContext sc) {
         Id batchJobId1;
          if(!Test.isRunningTest()){
       batchJobId1 = Database.executeBatch(new SaleDeleteAttachmentBatchClass('Select id,Delete_the_Sale_Attachment__c,Attachment_Name__c from opportunity where Delete_the_Sale_Attachment__c=True'), 5);
          }else{
                batchJobId1 = Database.executeBatch(new SaleDeleteAttachmentBatchClass('Select id,Delete_the_Sale_Attachment__c,Attachment_Name__c from opportunity where Delete_the_Sale_Attachment__c=True'), 200);
          }
System.debug('Batch1--'+batchJobId1);   

    }

}