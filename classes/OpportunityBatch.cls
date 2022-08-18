global class OpportunityBatch  implements Database.Batchable<sObject>, Database.Stateful  {
    
    id standardRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
    id stateRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
    global Integer recordsProcessed = 0;
    
    global database.QueryLocator start(Database.BatchableContext BC) 
    {
        List <Opportunity> oppIdsToClone = new List<Opportunity>();
        
        // WHEN "Is_Batch_Running__c = true", IT WILL BLOCK THE PROCESS BUILDER(Populate the Entity lookup field) CONDITON AND WILL NOT EXECUTE THE FLOW(Populate the Entity lookup field) FOR BATCH RECORDS
        // ADDED BY "Umer Amjad" ON "23-Nov-2021"
        BatchRunning__c runningBatch = BatchRunning__c.getOrgDefaults();
        runningBatch.Is_Batch_Running__c = true;
        UPDATE runningBatch;
        
        if(Test.isRunningTest()){
            oppIdsToClone = [select Id, Name,Createddate, StageName, AccountId,Sale_Campaign__c from Opportunity where StageName= 'Closed Won'  and Closedate =: Date.today()];    
        }
        else{
            oppIdsToClone = [select Id, Name,Createddate, StageName, AccountId,Sale_Campaign__c from Opportunity where StageName= 'Closed Won'  and Closedate =: Date.today()-1];
        }
        System.debug('Size==='+oppIdsToClone.size());
      
        
        return Database.getQueryLocator('select id,name,RecordTypeId,stageName,Due_Date__c,Entity_Type__c,Renewal_effective_Date__c,Renewal_End_Date__c,Renewal_State__c,ChargentSFA__Payment_Start_Date__c,CloseDate,AccountId,Sale_Campaign__c,ChargentSFA__Gateway__c,Override_Automation__c,ChargentSFA__Manual_Charge__c   from Opportunity where id IN:oppIdsToClone');        
    }  
    global void execute(Database.BatchableContext bc,List<Opportunity> scope){
        List <opportunity> opplist = New List <opportunity>();
        map<id,Opportunity> oppsToProcess = new map<id,Opportunity>();
        set<id> oppProcessed = new set<id>();
        set<id> oppids=new set<id>();
        system.debug('scope=='+scope);
        for(opportunity opp : scope)
        {
            system.debug('opp.stageName=='+opp.stageName);
            system.debug('opp.recordTypeId'+opp.recordTypeId);
            if(opp.stageName == 'Closed Won' &&
               (opp.recordTypeId == stateRecordTypeId ||
                opp.recordTypeId == standardRecordTypeId)
              )
                if(!OpportunityTriggerHandler.oppProcessed.contains(opp.id)){ // !OpportunityTriggerHandler.oppProcessed.contains //!oppProcessed.contains
                    oppsToProcess.put(opp.id, opp);
                    oppProcessed.add(opp.id);
                }
            system.debug(' === oppsToProcess === ' + oppsToProcess);
            system.debug(' === oppProcessed === ' + oppProcessed);
        } 
        OpportunityTriggerHandler.OpportunityRenewal(oppsToProcess);
    }
    global void finish(Database.BatchableContext BC){
        
        // WHEN "Is_Batch_Running__c = false", IT WILL ALLOW THE PROCESS BUILDER(Populate the Entity lookup field) CONDITON AND WILL EXECUTE THE FLOW(Populate the Entity lookup field) FOR INDIVIDUAL RECORDS
        // ADDED BY "Umer Amjad" ON "23-Nov-2021"
        BatchRunning__c runningBatchObj = BatchRunning__c.getOrgDefaults();
        runningBatchObj.Is_Batch_Running__c = false;
        UPDATE runningBatchObj;
        
        system.debug('Batch execution completed.');
    }                                            
}