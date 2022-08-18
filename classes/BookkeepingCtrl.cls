public class BookkeepingCtrl {
@AuraEnabled
    public static List<Set_of_Books__c> getSetofbooks(Id CaseID,Id userId) {
        
        ID CaseClientId=[Select AccountId from Case Where id=:CaseID].AccountId;
        string Username=[select Name from user where id=:userId].Name;
        List<Set_of_Books__c> RelatedToSetofbooks=[Select id,Name,Bookkeeper__c,Bookkeeping_Reviewer__c,Fiscal_Year_End__c from Set_of_Books__c where Client__c=:CaseClientId and (Bookkeeper__c=:Username or Bookkeeping_Reviewer__c=:Username) ];
        System.debug('Size--'+RelatedToSetofbooks.size());
        if(RelatedToSetofbooks.size()>0){
            return RelatedToSetofbooks;
        }else{
       		return null;
        }
        
    }
    @AuraEnabled
      public static List<Bookkeeping__c> getbookkeepingRecords(Id CaseID,Id userId) {
        
        ID CaseClientId=[Select AccountId from Case Where id=:CaseID].AccountId;
        string Username=[select Name from user where id=:userId].Name;
        List<Bookkeeping__c> RelatedToBookKeepingRecords=[Select id,Name,Bookkeeper__c,Bookkeeper_Reviewer__c,Set_of_Books__c,Set_of_Books__r.Name,Entity__c,Entity__r.Name,Fiscal_Year_End__c from Bookkeeping__c where Client_Name__c=:CaseClientId and (Bookkeeper__c=:Username or Bookkeeper_Reviewer__c=:Username) ];
        System.debug('Size--'+RelatedToBookKeepingRecords.size());
        if(RelatedToBookKeepingRecords.size()>0){
            return RelatedToBookKeepingRecords;
        }else{
       		return null;

        
    }
}
      @AuraEnabled
    public static String getClientId(Id CaseID) {
        
        String CaseClientId=[Select AccountId from Case Where id=:CaseID].AccountId;
        List<Account> RelatedToClient=[Select id,Name from Account Where id=:CaseClientId];
        if(RelatedToClient.size()>0){
            return CaseClientId;
        }else{
       		return null;
        }
        
    }
       @AuraEnabled
    public static String getcontactId(Id CaseID) {
        
        String CasecontactId=[Select ContactId from Case Where id=:CaseID].ContactId;
        List<contact> RelatedToContact=[Select id,Name from contact Where id=:CasecontactId];
        if(RelatedToContact.size()>0){
            return CasecontactId;
        }else{
       		return null;
        }
        
    }
        @AuraEnabled
public static List<Set_of_Books__c> findByNameSetofBooks(String searchKey, Id CaseID,Id userId) {
    ID CaseClientId=[Select AccountId from Case Where id=:CaseID].AccountId;
        string Username=[select Name from user where id=:userId].Name;
   
   String name = '%' + searchKey + '%';
   return [Select id,Name,Bookkeeper__c,Bookkeeping_Reviewer__c,Fiscal_Year_End__c from Set_of_Books__c where Client__c=:CaseClientId and (Bookkeeper__c=:Username or Bookkeeping_Reviewer__c=:Username) and (Name LIKE :name or Fiscal_Year_End__c Like:name ) ];
}
     @AuraEnabled
public static List<Bookkeeping__c> findByNameBookkeepingRecords(String searchKey, Id CaseID,Id userId) {
    List<Id> sodIDs=new List<ID>();
    ID CaseClientId=[Select AccountId from Case Where id=:CaseID].AccountId;
        string Username=[select Name from user where id=:userId].Name;
     String name = '%' + searchKey + '%';
   List<Set_of_Books__c> setofBooks=[Select id from Set_of_Books__c where Name like :name];
    for(Set_of_Books__c sof:setofBooks){
        sodIDs.add(sof.id);
    }
  
   return [Select id,Name,Bookkeeper__c,Bookkeeper_Reviewer__c,Set_of_Books__c,Set_of_Books__r.Name,Entity__c,Entity__r.Name,Fiscal_Year_End__c from Bookkeeping__c where Client_Name__c=:CaseClientId and (Bookkeeper__c=:Username or Bookkeeper_Reviewer__c=:Username) and (Name LIKE :name or Fiscal_Year_End__c Like:name or Set_of_Books__c In : sodIDs ) ];
}
}