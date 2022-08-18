public class ProjectRelatedTaxCompliance {    
    Public Static ID taxComplianceRecordTypeId='012U0000000DFUyIAO';
    @AuraEnabled(cacheable=true)
    public static list <Opportunity>  GetTaxComplianceopp (String taxid){
        system.debug('::value a '+taxid);
        Tax_Return__c Taxret =[select id ,Client__c from Tax_Return__c where Id=:taxid];
        Id a=Taxret.Client__c;
        system.debug('::value a '+a);
        list<Opportunity> taxComplianceOpp = [select id,name,CloseDate,Amount,StageName from Opportunity where RecordTypeId=:taxComplianceRecordTypeId AND AccountId=:a ];
        system.debug(taxComplianceOpp);
        return taxComplianceOpp;
    }
}