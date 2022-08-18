public class Filing_Changes {@AuraEnabled
  public static List<FilingChangesWrapper> getSale(Id oppId) {
      List<FilingChangesWrapper> returnopp = new List<FilingChangesWrapper>();
    List<opportunity>opp=[SELECT Id, AccountId,RecordTypeId,Name, QB_Invoice_Number__c  FROM opportunity where id=:oppId LIMIT 1];
      for(opportunity o:opp){
          String Invoicesid=o.QB_Invoice_Number__c;
         
        FilingChangesWrapper Rw =
               new FilingChangesWrapper();
               Rw.InvoiceId =Invoicesid;
              
          
               returnopp.add(Rw);
      }
      return returnopp;
  }
   
  public class FilingChangesWrapper {
   
 @AuraEnabled public  String InvoiceId {get; set;}
      
   public FilingChangesWrapper() {
       InvoiceId='';
       
   }
}

}