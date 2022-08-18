@isTest
public class EmailActivityTest {
    
    @isTest static void testGetEmailActivityById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://andersonadvisors--comm.cs19.my.salesforce.com//apexrest/retriveAccounts/'
            + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        List<ActivityHistory> thisEmailActivity = EmailActivity.getActivityHistory();
        // Verify results
        System.assert(thisEmailActivity != null);
        //System.assertEquals('Lee, Edward', thisAccount.Name);
        
    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account acctest = new Account(
            Name='Test Account',
            First_Name__c='Edward',
            Last_Name__c='Lee'
           );
        insert acctest;
        return acctest.Id;
    }

}