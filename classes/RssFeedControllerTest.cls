@isTest(SeeAllData=false)
private class RssFeedControllerTest {
    @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new RssHttpCalloutMock());        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        User usr = new User();
        ApexPages.StandardController controller = new ApexPages.StandardController(usr);
        RssFeedController rss = new RssFeedController(controller); 
        rss.getRSSFeed();        
    }
    
}