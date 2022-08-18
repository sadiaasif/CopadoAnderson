public class RowController {
    
    @Auraenabled
    public static list<orderItem> fetchOrderItems(Id odrId){
        List<OrderItem> orderItems = [SELECT Id, Audit_Completed__c,action_alert__c,type__c,Entity_Organization_State__c,Processor__c,toLabel(Processing_Stage__c),Service_Name__c,UnitPrice, Quantity,Entity__c,Entity__r.Name,Due_Date__c,Comments__c,Update_Comments__c,Update_Comments_Utility__c FROM OrderItem where orderid =: odrId];
        system.debug('orders: ' + orderItems);
        Schema.DescribeFieldResult F = OrderItem.Processing_Stage__c.getDescribe();
		List<Schema.PicklistEntry> P = F.getPicklistValues();
        for ( Schema.PicklistEntry obj : P ) {
            system.debug('stage label =  '+ obj.getLabel());
        }
        
        for (OrderItem inst : orderItems )
        {
            system.debug('stage =  '+ inst.Processing_Stage__c);
        }
        return orderItems;
    }
    
    @AuraEnabled
    public static List < OrderItem > saveServiceItems(List<OrderItem> serviceItems) {
        system.debug('service items: ' + serviceItems);
        
        Map<String,String> picklistValues = new Map<String,String>();
        Schema.DescribeFieldResult F = OrderItem.Processing_Stage__c.getDescribe();
		List<Schema.PicklistEntry> P = F.getPicklistValues();
        for ( Schema.PicklistEntry obj : P ) {
            picklistValues.put(obj.getLabel(), obj.getValue());
        }
        
        for(OrderItem item : serviceItems){
            item.Update_Comments__c = item.Update_Comments_Utility__c;
            item.Update_Comments_Utility__c = '';
            item.Processing_Stage__c = picklistValues.get( item.Processing_Stage__c );
        }
        try{
            update serviceItems;
        }
        catch(Exception e){
            system.debug(e);
            return null;
        }
        return serviceItems;
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
    public static List < String > getselectOptions(sObject objObject, string fld) {
        List < String > allOpts = new list < String > ();
        Schema.sObjectType objType = objObject.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        list < Schema.PicklistEntry > values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());
        }
        allOpts.sort();
        return allOpts;
    }
    
    @AuraEnabled
    public static Map<String,List<String>> getDependentPicklistValues(String typeValue){
         Schema.DescribeFieldResult typeApivalue = OrderItem.Type__c.getDescribe();
        String ApiValofType='';
        for(Schema.PicklistEntry TypeApi : typeApivalue.getPicklistValues()){
            if(TypeApi.getValue()==typeValue){
                ApiValofType=TypeApi.getValue();
                break;
            }
            
        }
        System.debug('ApiValofType'+ApiValofType);
        
        Schema.DescribeFieldResult depend = OrderItem.Processing_Stage__c.getDescribe();
        Schema.sObjectField controlToken = depend.getController();
        
        Schema.DescribeFieldResult control = controlToken.getDescribe();
        List<Schema.PicklistEntry> controlEntries = control.getPicklistValues();
        
        integer valueIndex;
        for(Schema.PicklistEntry centry : controlEntries){
            if(centry.getValue() == ApiValofType){
                System.debug('Reached');
                valueIndex = controlEntries.indexOf(centry);
                break;
            }
        }
        
        String base64map = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
        Map<String,List<String>> dependentPicklistValues = new Map<String,List<String>>();
        
        for (Schema.PicklistEntry entry : depend.getPicklistValues()){ 
            if(entry.isActive() ){
                try{
                    system.debug('entry:' + entry.getLabel());
                    List<String> base64chars = String.valueOf(((Map<String,Object>) JSON.deserializeUntyped( JSON.serialize( entry ) )).get( 'validFor' )).split( '' );
                    system.debug(base64chars.size());
                    system.debug('base: ' + base64chars);
                    String controlValue = controlEntries[ valueIndex ].isActive() ? controlEntries[ valueIndex ].getValue() : null;
                    system.debug('controlValue:' + controlValue );
                    Integer bitIndex = valueIndex / 6, bitShift = 5 - Math.mod( valueIndex, 6 );
                    system.debug('index: ' + bitIndex);
                    if  (controlValue == null || (base64map.indexOf( base64chars[ bitIndex ] ) & (1 << bitShift)) == 0){ 
                        continue;
                    }
                    if ( !dependentPicklistValues.containsKey( controlValue ) )
                    {
                        dependentPicklistValues.put( controlValue, new List<String>() );
                    }
                    dependentPicklistValues.get( controlValue ).add( entry.getLabel() );
                }
                catch(Exception e){
                    system.debug(e);
                }
            }
        }
        
        system.debug('Mapp: ' + dependentPicklistValues);
        return dependentPicklistValues;
    }
}