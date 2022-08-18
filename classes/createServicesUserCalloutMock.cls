@isTest
global class createServicesUserCalloutMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request) {
        
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"id":45,"username":"bazam","name":"bazam","first_name":"testfirst","last_name":"testlast","email":"bazam@gmail.com","url":"","description":"","meta":{"Sf_ClientAccountId":[""],"Sf_PrimaryContactId":[""]}}');
        response.setStatusCode(201);
        return response;
        
    }

}