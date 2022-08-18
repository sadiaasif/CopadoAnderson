global class CampaignHierarchyschedular implements Schedulable {
    global void execute(SchedulableContext sc) {
        CampaignhierarchyBatch cb = new CampaignhierarchyBatch(); 
        database.executebatch(cb);
    }
}