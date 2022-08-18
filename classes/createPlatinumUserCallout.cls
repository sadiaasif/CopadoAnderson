public class createPlatinumUserCallout {
    
    public static HttpResponse makePostCallout(String username, String email, String password, String accountId, String platinumSaleId, String primaryContactId, String firstName, String lastName) {
        
        String body = '{ "username" : "'+ username +'", "email" : "'+ email +'", "password" : "' + password +'", "first_name" : "' + firstName +'", "last_name" : "' + lastName +'", "meta" : { "Sf_ClientAccountId": "'+ accountId +'", "Sf_PlatinumSaleId": "'+ platinumSaleId+ '", "Sf_PrimaryContactId":"'+ primaryContactId +'"} }';
        System.debug('body=='+body);
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
        PlatinumCreationHandler.updatePrimaryContact(accountId, responseBody,primaryContactId);
        return response;
    }  
   
     public static Void makePostCallouttoaddServiceUser(String username, String email, String password, String accountId, String platinumSaleId, String primaryContactId, String firstName, String lastName) {
         System.debug('UserName--'+username);
         String role='Services';
                System.debug('Email--'+email);
        String body = '{ "username" : "'+ username +'", "email" : "'+ email +'", "password" : "' + password +'", "first_name" : "' + firstName +'", "last_name" : "' + lastName +'", "roles" : "services",  "meta" : { "Sf_ClientAccountId": "'+ accountId +'", "Sf_PlatinumSaleId": "'+ platinumSaleId+ '", "Sf_PrimaryContactId":"'+ primaryContactId +'"} }';
        
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
        PlatinumCreationHandler.updatePrimaryContact(accountId, responseBody,primaryContactId);
       
    }         
    
}