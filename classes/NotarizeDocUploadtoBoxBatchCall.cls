global class NotarizeDocUploadtoBoxBatchCall implements Schedulable {
  
     global void execute(SchedulableContext sc) {
           Id batchJobId1;
            if(!Test.isRunningTest()){
      batchJobId1 = Database.executeBatch(new NotarizeDocUploadtoBoxBatchCls('SELECT Id,ParentID,Name FROM Attachment WHERE Parent.Type = \'Notarization__c\''), 5);
            }else{
              batchJobId1 = Database.executeBatch(new NotarizeDocUploadtoBoxBatchCls('SELECT Id,ParentID,Name FROM Attachment WHERE Parent.Type = \'Notarization__c\''), 200);  
            }
System.debug('Batch1--'+batchJobId1);
    

     }
}