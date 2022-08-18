global class CampaignBatch implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('Start called');
        return Database.getQueryLocator('select id,name,Total_Collected_for_Hierarchy__c,Total_Collected__c from Campaign where IsActive=True');
    }
    global void execute(Database.BatchableContext bc,List<Campaign> scope){
        system.debug('Entered in Execute');
        List <Campaign> campaigns = new List<Campaign>();
        List <opportunity> oppList = New List <opportunity>();
        List<Campaign> lstAcc = new List<Campaign>();
        List<Campaign> lstcampToupdate = new List<Campaign>();
        Boolean updateTotalColected=false;
        set<id> camids=new set<id>();
        for(Campaign cam : scope)
        {
            system.debug('cam id=='+cam.id);
            camids.add(cam.id);
        }
        if(camids.size() > 0){
            lstAcc = [Select id,Total_Collected__c,(Select id,Net_Transactions_net_of_Fees__c,Amount  from opportunities where amount != 0 AND sale_campaign__c != '7014P000001BSSuQAO' AND campaignid != null) from Campaign where id IN : camids];
        }
        for(Campaign cmp : lstAcc){
            Decimal val = 0;
            for(opportunity opp : cmp.opportunities){
                
                val += opp.Net_Transactions_net_of_Fees__c;
                
            }
            if(cmp.Total_Collected__c!=val){
                  cmp.Total_Collected__c = val;
                lstcampToupdate.add(cmp);
                
            }
          
        }
      
        update lstcampToupdate;
    }
    global void finish(Database.BatchableContext BC){
        system.debug('Batch execution completed.');
        
    }
}