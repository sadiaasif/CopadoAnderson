@isTest
public class BoxApiRequestTests {
    private static String url = 'https://example.com';
    private static String method = 'GET';
    private static String accessToken = 'accesstoken';
    private static String refreshToken = 'refreshtoken';
    private static String clientId = 'clientid';
    private static String clientSecret = 'clientsecret';

    public static testMethod void testConstructors() {
        BoxApiConnection api = new BoxApiConnection(accessToken);

        Test.startTest();
        BoxApiRequest request1 = new BoxApiRequest(url, method);
        BoxApiRequest request2 = new BoxApiRequest(api, url, method);

        BoxApiConnection api2 = new BoxApiConnection(accessToken);
        api2.setAsUserId('1234');
        BoxApiRequest request3 = new BoxApiRequest(api2, url, method);
        Test.stopTest();
    }
 public static testmethod void getBoxResourceResponseBodytest(){
       String mockResponseBody ='{"total_count":9,"entries":[{"type":"folder","id":"81273866976","sequence_id":"0","etag":"0","name":"Viewable-ClientDocs"},{"type":"file","id":"484625073666","file_version":{"type":"file_version","id":"513028838466","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd"},"sequence_id":"0","etag":"0","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd","name":"2019 3:44:31 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484640237864","file_version":{"type":"file_version","id":"513043916264","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d"},"sequence_id":"0","etag":"0","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d","name":"2019 4:08:22 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484641397127","file_version":{"type":"file_version","id":"513045260327","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42"},"sequence_id":"0","etag":"0","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42","name":"2019 4:20:11 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484642269212","file_version":{"type":"file_version","id":"513046175612","sha1":"ecf850c16713a532e3ad88faddbb74de67450400"},"sequence_id":"0","etag":"0","sha1":"ecf850c16713a532e3ad88faddbb74de67450400","name":"2019 4:22:44 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484647539143","file_version":{"type":"file_version","id":"513052364743","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466"},"sequence_id":"0","etag":"0","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466","name":"2019 4:29:46 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"485224761411","file_version":{"type":"file_version","id":"513669701811","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33"},"sequence_id":"0","etag":"0","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33","name":"2019.7.2 -   Receipt  0261161 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485234018678","file_version":{"type":"file_version","id":"513678960278","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890"},"sequence_id":"0","etag":"0","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890","name":"2019.7.2 -   Receipt  0261165 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485226499651","file_version":{"type":"file_version","id":"513671783251","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb"},"sequence_id":"0","etag":"0","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb","name":"2019.7.2 -   Receipt  0261166 -   Grey Test, Meredith  Test.pdf"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}]}';
	BoxFolder.Info responseFromJsonString = new BoxFolder.Info(mockResponseBody);
            Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(mockResponseBody, 'OK', 200));
            BoxApiConnection apitest = new BoxApiConnection('accesstoken');
             BoxFolder folder1 = new BoxFolder(apitest, '11446498');
             BoxFolder.Info responseFromJsonObject = new BoxFolder.Info(responseFromJsonString);
            folder1.setInfo(responseFromJsonObject);
        list<BoxItem.Info> children = folder1.getChildren();
    }
    
    public static testmethod void ensureBoxResourceResponseCodeTest(){
       list<BoxTestMockCallout.MockResponse> responses = new List<BoxTestMockCallout.MockResponse>();
        BoxTestMockCallout.MockResponse retryResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"retry"}',
            'ERROR',
            500
        );
        responses.add(retryResponse);
        BoxTestMockCallout.MockResponse successResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"success"}',
            'OK',
            200
        );
        responses.add(successResponse);
        Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(responses));

        Test.startTest();
        BoxApiConnection api = new BoxApiConnection(
            clientId,
            clientSecret,
            accessToken,
            refreshToken
        );
        api.lastRefresh = DateTime.now().getTime() - 5;
        api.expires = api.lastRefresh + 60000;
        BoxApiRequest request = new BoxApiRequest(api, url, method);
        request.setBody('request body', 12);
        request.setTimeout(500);
        HttpResponse finalResponse = request.send();
        Set<Integer> statusCodes=new  Set<Integer>();
        statusCodes.add(finalResponse.getStatusCode());
        BoxApiRequest.ensureBoxResourceResponseCode(finalResponse, method, statusCodes);
        Test.stopTest();

        System.assertEquals(200, finalResponse.getStatusCode());
    }
    
      
      public static testmethod void setMultipartFormBodytest(){
           list<BoxTestMockCallout.MockResponse> responses = new List<BoxTestMockCallout.MockResponse>();
        BoxTestMockCallout.MockResponse redirectResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"redirect"}',
            'REDIRECT',
            301
        );
        responses.add(redirectResponse);
        BoxTestMockCallout.MockResponse successResponse = new BoxTestMockCallout.MockResponse(
            '{"Status":"success"}',
            'OK',
            200
        );
        responses.add(successResponse);
        Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(responses));

        Test.startTest();
          Blob Body=Blob.valueOf('test 1');
         String FileName='test 1';
        BoxApiConnection api = new BoxApiConnection(
            clientId,
            clientSecret,
            accessToken,
            refreshToken
        );
        api.lastRefresh = DateTime.now().getTime() - 5;
        api.expires = api.lastRefresh + 60000;
        BoxApiRequest request = new BoxApiRequest(api, url, method);
            request.setMultipartFormBody(Body,FileName);
       
        request.setTimeout(500);
        HttpResponse finalResponse = request.send();
        

        System.assertEquals(200, finalResponse.getStatusCode());
     
         
       
          
       
       //     HttpResponse finalResponse = apirequest.send();
 Test.stopTest();
    }
     
    public static testMethod void testRetry() {
        list<BoxTestMockCallout.MockResponse> responses = new List<BoxTestMockCallout.MockResponse>();
        BoxTestMockCallout.MockResponse retryResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"retry"}',
            'ERROR',
            500
        );
        responses.add(retryResponse);
        BoxTestMockCallout.MockResponse successResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"success"}',
            'OK',
            200
        );
        responses.add(successResponse);
        Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(responses));

        Test.startTest();
        BoxApiConnection api = new BoxApiConnection(
            clientId,
            clientSecret,
            accessToken,
            refreshToken
        );
        api.lastRefresh = DateTime.now().getTime() - 5;
        api.expires = api.lastRefresh + 60000;
        BoxApiRequest request = new BoxApiRequest(api, url, method);
        request.setBody('request body', 12);
        request.setTimeout(500);
        HttpResponse finalResponse = request.send();
        Test.stopTest();

        System.assertEquals(200, finalResponse.getStatusCode());
    }

    public static testMethod void testRedirect() {
        list<BoxTestMockCallout.MockResponse> responses = new List<BoxTestMockCallout.MockResponse>();
        BoxTestMockCallout.MockResponse redirectResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"redirect"}',
            'REDIRECT',
            301
        );
        responses.add(redirectResponse);
        BoxTestMockCallout.MockResponse successResponse = new BoxTestMockCallout.MockResponse(
            '{"Status":"success"}',
            'OK',
            200
        );
        responses.add(successResponse);
        Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(responses));

        Test.startTest();
        BoxApiConnection api = new BoxApiConnection(
            clientId,
            clientSecret,
            accessToken,
            refreshToken
        );
        api.lastRefresh = DateTime.now().getTime() - 5;
        api.expires = api.lastRefresh + 60000;
        BoxApiRequest request = new BoxApiRequest(api, url, method);
        request.setBody('request body');
        request.setTimeout(500);
        HttpResponse finalResponse = request.send();
        Test.stopTest();

        System.assertEquals(200, finalResponse.getStatusCode());
    }

    @isTest
    static void handleRedirectTest() {
        list<BoxTestMockCallout.MockResponse> responses = new List<BoxTestMockCallout.MockResponse>();
        BoxTestMockCallout.MockResponse redirectResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"redirect"}',
            'REDIRECT',
            301
        );
        responses.add(redirectResponse);
        BoxTestMockCallout.MockResponse successResponse = new BoxTestMockCallout.MockResponse(
            '{"Status":"success"}',
            'OK',
            200
        );
        responses.add(successResponse);
        Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(responses));

        BoxApiConnection api = new BoxApiConnection(
            clientId,
            clientSecret,
            accessToken,
            refreshToken
        );
        api.lastRefresh = DateTime.now().getTime() - 5;
        api.expires = api.lastRefresh + 60000;

        BoxApiRequest request = new BoxApiRequest(api, url, method);
        request.numberOfRedirects = 1;
        request.setTimeout(500);

        HttpResponse responseMock = new HttpResponse();
        responseMock.setHeader(
            BoxApiRequest.HEADER_LOCATION_LOWER_CASE,
            BoxTestMockCallout.MOCK_REDIRECT_URL
        );

        Test.startTest();

        request.handleRedirect(responseMock);

        Test.stopTest();

        System.assertEquals(
            BoxTestMockCallout.MOCK_REDIRECT_URL,
            request.url,
            'Expected request url to be assigned value from response location header'
        );
    }

    @isTest
    static void handleRedirectLegacyTest() {
        list<BoxTestMockCallout.MockResponse> responses = new List<BoxTestMockCallout.MockResponse>();
        BoxTestMockCallout.MockResponse redirectResponse = new BoxTestMockCallout.MockResponse(
            '{"status":"redirect"}',
            'REDIRECT',
            302
        );
        responses.add(redirectResponse);
        BoxTestMockCallout.MockResponse successResponse = new BoxTestMockCallout.MockResponse(
            '{"Status":"success"}',
            'OK',
            200
        );
        responses.add(successResponse);
        Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(responses));

        BoxApiConnection api = new BoxApiConnection(
            clientId,
            clientSecret,
            accessToken,
            refreshToken
        );
        api.lastRefresh = DateTime.now().getTime() - 5;
        api.expires = api.lastRefresh + 60000;

        BoxApiRequest request = new BoxApiRequest(api, url, method);
        request.numberOfRedirects = 1;
        request.setTimeout(500);

        HttpResponse responseMock = new HttpResponse();
        responseMock.setHeader(
            BoxApiRequest.HEADER_LOCATION_CAPITALIZED,
            BoxTestMockCallout.MOCK_REDIRECT_URL
        );

        Test.startTest();

        request.handleRedirect(responseMock);

        Test.stopTest();

        System.assertEquals(
            BoxTestMockCallout.MOCK_REDIRECT_URL,
            request.url,
            'Expected request url to be assigned value from response location header'
        );
    }
}