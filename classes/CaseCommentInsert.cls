/** A Rest webservice class to insert the case comment from the Platinum Portal.
* @author Deepesh Kumar
* @version 1.0 - may 3, 2020
*/@RestResource(urlMapping='/CaseComment/*')
global with sharing class CaseCommentInsert {
    // Post Method
    @HTTPPost
    global static CaseComment createNewComment() {
        RestRequest contactRequest = RestContext.request;
        String requestBody = contactRequest.requestBody.toString();
        Casecomment CaseInsert = (Casecomment) JSON.deserialize(requestBody, Casecomment.class);
        insert CaseInsert;
        return CaseInsert;
    }
}