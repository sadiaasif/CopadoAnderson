/*****************************************************************************************************************************
@ Class Name:    Callout
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   Sending Request and Getting Response    
*****************************************************************************************************************************/
public with sharing class Callout {
 
    private static final string REQHEADERKEY ='Content-Type';
    private static final string REQHEADERVALUE='application/json';
    private static final string REQHEADERAUTHORIZATION ='Authorization';
    private static final string REQHEADERBEARER='Bearer ';
    private static final string PATCH = 'PATCH';
    private static final string REQHEADEROVERRIDE='X-HTTP-Method-Override';
   
    //HTTP REQUEST
    public static HttpRequest buildHttpRequest(String endpoint, String method){
        HttpRequest request = new HttpRequest();
        request.setHeader(REQHEADERAUTHORIZATION, REQHEADERBEARER + UserInfo.getSessionID());
        request.setHeader(REQHEADERKEY, REQHEADERVALUE);
        request.setHeader(REQHEADEROVERRIDE,PATCH);
        request.setTimeout(60000);
        request.setEndpoint(endpoint);
        request.setMethod(method);
        return request;
    }
    
    //HTTP RESPONSE
    public static HttpResponse buildHttpResponse(HttpRequest sendRequest){
        Http poll = new Http();
        HttpResponse pollResponse = poll.send(sendRequest);
        return pollResponse;
    }
      
    
}