public class Taxtasktabctrl {
@AuraEnabled
    public static List<task> getTaxtasks(Id ClientId) {
        Set<id> conAcctId=new Set<Id>();
        List<Contact> contactList=[Select id from Contact where AccountId =:ClientId];
        for(contact con:contactList){
            conAcctId.add(con.id); 
        }
        Id devTaxRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Tax').getRecordTypeId();
      
        return [Select id,RecordType.Name,Client__r.Name,WhatId,Subject,What.Name,Description,Owner.Name,Tax_Stage__c,Update_Comments__c from task where RecordTypeId=:devTaxRecordTypeId and (Client__c=:ClientId OR WhoId IN :conAcctId)];
    }
     @AuraEnabled
     public static boolean updateTaxtaskrecord( List < task > updatedtaxtaskRecordList ) {    
            
        try {
            
           
          
            update updatedtaxtaskRecordList;  
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    }
    @AuraEnabled
public static List<task> findByName(String searchKey, Id ClientId) {
   Set<id> conAcctId=new Set<Id>();
        List<Contact> contactList=[Select id from Contact where AccountId =:ClientId];
        for(contact con:contactList){
            conAcctId.add(con.id);
        }
  
      Id devTaxRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Tax').getRecordTypeId();
   String name = '%' + searchKey + '%';
   return [Select id,RecordType.Name,Client__r.Name,Subject,What.Name,WhatId,Description,Owner.Name,Tax_Stage__c,Update_Comments__c from task  WHERE (Subject LIKE :name or Tax_Stage__c Like:name ) AND RecordTypeId=:devTaxRecordTypeId and (Client__c=:ClientId OR WhoId IN :conAcctId) ];
}
}