public class consolidatedServiceItemsCtrl {
    @AuraEnabled
    public static List<OpportunityLineItem> getseviceItems(Id CaseId) {
        List<id> saleid=new List<id>();
        List<Case> SelectedCase=[Select id,Sales__c,Sale2__c,Sale3__c,Sale4__c,Sale5__c,Sale6__c from case where id=:CaseId ];
        for(case c:SelectedCase){
            saleid.add(c.Sales__c);
             saleid.add(c.Sale2__c);
             saleid.add(c.Sale3__c);
             saleid.add(c.Sale4__c);
             saleid.add(c.Sale5__c);
             saleid.add(c.Sale6__c);
            
        }
       return[select id,OpportunityId,Opportunity.Name,Product2Id,Product2.Name,Status__c from OpportunityLineItem where OpportunityId in:saleid ];
    }
              @AuraEnabled
    public static  List < String > getseviceItemsStatuspicklist(sObject objObject, string fld) {
        system.debug('objObject --->' + objObject);
        system.debug('fld --->' + fld);
        List < String > allOpts = new list < String > ();
        // Get the object type of the SObject.
        Schema.sObjectType objType = objObject.getSObjectType();
        
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        
        // Get a map of fields for the SObject
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        // Get the list of picklist values for this field.
        list < Schema.PicklistEntry > values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
    }
     @AuraEnabled
   public static List < OpportunityLineItem > saveoplt(List<OpportunityLineItem> lstoplt) {
        update lstoplt;
        return lstoplt;
    }
}