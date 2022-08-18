public without sharing class  CommunityCaseDisplayController {	
    
    @AuraEnabled
    public static List<CaseComment> getCaseComments(String caseId) {
        List<CaseComment> caseComments = 
                [SELECT Id, ParentId, IsPublished, CommentBody, CreatedDate, CreatedBy.Name, LastModifiedDate, LastModifiedById FROM CaseComment 
                 where parentId=:caseId order by CreatedDate desc];

        return caseComments;        
    }
    
    @AuraEnabled
    public static CaseComment addCaseComment(String caseId, String commentBody) {
        CaseComment caseComment = new CaseComment(ParentId=caseId, CommentBody=commentBody);
        insert caseComment;

        return caseComment;        
    }

 @AuraEnabled
    public static string EditCaseComment(String caseCommentId) {
        String caseCommententered='';
        
        for(CaseComment c:[SELECT Id, ParentId, IsPublished, CommentBody, CreatedDate, CreatedBy.Name, LastModifiedDate, LastModifiedById FROM CaseComment 
                 where id=:caseCommentId limit 1]){
            caseCommententered=c.CommentBody;       
                }
        return caseCommententered;
             
    }
    
    @AuraEnabled
    public static Boolean updateCaseComment(String caseCommentId,string updatecaseComment) {
        Boolean caseCommentupdate=false;
      List<CaseComment> updateCase=new List<CaseComment>();
         updateCase= [SELECT Id, ParentId, IsPublished, CommentBody, CreatedDate, CreatedBy.Name, LastModifiedDate, LastModifiedById FROM CaseComment 
                 where id=:caseCommentId limit 1];
        for(CaseComment c:updateCase){
            c.CommentBody=updatecaseComment;       
                }
        try{
            update updateCase;
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
      
             
    }        
}