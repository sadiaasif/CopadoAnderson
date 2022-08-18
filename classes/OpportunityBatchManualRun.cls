global class OpportunityBatchManualRun implements Database.Batchable<sObject>, Database.Stateful  {
      private String query; 
    id standardRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
    id stateRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
    global Integer recordsProcessed = 0;
     global OpportunityBatchManualRun(string query){
            this.query = query;
            
        }
    global database.QueryLocator start(Database.BatchableContext BC) {
       
        List <Opportunity> oppIdsToClone = new List<Opportunity>();
        
        if(Test.isRunningTest()){
            oppIdsToClone = [select Id, Name,Createddate, StageName, AccountId from Opportunity where StageName= 'Closed Won'  and Closedate =: Date.today()];    
        }
        else{
            // WHEN "Is_Batch_Running__c = true", IT WILL BLOCK THE PROCESS BUILDER(Populate the Entity lookup field) CONDITON AND WILL NOT EXECUTE THE FLOW(Populate the Entity lookup field) FOR BATCH RECORDS
            // Fixed on this BY "Muhammad Awais Khan" ON "05-Jan-2022"
            BatchRunning__c runningBatch = BatchRunning__c.getOrgDefaults(); runningBatch.Is_Batch_Running__c = true; UPDATE runningBatch;
            oppIdsToClone = Database.query(this.query);
        }
        System.debug('Size==='+oppIdsToClone.size());
       
        
       return Database.getQueryLocator('select id,name,RecordTypeId,stageName,Due_Date__c,Entity_Type__c,Renewal_effective_Date__c,Renewal_End_Date__c,Renewal_State__c,ChargentSFA__Payment_Start_Date__c,Sale_Campaign__c,CloseDate,AccountId from Opportunity where id IN:oppIdsToClone');    

        
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
        if(!Test.isRunningTest()){
        	// WHEN "Is_Batch_Running__c = false", IT WILL ALLOW THE PROCESS BUILDER(Populate the Entity lookup field) CONDITON AND WILL EXECUTE THE FLOW(Populate the Entity lookup field) FOR INDIVIDUAL RECORDS
            // Fixed on this BY "Muhammad Awais Khan" ON "05-Jan-2022"
            BatchRunning__c runningBatchObj = BatchRunning__c.getOrgDefaults(); runningBatchObj.Is_Batch_Running__c = false; UPDATE runningBatchObj;    
        }
        
        system.debug('Batch execution completed.');
    }                                            
}