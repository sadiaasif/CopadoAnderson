/**
* A controller class to used to search knowledge article and for sending email.
* 
* @author prateeks
* @version 1.0 - Dec 24, 2018
*/
public with sharing class KnowledgeCustomSearchController {
    
    
    public string searchArticle{get;set;}
    public String query;
    public String articleQuery;
    public List<Knowledge__kav>lstknowledge{get;set;}
    Public User usObj{get;set;}
    Public Contact con{get;set;}
    public integer errorMsg{get;set;}
    
    public Knowledge__kav art{get;set;}
    public List<Knowledge__kav> articleList {get;set;}
    // create a list of strings to hold the conditions
    List<string> conditions = new List<string>();
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 5;
    public Knowledge__kav articleLists{get;set;}
    
    
    public KnowledgeCustomSearchController(ApexPages.StandardController controller){        
        usObj=[Select id,Username,AboutMe,Name,FirstName,LastName,Phone,ContactId,SmallPhotoUrl,FullPhotoUrl,AccountId,Email,Alias,ProfileId,Title,MobilePhone,LastLoginDate,CreatedDate,Client_Image__c,IsActive from User where Id=:UserInfo.getUserId() Limit 1];
        system.debug(' us obj = ' + usObj);
        con=[Select id,Name,Email,AccountId,account.Platinum_Client_View__c,account.Phone,FirstName, LastName, MobilePhone, Birthdate From contact where id =:usObj.contactid limit 1];           
        lstknowledge = new List<Knowledge__kav>();
        art = new Knowledge__kav();
        Id articleId  = ApexPages.CurrentPage().getparameters().get('articleid');
        system.debug('=============articleId========='+articleId);
        getArticleDetails(articleId);
        errorMsg = 0;
        
    }
    
        /**
* This method is used to call main search method.
* 
* @author prateeks
* @date Dec 24, 2018
*/
    public void searchArt(){
        totalRecs = 0;
        OffsetSize = 0;
        if(articleList !=null && articleList.size()>0){
            articleList=null;
        }
        doSearch();
        conditions.clear();
    }
    /**
* This method is used to search article.
* 
* @author prateeks
* @date Dec 24, 2018
*/
    public void doSearch(){    
        system.debug(' searchArticle ==  ' + searchArticle );
        String myPageVal = '';
        myPageVal=Apexpages.currentPage().getParameters().get('pageVal');
        if(myPageVal != null &&  myPageVal != ''){
            String myInput=Apexpages.currentPage().getParameters().get('myInput');        
            searchArticle = myInput;
        } else {
            searchArticle = searchArticle;
        }
        
        if(articleList != null && !articleList.isEmpty()){
            articleList.clear();
        }
        String strQuery ='Select Article_category_type__c,Knowledge_video_category__c,Long_Description__c,Knowledge_Article_Category__c,Knowledge_Video_Link__c,Title,Summary,ArticleNumber,Short_Description__c,  Revision_Date__c,Upload_File__ContentType__s  FROM Knowledge__kav WHERE ';
        
        if(searchArticle !=null && searchArticle !=''){
            strQuery += ' (Permissions__c = \''+ 'Both' +'\' OR Permissions__c = \''+ 'Client' +'\' ) AND';  // search by title
            strQuery += ' (Title LIKE \''+'%'+searchArticle+'%'+'\'';  // search by title 
            strQuery += ' OR Short_Description__c LIKE \''+'%'+searchArticle+'%'+'\''; // search by Short Description
            strQuery += ' OR Content__c LIKE \''+'%'+searchArticle+'%'+'\''; // search by Content 
            strQuery += ' OR Keywords__c LIKE \''+'%'+searchArticle+'%'+'\')'; // search by Keyword 
          KnowledgeSearchHistory knowSearch = new KnowledgeSearchHistory(UserInfo.getUserId(),searchArticle ,'Community');
            ID jobID = System.enqueueJob(knowSearch);
        }
        system.debug(' Query == ' + strQuery);
        if(totalRecs !=null && totalRecs ==0){
            List<Knowledge__kav> accTemp = new List<Knowledge__kav>();
            if(!Test.isRunningTest()){
               accTemp = Database.query(strQuery);
            }
            totalRecs = (accTemp !=null &&accTemp.size()>0)?accTemp.size():0;
        } 
        // add sort and limits at the end  
        strQuery += ' ORDER BY Title ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';
        system.debug(' strQuery == ' + strQuery);
            if(!Test.isRunningTest()){
                articleList  = Database.query(strQuery);
                 if(OffsetSize == 0 && articleList.size() == 0){
                      errorMsg = 1;  
                    }else{
                        errorMsg = 0;  
                    }
                    system.debug(' articleList == ' + articleList);
            }
        
       
    }
    
    /**
* This method is used for Pagination to go to first page of searched article.
* 
* @author prateeks
* @date Jan 02, 2019
*/
    public void FirstPage()
    {
        OffsetSize = 0;
        doSearch();
    }
    
    /**
* This method is used for Pagination to go to previous page of searched article.
* 
* @author prateeks
* @date Jan 02, 2019
*/
    public void previousRow()
    {
        OffsetSize = (OffsetSize-LimitSize);
        doSearch();
    }
    
    /**
* This method is used for Pagination to go to next page of searched article.
* 
* @author prateeks
* @date Jan 02, 2019
*/    
    public void nextRow()
    {
        OffsetSize = OffsetSize + LimitSize;
        doSearch();
    }
    
    /**
* This method is used for Pagination to go to last page of searched article.
* 
* @author prateeks
* @date Jan 02, 2019
*/
    public void LastPage()
    {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        if(OffsetSize == totalrecs){
            OffsetSize = OffsetSize - LimitSize;
        }
        doSearch();
    }
    
    /**
* This method is used for Pagination.
* 
* @author prateeks
* @date Jan 02, 2019
*/
    public boolean getprev()
    {
        if(OffsetSize == 0){
            return true;
        }
        else {
            return false;
        }
    }
    
    /**
* This method is used for Pagination.
* 
* @author prateeks
* @date Jan 02, 2019
*/
    public boolean getnxt()
    {
        if((OffsetSize + LimitSize) >= totalRecs){            
            return true;
        }
        else {            
            return false;
        }
    }
    
    /**
* This method is used to get searched keywords of articles of logged in user in community portal.
* 
* @author prateeks
* @date Dec 24, 2018
*/
    @RemoteAction
    Public static Set<String> getUserKeywords() {      
        
        try {            
            Set<String> mainArr = new Set<String>();
            User usObj = [Select id,AccountId,ContactId from User where Id=:UserInfo.getUserId()];
            List<KnowledgeSearchHistory__c> knowledgeData = [Select SearchKeyword__c From KnowledgeSearchHistory__c where UserId__c = :usObj.Id ];
            for(KnowledgeSearchHistory__c ka: knowledgeData) {
                mainArr.add(ka.SearchKeyword__c);
            }
            return mainArr;
        } catch (QueryException e) {                            
            ApexPages.addMessages(e);                   
            return null;
        }        
    }
    
    
    /**
* This method is used to get article details according to knowledge id from community portal.
* 
* @author prateeks
* @date Dec 24, 2018
*/
    Public Knowledge__kav getArticleDetails(Id artId) {
        try {
            system.debug('====artId====='+artId);
            if(artId != null){
            articleLists = [SELECT Id, Title,Knowledge_Article_Category__c, Long_Description__c, Knowledge_Video_Link__c,Summary,Upload_File__Name__s,Content__c,UrlName,Upload_File__ContentType__s,Article_category_type__c  FROM Knowledge__kav where Id =:artId LIMIT 1];    
            system.debug('====articleLists====='+articleLists);
            return articleLists; 
            } else {
               return null; 
            }
            
        } catch (QueryException e) {      
            system.debug('error == ' + e);
            ApexPages.addMessages(e);
            return null;
        }        
    }
    
    /**
* This method is used to send email from community portal.
* 
* @author prateeks
* @date Dec 24, 2018
*/
    @RemoteAction
    public static Boolean sendMail(String KnowId,String contactId){
        Id contId = Id.valueOf(contactId);
        Id KnowledgeId = Id.valueOf(KnowId);
        
        Contact objCon =[select id,Account_Roles__c,Email from Contact where id =:contId ]; 
        List<String>knowledgeLink = new List<String>();
        
        if(objCon.Account_Roles__c == 'Primary Contact' && objCon.Email!=null){
            
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(objCon.Email);
            mail.setToAddresses(sendTo);
            mail.setSubject('Link of Knowledge Articles'); 
            String body='';
            List<Knowledge__kav> lstKnowlegde= [SELECT UrlName, Title, Id, KnowledgeArticleId FROM Knowledge__kav ];
            Map<Id,String>map_id_Knowledge = new Map<Id,String>();
            
            for(Knowledge__kav objKnowledge : lstKnowlegde){
                map_id_Knowledge.put(objKnowledge.id,objKnowledge.UrlName);
            }                          
            
            String  mailsite ='';
            String knowArt ='';
            List<String> res = new List<String>();
            mailsite =   map_id_Knowledge.get(KnowledgeId);
            knowArt = 'https://comm-andersonadvisors.cs19.force.com/Article/articles/Knowledge/' + mailsite + '/p' ; 
            body += '<a href='+knowArt+'>Click Here.</a></br>';
            system.debug('body == ' + body);
            
            String mailContent = 'Hi, Please click on the button  for see the knowledge article <br/><br/>' + body;
            mail.setHtmlBody(mailContent);
            mails.add(mail);
            if(!mails.isEmpty())              
                Messaging.sendEmail(mails);            
        }
        return true;
    }
    
       
}