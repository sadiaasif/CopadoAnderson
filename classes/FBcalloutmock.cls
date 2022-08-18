@isTest
public class FBcalloutmock implements HttpCalloutMock  {
  public HTTPResponse respond(HTTPRequest request) {
       
        
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('');
        response.setStatusCode(200);
        return response;
        
    }
    
}