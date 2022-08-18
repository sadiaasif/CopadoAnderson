public class ProcessingConsoleCtrl {
@AuraEnabled
    public static ID getEntityId(Id TaskID) {
        
        ID TaskEntityId=[Select Related_Entity__c from Task Where id=:TaskID].Related_Entity__c;
        List<Entities__c> RelatedToEntity=[Select id,Name from Entities__c Where id=:TaskEntityId];
        if(RelatedToEntity.size()>0){
            return TaskEntityId;
        }else{
       		return null;
        }
        
    }
    @AuraEnabled
    public static String getClientId(Id TaskID) {
        
        String TaskClientId=[Select Client__c from Task Where id=:TaskID].Client__c;
        List<Account> RelatedToClient=[Select id,Name from Account Where id=:TaskClientId];
        if(RelatedToClient.size()>0){
            return TaskClientId;
        }else{
       		return null;
        }
        
    }
    @AuraEnabled
    public static List<SaleEntity__c> getSaleEntities(Id TaskID) {
        
        ID TaskEntityId=[Select Related_Entity__c from Task Where id=:TaskID].Related_Entity__c;
        List<SaleEntity__c> RelatedToEntity=[Select id,Name,Opportunity__c,Opportunity__r.Name,Status__c,Sale_Type__c,Amount__c,Balance_Due__c,Contract_Effective_Date__c,Contract_End_Date__c,Renewal_State__c,Filing_Fees_Paid__c from SaleEntity__c Where Entity__c=:TaskEntityId];
        if(RelatedToEntity.size()>0){
            return RelatedToEntity;
        }else{
       		return null;
        }
        
    }
       @AuraEnabled
    public static List<Contact> getRelatedContact(Id TaskID) {
        
         String TaskClientId=[Select Client__c from Task Where id=:TaskID].Client__c;
        List<Contact> RelatedTocontact=[Select id,Name,Account_Roles__c,Email,Phone,MobilePhone,Nickname__c,X2_Free_Platinum_Tickets_Used__c from Contact Where AccountId=:TaskClientId];
        if(RelatedTocontact.size()>0 && TaskClientId!='' && TaskClientId!=null){
            return RelatedTocontact;
        }else{
       		return null;
        }
        
    }
      @AuraEnabled
    public static List<opportunity> getRelatedSales(Id TaskID) {
        
         String TaskClientId=[Select Client__c from Task Where id=:TaskID].Client__c;
        List<opportunity> RelatedToSales=[Select id,Name,StageName,RecordTypeID,RecordType.Name,Amount,ChargentSFA__Balance_Due__c,CloseDate,OwnerID,Owner.Name,Entity__c,Entity__r.Name,Sales_Rep__c,Sales_Rep__r.Name from opportunity Where AccountId=:TaskClientId];
        if(RelatedToSales.size()>0 && TaskClientId!='' && TaskClientId!=null){
            return RelatedToSales;
        }else{
       		return null;
        }
        
    }
    
   

}