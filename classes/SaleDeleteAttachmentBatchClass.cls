global class SaleDeleteAttachmentBatchClass implements 
    Database.Batchable<sObject>, Database.Stateful {
         private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global SaleDeleteAttachmentBatchClass(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
        global void execute(Database.BatchableContext bc, List<opportunity> opportunitytobeprocessed){
            
            List<ContentDocumentLink> cdlList=new List<ContentDocumentLink>();
            List<Attachment> attList=new List<Attachment>();
            List<opportunity> updateOpp=new List<opportunity>();
        
           
            for(opportunity opp:opportunitytobeprocessed){
             
             ContentDocumentLink[]   cDL=[SELECT ContentDocumentId,ContentDocument.title FROM ContentDocumentLink WHERE LinkedEntityId =:opp.id and ContentDocumentId IN (Select id from ContentDocument where title=:opp.Attachment_Name__c) Limit 1];
              
                if(cDL.size()>0){
                    for(ContentDocumentLink cl:cDL){
                        cdlList.add(cl);
                    }
                    
                }else{
                Attachment[]  att=[Select id,name from Attachment where parentId=:opp.id and name=: opp.Attachment_Name__c]; 
                    if(att.size()>0){
                        for(Attachment a:att){
                             attList.add(a); 
                        }
                      
                    }
                }
             
              opp.Delete_the_Sale_Attachment__c=false;
               
                updateOpp.add(opp);
            }
               System.debug('attList size=='+attList.size());
              try { 
             If(attList.size()>0){ 
                 	delete attList;
       	recordsProcessed=recordsProcessed+1;
                
               
              
             }else{
                 if(cdlList.size()>0){
                    delete cdlList; 
                 }
             }
                  if(updateOpp.size()>0){
                      update updateOpp;
                       
                      
                  }
                  
             
         } catch (Exception ex) { 
             
         	System.Debug('Insert failed ' + ex);
             
            Dinfo.DebugData__c=ex.getMessage();
            insert Dinfo;
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
         
            Dinfo.DebugData__c='Job Name:SaleDeleteAttachmentBatchClass; Records deleted:'+recordsProcessed;
            insert Dinfo;
        }
}