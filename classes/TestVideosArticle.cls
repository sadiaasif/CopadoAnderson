@isTest
private class TestVideosArticle  {
static testMethod void testData() {

RestRequest req = new RestRequest(); 
RestResponse res = new RestResponse();

req.requestURI = 'services/apexrest/VideosArticle';  
req.httpMethod = 'GET';
RestContext.request = req;
RestContext.response = res;
List<Knowledge__kav> finalList = VideosArticle.getVideosArticles();
system.assertNotEquals(null,finalList);    
    }
}