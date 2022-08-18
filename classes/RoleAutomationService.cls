/*****************************************************************************************************************************
@ Class Name:    RoleAutomationService
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   This service is used to assign license based on the job role field in the user profile.    
*****************************************************************************************************************************/
public class RoleAutomationService implements Queueable, Database.AllowsCallouts {
    
    private static final string GET= 'GET';
    private static final string PATCH = 'PATCH';
    private static final string label='Bookkeeping';
    public static Id taxRecord = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Tax').getRecordTypeId(); 
    public static Id bookkeepingRec = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Bookkeeping').getRecordTypeId();
    public static Id bookTaskRec = Schema.SObjectType.Task.getRecordTypeInfosByDeveloperName().get('Bookkeeping_Task').getRecordTypeId();
    public static Id annualRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('Annual').getRecordTypeId();
    public static Id asNeededRec = Schema.SObjectType.Bookkeeping__c.getRecordTypeInfosByDeveloperName().get('As_Needed').getRecordTypeId();
    private static string BASEURL = URL.getSalesforceBaseUrl().toExternalForm()+ '/services/data/v48.0/tooling/';
    public static Role_Automation_Setting__mdt record = Role_Automation_Setting__mdt.getInstance(label);
    public static string globalPicklistVal = record.Global_ValueSet_ID__c;
    public static string localPicklistVal= record.Local_Picklist_ID__c;
    public static string license= record.Licences__c;
    public static string globalValSetName= record.Global_ValueSet_Name__c;
    public static string localPicklistName= record.Global_ValueSet_Name__c;
    public Set<Id> setofUser = new Set<Id>();
   
    Boolean deactivate = false;
    public RoleAutomationService (Set<Id> usersId,Boolean deactivate){
        setofUser= usersId;
        this.deactivate=deactivate;
        System.debug('@@+Id'+setofUser);
        
    }
    public void execute(QueueableContext context){
        try{
            List<UserPackageLicense> listofUserLicense = new List<UserPackageLicense>();
            List<PackageLicense> lstPackageLicense  = [SELECT Id, NamespacePrefix, AllowedLicenses, UsedLicenses, CreatedDate, ExpirationDate, Status 
                                                       FROM PackageLicense WHERE NamespacePrefix =: license LIMIT 1];
            for (User usr : [Select Id, Name,Job_Role__c FROM User Where Id =: setofUser LIMIT 1]){ 
                getGlobalPicklistValues(usr.Name,deactivate);
                getcustomPicklistValues(usr.Name,deactivate);
                if(!deactivate){
                    System.enqueueJob(new RoleAutomationRecordType()); 
                    setPermissionSet(setofUser);
                }
            }
        } Catch(Exception ex){
            System.debug('ERROR:' + ex.getmessage());
        }
    }

    @testVisible
    private static void setPermissionSet(Set<Id> userId){
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        List<String> PermissionSetIds = new List<String> { '0PS6f000000Y5qr', '0PS6f0000001MRX', '0PS0B0000005T5a'};
        for(Id userIdFromSet : userId){
            for (String permissionSetId : PermissionSetIds){
            PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = permissionSetId,AssigneeId = userIdFromSet);
            permissionSetList.add(psa);
            }
        }
try{
    upsert permissionSetList;
}catch(exception e){
    system.debug('exception caught' + e);
}
    }

    public static void getGlobalPicklistValues(String username, Boolean deactivate) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/GlobalValueSet/'+globalPicklistVal,'GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        
        /*Data mapping for insert string creation  */
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        List<PicklistValueWrapper> customValue = (List<PicklistValueWrapper>) JSON.deserialize(JSON.serialize(Metadata.get('customValue')),List<PicklistValueWrapper>.class);

        System.debug('@@ res.getBody()'+ res.getBody());
        String dataString = valueCompilation(customValue, true, username, deactivate);
        
        String fieldDef = '{"Metadata":{"customValue":'+dataString+',"description":null,"masterLabel":"Bookkeeping Admin","sorted":true,"urls":null},"FullName":"Bookkeeping_Admin"}';
        system.debug('@@fieldDef '+ fieldDef);
        globalPicklistSet(fieldDef);
        
    }
    public static void globalPicklistSet(String fieldDef) {           
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/GlobalValueSet/'+globalPicklistVal+'?_HttpMethod=PATCH','PATCH');
        req.setBody(fieldDef);
        HttpResponse res = Callout.buildHttpResponse(req);
        
    }   
    public static void getcustomPicklistValues(String username,Boolean deactivate) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/'+localPicklistVal,'GET');
        
        HttpResponse res = Callout.buildHttpResponse(req);
        
        Map<String, Object> resultData = (Map<String, Object>)JSON.deserializeUntyped( res.getBody() );
        Map<String, Object> Metadata =  (Map<String, Object>)resultData.get('Metadata');
        Map<String, Object> valueSet =  (Map<String, Object>)Metadata.get('valueSet');
        Map<String, Object> valueSetDefinition =  (Map<String, Object>)valueSet.get('valueSetDefinition');
        List<PicklistValueWrapper> value = (List<PicklistValueWrapper>) JSON.deserialize(JSON.serialize(valueSetDefinition.get('value')),List<PicklistValueWrapper>.class);
        String dataString = valueCompilation(value, true, username,deactivate);
        String fieldDef = '{"Metadata":{"label":"Bookkeeper","required":false,"type":"Picklist","valueSet":{"valueSetDefinition":{"sorted":true,"value":'+dataString+'}}},"FullName":"Bookkeeping__c.Bookkeeper__c"}';
        System.debug('fieldDef for custom '+fieldDef);
        customPicklistValuesSet(fieldDef);
        
    }
    public static void customPicklistValuesSet(String fieldDef) {
        
        HttpRequest req = Callout.buildHttpRequest(BASEURL+'sobjects/CustomField/'+localPicklistVal+'?_HttpMethod=PATCH','PATCH');
        req.setBody(fieldDef);
        HttpResponse res = Callout.buildHttpResponse(req);
        
    }  
    public static String valueCompilation(List<PicklistValueWrapper> values, Boolean customPicklist, String username, Boolean deactivate) {
        String dataString = '';
        List<PicklistValueWrapper> newValues = new List<PicklistValueWrapper>();
        Boolean userNameAlreadyExists = false;
        System.debug('@@+Deactivate'+deactivate);
        //if(!deactivate)
        if(!deactivate){
            for(PicklistValueWrapper val:values){
                if(val.isActive == null || (!val.isActive && val.valueName == username)){
                    val.isActive = true;
                    if(val.valueName == username){
                        userNameAlreadyExists=true;
                    }
                }
                newValues.add(val); 
            }
            if(!userNameAlreadyExists){
                //add a new picklist value in newValues
                PicklistValueWrapper npv = new PicklistValueWrapper();
                npv.isActive=true;
                npv.label=username;
                npv.valueName=username;
                newValues.add(npv);
            }
        }
       else{
         
            for(PicklistValueWrapper val:values){
                if(val.isActive == null){
                    val.isActive = true;
                }
                if(val.valueName == username){
                    val.isActive = false;
                   
                }
                newValues.add(val); 
            }
        }
        return JSON.serialize(newValues);
    }
   
}