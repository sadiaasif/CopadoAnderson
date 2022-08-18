/**
* A controller class to used to provide Code Coverage for CreateTaskApi class.
* 
* @author Ranjeet
* @version 1.0 - March 11, 2019
*/
@isTest
public class CreateTaskApiTest {
    
    /**
* This method is used to provide code coverage of createTask method
* 
* @author Ranjeet
* @date March 11, 2019
* @return response on the basis of Task creation
*/
    @isTest
    public static void CreateTask(){
        
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        
       
        Integer cseLstSze = 10;
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp; 
        
        // Account creation
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782'; 
       // testAccount.Senior_Advisor_Lookup__c = thisUser.id;
        insert testAccount;  
        
        // Account creation
        Account testAccount1 = new Account();
        testAccount1.Name='Test Account' ;
        testAccount1.First_Name__c='Test';
        testAccount1.Last_Name__c='Test';
        insert testAccount1;  
        
        Test.startTest();
        // Calling class method to provide code coverage
        Map<String,String> res = CreateTaskApi.createTask(testAccount.id,'Hello','Normal','Test Description','Normal');
        //Map<String,String> res1 = CreateTaskApi.createTask(testAccount1.id,'Hello','Normal','Test Description','Normal');
        Map<String,String> res2 = CreateTaskApi.createTask('','Normal','j','Test Description','Normal');
       
        Test.stopTest(); 
    } 
    
}