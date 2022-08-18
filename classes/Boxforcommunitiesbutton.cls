global class Boxforcommunitiesbutton {
    public static String FolderID{ get; set; }
  
         public static String url { get; set; }
  @AuraEnabled
        public static string doinit(Id recordId){
         
    
        system.debug('Record id=='+recordId);
        box.Toolkit toolkit = new box.Toolkit();
        
       FolderID=toolkit.getFolderIdByRecordId(recordId); 
            if(FolderID!=null && FolderID!=''){
                 Id userId = UserInfo.getUserId();
box.Toolkit.CollaborationType collabType = box.Toolkit.CollaborationType.EDITOR;
String collabId = toolkit.createCollaborationOnRecord(userId, recordId, collabType, false);
system.debug('new collaboration id: ' + collabId);
            toolkit.commitChanges();
          url='https://andersonadvisors.app.box.com/embed_widget/files/0/f/'+FolderID+'?inline=1&partner_id=219&promoted_app_ids=840%2C1476'; 
            }else{
                 List<box__FRUP__c> boxFolders = [Select id, box__Folder_ID__c, box__Record_ID__c, box__Box_user__c,Createdby.Name from box__FRUP__c where box__Record_ID__c=:recordId ];
        if(boxFolders.size()>0){
        	 url='Issue' ; 
        }else{
                
		createAttachmentinBox(recordId);
            
        }
            }
           
          system.debug('FolderID id=='+FolderID);
      return url;
    }
    @future (callout=true)
    private static void createAttachmentinBox(id recordId){
        string createdFolderID='';
         box.Toolkit toolkit = new box.Toolkit();
         FolderID=toolkit.getFolderIdByRecordId(recordId);
		String accountFolderId = toolkit.createFolderForRecordId(recordId, null, true);
	system.debug('new item folder id: ' + accountFolderId);

// If there was an error, accountFolderId will be null. mostRecentError will contain the error message
	if(accountFolderId == null) {
	system.debug('most recent error: ' + toolkit.mostRecentError);
	}
	Id userId = UserInfo.getUserId();
	box.Toolkit.CollaborationType collabType = box.Toolkit.CollaborationType.EDITOR;
	String collabId = toolkit.createCollaborationOnRecord(userId, recordId, collabType, false);
	system.debug('new collaboration id: ' + collabId);
// ALWAYS call this method when finished.Since salesforce doesn't allow http callouts after dml operations, we need to commit the pending database inserts/updates or we will lose the associations created
	toolkit.commitChanges();
      //   boxforcommunitiesDesign.doinit(); 
     
       
    }
}