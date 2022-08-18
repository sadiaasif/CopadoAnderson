global class CloseRenewalsBatch implements Database.Batchable<sObject>{
    global List<Opportunity> start(Database.BatchableContext BC){
        List<Opportunity> opps = [select id,name,StageName,closedate from opportunity where recordtype.name in ('State Renewal','Standard Renewal') and stagename = 'Qualification' and closeDate < last_n_months:9 order by closedate desc limit 50000];
        return opps;
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> oppBatch){
        for(Opportunity opp : oppBatch){
            opp.StageName = 'Closed Lost';
            opp.Closed_Lost_Reason__c = 'Non Payment';
        }
        try{
            update oppBatch;
        }
        catch(Exception e){
            system.debug(e);
        }
    }
    
    global void finish(Database.BatchableContext BC){
		        
    }
}