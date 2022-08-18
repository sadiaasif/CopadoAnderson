/** A Rest webservice class is used to show the Video Article.
* @author Deepesh Kumar
* @version 1.0 - 5 Apr, 2020
*/
@RestResource(urlmapping='/VideosArticle/*')
global class VideosArticle {  
    @HttpGet
    global static List<knowledge__kav> getVideosArticles()
    {
        List<Knowledge__kav> finalList = new List<Knowledge__kav>();
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        List<Knowledge__kav> videoarticleLists = [SELECT Id, Title,Knowledge_video_category__c,Article_category_type__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav WHERE Knowledge_video_category__c != 'FAQs' AND Knowledge_Video_Category__c != NULL AND Knowledge_Video_Category__c != 'Tax Tuesday Q & A'];
        List<Knowledge__kav> FaqvideoarticlesList= [SELECT Id, Title,Knowledge_video_category__c,Article_category_type__c,Knowledge_video_FAQ_category__c,Knowledge_Video_Link__c,Summary,Upload_File__Name__s FROM Knowledge__kav WHERE Knowledge_video_category__c = 'FAQs'];
 		
        finalList.addAll(videoarticleLists);
        finalList.addAll(FaqvideoarticlesList);
        
        List<String> videoPickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Knowledge__kav.Knowledge_video_category__c.getDescribe();         
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            videoPickListValuesList.add(pickListVal.getLabel()); 
        }
        
        List<String> faqPickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResultFaq = Knowledge__kav.Knowledge_video_FAQ_category__c.getDescribe();         
        List<Schema.PicklistEntry> ple2 = fieldResultFaq.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple2){
            faqPickListValuesList.add(pickListVal.getLabel()); 
        }
        Set<String> videoFoldersInQuery = new Set<String>();
        Set<String> faqFoldersInQuery = new Set<String>();
        for(Knowledge__kav video : videoarticleLists ){
            videoFoldersInQuery.add(video.Knowledge_video_category__c);
        }
        
        for(Knowledge__kav video : FaqvideoarticlesList ){
            faqFoldersInQuery.add(video.Knowledge_video_FAQ_category__c);
        }

        for(String folderName : videoPickListValuesList){
            if(!videoFoldersInQuery.contains(folderName)){
                knowledge__kav knw = new knowledge__kav(Knowledge_video_category__c = folderName);
                finalList.add(knw);
         	}
        }
        for(String folderName : faqPickListValuesList){
            if(!faqFoldersInQuery.contains(folderName)){
                knowledge__kav knw = new knowledge__kav(Knowledge_video_category__c = 'FAQs', Knowledge_video_FAQ_category__c = folderName);
                finalList.add(knw);
            }
         }
		return finalList;
    }
}