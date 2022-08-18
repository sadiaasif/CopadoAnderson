@isTest
public class ProjectRelatedListTaxAndComplianceTest {
    @isTest
    public static void  Getprojectbyidtest (){
        Tax_Return__c taxReturn = new Tax_Return__c();  
        taxReturn.Tax_Year__c = '2022';
        insert taxReturn;
        
        ProjectRelatedListTax.Getprojectbyid(taxReturn.Id);
        ProjectRelatedTaxCompliance.GetTaxComplianceopp(taxReturn.id);
    }
}