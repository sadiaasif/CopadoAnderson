/*****************************************************************************************************************************
@ Class Name:    RoleAutomationServiceTest
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   Test Class of RoleAutomationService 
*****************************************************************************************************************************/
@isTest
public  with sharing class RoleAutomationServiceTest {
    public static user USER =[select Id,name from user where id=:userinfo.getuserid() limit 1];
    public static Set<Id> userIds = new Set<Id>();
    public static String name;
    public static boolean deactivate = true;
    
    private static testmethod void userLicenseAssignmentTest(){
        
        String creatRequestResponse = '{"Metadata":{"active":true,"label":"Tax","fullName":"Task.Tax","picklistValues":[{"picklist":"Bookkeeping_Admin__c","values":[{"color":null,"default":false,"description":null,"isActive":true,"urls":null,"valueName":"Abraham Carrillo"}]}],"urls":null}}';      
        Profile p = [select id from profile where name='System Administrator'];
        User usr1= new User();
        usr1.Username = 'testyzk@test.com';
        usr1.LastName= 'User1';
        usr1.Alias='Testa';
        usr1.Email='testuser1@gmail.com';
        usr1.Job_Role__c='Bookkeeping';
        usr1.ProfileId= p.id;
        usr1.TimeZoneSidKey = 'GMT';
        usr1.LocaleSidKey ='en_US';
        usr1.EmailEncodingKey ='ISO-8859-1';
        usr1.LanguageLocaleKey ='en_US';
        usr1.isActive = true;
        
        usr1.UpdateLoginCount__c = false;
        userIds.add(usr1.Id);
        database.insert(usr1);
        
        Test.setMock(HttpCalloutMock.class, new Mock());
        Test.startTest();
        RoleAutomationService construct = new RoleAutomationService(userIds,deactivate);
        deactivate=true;
        System.enqueueJob(new RoleAutomationRecordType());
        Test.stopTest();
        
        Test.setMock(HttpCalloutMock.class, new MockGenerator());
        
        System.enqueueJob(new RoleAutomationBookRecType());
        //  Test.setMock(HttpCalloutMock.class, new MockGeneratorforRec());
    }
    private static testMethod void setPermissionSet(){
        
        RoleAutomationService.setPermissionSet(userIds);
    }
    private static testmethod void userTrigger(){
        try{
            User usr= new User();
            usr.LoginHistoryCount__c = 29;
            usr.Id= USER.Id ;
            usr.UpdateLoginCount__c= true;
            database.update(usr);
            RoleAutomationService.customPicklistValuesSet('def');
        }
        catch(Exception e){}
    }
    
    Private class Mock implements HttpCalloutMock{
        
        
        public  HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String creatRequestResponse = '{"Metadata":{"customValue":[{"color":null,"default":false,"description":null,"isActive":true,"label":"Abraham Carrillo","urls":null,"valueName":"Abraham Carrillo"}],"description":null,"masterLabel":"Bookkeeping Admin","sorted":true,"urls":null},"FullName":"Bookkeeping_Admin"}';
            res.setBody(creatRequestResponse);
            res.setStatusCode(201);
            res.setStatus('CREATED');
            return res;
        } 
    }
    
    Private class MockGenerator implements HttpCalloutMock{
        
        public  HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String creatRequestResponse = '{"Metadata":{"label":"Bookkeeper","required":false,"type":"Picklist","valueSet":{"valueSetDefinition":{"sorted":true,"value":[{"color":null,"default":false,"description":null,"isActive":true,"label":"Hi","urls":null,"valueName":"Hi"}]}}},"FullName":"Bookkeeping__c.Bookkeeper__c"}';
            res.setBody(creatRequestResponse);
            res.setStatusCode(201);
            res.setStatus('CREATED');
            return res;
        } 
    }
    
    @isTest
    public static void myUnitTest(){
        
        PicklistValueWrapper wrapper= new PicklistValueWrapper ();
        
        wrapper.color=null;
        wrapper.description=null;
        wrapper.urls=null;
        
    }
    
    
    Private class MockGeneratorforRec implements HttpCalloutMock{
        
        
        public  HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String creatRequestResponse = '{"Metadata":{"active":true,"label":"Tax","fullName":"Task.Tax","picklistValues":[{"picklist":"Bookkeeping_Admin__c","values":[{"color":null,"default":false,"description":null,"isActive":true,"urls":null,"valueName":"Abraham Carrillo"}]}],"urls":null}}';
            res.setBody(creatRequestResponse);
            res.setStatusCode(201);
            res.setStatus('CREATED');
            return res;
        } 
    }
    
}