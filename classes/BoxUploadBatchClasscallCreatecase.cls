global class BoxUploadBatchClasscallCreatecase  implements 
    Database.Batchable<sObject> {
         private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global BoxUploadBatchClasscallCreatecase(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
        global void execute(Database.BatchableContext bc, List<Box_Listener__c> BoxListenerProcessed){
      
            List<Box_Listener__c> updateOpp=new List<Box_Listener__c>();
        
           List<String> AccountList=new List<String>();
              List<String> oppList=new List<String>();
            for(Box_Listener__c BoXL:BoxListenerProcessed){
                Map<String, Object> inputs = new Map<String, Object>();
 			 inputs.put('FolderId', BoXL.Parent_Folder_ID__c);
            inputs.put('FolderName', BoXL.Folder_Name__c);
                  inputs.put('BoxListnerREcordID', BoXL.id);
                   inputs.put('Filename', BoXL.Uploaded_File_Name__c);
                 inputs.put('BaseFoldername', BoXL.Base_Folder_Name__c);
           
               Flow.Interview.Box_Listener_Create_Case_and_task myFlow = 
    		new Flow.Interview.Box_Listener_Create_Case_and_task(inputs);
  			myFlow.start();
          
            }
             
            
  			
           
            
     
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