public class UpdateTaskforRelatedParties {
    
    String RelList;
    id relatedid;
    String commentDesc = '';
    Boolean otherEntityMemberOne;
    string subj;
    id recTypeId;
    String BlueprintMod;
    RecordType rectype;
    String communityUrl='https://platinum.force.com/aba/s/detail';
    set<id> entId=new set<id>();
    map<Id,string> memberMap=new map<Id,string>();
    List<Task> taskList=new List<Task>();
    List<Related_Parties__c> updateTask=new List<Related_Parties__c>();
    
    public void updateTaskCommentByRelOninsert(List<Related_Parties__c> updateTasks) {
        
        System.debug('In insert');
        for(Related_Parties__c Rel :updateTasks)
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
            
            memberMap.put(Rel.Entities__c,commentDesc);
            RelList= Rel.Other_1st_Member_Name__c;
            relatedid=Rel.id;
            entId.add(Rel.Entities__c);
            otherEntityMemberOne= Rel.Other_Entity_Member_1__c;
            BlueprintMod=Rel.Blueprint_Modifier_Name__c;
            system.debug('BlueprintMod=='+BlueprintMod);
        }
        taskList=[SELECT Client__c, Related_Entity__c, Name_of_Entity__c, Description, WhoId, Id, WhatId, Subject,RecordTypeId FROM Task WHERE Related_Entity__c=:entId];
        for(Task t:taskList)
        {
            subj=t.Subject;
            recTypeId=t.RecordTypeId;
            
        }
        for(Task t:taskList)
        {
            if(recTypeId!=null){
                rectype=[select id,name from RecordType where id=:recTypeId];
                system.debug('rectype=='+rectype);
                
                if(subj.contains('Filing') && rectype.Name=='Processing')
                {
                    String memMap = memberMap.get(t.Related_Entity__c);        
                    if(memMap==''){
                        t.Description='';
                    }
                    else
                    {
                        
                        t.Description='For information related to '+ memMap +'- Please check the Related party-'+communityUrl+'/'+relatedid;
                    }
                }
                update taskList;
            }
        }   
    }
    
    public void updateTaskCommentByRelOnUpdate(List<Related_Parties__c> updateTasks,String triggerType) {
        
        System.debug('In Update');
        for(Related_Parties__c Rel :updateTasks)
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
            
            memberMap.put(Rel.Entities__c,commentDesc);
            RelList= Rel.Other_1st_Member_Name__c;
            relatedid=Rel.id;
            entId.add(Rel.Entities__c);
            otherEntityMemberOne= Rel.Other_Entity_Member_1__c;
            BlueprintMod=Rel.Blueprint_Modifier_Name__c;
            system.debug('BlueprintMod=='+BlueprintMod);
        }
        
        taskList=[SELECT Client__c, Related_Entity__c, Name_of_Entity__c, Description, WhoId, Id, WhatId, Subject,RecordTypeId FROM Task WHERE Related_Entity__c=:entId];
       /* for(Task t:taskList)
        {
            subj=t.Subject;
            recTypeId=t.RecordTypeId;
            
        }*/
        for(Task t:taskList)
        {
            subj=t.Subject;
            recTypeId=t.RecordTypeId;
            if(recTypeId!=null){
                rectype=[select id,name from RecordType where id=:recTypeId];
                system.debug('rectype=='+rectype);
                
                if(subj.contains('Filing') && rectype.Name=='Processing')
                {
                    String memMap = memberMap.get(t.Related_Entity__c);        
                    if(memMap==''&& BlueprintMod==''){
                        t.Description='';
                    }
                    else if(memMap!=''&& (BlueprintMod!='' && BlueprintMod !=null))
                    {
                        system.debug('updated Task -111');
                        t.Description='Modified By: '+ BlueprintMod +', For information related to '+ memMap +'- Please check the Related party-'+communityUrl+'/'+relatedid;
                    }
                    else if(memMap!='' && BlueprintMod==null)
                    {
                        system.debug('modifier is null');
                        t.Description='For information related to '+ memMap +'- Please check the Related party-'+communityUrl+'/'+relatedid;
                    }
                }
                update taskList;
            }
        }  
        
    }
}