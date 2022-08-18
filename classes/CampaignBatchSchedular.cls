global class CampaignBatchSchedular implements Schedulable {
    global void execute(SchedulableContext sc) {
        CampaignBatch b = new CampaignBatch(); 
        database.executebatch(b,20);
    }
}