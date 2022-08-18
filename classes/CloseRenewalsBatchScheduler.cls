global class CloseRenewalsBatchScheduler implements Schedulable {
    
    global void execute(SchedulableContext ctx){
      CloseRenewalsBatch batch = new CloseRenewalsBatch();
      Database.executebatch(batch, 20);
    }
}