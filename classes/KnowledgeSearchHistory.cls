/**
* A controller class to used to maintain Search History for knowledge Search article.
* 
* @author Ranjeet Kumar
* @version 1.0 - Jan 2, 2019
*/
public class KnowledgeSearchHistory implements Queueable {
    private ID userId;
    private String searchKeyword;
    private String source;

   public KnowledgeSearchHistory(ID id, String search, String sourceMode){
        this.userId        = id;
        this.searchKeyword = search;
        this.source        = sourceMode; 
   
   }
   
    
 /**
* This method is used to Insert data into KnowledgeSearchHistory__c custom object to maintain history.
* 
* @author Ranjeet Kumar
* @date Jan 2, 2019
*/ 
   public void execute(QueueableContext context) {
	List<KnowledgeSearchHistory__c> cList = [select Id from KnowledgeSearchHistory__c where UserId__c = :userId and SearchKeyword__c = :searchKeyword and Source__c = :source];
       if(cList.size() == 0){
           KnowledgeSearchHistory__c KnowledgeSearch = new KnowledgeSearchHistory__c();   
           KnowledgeSearch.UserId__c         = userId;
           KnowledgeSearch.SearchKeyword__c  = searchKeyword;
           KnowledgeSearch.Name              = searchKeyword; 
           KnowledgeSearch.Source__c         = source;
           Insert KnowledgeSearch;    
      }
   
   }

}