/***********************************
* Author : Ifrahim Afzal
* Description : Trigger on ASA__C
* Class : ASA_Trigger
***********************************/
trigger ASA_Trigger on ASA__c (before update,after update,before Insert) {
    try{
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                ASA_BeforeInsertHelper.populateFields(Trigger.new);
            }
            if(Trigger.isUpdate){
                ASA_BeforeUpdatetHelper.populateFollowUp(Trigger.new,Trigger.oldMap);
            }
        }
        if(Trigger.isAfter){
            if(Trigger.isUpdate){
                ASA_AfterUpdateHelper.critierataskGeneration(Trigger.new,Trigger.newMap,Trigger.oldMap);
            }
        }
    }catch(Exception e){
        System.debug('e'+e.getLineNumber());  
    }
}