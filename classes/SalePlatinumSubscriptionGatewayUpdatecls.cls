global class SalePlatinumSubscriptionGatewayUpdatecls implements   Database.Batchable<sObject>,    Database.AllowsCallouts, Database.Stateful {
      private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global SalePlatinumSubscriptionGatewayUpdatecls(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
      global void execute(Database.BatchableContext bc, List<opportunity> SalePlatinumSubscriptionList){
       List<opportunity> Saleupdate=new List<opportunity>();
		Id GatewayID =  [Select id, name from ChargentBase__Gateway__c where Name='Platinum' and ChargentBase__Active__c=true limit 1]?.id;
          for(opportunity opp: SalePlatinumSubscriptionList){
              opp.ChargentSFA__Gateway__c=GatewayID;
              Saleupdate.add(opp);
          }  
        		update Saleupdate;
   
        }
        global void finish(Database.BatchableContext bc){
              
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         integer cpuTime = Limits.getCpuTime();
            integer Queries = Limits.getQueries();
         
            Dinfo.DebugData__c='Job Name:SFFBuploadBatchClass; Records deleted:'+recordsProcessed;
            insert Dinfo;
        }
    
}