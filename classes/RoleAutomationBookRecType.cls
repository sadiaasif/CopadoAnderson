/*****************************************************************************************************************************
@ Class Name:    RoleAutomationBookRecType
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   This service is used to assign license based on the job role field in the user profile.    
*****************************************************************************************************************************/
public class RoleAutomationBookRecType implements Queueable, Database.AllowsCallouts {
    
    private static final string GET= 'GET';
    private static final string PATCH = 'PATCH';
    private static final string label='Bookkeeping';
    public static Id bookMonthlyRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Bookkeeping_Monthly_Recurring').getRecordTypeId();
    public static Id cleanupRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Cleanup').getRecordTypeId();
    public static Id asNeededRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('As_Needed').getRecordTypeId();
    public static Id InactiveRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Inactive').getRecordTypeId();
    public static Id monthlyRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Monthly').getRecordTypeId();
    public static Id quarterlyRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Quarterly').getRecordTypeId();
    public static Id rolloverRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Rollover').getRecordTypeId();
    private static string BASEURL = URL.getSalesforceBaseUrl().toExternalForm()+ '/services/data/v48.0/tooling/';
    public static Role_Automation_Setting__mdt record = Role_Automation_Setting__mdt.getInstance(label);
    public static string globalPicklistVal = record.Global_ValueSet_ID__c;
    public static string localPicklistVal= record.Local_Picklist_ID__c;
    public static string license= record.Licences__c;
    public static string globalValSetName= record.Global_ValueSet_Name__c;
    public static string localPicklistName= record.Global_ValueSet_Name__c;
    public static List<Role_Automation_Setting__mdt> rec= Role_Automation_Setting__mdt.getall().values();
    public static Set<Id> setofUser = new Set<Id>();
    
    
    public void execute(QueueableContext qc){
        try{
            
            getAsNeededRecTypeVal();
            getbookMonthlyRecTypeVal();
            getCleanUpRecTypeVal();
            getInactiveRecTypeVal();
            getmonthlyRecTypeVal();
            getquarterlyRecTypeVal();
            getRolloverRecTypeVal() ;     
            
        } Catch(Exception ex){
            System.debug('ERROR:' + ex.getmessage());
        }
    }
    
     public static void getAsNeededRecTypeVal() {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"As Needed","fullName":"Bookkeeping__c.As_Needed","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        System.debug('dataString: '+dataString);
        AsNeededRecTypeValSet (fieldDef);
        
    }
    public static void AsNeededRecTypeValSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+asNeededRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);
        
    }   
    public static void getbookMonthlyRecTypeVal() {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"Bookkeeping Monthly Recurring","fullName":"Bookkeeping__c.Bookkeeping_Monthly_Recurring","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        
        bookMonthlyRecTypeValSet (fieldDef);
        
    }
    public static void bookMonthlyRecTypeValSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+bookMonthlyRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response: ' + res.getBody());
        
        
    }
    public static void getCleanUpRecTypeVal() {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"Cleanup","fullName":"Bookkeeping__c.Cleanup","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        System.debug('dataString: '+dataString);
        cleanupRecTypeValSet (fieldDef);
        
    }
    public static void cleanupRecTypeValSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+cleanupRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response: ' + res.getBody());
        
        
    }
    public static void getInactiveRecTypeVal() {       
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"Inactive","fullName":"Bookkeeping__c.Inactive","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        
        InactiveRecTypeValSet(fieldDef);
        
    }
    public static void InactiveRecTypeValSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+InactiveRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response: ' + res.getBody());
        
        
    }
    public static void getmonthlyRecTypeVal() {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"Monthly","fullName":"Bookkeeping__c.Monthly","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        
        monthlyRecTypeValuesSet (fieldDef);
        
    }
    public static void monthlyRecTypeValuesSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+monthlyRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response: ' + res.getBody());
        
        
    }
    public static void getquarterlyRecTypeVal() {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"Quarterly","fullName":"Bookkeeping__c.Quarterly","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        quarterlyRecTypeValSet(fieldDef);
        
    }
    public static void quarterlyRecTypeValSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+quarterlyRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response: ' + res.getBody());    
    }
    public static void getRolloverRecTypeVal() {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/00N0B000006Ivqm','GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        System.Debug('**** ApexClass Response1: ' + res.getBody());
        
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<Object> value =  (List<Object>)valueSetDefinition.get('value');
        
        String dataString = valueCompilationforRecType(value, false);
        
        String fieldDef = '{"Metadata":{"active":true,"label":"Rollover","fullName":"Bookkeeping__c.Rollover","picklistValues":[{"picklist":"Bookkeeper__c","values":'+dataString+'}],"urls":null}}';
        rolloverRecTypeValSet (fieldDef);
        
    }
    public static void rolloverRecTypeValSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/RecordType/'+rolloverRec+'','PATCH');
        req.setBody(fieldDef);
        
        HttpResponse res = Callout.buildHttpResponse(req);    
    }
    
    public static String valueCompilationforRecType(List<Object> value, Boolean customPicklist) {
        String dataString = '[';
        integer i = 0;
        List<String> vals = new List<String>();
        String localString;
        
        for( Object m : value ) {
            
            vals.clear();
            String strLis = String.valueOf(m);
            for( String st : strLis.split(',') ){
                
                List<String> innerVal = st.split('=');
                vals.add(innerVal[1].replace('}',''));
            }
            localString = '';
            if(vals.get(3) != 'false'){
                
                localString += '{';
                localString += ( vals.get(0) != 'null' ) ? '"color":"'+vals.get(0)+'",' : '"color":null,';  
                localString += ( vals.get(1) == 'false' || vals.get(1) == 'true' ) ? '"default":'+vals.get(1)+',' : '"default":false,';  
                localString += ( vals.get(2) != 'null' ) ? '"description":"'+vals.get(2)+'",' : '"description":null,'; 
                localString += ( vals.get(3) == 'true' ) ? '"isActive":'+vals.get(3)+',' : '"isActive":true,'; 
                localString += ( vals.get(5) != 'null' ) ? '"urls":"'+vals.get(5)+'",' : '"urls":null,';
                localString += '"valueName":"'+vals.get(6)+'"';
                localString += '},';    
            }
            if( localString != '' )
            {
                dataString += localString;   
            }                
        }
        
        dataString = dataString.Substring(0, dataString.length()-1);
        
        dataString += ']';
        
        return dataString;
    }
    
    
}