global class SFFBuploadBatchClass implements 
    Database.Batchable<sObject> {
         private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global SFFBuploadBatchClass(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
        global void execute(Database.BatchableContext bc, List<opportunity> opportunitytobeprocessed){
            SySTem.debug('oppid==');
            
           
            List<Attachment> attList=new List<Attachment>();
            List<opportunity> updateOpp=new List<opportunity>();
        
           List<String> AccountList=new List<String>();
              List<String> oppList=new List<String>();
            for(opportunity opp:opportunitytobeprocessed){
             SySTem.debug('oppid=='+opp.Id);
                AccountList.add(opp.AccountID);
                oppList.add(opp.id);
            }
             Map<String, Object> inputs = new Map<String, Object>();
 			 inputs.put('AccountIDS', AccountList);
            inputs.put('Saleids', oppList);
           
                Flow.Interview.Test_Uploading_to_csv myFlow = 
    		new Flow.Interview.Test_Uploading_to_csv(inputs);
  			myFlow.start();
          
  			
           
            
     
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