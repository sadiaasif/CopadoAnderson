global class TasksEscaltionClass implements 
    Database.Batchable<sObject>, Database.Stateful {
         private String query; 
        global Integer recordsProcessed = 0;
List<Escalation__c> WcEscaltions= new   List<Escalation__c>();
        
        List<task> taskList=new List<task>();
        global TasksEscaltionClass(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
        global void execute(Database.BatchableContext bc, List<task> tasktobeprocessed){
            
            
            for(task t:tasktobeprocessed){
                Escalation__c e= new Escalation__c();
                ID profileID=[Select id,Name from Profile where name ='Partner Community User'].id;
                e.Task_Link__c=t.id;
             List< User> ActiveUSer=[select id,isActive,Title,name from user where id=:t.OwnerId and isActive=True and Profileid!=:profileID limit 1];
                if(ActiveUSer.size()>0){
                       If(ActiveUSer[0].isActive){
                           if(ActiveUSer[0].Title!=null){
                                  if(ActiveUSer[0].Title=='Accounting Coordinator'){
                 		e.Department__c='Accounting Coordinators';       
                    }else if(ActiveUSer[0].Title.contains('Advisor Admin')){
                        e.Department__c='Admin';
                    }else if(ActiveUSer[0].Title.contains('Bookkeeper')|| ActiveUSer[0].Title.contains('Bookkeeping')){
                         e.Department__c='Bookkeeping';
                    }else if(ActiveUSer[0].Title=='Client Account Manager'){
                        e.Department__c='CAM';
                    }else if(ActiveUSer[0].Title.contains('Client Success Coordinator')){
                        e.Department__c='Client Success Coordinator Admin';
                    }else if(ActiveUSer[0].Title.contains('Law Coordinator')){
                        e.Department__c='Client Success Coordinator Admin';  }
                      else if(ActiveUSer[0].Title.contains('Tax')){
                          e.Department__c='Tax';
                    }else if(ActiveUSer[0].Title.contains('(BCP)') ){
                         e.Department__c='BCP';
                    }else if(ActiveUSer[0].Title.contains('Advisor Support Specialist') ){
                         e.Department__c='Advisor Support Specialist';
                    }
                    
                 
                }	
                           }
                 
                }
             
                e.Created_by_Automation__c=true;
                e.Escalation_Reason__c='Welcome Call SOP Not Being Followed';
                e.Related_Case_Escalation__c=t.WhatId;
                e.Related_Client__c=t.Client__c;
                e.Person_Responsible__c=t.OwnerId;
                e.Escalation_Status__c='Not Started';
                e.All_Services_Status__c='Step 1 - Supervisor';
                WcEscaltions.add(e);
				recordsProcessed=recordsProcessed+1;
             
            }
              try { 
             If(WcEscaltions.size()>0){ 
                 	recordsProcessed=recordsProcessed+1;
              upsert WcEscaltions;
     
             }
                  
             
         } catch (Exception ex) { 
         	System.Debug('Insert failed ' + ex);
         } 
       
          
            
            
            
          
        }
        global void finish(Database.BatchableContext bc){
               System.debug(recordsProcessed + ' records processed.');
           System.debug(WcEscaltions.size() + ' records size.');
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