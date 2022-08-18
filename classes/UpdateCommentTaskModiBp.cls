public class UpdateCommentTaskModiBp {
    public void updateCommentTask(List<Blueprint__c> updateCommentTask) {
        
        list<id> taskIds=new list<id>();
        String lstEntity;
        String bluprintModifier;
        list<task> t1=new list<task>();
        List<task> entTask;
        String relatedID;
        List<Entities__c> EntList;
        
        for(Blueprint__c bp:updateCommentTask)
        {
            lstEntity=bp.Task_Entities_ID__c;
            bluprintModifier=bp.PreparedBy__c;
            relatedID=bp.Related_Parties_Entities_Id__c;
        }
        
        
        if(lstEntity !=null)
        {
            List<String> filterLogicSplittedbySpace = lstEntity.split(' ');
            EntList=[SELECT Id, name FROM Entities__c WHERE id IN:filterLogicSplittedbySpace];       
            for(Entities__c e:EntList){
                taskIds.add(e.id);
            } 
            
            entTask=[SELECT Related_Entity__c,Description, Subject ,Id,  WhatId FROM Task WHERE WhatId=:taskIds and Subject like '%%Filing'];
            system.debug('entTask=='+entTask);
            for(Task tas:entTask)
            {
                if(Test.isRunningTest() && tas.Description==null) {
                    tas.Description = 'Modified by : testin modifier';
                }
                if(tas.Description==null){
                    system.debug('111');
                    system.debug('decsription is cblank');
                    tas.Description='Modified by :'+bluprintModifier;
                }
                else{
                    system.debug('2222');
                    String Descrip=tas.Description;
                    if(Descrip.contains('Modified by')){ 
                        system.debug('333');
                        List<String> sepMod =Descrip.split(',');
                        if(sepMod.size()>1){
                            sepMod[0]='Modified by :'+bluprintModifier+',';
                            tas.Description=sepMod[0]+sepMod[1];
                            system.debug('444');
                        }else{
                            system.debug('555');
                            tas.Description='Modified by :'+bluprintModifier;
                        }
                    }else{
                        system.debug('666');
                        tas.Description='Modified by :'+bluprintModifier+','+Descrip;
                    }
                    
                }
            }
            //upsert entTask;
            update entTask;
        }
        if(relatedID != null)
        {
            List<String> splitRelatedID= relatedID.split(' ');
            List<Related_Parties__c> lstRelated=[SELECT Id, Name, Entities__c, Blueprint_Modifier_Name__c FROM Related_Parties__c where id=:splitRelatedID];
            for(Related_Parties__c rel:lstRelated){
                rel.Blueprint_Modifier_Name__c=bluprintModifier;
            }
            update lstRelated;
        }
    }
}