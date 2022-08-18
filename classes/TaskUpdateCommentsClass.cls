public class TaskUpdateCommentsClass {
    
    public void taskUpdated(List<Task> taskUpdate) {
        String blModifier;
        id entityId;
        id relatedID;
        String commentDesc='';
        String subject;
        id recordTypeId;
        RecordType rec;
        map<Id,string> memberMap=new map<Id,string>();
        for(Task T:taskUpdate)
        {
            entityId=T.WhatId; 
            subject=t.Subject;
            recordTypeId=t.RecordTypeId;
        }
        if(recordTypeId!=null){
            rec=[select id, name from RecordType where id=:recordTypeId];
        } 
        if((subject!=null && subject.contains('Filing')) && rec.Name=='Processing'){
            system.debug('33333333');
            
            List<Related_Parties__c> relatedList=[SELECT Id, Name,Other_Entity_Member_1__c,Other_Entity_Member_2__c,Other_Entity_Member_3__c,Other_Entity_Member_4__c, Entities__c, Blueprint_Modifier_Name__c FROM Related_Parties__c WHERE Entities__c=:entityId];
            system.debug('relatedList==srk=='+relatedList);
            if(relatedList.size()>0){
                for(Related_Parties__c rel:relatedList)
                {
                    
                    if(Rel.Other_Entity_Member_1__c){
                        commentDesc += ' Entity Member 1 and';
                    }
                    if(Rel.Other_Entity_Member_2__c){
                        commentDesc += ' Entity Member 2 and';
                    }
                    if(Rel.Other_Entity_Member_3__c){
                        commentDesc += ' Entity Member 3 and';
                    }
                    if(Rel.Other_Entity_Member_4__c){
                        commentDesc += ' Entity Member 4 and';
                    }
                    if(commentDesc!=''){
                        commentDesc=commentDesc.Substring(0,commentDesc.length()-3);
                    }
                    memberMap.put(rel.Entities__c,commentDesc);
                    system.debug('==memberMap=='+memberMap);
                    blModifier=rel.Blueprint_Modifier_Name__c;
                    system.debug('blModifier=='+blModifier);
                    relatedID=rel.id;
                }
                
                List<Entities__c> ent=[SELECT id,name,status__c FROM Entities__c WHERE id=:entityId];    
                for(Task T:taskUpdate)
                {
                    list<task> lstTask=[SELECT Id, RecordTypeId, Subject FROM Task where id=:t.id];
                    system.debug('lstTask==='+lstTask);
                    String memMap = memberMap.get(t.Related_Entity__c);
                    system.debug('memMap==='+memMap);
                    String taskComment = t.Description;
                    if(memMap!='')
                    {
                        system.debug('11111');
                        String communityUrl='https://platinum.force.com/aba/s/detail';
                        if(taskComment==''||taskComment==null){
                            
                            if(blModifier!=null){
                                system.debug('333');
                                t.Description='Created By:'+blModifier+' For information related to '+ memMap +'- Please check the Related party-'+communityUrl+'/'+relatedid; 
                            }
                            else{
                                system.debug('444');
                                t.Description=' For information related to '+ memMap +'- Please check the Related party-'+communityUrl+'/'+relatedid;
                            }
                            
                            system.debug('t.Description=='+t.Description);
                        }
                    }
                    else
                    {
                        system.debug('222222');
                        if(taskComment==''||taskComment==null){
                            if(blModifier!=null){
                                t.Description='Created By:'+blModifier;
                            }
                            system.debug('t.Description=='+t.Description);
                        } 
                    }    
                }
            }
        }       
    }
}