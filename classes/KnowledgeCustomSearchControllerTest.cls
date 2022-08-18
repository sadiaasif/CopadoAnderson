@isTest(SeeAllData=true)
public class KnowledgeCustomSearchControllerTest {
    /**
* This method is used to get code coverage of  doSearch, getUserKeywords, getArticleDetails and sendmail method.
* 
* @author prateeks
* @date Dec 26, 2018
*/
    public static TestMethod void unitTest(){
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c = 'Edward';
        testAccount.Last_Name__c = 'Lee';
        testAccount.Name='Test Account' ;
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount;              
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        cont.Account_Roles__c = 'Primary Contact';
        insert cont;        
        User uzr = new User();
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.ProfileId=p;
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = p;
        // uzr.AccountId = testAccount.Id;
        uzr.IsActive =true;
        insert uzr;
        Knowledge__kav objknowledge = new Knowledge__kav ();
        objknowledge.UrlName = 'Testing';
        objknowledge.Article_category_type__c = 'Videos';
        objknowledge.Permissions__c = 'Both';
        objknowledge.Title = 'Testing';
        objknowledge.Summary = 'Testing';
        objknowledge.Knowledge_video_category__c = 'Courses';
        objknowledge.Knowledge_Video_Link__c = 'Testing';
        insert objknowledge;
     /*   knowledge__kav obj1 = [SELECT Id,Title,KnowledgeArticleId FROM knowledge__kav WHERE id =: objknowledge.Id];
        KbManagement.PublishingService.publishArticle(obj1.KnowledgeArticleId, true);*/
        Test.StartTest();
        system.runAs(uzr){
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            KnowledgeCustomSearchController CustomSearchController = new KnowledgeCustomSearchController(controller);
            CustomSearchController.searchArticle = 'test';
            CustomSearchController.doSearch(); 
            KnowledgeCustomSearchController.getUserKeywords();   
            //CustomSearchController.getArticleDetails(objknowledge.Id);   
            String myPageVal = '1';
            //String searchArticle = 'Test';
           /*  KnowledgeCustom1SearchController CustomSearch1Controller = new KnowledgeCustom1SearchController();
             CustomSearch1Controller.doSearch();  */
            
            
         CustomSearchController.getnxt();
         CustomSearchController.getprev();
         CustomSearchController.LastPage();
         CustomSearchController.nextRow();
        
         CustomSearchController.previousRow(); 
         CustomSearchController.FirstPage();    
         CustomSearchController.searchArt();    
             
        }
        KnowledgeCustomSearchController.sendMail(objknowledge.Id,cont.Id);
       
        Test.stopTest();
    } 
    
   public static TestMethod void PaginationArticleController(){
       UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c = 'Edward';
        testAccount.Last_Name__c = 'Lee';
        testAccount.Name='Test Account' ;
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount;              
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        cont.Account_Roles__c = 'Primary Contact';
        insert cont;        
       
       // Second Contact Insert here
        Contact cont1 = new Contact();
        cont1.FirstName = 'FirstName1';
        cont1.LastName = 'LastName1';
        cont1.Email='email1@email.com';
        cont1.phone='123456781';
        cont1.AccountId=testAccount.Id;
        cont1.Account_Roles__c = 'Primary Contact';
        insert cont1; 
       // Second Contact Insert here
        User uzr = new User();
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.ProfileId=p;
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = p;
        // uzr.AccountId = testAccount.Id;
        uzr.IsActive =true;
        insert uzr;
        Knowledge__kav objknowledge = new Knowledge__kav ();
        objknowledge.UrlName = 'Testing';
        objknowledge.Article_category_type__c = 'Videos';
        objknowledge.Permissions__c = 'Both';
        objknowledge.Title = 'Testing';
        objknowledge.Summary = 'Testing';
        objknowledge.Knowledge_video_category__c = 'Courses';
        objknowledge.Knowledge_Video_Link__c = 'Testing';
        insert objknowledge;
     /*   knowledge__kav obj1 = [SELECT Id,Title,KnowledgeArticleId FROM knowledge__kav WHERE id =: objknowledge.Id];
        KbManagement.PublishingService.publishArticle(obj1.KnowledgeArticleId, true);*/
        Test.StartTest();
        system.runAs(uzr){
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            PaginationArticleController CustomSearchController = new PaginationArticleController(controller);
            CustomSearchController.searchArticle = 'test';
            CustomSearchController.searchArticles(); 
           PaginationArticleController.getUserKeywords();   
         //  CustomSearchController.getArticleDetails(objknowledge.Id);    
            String myPageVal = '1';
            //String searchArticle = 'Test';
           /*  KnowledgeCustom1SearchController CustomSearch1Controller = new KnowledgeCustom1SearchController();
             CustomSearch1Controller.doSearch();  */
            
            
         CustomSearchController.getnxt();
        CustomSearchController.getprev();
         CustomSearchController.LastPage();
         CustomSearchController.next();
        
         CustomSearchController.previous(); 
         CustomSearchController.FirstPage();    
         CustomSearchController.searchArt();    
             
        }
        PaginationArticleController.sendMail(objknowledge.Id,testAccount.Id); 
       
        Test.stopTest(); 
      
    }
    
    
    
    public static TestMethod void KeywordController(){
       UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c = 'Edward';
        testAccount.Last_Name__c = 'Lee';
        testAccount.Name='Test Account' ;
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
        testAccount.phone='123456782';
        insert testAccount;              
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        cont.Account_Roles__c = 'Primary Contact';
        insert cont;        
       
       // Second Contact Insert here
        Contact cont1 = new Contact();
        cont1.FirstName = 'FirstName1';
        cont1.LastName = 'LastName1';
        cont1.Email='email1@email.com';
        cont1.phone='123456781';
        cont1.AccountId=testAccount.Id;
        cont1.Account_Roles__c = 'Primary Contact';
        insert cont1; 
       // Second Contact Insert here
        User uzr = new User();
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.ProfileId=p;
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = p;
        // uzr.AccountId = testAccount.Id;
        uzr.IsActive =true;
        insert uzr;
        Knowledge__kav objknowledge = new Knowledge__kav ();
        objknowledge.UrlName = 'Testing';
        objknowledge.Article_category_type__c = 'Videos';
        objknowledge.Permissions__c = 'Both';
        objknowledge.Title = 'Testing';
        objknowledge.Summary = 'Testing';
        objknowledge.Knowledge_video_category__c = 'Courses';
        objknowledge.Knowledge_Video_Link__c = 'Testing';
        insert objknowledge;
     /*   knowledge__kav obj1 = [SELECT Id,Title,KnowledgeArticleId FROM knowledge__kav WHERE id =: objknowledge.Id];
        KbManagement.PublishingService.publishArticle(obj1.KnowledgeArticleId, true);*/
        Test.StartTest();
        
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            KeywordSearchController CustomSearchController = new KeywordSearchController();
            CustomSearchController.getPrevRequired();
            CustomSearchController.getNextRequired();
            CustomSearchController.getCurrentPageNumber();
            CustomSearchController.next();
            CustomSearchController.previous(); 
             
      
       
       
        Test.stopTest(); 
      
    }
    
    
   
}