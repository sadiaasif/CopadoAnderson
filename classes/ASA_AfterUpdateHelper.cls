/***********************************
* Author : Ifrahim Afzal
* Description : Class is invoked on After update of the Trigger context
* Class : ASA_AfterUpdateHelper
***********************************/
public class ASA_AfterUpdateHelper {
    
    public static Final String  FOLLOW_UP_YEAR= '1 Year Follow-up';
    public static Final String ASA_YEAR_FOLLOW = 'ASA Yearly Follow-up';
    public static Id call = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
    public static Map<Id,ASA__c> asaGenMap = new Map<Id,ASA__c>();
    /***********************************
    * Author : Ifrahim Afzal
    * Method : critierataskGeneration
    * Description : Generate task on below condition 
    				ASA Stage changed(ASA_Stage__c)      : 1-year Follow-up
					Follow Up date changed(ASA_Stage__c)  
					Record Type : None
     ***********************************/
    public static void critierataskGeneration(List<ASA__c> asaList,Map<Id,ASA__c> newMap, Map<Id,ASA__c> oldMap){
        try{
            if(!asaList.isEmpty()){
                for(ASA__c asa : asaList){
                    if((asa.ASA_Stage__c == FOLLOW_UP_YEAR && asa.ASA_Stage__c != oldMap.get(asa.Id).ASA_Stage__c) 
                        || asa.Yearly_Follow_up_Date__c != oldMap.get(asa.Id).Yearly_Follow_up_Date__c){
                        asaGenMap.put(asa.Id,asa);
                    }
                }
            }
            
            if(!asaGenMap.isEmpty()){
                taskGeneration(asaGenMap);
            }
        }catch(Exception e){
            System.debug('e.getMessage'+e.getMessage());
        }
    }
    
    
    /***********************************
    * Author : Ifrahim Afzal
    * Method : taskCreation
    * Description : Create a call task on below condition 
    				RecordType= call
                    AssignedTo= Jaime Escandon
                    Due date = 1year from the date it was set to followup
                    Subject= ASA Yearly Follow-up
                    related to Id= The Asa record that triggered the Task
					Client field= Associated to the related client on ASA
					Contact Field = Associated to the related contact on ASA
     ***********************************/
    public static void taskGeneration(Map<Id,ASA__c> asaGenMap){
        try{
            
            Task task = new Task();
            List<Task> followUpList = new List<Task>();
            Map<Id,Task> asaToTask = new Map<Id,Task>();
            
            for(Task taskObj :[Select Id,Subject,WhatId from Task Where Subject =: ASA_YEAR_FOLLOW and WhatId IN : asaGenMap.keySet() Limit 50000]){
               	 asaToTask.put(taskObj.WhatId, taskObj);
            }
            
            
            for(Id asaId : asaGenMap.keySet()){
                task = new Task();  
                if(asaToTask.containsKey(asaId)){  /*Update the Existing Task*/
                    task = asaToTask.get(asaId);
                    task.ActivityDate = asaGenMap.get(asaId).Yearly_Follow_up_Date__c;
                    
                }else{ /*Create the Task*/
                    task.RecordTypeId = call;
                    task.OwnerId = Follow_up_task_owner__c.getValues('Follow Up').Id__c;
                    task.ActivityDate = asaGenMap.get(asaId).Yearly_Follow_up_Date__c;
                    task.WhatId = asaId;
                    task.Subject = Follow_up_task_owner__c.getValues('Follow Up').Subject__c;
                    task.Client__c = asaGenMap.get(asaId).Client_Name__c;
                    task.WhoId =  asaGenMap.get(asaId).Contact__c;
                }
                followUpList.add(task);
            }
            
            if(!followUpList.isEmpty()){
                Database.UpsertResult[] ResultList = Database.upsert(followUpList, false);
                for (Database.UpsertResult sr : ResultList) {
                    if (!sr.isSuccess()) {
                        System.debug('Follow up task get created/Updated' + sr.getId());
                    }
                    else {
                        for(Database.Error err : sr.getErrors()) {
                            System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        }
                    }
                }
            }
        }catch(Exception e){
             System.debug('e.getMessage'+e.getMessage());
        }
    }
}