public class bookkeepingFieldsFromTasks {
    
    public static boolean firstRun;
    public static boolean stopRun;
    
    public void passUpdateFields(List<Task> newList, Map<Id,Task> oldMap) {
        
        if (firstRun == true) return;
        firstRun = true;
        
        Id bookkeepingTaskid = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Bookkeeping_Task').getRecordTypeId();
        
        List<Bookkeeping__c> updateList = new List<Bookkeeping__c>();
        
        for (Task t : newList) {
            
            if (t.RecordTypeId == bookkeepingTaskid && string.valueOf(t.whatId).startsWith('500')) {
                
                if(t.Team_Lead__c != oldMap.get(t.id).Team_Lead__c ||
                   t.Bookkeeping_IC__c != oldMap.get(t.id).Bookkeeping_IC__c) {
                       
                       for (Bookkeeping__c bk : [SELECT Id 
                                                 FROM Bookkeeping__c
                                                 WHERE Case__c = :t.WhatId]) {
                                                     
                                                     bk.Team_Lead__c = t.Team_Lead__c;
                                                     bk.Bookkeeping_IC__c = t.Bookkeeping_IC__c;
                                                     updateList.add(bk);
                                                     
                                                 }
                       
                       
                   } 
                
            }
        }
        
        update updateList;        
    }
    
    public void passInsertFields(List<Task> newList) {
        
        if (stopRun == true) return;
        stopRun = true;
        
        Id bookkeepingTaskid = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Bookkeeping_Task').getRecordTypeId();
        
        List<Bookkeeping__c> updateList = new List<Bookkeeping__c>();
        
        for (Task t : newList) {
            
            if (t.RecordTypeId == bookkeepingTaskid && string.valueOf(t.whatId).startsWith('500')) {
                
                if(t.Team_Lead__c != null ||
                   t.Bookkeeping_IC__c != null) {
                       
                       for (Bookkeeping__c bk : [SELECT Id 
                                                 FROM Bookkeeping__c
                                                 WHERE Case__c = :t.WhatId]) {
                                                     
                                                     bk.Team_Lead__c = t.Team_Lead__c;
                                                     bk.Bookkeeping_IC__c = t.Bookkeeping_IC__c;
                                                     updateList.add(bk);
                                                     
                                                 }
                       
                   }
                
            }
            
            
        }
        update updateList;
    }
    
}