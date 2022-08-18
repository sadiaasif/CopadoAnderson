public class Paginationcontrollerforcommunities {
       Public static List<wrapperBlueprintforcommunities> blueprintListWrapper;
     Public String recId{get; set;}  
   
    Public List<Attachment> att{get; set;}
    public Paginationcontrollerforcommunities(ApexPages.StandardController controller) {
     
    }
@RemoteAction
    public static List<wrapperBlueprintforcommunities> getBlueprintAttachment(string Id){
        try {
            blueprintListWrapper = new List<wrapperBlueprintforcommunities>();
          wrapperBlueprintforcommunities wrapperCon = new wrapperBlueprintforcommunities();
            blueprintListWrapper = wrapperCon.initializeBlueprint(Id);
            
            return blueprintListWrapper;
        } catch (QueryException e) { 
            ApexPages.addMessages(e);                   
            return null;
        }   
    }
      public class wrapperBlueprintforcommunities
    {
        String preparedBy{get;set;}
        Id attachementId{get; set;}
        String attachmentName{get; set;}
        String attachementDescription{get; set;}
        Public List<wrapperBlueprintforcommunities> blueprintListWrapper;
        
        
        public List<wrapperBlueprintforcommunities> initializeBlueprint(string Id) {
            blueprintListWrapper = new List<wrapperBlueprintforcommunities>();
       Account acc = new Account(id = Id);
        Blueprint__c uId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c,PreparedBy__c FROM Blueprint__c WHERE AccountId__c=:acc.Id ORDER By CreatedDate DESC LIMIT 1];
          
               if(uId.PreparedBy__c != null && uId.PreparedBy__c != '') {
                preparedBy = uId.PreparedBy__c;
            }
            else {
                preparedBy = 'test user dd';
            }
            //preparedBy = 'Test';
            List<Blueprint__c> attachmentId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c FROM Blueprint__c WHERE Unique_Blueprint_Id__c = :uId.Unique_Blueprint_Id__c ORDER By CreatedDate ASC];
            Set<String> attSet = new Set<String>();
            for(Blueprint__c bp : attachmentId){
                attSet.add(bp.AttachmentId__c);
            }
            List<Attachment> attList=new List<Attachment>();
            attList= [select Id, Name, Description from Attachment where Id in :attSet ORDER By CreatedDate DESC];
            system.debug(' attList[0] === ' + attList.size());     
            
            for(Attachment atch : attList) {
                wrapperBlueprintforcommunities bluePrintWrapp = new wrapperBlueprintforcommunities();
               bluePrintWrapp.preparedBy = preparedBy;
                bluePrintWrapp.attachementId = atch.Id;
                bluePrintWrapp.attachmentName = atch.Name;
                bluePrintWrapp.attachementDescription = atch.Description;
                blueprintListWrapper.add(bluePrintWrapp);
            }
            return blueprintListWrapper;   
        }
        
    }
}