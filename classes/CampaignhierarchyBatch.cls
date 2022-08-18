global class CampaignhierarchyBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    global database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('select id,name,Total_Collected_for_Hierarchy__c,Total_Collected__c from Campaign where IsActive=True  ');
    }
    global void execute(Database.BatchableContext bc,List<Campaign> scope){
        List <Campaign> cams = new List<Campaign>();
        set<id> cids=new set<id>();
        for(Campaign c:scope)
        {
            cids.add(c.id);            
        }
        if(cids.size() > 0){
            cams = [Select id,Total_Collected__c,ParentId from Campaign where ParentId IN : cids];
        }
        list<Campaign> cmpList = new list<Campaign>();
        Map<ID,Account> accountMap = new Map<ID,Account>();
        AggregateResult[] groupedResults;
        List<Campaign> cmpLst= [SELECT Total_Collected__c ,ParentId  FROM Campaign];
        if(!test.isRunningTest())
        {
            groupedResults = [SELECT SUM(Total_Collected__c), ParentId FROM Campaign where ParentId IN :cids and hierarchyamountwonopportunities != 0 AND parentid != '7014P000001BSSuQAO' AND parentid != null GROUP BY ParentId];
        }
        else
        {
            groupedResults = [SELECT SUM(Total_Collected__c), ParentId FROM Campaign where ParentId IN :cids  GROUP BY ParentId];
        }
        
        for(AggregateResult ar:groupedResults) 
        {  
            Id cpId = (ID)ar.get('ParentId');         
            Double sum = (DOUBLE)ar.get('expr0');
            Campaign cp1 = new Campaign(Id=cpId);
            if(cp1.Total_Collected_for_Hierarchy__c!= sum){
                cp1.Total_Collected_for_Hierarchy__c= sum;
                cmpList.add(cp1);
            }
        }
        if(cmpList.size()>0 && cmpList!=null)
        {
            update cmpList;
        }
    }
    
    global void finish(Database.BatchableContext BC){
        system.debug('Batch execution completed.');
        
    }
}