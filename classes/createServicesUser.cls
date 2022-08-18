public class createServicesUser {
    
    @InvocableMethod
    public static void prepareCallout(List<Id> contactIds) {
        
        Contact c = [SELECT Id, Email, AccountId, FirstName, LastName FROM Contact WHERE Id IN :contactIds LIMIT 1];
        
        String username = c.Email;    
        String email = c.Email;
        String accountId = c.AccountId;
        String primaryContactId = c.Id;
        String firstName = c.FirstName;
        String lastName = c.LastName;
            
        if(!Test.isRunningTest() && !System.isBatch()) {
        makePostCallout(username, email, accountId, primaryContactId, firstName, lastName);
        }

    }   
    
    @future(callout=true)
    public static void makePostCallout(String username, String email, String accountId, String primaryContactId, String firstName, String lastName) {
        
        String body = '{ "username" : "'+ username +'", "email" : "'+ email +'", "password" : "zrHKdrM6t^d%c&;%mR#W!8e", "first_name" : "' + firstName +'", "last_name" : "' + lastName +'", "roles" : "services", "meta" : { "Sf_ClientAccountId": "'+ accountId +'", "Sf_PrimaryContactId":"'+ primaryContactId +'"} }';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(body);
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        String responseBody = response.getBody();
        PlatinumCreationHandler.updatePrimaryContact(accountId, responseBody, primaryContactId);
        system.debug(response);
    }        
    
}