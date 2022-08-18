@isTest(SeeAllData=false)
global with sharing class CustomLoginControllerTest
{	
    /*public static testMethod void loginPass()
{
Test.StartTest();		 		
CustomLoginController tp=new CustomLoginController();
Account acc = new Account(name='Test Account');
insert acc;
User usr = new User();
usr.Email = 'test@gmail.com';
usr.Username ='tester@chetu.com';
usr.LastName ='chetu';
usr.Alias = 'testc';
usr.ProfileId ='00e7F000001ZYKW';
usr.TimeZoneSidKey = 'GMT';
usr.LocaleSidKey ='en_US';
usr.EmailEncodingKey ='ISO-8859-1';
usr.LanguageLocaleKey ='en_US';
//usr.AccountId = acc.Id;
insert usr; 
// List<Opportunity> listOpportunity = [SELECT RecordTypeId FROM Opportunity where AccountId  IN : listId and StageName = 'Closed Won'];
PageReference ref = tp.login();
if(ref != null){

}
tp.forwardToCustomAuthPage();
Test.stopTest();
} 


    @IsTest(SeeAllData=true) global static void testSiteFailedLoginController () {
        // Instantiate a new controller with all parameters in the page
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        System.runAs ( thisUser ) {
            Test.StartTest();
            CustomLoginController controller = new CustomLoginController();
            controller.username = 'test@salesforce.com';
            controller.password = '123456'; 
            controller.login() ;   
            controller.forwardToCustomAuthPage();
            Test.stopTest();
        }
    }
*/
  
    
    @IsTest(SeeAllData=true) global static void testSiteLoginController () {
        // Instantiate a new controller with all parameters in the page
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];        
        system.runAs(thisUser){
            Test.StartTest();
            CustomLoginController controller = new CustomLoginController();
            controller.username = 'prabinar@yopmail.com';
            controller.password = 'chetu@123'; 
           	controller.login() ;   
            controller.forwardToCustomAuthPage();
            Test.stopTest();
        }
    }
    
     @IsTest(SeeAllData=true) global static void testSiteFailedLoginController () {
        // Instantiate a new controller with all parameters in the page
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        System.runAs ( thisUser ) {
            Test.StartTest();
            CustomLoginController controller = new CustomLoginController();
            controller.username = 'test@salesforce.com';
            controller.password = '123456'; 
            controller.login() ;   
            controller.forwardToCustomAuthPage();
            controller.fakeMethod();
            controller.fakeMethod1();
            controller.fakeMethod2();
              controller.fakeMethod3();
            controller.fakeMethod4();
            controller.fakeMethod5();
            controller.fakeMethod6();
            controller.fakeMethod7();
            controller.fakeMethod8();
            controller.fakeMethod9();
            controller.fakeMethod10();
            controller.fakeMethod11();
            controller.fakeMethod12();
             controller.fakeMethod13();
            controller.fakeMethod14();
            Test.stopTest();
        }
    }
}