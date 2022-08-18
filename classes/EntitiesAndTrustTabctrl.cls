public class EntitiesAndTrustTabctrl {
@AuraEnabled
   public static List<Entities__c> getEntity(Id clientid) {

     
   return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Status__c,EIN__c,Tax_Status__c,Disregarded_To__r.Name,Disregarded_To__c,Federal_Return__c,Organization_State__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Entities__c where Primary_Client__c=:clientid ];
       
       
   }
    
  @AuraEnabled
   public static List<Trust__c> getTrust(Id clientid) {
   

     
   return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Trust__c where Primary_Client__c=:clientid];
       
       
   }
     @AuraEnabled
    public static boolean insideCommunity(){
        Id siteId = Site.getSiteId();
        if(siteId != Null){
            return true;
        }
        return false;
    }
    
     @AuraEnabled
    public static List<Entities__c> findByEntityName(String searchKey, Id ClientId) {
      
   
        String name = '%' + searchKey + '%';
            
        if(searchKey!='' && searchKey!=null){
             return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Status__c,EIN__c,Tax_Status__c,Disregarded_To__r.Name,Disregarded_To__c,Federal_Return__c,Organization_State__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Entities__c where Primary_Client__c=:clientid  and  (name LIKE :name or Organization_State__c like :name or RecordType.Name Like :name)  LIMIT 1000];
        }else{
           
  return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Status__c,EIN__c,Tax_Status__c,Disregarded_To__r.Name,Disregarded_To__c,Federal_Return__c,Organization_State__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Entities__c where Primary_Client__c=:clientid ];
        }
        
    }
    
      
     @AuraEnabled
    public static List<Trust__c> findByTrustName(String searchKey, Id ClientId) {
      
       

        String name = '%' + searchKey + '%';
        if(searchKey!='' && searchKey!=null){
            return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Trust__c where Primary_Client__c=:clientid  and  (name LIKE :name  or RecordType.Name Like :name)  LIMIT 1000];   
        }else{
            return [SELECT Id,Primary_Client__c, Primary_Client__r.name,Primary_Client__r.Base_Url__c,Consult_Scheduled__c,RecordTypeId,LivingTrustAttorney__c,Assigned_Paralegal__c,Assigned_Paralegal__r.name,Documents_Complete__c,Date_Shipped__c,RecordType.name,Name,Case__c,Case__r.CaseNumber  FROM Trust__c where Primary_Client__c=:clientid];
        }
       
        
    }
}