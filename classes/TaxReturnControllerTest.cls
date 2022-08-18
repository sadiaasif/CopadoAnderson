@isTest(seeAllData=true)
public class TaxReturnControllerTest {
    
    @isTest static void testPostAuth(){
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('TaxAuthenticateResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        String result = TaxReturnController.authenticate();
        // Verify mock response is not null
        System.assertNotEquals(null,result,
                               'The callout returned a null response.');
    }
    @isTest static void testGetReturns(){
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('TaxGetReturnsResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        //String resultAuth = CCHAxcessElfDataApi.authenicate();
        Test.startTest();
        string result = TaxReturnController.fetchReturnId(2018);
        Test.stopTest();
        // Verify mock response is not null
        System.assertNotEquals(null,result,
                               'The callout returned a null response.');    
    }
    @isTest static void testGetReturnId(){
        
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('TaxReturnIDResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        //String resultAuth = CCHAxcessElfDataApi.authenicate();
        //List<string> result = CCHAxcessElfDataApi.getClientId();
        Entities__c ent=new Entities__c();
        ent.id='a0I29000001XH3h';
        ent.Name='JOHN Entity';
        ent.Tax_Form__c='1065';
        Test.startTest();
        //TaxReturnController c = new TaxReturnController(sc);
        ApexPages.StandardController sc=new ApexPages.StandardController(ent);
        TaxReturnController c = new TaxReturnController(sc);
        c.getPerformcallout(2018);
        c.getdynamiclist();
        //c.executeDML();
        //PageReference pg=c.executeDML();
        Test.stopTest();
        //TaxReturnController.getPerformcallout(2018);
        
    }
    
   /* @isTest static void testSelectList()
    {  
        test.startTest();
        Entities__c ent=new Entities__c();
        ApexPages.StandardController sc=new ApexPages.StandardController(ent);
        TaxReturnController c = new TaxReturnController(sc);
        c.getdynamiclist();
        test.stopTest();
 }*/
    
    /* @isTest static void testpageRef(){
        Entities__c ent=new Entities__c();
        test.startTest();
        ApexPages.StandardController sc=new ApexPages.StandardController(ent); 
        TaxReturnController c = new TaxReturnController(sc);
        PageReference pageRef = c.executeDML();
        test.stopTest();
        
    }*/
}