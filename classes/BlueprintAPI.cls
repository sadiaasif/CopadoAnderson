@RestResource(urlmapping='/BlueprintAttachement/*')
global class BlueprintAPI {
    
    @HttpGet
    global static List<string> getAttachement()
    {
        list<string> testList=new List<string>();
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        String accountid=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug('account id:'+accountid);
        
        Id aidId = [SELECT id FROM Account WHERE  id=:accountid  LIMIT 1].id;
        Blueprint__c uId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c,PreparedBy__c FROM Blueprint__c WHERE AccountId__c =:aidId ORDER By CreatedDate DESC LIMIT 1];
        List<Blueprint__c> attachmentId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c FROM Blueprint__c WHERE Unique_Blueprint_Id__c = :uId.Unique_Blueprint_Id__c ORDER By CreatedDate ASC];
        Set<String> attSet = new Set<String>();
        for(Blueprint__c bp : attachmentId){
            attSet.add(bp.AttachmentId__c);
        }
        List<Attachment> attList=new List<Attachment>();
        attList= [select Id, Name,Body,Description from Attachment where Id in :attSet ORDER By CreatedDate DESC];
        for(Attachment a:attList)
        {
            testList.add(EncodingUtil.base64Encode(a.Body));
            system.debug('body=='+EncodingUtil.base64Encode(a.Body));
            system.debug('testList=='+testList);
        }
        if(testList.size()>0)
        {
        return testList;
        }
        else
        {
            return null;
        }
    }
    
}