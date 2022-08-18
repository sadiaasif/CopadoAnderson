public class Team3StalledProcessingTask2Daysctrl {
  @AuraEnabled
    public static List<task> getAlltasks() {
          Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();
        Id LawProfileID=[Select Id,name from profile where name='Law Coordinator' limit 1].id;
          Id lawCommunityProfileID=[Select Id,name from profile where name='Service Comm-Service Manager' limit 1].id;
        
         
        return [Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,Related_Entity__c,Related_Entity__r.Name,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c,Client__c,Client__r.Base_Url__c,Client__r.Name,CreatedDate From task where RecordTypeID=:devoppcallRecordTypeId and (NOT subject Like 'Welcome Call%') and (Processing_Stage__c='Name Rejected' or Processing_Stage__c='Supervisor Review'or Processing_Stage__c='Back to CSR' or Processing_Stage__c='Review/Update Structure' or Processing_Stage__c='' ) and (Status!='Completed' ) and(Client__r.Teams__c IN ('Team 3','VIP','Team Renewals','Temp Team'))and (owner.ProfileID =:LawProfileID or owner.ProfileID =:lawCommunityProfileID  ) ];
    }
     @AuraEnabled
public static List<task> findByName(String   startDate,String   endDate) {
    Date startingDate = Date.valueOf(startDate);
      Date EndingDate = Date.valueOf(endDate);
System.debug('date'+startingDate);
     Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();
        Id LawProfileID=[Select Id,name from profile where name='Law Coordinator' limit 1].id;
          Id lawCommunityProfileID=[Select Id,name from profile where name='Service Comm-Service Manager' limit 1].id;
        
         
        return [Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,Related_Entity__c,Related_Entity__r.Name,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c,Client__c,Client__r.Base_Url__c,Client__r.Name,CreatedDate From task where RecordTypeID=:devoppcallRecordTypeId and (NOT subject Like 'Welcome Call%') and (Processing_Stage__c='Name Rejected' or Processing_Stage__c='Supervisor Review'or Processing_Stage__c='Back to CSR' or Processing_Stage__c='Review/Update Structure' or Processing_Stage__c='' ) and (Status!='Completed' ) and(Client__r.Teams__c IN ('Team 3','VIP','Team Renewals','Temp Team'))and (owner.ProfileID =:LawProfileID or owner.ProfileID =:lawCommunityProfileID  )and( ActivityDate>=:startingDate and ActivityDate<=:EndingDate) ];
    }
    
      @AuraEnabled
    public static Integer getCounttasks() {
          Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();
        Id LawProfileID=[Select Id,name from profile where name='Law Coordinator' limit 1].id;
          Id lawCommunityProfileID=[Select Id,name from profile where name='Service Comm-Service Manager' limit 1].id;
        
         List<task> tasklist=[Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,Related_Entity__c,Related_Entity__r.Name,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c,Client__r.Name,CreatedDate From task where RecordTypeID=:devoppcallRecordTypeId and (NOT subject Like 'Welcome Call%') and (Processing_Stage__c='Name Rejected' or Processing_Stage__c='Supervisor Review'or Processing_Stage__c='Back to CSR' or Processing_Stage__c='Review/Update Structure' or Processing_Stage__c='' ) and (Status!='Completed' ) and(Client__r.Teams__c IN ('Team 3','VIP','Team Renewals','Temp Team'))and (owner.ProfileID =:LawProfileID or owner.ProfileID =:lawCommunityProfileID  ) ];
        return tasklist.size();
    }
      @AuraEnabled
    public static Integer getCounttasksFilter(String   startDate,String   endDate) {
          Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();
        Id LawProfileID=[Select Id,name from profile where name='Law Coordinator' limit 1].id;
          Id lawCommunityProfileID=[Select Id,name from profile where name='Service Comm-Service Manager' limit 1].id;
         Date startingDate = Date.valueOf(startDate);
      Date EndingDate = Date.valueOf(endDate);
        
         List<task> tasklist=[Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,Related_Entity__c,Related_Entity__r.Name,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c,Client__c,Client__r.Base_Url__c,Client__r.Name,CreatedDate From task where RecordTypeID=:devoppcallRecordTypeId and (NOT subject Like 'Welcome Call%') and (Processing_Stage__c='Name Rejected' or Processing_Stage__c='Supervisor Review'or Processing_Stage__c='Back to CSR' or Processing_Stage__c='Review/Update Structure' or Processing_Stage__c='' ) and (Status!='Completed' ) and(Client__r.Teams__c IN ('Team 3','VIP','Team Renewals','Temp Team'))and (owner.ProfileID =:LawProfileID or owner.ProfileID =:lawCommunityProfileID  )and( ActivityDate>=:startingDate and ActivityDate<=:EndingDate) ];
        return tasklist.size();
    }
    
}