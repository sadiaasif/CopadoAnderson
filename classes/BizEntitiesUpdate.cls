/** A Rest webservice class to Update the Entities from the BizDoc.
*/
@RestResource(urlMapping='/EntitiesUpdate/*')
global with sharing class  BizEntitiesUpdate {
    // Post Method
    @HTTPPost
    global static Entities__c UpdateEntities() {
        RestRequest contactRequest = RestContext.request;
        String requestBody = contactRequest.requestBody.toString();
        System.debug('**** requestBody = '+requestBody);
        Entities__c entInsert = (Entities__c) JSON.deserialize(requestBody, Entities__c.class);
        system.debug('entInsert==========  '+ entInsert);
        Update entInsert;
        return entInsert;
    } 
}