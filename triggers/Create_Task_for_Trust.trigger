trigger Create_Task_for_Trust on Trust__c (after insert) {

    
    List<String> taskContactList = new List<String>();
    Map<Id, Id> contactMap = new Map<Id, Id>();
    Map<Id, String> camMap = new Map<Id, String>();
    Map<Id, String> csrMap = new Map<Id, String>();
    for(Trust__c et : trigger.new){
        taskContactList.add(et.Primary_Client__c);
    }
    List<Contact> contactTask = [SELECT Id, AccountId, FirstName, LastName, Name FROM Contact where AccountId In :taskContactList]; 
    for(Contact cnt : contactTask){
        contactMap.put(cnt.AccountId, cnt.Id);
    }
    
    List<Account> accTask = [SELECT Id, Name, Assigned_CSR__c, Assigned_CAM__c FROM Account where Id In :taskContactList]; 
    for(Account acc : accTask){
        system.debug('acc.Assigned_CAM__c = ' + acc.Assigned_CAM__c);
        system.debug('acc.Assigned_CSR__c = ' + acc.Assigned_CSR__c);
        camMap.put(acc.Id, acc.Assigned_CAM__c);
        csrMap.put(acc.Id, acc.Assigned_CSR__c);
    }
    Map<Id, String> rtMap = new Map<Id, String>();
    List<Id> rtstring = new List<Id>();
    List<Task> taskList = new List<Task>();
    Id taskRT = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Processing' and SobjectType = 'Task'].Id; 
    Id taskUser = [SELECT Id, Name FROM User where Name = 'Anderson Advisors'].Id; 
    List<RecordType> objNames = [SELECT Id, Name, DeveloperName FROM RecordType where Name = 'Land Trust' and SobjectType = 'Trust__c'];
    for(RecordType rc : objNames){
        rtMap.put(rc.Id, rc.Name);
       // rtstring.add(rc.Id);
    }
    system.debug('======1');
    for(Trust__c ent : trigger.new){
         system.debug('Status__c' + ent.Status__c);
      //  if(rtstring.contains(ent.RecordTypeId)){
        if(ent.Status__c == 'Sent To Processing'){
            system.debug('CAM ====='+ camMap.get(ent.Primary_Client__c));
            system.debug('CSR ====='+ csrMap.get(ent.Primary_Client__c));
            String camName = camMap.get(ent.Primary_Client__c);
            String csrName = csrMap.get(ent.Primary_Client__c);
            String rtName = rtMap.get(ent.RecordTypeId);
            Task tk = new Task();
            tk.WhatId = ent.Id;
            tk.Case_connect__c = ent.Case__c;
            tk.CAM__c = camName;
            tk.CSR__c = csrName;
            tk.Priority = 'Normal';
            tk.Status = 'Not Started';
            tk.Subject = rtName + ' Filing' ;
            tk.RecordTypeId = taskRT;
            tk.OwnerId = taskUser;
            tk.Client__c = ent.Primary_Client__c;
            tk.Name_of_Entity__c = ent.Primary_Client__c;
            //tk.Related_Entity__c = ent.Id;
            tk.ActivityDate = Date.Today() + 8;
            tk.Processing_Stage__c = 'Not Started';
            tk.WhoId = contactMap.get(ent.Primary_Client__c);
            taskList.add(tk);
            system.debug('========2');
        }
    }
    if(taskList.size() > 0 ){
        try{
            Insert taskList;     
            system.debug('========3');
        } catch (Exception e) {
              
        system.debug('e ==== ' + e);
        }
        
    }
    
}