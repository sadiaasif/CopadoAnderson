global class NonCommissionable_Batch implements Database.Batchable<sObject> {
    global Integer recordsProcessed = 0;
    private String query; 
    
    global NonCommissionable_Batch(string query){
        this.query = query;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        Set<Id> OppId=new Set<Id>();
        List<OpportunityLineItem> OppLineItemList= [SELECT OpportunityId FROM OpportunityLineItem WHERE Product2.Non_Commissionable__c = TRUE
                                                    AND OpportunityId IN (SELECT Id FROM Opportunity 
                                                                          WHERE Amount > 0 AND LastModifiedDate = TODAY 
                                                                          AND (RecordType.Name = 'Entity Formation'
                                                                               OR RecordType.Name = 'Tax Compliance' 
                                                                               OR RecordType.Name = 'Bookkeeping'))];
        for(OpportunityLineItem oppLI : OppLineItemList){
            OppId.add(oppLI.OpportunityId);
        }
        return Database.getQueryLocator(this.query);
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> scope){

        List<Opportunity> oppList = new List<Opportunity>(); 
        System.debug('Scope--'+scope.size());
        
        for (Opportunity opp : scope) {
            if(scope.size() > 0){
                AggregateResult[] NCItems = [SELECT SUM(Affiliate_Price__c) totalItemPrice FROM OpportunityLineItem 
                            WHERE Product2.Non_Commissionable__c = TRUE AND OpportunityId=:opp.Id 
                            GROUP BY OpportunityId];
                opp.Total_Non_Commissionable_Amount__c = (Decimal)NCItems[0].get('totalItemPrice');
                oppList.add(opp);
            }
        }
        
        try {
            if(oppList.size()>0){
                update oppList;   
            }
            
        } catch (Exception ex) { 
            System.Debug('Insert failed ' + ex);
        }
    }
        
        global void finish(Database.BatchableContext bc){
            
            System.debug(recordsProcessed + ' records processed.');
            AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
                                JobItemsProcessed,
                                TotalJobItems, CreatedBy.Email
                                FROM AsyncApexJob
                                WHERE Id = :bc.getJobId()];
            integer cpuTime = Limits.getCpuTime();
            integer Queries = Limits.getQueries();
            system.debug('CPU Time: '+cpuTime);
            system.debug('Queries: '+Queries);
                
        }
    }