/**
* A controller class to used to search knowledge article and for sending email.
* 
* @author Ranjeet Kumar
* @version 1.0 - Dec 24, 2018
*/
/* Test class used for this controller is KnowledgeCustomSearchControllerTest*/
global with sharing class PaginationArticleController { 
   
     
    public Knowledge__kav art{get;set;}
    public List<Knowledge__kav> articleList {get;set;} 
    public integer errorMsg{get;set;}
    // create a list of strings to hold the conditions
    List<string> conditions = new List<string>();
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 5;
    public string searchArticle{get;set;}
    
    public Knowledge__kav articleLists{get;set;}
    
    // for mail functionality 
    public Account objAcc {get;set;}
    Public Contact con{get;set;}
    public PaginationArticleController(ApexPages.StandardController controller){
        system.debug('==>AccountMultipleSearchWithPagenationCLS  is calling==>');
        art = new Knowledge__kav();
        errorMsg = 0;
        Id articleId  = ApexPages.CurrentPage().getparameters().get('articleid');
        system.debug('=============articleId========='+articleId);
        Id accountId  = ApexPages.CurrentPage().getparameters().get('account_id');
        system.debug('=============accountId========='+accountId);
       
             getArticleDetails(articleId);
       
       
      
    }
    
    public void searchArt(){
        totalRecs = 0;
        OffsetSize = 0;
        if(articleList !=null && articleList.size()>0){
            articleList=null;
        }
        searchArticles ();
        conditions.clear();
    }
    
 /**
* This method is used to search article.
* 
* @author Ranjeet Kumar
* @date Dec 24, 2018
*/ 
    public Void searchArticles(){
        system.debug(' searchArticle ==  ' + searchArticle );
        String myPageVal = '';
        myPageVal=Apexpages.currentPage().getParameters().get('pageVal');
        if(myPageVal != null &&  myPageVal != ''){
            String myInput=Apexpages.currentPage().getParameters().get('myInput');        
            searchArticle = myInput;
        } else {
            searchArticle = searchArticle;
        }
        system.debug(' myPageVal ==  ' + myPageVal );
        system.debug(' searchArticle ==  ' + searchArticle );
        System.debug('Total Records is ==>'+totalRecs);
        System.debug('OffsetSize is ==>'+OffsetSize);
        
        if(articleList != null && !articleList.isEmpty()){
            articleList.clear();
        }
        String strQuery ='Select Article_category_type__c,Knowledge_video_category__c, Long_Description__c, Knowledge_Article_Category__c,Knowledge_Video_Link__c,Title,Summary,ArticleNumber,Short_Description__c, Revision_Date__c FROM Knowledge__kav WHERE ';
        
        if(searchArticle !=null && searchArticle !=''){
            strQuery += ' (Permissions__c = \''+ 'Both' +'\' OR Permissions__c = \''+ 'Internal' +'\' ) AND';  // search by title
            strQuery += ' (Title LIKE \''+'%'+searchArticle+'%'+'\'';  // search by title 
            strQuery += ' OR Short_Description__c LIKE \''+'%'+searchArticle+'%'+'\''; // search by Short Description
            strQuery += ' OR Content__c LIKE \''+'%'+searchArticle+'%'+'\''; // search by Content 
            strQuery += ' OR Keywords__c LIKE \''+'%'+searchArticle+'%'+'\')'; // search by Keyword 
            
            KnowledgeSearchHistory knowSearch = new KnowledgeSearchHistory(UserInfo.getUserId(),searchArticle ,'Org');
            ID jobID = System.enqueueJob(knowSearch); 
        }
        
       
         if(!Test.isRunningTest()){
                if(totalRecs !=null && totalRecs ==0){
                    List<Knowledge__kav> accTemp = Database.query(strQuery);
                    totalRecs = (accTemp !=null &&accTemp.size()>0)?accTemp.size():0;
                }
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
        
        //conditions.clear();
        //return articleList.size();
    }
    
  /**
* This method is used for Pagination to go to first page of searched article.
* 
* @author Ranjeet
* @date Jan 02, 2019
*/
    public void FirstPage()
    {
        OffsetSize = 0;
        searchArticles();
    }
    
    
 /**
* This method is used for Pagination to go to previous page of searched article.
* 
* @author Ranjeet
* @date Jan 02, 2019
*/
    public void previous()
    {
        OffsetSize = (OffsetSize-LimitSize);
    searchArticles();
    }
    
/**
* This method is used for Pagination to go to next page of searched article.
* 
* @author Ranjeet
* @date Jan 02, 2019
*/  
    public void next()
    {
        OffsetSize = OffsetSize + LimitSize;   
        searchArticles();
    }
    
/**
* This method is used for Pagination to go to last page of searched article.
* 
* @author Ranjeet
* @date Jan 02, 2019
*/
    public void LastPage()
    {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        if(OffsetSize == totalrecs){
            OffsetSize = OffsetSize - LimitSize;
        }
        searchArticles();
    }
    
 /**
* This method is used for Pagination.
* 
* @author Ranjeet
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
* @author Ranjeet
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
* @author Ranjeet
* @date Dec 24, 2018
*/
    @RemoteAction
    global static Set<String> getUserKeywords() {      
        
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
* @author Ranjeet
* @date Dec 24, 2018
*/
    Public Knowledge__kav getArticleDetails(Id artId) {
        try {
            system.debug('====artId====='+artId);
            articleLists = [SELECT Id, Title,Knowledge_Article_Category__c, Long_Description__c, Knowledge_Video_Link__c,Summary,Upload_File__Name__s,Content__c,UrlName,Upload_File__ContentType__s, Permissions__c, Article_category_type__c  FROM Knowledge__kav where Id =:artId LIMIT 1];    
            system.debug('====articleLists====='+articleLists);
            return articleLists; 
            
        } catch (QueryException e) {      
            system.debug('error == ' + e);
            ApexPages.addMessages(e);
            return null;
        }        
    }
    
    /**
* This method is used to send email from Salesforce org to primary contact.
* 
* @author Ranjeet
* @date Dec 24, 2018
*/
    @RemoteAction
    global static Integer sendMail(String KnowId,String accountId){
        try{
            
        Id accId = Id.valueOf(accountId);
        Id KnowledgeId = Id.valueOf(KnowId);
        
        Contact objCon =[select id,Account_Roles__c,Email, Name from Contact where Accountid =:accId AND Account_Roles__c= 'Primary Contact' LIMIT 1 ]; 
        
        system.debug('=====objCon==========='+objCon);
     
        List<String>knowledgeLink = new List<String>();
        
        if(objCon.Account_Roles__c == 'Primary Contact' && objCon.Email!=null){
            
            //get Knowledege Article Details 
            List<Knowledge__kav> lstKnowlegde= [SELECT UrlName, Title, Id, KnowledgeArticleId FROM Knowledge__kav ];
            Map<Id,String>map_id_Knowledge = new Map<Id,String>();
            Map<Id,String>map_id_Knowledge_title = new Map<Id,String>();
            
            for(Knowledge__kav objKnowledge : lstKnowlegde){
                map_id_Knowledge.put(objKnowledge.id,objKnowledge.UrlName);
                map_id_Knowledge_title.put(objKnowledge.id,objKnowledge.Title);
            }     
            //get Knowledege Article Details
            
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(objCon.Email);
            mail.setToAddresses(sendTo);
            mail.setSubject('Information on '+ map_id_Knowledge_title.get(KnowledgeId)); 
            String body='';
            
            
            String  mailsite ='';
            String knowArt ='';
            List<String> res = new List<String>();
            mailsite =   map_id_Knowledge.get(KnowledgeId);
           // knowArt = 'https://comm-andersonadvisors.cs19.force.com/Article/articles/Knowledge/' + mailsite + '/p' ; // for Sandbox
            knowArt = 'https://andersonadvisors.secure.force.com/Article/articles/Knowledge/' + mailsite + '/p' ; // for Production
            body += '<a href='+knowArt+'>Click Here.</a></br>';
            system.debug('body == ' + body);
            
            //Sample email templates Start her
            
             string html = '';
            html += '<body class="" style="background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;">';
    html +='<table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;">';
      html +='<tr>';
        html +='<td style="font-family: sans-serif; font-size: 14px; vertical-align: top;">&nbsp;</td>';
        html +='<td class="container" style="font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 580px; padding: 10px; width: 580px;">';
          html +='<div class="content" style="box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;">';

            /* START CENTERED WHITE CONTAINER **/
            html +='<span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;"></span>';
            html +='<table class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;">';

              /* START MAIN CONTENT AREA **/
              html +='<tr>';
                html +='<td class="wrapper" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;">';
                  html +='<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;">';
                   html += '<tr>';
                     html += '<td style="font-family: sans-serif; font-size: 14px; vertical-align: top;">';
                       html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Dear '+objCon.Name+' ,</p>';
                       html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Thanks for requesting information on '+ map_id_Knowledge_title.get(KnowledgeId) +'</p>';
            html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">We are pleased to share the following details.</p>';
                       html += '<table border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;">';
                         html += '<tbody>';
                           html += '<tr>';
                             html += '<td align="left" style="font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;">';
                               html += '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">';
                                html +=  '<tbody>';
                                   html += '<tr>';
                                   html +=   '<td style="font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #3498db; border-radius: 5px; text-align: center;"> <a href='+knowArt+' target="_blank" style="display: inline-block; color: #ffffff; background-color: #3498db; border: solid 1px #3498db; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #3498db;">Click Me</a> </td>';
                                  html +=  '</tr>';
                                html +=  '</tbody>';
                               html += '</table>';
                             html += '</td>';
                          html +=  '</tr>';
                        html +=  '</tbody>';
                       html += '</table>';
                       html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Please let us know if you need anything further and we would be happy to help.</p>';
                       html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Thank you,</p>';
                     html += '</td>';
                    html +='</tr>';
                 html += '</table>';
               html += '</td>';
             html += '</tr>';

            /** END MAIN CONTENT AREA ***/
           html += '</table>';

            /**** START FOOTER *****/
           html += '<div class="footer" style="clear: both; Margin-top: 10px; text-align: center; width: 100%;">';
             html += '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;">';
               html += '<tr>';
                 html += '<td class="content-block" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;">';
                   html += '<span class="apple-link" style="color: #999999; font-size: 12px; text-align: center;">ANDERSON LAW GROUP ADDRESS</span>';
                html += '</td>';
               html += '</tr>';
               html += '<tr>';
                 html += '<td class="content-block powered-by" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;">';
                  html +=  'Powered by ANDERSON LAW GROUP';
                 html += '</td>';
               html += '</tr>';
             html += '</table>';
           html += '</div>';
            /*** END FOOTER  ***/

          /*** END CENTERED WHITE CONTAINER ****/
         html += '</div>';
       html += '</td>';
       html += '<td style="font-family: sans-serif; font-size: 14px; vertical-align: top;">&nbsp;</td>';
     html += '</tr>';
   html += '</table>';
 html += '</body>';
            
            
            // Sample Email templates End here
            
            
            String mailContent = 'Hi, Please click on the button  for see the knowledge article <br/><br/>' + body;
            // mail.setHtmlBody(mailContent);
             mail.setHtmlBody(html);
            mails.add(mail);
            if(!mails.isEmpty())              
                Messaging.sendEmail(mails);            
        }else{
            return 0;
        }
        return 1;
        } catch (QueryException e) {      
            system.debug('error == ' + e);
            ApexPages.addMessages(e);
            return 2;
        }    
    }
    
    
}