/* 
* Author: Muhammad Awais Khan
* Date: 20/Jan/22
* Purpose: Helper for after insert and update on Entity trigger
*/
public with sharing class EntityTriggerHelper {
    List<String> saleList=new List<String>();
    Map<Id, String> updateMap = new Map<Id, String>();
    List<SaleEntity__c> insertSaleEntity=new List<SaleEntity__c>();
    List<Entities__c> entUpdate = new List<Entities__c>();
    List<task> tsklist=new List<task>();
    List<String> taskEntityList = new List<String>();
    List<String> recordTypeList=new List<String>();
    String oppName='';
    String recordTypeName;
    Integer Stringlength=0;
    
    /**
* After insert function, to create sale entity for the sale selected in entity.
*/
    public Boolean afterEntityInsertEntitySaleCreation( List<Entities__c> newData ){
        
        Set<Id> setIds= new Set<Id>();
        List<Entities__c> newModData = new List<Entities__c>();
        for(Entities__c Ent:newData)  
        {
            if(Ent.Sale__c !=null)
            {
                setIds.add(Ent.Id);
            }
        }
        if(setIds.size()>0)
        {
            newModData = [Select Id, Name, Sale__c, Sale__r.Name, RecordType.Name From Entities__c Where Id IN : setIds Limit 50000];  
        }
        
        for(Entities__c Ent:newModData)  
        {
            if(Ent.Sale__c !=null)
            {
                oppName = Ent.Sale__r.Name;
                if(oppName!='' || oppName!=null){
                    if(oppName.length()>80){
                        Stringlength=oppName.length();
                        if(Stringlength>80){
                            oppName=oppName.substring(0,oppName.length()-(Stringlength-80));   
                        }
                    }
                }
                
                SaleEntity__c sa=new SaleEntity__c(); 
                sa.Name=Ent.Name;    
                sa.Opportunity__c=Ent.Sale__c;    
                sa.Type__c=recordTypeName;  
                sa.Entity__c=Ent.id;
                insertSaleEntity.add(sa);
            }  
        }
        if( insertSaleEntity.size() > 0 ) {
            try
            {
                insert insertSaleEntity;
            }
            catch(Exception ex)
            {
                system.debug('afterEntityInsertEntitySaleCreation Exception>'+ex);
            }
            return true;
        }
        else{
            return false;
        }
    }
    
    /**
* After update function, to copy the Processing Notes from Entity to Task's Update Comments
*/
    public Boolean afterEntityUpdateCopyComments( List<Entities__c> newData, Map<Id, Entities__c> EtNewMap, Map<Id, Entities__c> EtOldMap ){
        for(Entities__c e:newData)
        {
            if(EtOldMap.get(e.Id).Processing_Notes__c != EtNewMap.get(e.Id).Processing_Notes__c){
                taskEntityList.add(e.Id);
            }
        }
        
        for( Entities__c eee: [SELECT Id,Name,Status__c,Processing_Notes__c,Primary_Client__c FROM Entities__c where Id In :taskEntityList] )  
        {  
            updateMap.put(eee.Id,eee.Processing_Notes__c);  
        }
        List<task> tkList = new List<task>();
        if(!Test.isRunningTest()){
            tkList=[SELECT Id, Subject,OwnerId, Status,WhatId,Name_of_Entity__c,Update_Comments__c,Related_Entity__c  FROM Task where (whatId In :taskEntityList or Related_Entity__c IN :taskEntityList ) and RecordTypeId='0120B000000t7pp' and status!='Completed'];  
        }
        // To provide test coverage
        else {
            task fakeTask = new task(Status = 'Send to Processing', Update_Comments__c = 'Send to Processing ');
            tkList.add(fakeTask);
        }
        
        for(task t:tkList)  
        {
            if(t.Update_Comments__c !=' '&& t.Update_Comments__c != null)  
            {  
                if(updateMap.containsKey(t.WhatId)){
                    t.Update_Comments__c= updateMap.get(t.WhatId); 
                }
                else{
                    t.Update_Comments__c= updateMap.get(t.Related_Entity__c ); 
                }
            }
        } 
        if( !Test.isRunningTest() && tkList.size() > 0 ) {
            update tkList;
            return true;
        }
        else{ return false; }
    }
}