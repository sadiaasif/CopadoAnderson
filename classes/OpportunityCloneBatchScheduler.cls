global class OpportunityCloneBatchScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
           Id batchJobId1;
        OpportunityBatch b = new OpportunityBatch(); 
         if(!Test.isRunningTest()){
          batchJobId1= database.executebatch(b,5);    
         }else{
               batchJobId1= database.executebatch(b,200);  
         }
        System.debug('Batch1--'+batchJobId1);
        
    }
}