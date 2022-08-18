public class ctrlLeadRelatedList{
    public List<Lead> lstLead{get; set;}
    public string SalesRepid {get; set;}
    public string LeadId {get; set;}
    
   public ctrlLeadRelatedList(ApexPages.StandardController controller) {
        lstLead= new List<Lead>();
        SalesRepid = Apexpages.currentpage().getParameters().get('id');
        Set<Id> leadid = new Set<Id>();
        if(SalesRepid != null){
            lstLead = [select id,Name,Company,Total_Income__c,Email,Mobile_Number__c,Spouse_E_Mail__c,Spouse_Mobile__c from Lead where Sales_Rep__c =:SalesRepid];
        }
    }
 
}