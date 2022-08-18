public class RelatedEstateplanningcommunitiesctrl {
  @AuraEnabled
   public static List<Entities__c> getEntityObjectLivingTrust(Id clientid) {
       Id devoppLivingTrustRecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
       Id devoppLivingTrustobjRecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
     
   return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Entities__c where Primary_Client__c=:clientid and RecordTypeId=:devoppLivingTrustRecordTypeId];
       
       
   }
    @AuraEnabled
   public static List<Trust__c> getTrust(Id clientid) {
   
       Id devoppLivingTrustobjRecordTypeId = Schema.SObjectType.Trust__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
     
   return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Trust__c where Primary_Client__c=:clientid and RecordTypeId=:devoppLivingTrustobjRecordTypeId];
       
       
   }
    
     @AuraEnabled
    public static List<Opportunity> getSalesRecord(Id accId) {
         
       
      
    
        return [Select id,Name,RecordType.Name,Status__c,StageName,Account.Base_Url__c,CloseDate,Probability,pymt__Total_Amount__c,pymt__Balance__c,Entity__c,Entity__r.Name,OwnerId,Owner.name,Sales_Rep__c,Sales_Rep__r.Name From Opportunity where AccountId=:accId and (name like '%Living Trust%' or name like 'Living Trust%' or  name like '%Living Trust' or name='Living Trust' ) ];
    }
              @AuraEnabled
    public static List<task> getlvtasks(Id accId) {
          Id devoppLivingTRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
      set<id> cid= new set<id>();
        for(contact c: [Select id from contact where AccountId=:accId]){
            cid.add(c.id);
        }
         
        return [Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,WhoId,What.Name,LastModifiedDate,WhatId,Status,Client__r.Base_Url__c,Summary__c,Days_Since_Last_Modified__c,Living_Trust_Stages__c From task where WhoId=:cid  and (RecordTypeID=:devoppLivingTRecordTypeId OR  subject Like '%Living Trust%'  or subject like 'Living Trust%' or  subject like '%Living Trust'  or subject='Living Trust'  )  ];
    }
         
           @AuraEnabled
    public static List<Case> getlvcase(Id accId) {
    Id devoppLivingCRecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        return [Select Id, subject,status,CaseNumber,Account.Base_Url__c,RecordTypeId,RecordType.Name,LastmodifiedDate,CreatedDate,OwnerId,Owner.Name From Case where AccountId=:accId and (RecordTypeID=:devoppLivingCRecordTypeId OR  subject Like '%Living Trust%'  or subject like 'Living Trust%' or  subject like '%Living Trust'  or subject='Living Trust'  ) ];
    }
    
  
}