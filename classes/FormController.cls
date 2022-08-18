/**
* A controller class to used to fetch Upload Forms data.
* 
* @author prateeks
* @version 1.0 - Feb 13, 2018
*/
public with sharing class FormController {    
    
    //Page Size
    private Static Final Integer PAGE_NUMBER = 10;    
    //Search String used in ArticleList tag
    public String searchstring { get; set; }
    //public static boolean Vf{get;set;}
    public string tr='FAQs';
    
    Public List<Knowledge__kav> articleCategory{get;set;} 
    Public List<Knowledge__kav> videoArticleCategory{get;set;} 
    Public List<Knowledge__kav> videoArticalCategoryFAQ{get;set;}
    
    public FormController(ApexPages.StandardController controller) {
        String qryString = 'SELECT Id, Title,Knowledge_Article_Category__c,Article_category_type__c FROM Knowledge__kav ';
        List<Knowledge__kav> articleLists= Database.query(qryString);
        articleCategory=articleLists;
        List<Knowledge__kav> videoarticleLists = [SELECT Id, Title,Knowledge_video_category__c,Article_category_type__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav WHERE Knowledge_video_category__c = 'Courses' OR Knowledge_video_category__c='Real Estate' OR Knowledge_video_category__c='Stock Trading' OR Knowledge_video_category__c='Tax Strategies'OR Knowledge_video_category__c='Retirement' OR Knowledge_video_category__c='Entrepreneurship'OR Knowledge_video_category__c='Past Webinars'OR  Knowledge_video_category__c='Tax Tuesday'];
        videoArticleCategory=videoarticleLists; 
        System.debug('**** DP videoArticleCategory = '+videoArticleCategory);
        List<Knowledge__kav> FaqvideoarticlesList= [SELECT Id, Title,Knowledge_video_category__c,Article_category_type__c,Knowledge_video_FAQ_category__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav WHERE Knowledge_video_category__c = 'FAQs'];
        videoArticalCategoryFAQ=FaqvideoarticlesList;
        System.debug('**** DP videoArticalCategoryFAQ = '+videoArticalCategoryFAQ);
        getCategoryList();
        getVideoCategoryList();
        getVideoFAQCategoryList();
    } 
    
    // Method to serach article for forms
    public void search(){  
        string searchquery='SELECT Id, Title,Knowledge_Article_Category__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav where Title like \'%'+searchstring+'%\'';  
        List<Knowledge__kav> articleLists= Database.query(searchquery);
        articleCategory=articleLists; 
    }  
    
    // Method to serach article for Videos
    public void searchVideos(){  
        string searchquery='SELECT Id, Title,Knowledge_video_category__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav where Title like \'%'+searchstring+'%\'';  
        List<Knowledge__kav> articleLists= Database.query(searchquery);
        videoArticleCategory=articleLists; 
    } 
    
    //Method to search the article from FAQ
    public void searchFAQVideos(){  
        string searchquery='SELECT Id, Title,Knowledge_video_FAQ_category__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav where Title like \'%'+searchstring+'%\'';  
        List<Knowledge__kav> articleLists= Database.query(searchquery);
        videoArticalCategoryFAQ=articleLists; 
    } 
    
    // Returns picklist values of Knowledge Kav object
    public List<String> getCategoryList(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Knowledge__kav.Knowledge_Article_Category__c.getDescribe();         
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        return pickListValuesList;
    }   
    // Returns picklist values of Knowledge Kav  object
    
    public List<String> getVideoCategoryList(){ 
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Knowledge__kav.Knowledge_video_category__c.getDescribe();         
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel()); 
        }
        
        return pickListValuesList;
    }  
    
    // Returns picklist values of Knowledge Kav object
    public List<String> getVideoFAQCategoryList(){   
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Knowledge__kav.Knowledge_video_FAQ_category__c.getDescribe();         
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());  
        }
        
        return pickListValuesList;      
    } 
    //Keeps track of current page & max size of article list
    Integer currentPage = 1;
    Integer maxSize = 1;
    
    // Returns whether we need to see previous button or not
    public boolean getPrevRequired() {
        return currentPage > 1;
    }
    
    // Returns whether we need to see next button or not
    public boolean getNextRequired() {
        return currentPage * PAGE_NUMBER < maxSize;
    }
    
    //Returns current page number 
    public Decimal getCurrentPageNumber() {
        return this.currentPage;
    }
    
    //action for next click
    public PageReference next() {
        if(maxSize > this.currentPage * PAGE_NUMBER) {
            this.currentPage = this.currentPage + 1;
        }
        return null;
    }    
    
    //action for previous click
    public PageReference previous() {        
        if(this.currentPage > 1)
            this.currentPage = this.currentPage - 1;
        return null;
    }
    
    public void fakeMethod(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod1(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod2(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    
    public void fakeMethod3(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    
}