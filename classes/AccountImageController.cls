/**
* A controller class to used to show Blueprint image on account page layout.
* 
* @author prateeks
* @version 1.0 - Aug 03, 2018
*/
Public Class AccountImageController {
    
    Public String recId{get; set;}  
    Public String fullFileURL{get; set;}
    Public List<Attachment> att{get; set;}
    public AccountImageController(ApexPages.StandardController controller) {
        
        fullFileURL = 'https://' + URL.getSalesforceBaseUrl().getHost();
        if(!test.isRunningTest()){
            recId = apexpages.currentpage().getparameters().get('id');
        }else{
            recId = controller.getId();
        }
        Id MyId = id.valueOf(recId);
        String sObjName = MyId.getSObjectType().getDescribe().getName();

        system.debug('curr page == ' + sObjName);
        if(sObjName == 'Strategy_Session_Questionnaire__c'){
         Strategy_Session_Questionnaire__c sId = [SELECT Id, Name, Account_Lookup__c FROM Strategy_Session_Questionnaire__c where id = :MyId LIMIT 1];
            system.debug('*******sId'+sId);
            recId = sId.Account_Lookup__c;
            system.debug('*******recId'+recId);
        }
        Account acc = new Account(id = recId);
        
        try {
            Blueprint__c uId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c FROM Blueprint__c WHERE AccountId__c =:acc.Id ORDER By CreatedDate DESC LIMIT 1];
            system.debug('Unique id is = ' + uId.Unique_Blueprint_Id__c);
            List<Blueprint__c> attachmentId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c,PreparedBy__c FROM Blueprint__c WHERE Unique_Blueprint_Id__c = :uId.Unique_Blueprint_Id__c ORDER By CreatedDate ASC];
            Set<String> attSet = new Set<String>();
            for(Blueprint__c bp : attachmentId){
                attSet.add(bp.AttachmentId__c);
            }       
            att= [select Id, Name, Description from Attachment where Id in :attSet ORDER By CreatedDate DESC];
        } catch (QueryException e) {
            ApexPages.addMessages(e); 
        }   
    }
}