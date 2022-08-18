global class  NotarizeDocUploadtoBoxBatchCls implements   Database.Batchable<sObject>,    Database.AllowsCallouts, Database.Stateful {
 private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global NotarizeDocUploadtoBoxBatchCls(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
      global void execute(Database.BatchableContext bc, List<Attachment> AttachmentList){
       Map<String,string> NotarizeDocAttachmentIDandParentIdMap= new   Map<String,string>();
          for(Attachment  att: AttachmentList){
             NotarizeDocAttachmentIDandParentIdMap.put(att.ParentID,att.Id);
              System.debug('att.Name---'+att.Name);
              
          }  
          NotarizeLinktoBox.callout(NotarizeDocAttachmentIDandParentIdMap);
        
        
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