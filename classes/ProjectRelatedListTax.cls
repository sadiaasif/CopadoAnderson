public class ProjectRelatedListTax {
    @AuraEnabled(cacheable=true)
    public static list <H2S__HarvestProject__c>  Getprojectbyid (String taxid){
        system.debug('::value a '+taxid);
        Tax_Return__c Taxret =[select id ,Client__c from Tax_Return__c where Id=:taxid];
        Id a=Taxret.Client__c;
        system.debug('::value a '+a);
        list<H2S__HarvestProject__c> Harvestpkg = [select id,name,Account_ID__c, H2S__BurnPercent__c ,H2S__ProjectCode__c,H2S__HarvestProjectID__c,H2S__Account__c  from H2S__HarvestProject__c where H2S__Account__c =:a];
        system.debug(Harvestpkg);
        return Harvestpkg;
    }
}