public class RefundFlowLightningctrl {
@AuraEnabled
   public static List<RefundFlowWrapper> getSale(Id oppId) {
       List<RefundFlowWrapper> returnopp = new List<RefundFlowWrapper>();
     List<opportunity>opp=[SELECT Id, AccountId,RecordType.Name,Name  FROM opportunity where id=:oppId LIMIT 1];
       for(opportunity o:opp){
           String id=o.Id;
           string Accid=o.AccountId;
           string RecordType=o.RecordType.Name;
              string oppname=o.Name;
          
         RefundFlowWrapper Rw =
                new RefundFlowWrapper();
                Rw.oppId =id;
                Rw.Accid = Accid;
                Rw.oppRecordType =RecordType;
            Rw.oppName =oppname;
                returnopp.add(Rw);
       }
       return returnopp;
   }
    
   public class RefundFlowWrapper {
    
  @AuraEnabled public  String oppId {get; set;}
       @AuraEnabled public  String Accid {get; set;}
       @AuraEnabled public  String oppRecordType {get; set;}
         @AuraEnabled  public  String oppName {get; set;}
    public RefundFlowWrapper() {
        oppId='';
        Accid='';
        oppRecordType='';
        oppName='';
    }
}
}