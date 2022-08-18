public class wordpressUpdatePlatinumUser {
    
    
    public static void processContacts(List<Contact> newList) {
        
        String WPId;
        String FirstName;
        String LastName;
        String email;
        String password;
        
        for ( Contact c : newList ) {
            
         WPId =  c.Platinum_Wordpress_Id__c;
         FirstName = c.FirstName;
         LastName = c.LastName;
         Email = c.Platinum_Email__c;
        // Password = c.Platinum_Password__c;
            
        }
        
          wordpressUpdatePlatinumUser.handleCallout(WPId, FirstName, LastName, Email); 
        
    }
    
    @future (callout=true)
    public static void handleCallout(String wordPressId, String firstName, String LastName, String Email) {
        
        if (!Test.isRunningTest()) {
        wordpressUpdatePlatinumUser.serverSendmessage(wordPressId, firstName, lastname, Email); 
        }
    }
    
    public static HttpResponse serverSendmessage(String wordPressId, String firstName, string lastname, string email) {
        
        String body = '{ "first_name" : " '+ firstName+' ", "last_name" : " '+lastname+' ", "email" : "'+email+'"}';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal/'+wordPressId);
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
        return response;
    } 
    
    //reset password
    
     public static void processContactsforreset(List<Contact> newList) {
        
        String WPId;
        String FirstName;
        String LastName;
        String email;
        String password;
        
        for ( Contact c : newList ) {
            
         WPId =  c.Platinum_Wordpress_Id__c;
         FirstName = c.FirstName;
         LastName = c.LastName;
       //  Email = c.Platinum_Email__c;
         Password = c.Platinum_Password__c;
            
        }
        
          wordpressUpdatePlatinumUser.handleCalloutforreset(WPId, FirstName, LastName, Password); 
        
    }
    
    @future (callout=true)
    public static void handleCalloutforreset(String wordPressId, String firstName, String LastName, String Password) {
        
        if (!Test.isRunningTest()) {
        wordpressUpdatePlatinumUser.serverSendmessageforreset(wordPressId, firstName, lastname, Password); 
        }
    }
    
    public static HttpResponse serverSendmessageforreset(String wordPressId, String firstName, string lastname, string password) {
        
        String body = '{ "first_name" : " '+ firstName+' ", "last_name" : " '+lastname+' ", "password" : "'+password+'"}';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal/'+wordPressId);
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
        return response;
    } 
    
}