@isTest
global class wordpressUpdateMetaCalloutMock implements HttpCalloutMock {
  
    global HTTPResponse respond(HTTPRequest request) {
       
        
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"id":45,"username":"Bob","name":"apples","first_name":"","last_name":"","roles":["platinum"],"email":"bobapples@gmail.com","url":"","description":"","meta":{"Sf_ClientAccountId":[""],"Sf_PlatinumSaleId":[""],"Sf_PrimaryContactId":[""]}}');
        response.setStatusCode(200);
        return response;
        
    }
    
    

}