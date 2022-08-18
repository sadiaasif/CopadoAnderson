public class ActivitySearchtabctrl {
    @AuraEnabled
    public static List<task> getActivitySearch(Id ClientId) {
        Set<id> conAcctId=new Set<Id>();
        List<Contact> contactList=[Select id from Contact where AccountId =:ClientId];
        for(contact con:contactList){
            conAcctId.add(con.id); 
        }
  
        return [Select id,RecordType.Name,Client__r.Name,Subject,What.Name,WhatId,Description,Owner.Name,Tax_Stage__c,Update_Comments__c,Status from task where (Client__c=:ClientId OR WhoId IN :conAcctId) LIMIT 200];
    }
    
    @AuraEnabled
    public static boolean updateActivitySearchrecord( List < task > updatedActivitySearchRecordList ) {    
        
        try {

            update updatedActivitySearchRecordList;  
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

        String name = '%' + searchKey + '%';
        return [Select id,RecordType.Name,Client__r.Name,Subject,What.Name,WhatId,Description,Owner.Name,Tax_Stage__c,Update_Comments__c,Status,Formula_Comments__c from task  WHERE (Subject LIKE :name or Formula_Comments__c like :name or Status Like:name or Owner.Name Like :name or RecordType.Name Like :name) and (Client__c=:ClientId OR WhoId IN :conAcctId) LIMIT 1000];
    }
}