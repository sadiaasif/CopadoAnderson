global class FbSfdatuploadcalloutcls implements 
    Database.Batchable<sObject>,    Database.AllowsCallouts, Database.Stateful {
      private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global FbSfdatuploadcalloutcls(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
      global void execute(Database.BatchableContext bc, List<FacebookoBject__c> fbdatalistforcallout){
         String data= JSONGeneratorclass.generateJSONContentforfacebook(fbdatalistforcallout);
          
               String reqBody='access_token=EAALiCc1xg2ABAP1CW9814uQgdVS0badIjZAMv8pznWgcrRZBIflAdl4QZCLKhFBmrdHcsByTEKzL1XREz5Rcg1cNBSQLZBd4VNMHVXSp4FNPTBILzUUzyr7LP5KpNlENseBcaLkBLdN06AVgiYJw6nBIOOS2CUvETL0cuhrvlN5WuvqFEb5q6CT7ukZCtLq5PSjK6CvMGYQZDZD&upload_tag=Salesforce uploads&data='+data;
             Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/v9.0/510666899381703/events');
             req.setBody(reqBody);
        req.setMethod('POST'); 
        HttpResponse res = http.send(req); // receive the response
        String str = res.getBody();
        

          // deserialize the JSON data
          If(!test.isRunningTest()){
                 Map<String, Object> response_Map = (Map<String, Object>) JSON.deserializeUntyped(str);
        system.debug(response_Map);
        system.debug(str);
    
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