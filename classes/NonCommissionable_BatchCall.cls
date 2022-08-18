global class NonCommissionable_BatchCall implements Schedulable {
     global void execute(SchedulableContext sc) {
         Id batchJobId1 = Database.executeBatch(
             new NonCommissionable_Batch(
                 'Select Id, Total_Non_Commissionable_Amount__c FROM Opportunity WHERE Id IN:OppId'), 5);
         System.debug('Batch1--'+batchJobId1);

    }

}