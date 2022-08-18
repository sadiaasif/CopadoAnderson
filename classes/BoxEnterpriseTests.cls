@IsTest
public class BoxEnterpriseTests {
    public static testMethod void testParseMember() {
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxEnterprise enterprise = new BoxEnterprise(api, '10543463');
        BoxEnterprise.Info enterpriseInfo = new BoxEnterprise.Info();
        enterpriseInfo.addValue('name', 'test enterprise');

        Test.startTest();
        enterpriseInfo.parseMember('name', 'test enterprise');
        Test.stopTest();

        System.assertEquals('test enterprise', enterpriseInfo.name);
    }

    public static testMethod void testGetEnterpriseEvents() {
        String mockResponseBody = '{"chunk_size": 3,"next_stream_position": "28893355","entries": [{"source": null,"created_by": {"type": "user","id": "181216415","name": "sean rose","login": "sean+awesome@box.com"},"created_at": "2012-12-12T10:53:43-08:00","event_id": "28893270","event_type": "ADD_LOGIN_ACTIVITY_DEVICE","ip_address": "67.218.117.3","type": "event","session_id": null},{"source": null,"created_by": {"type": "user","id": "181216415","name": "sean rose","login": "sean+awesome@box.com"},"created_at": "2012-12-12T10:53:43-08:00","event_id": "28893272","event_type": "LOGIN","ip_address": "67.218.117.3","type": "event","session_id": null},{"source": {"type": "folder","id": "387630341","sequence_id": "0","name": "A BNE"},"created_by": {"type": "user","id": "181216415","name": "sean rose","login": "sean+awesome@box.com"},"created_at": "2012-12-12T10:53:43-08:00","event_id": "28893354","event_type": "UPLOAD","ip_address": "67.218.117.3","type": "event","session_id": null}]}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'OK', 200)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');

        BoxEnterprise enterprise = new BoxEnterprise(api, '10543463');
        BoxEnterprise.Info enterpriseInfo = new BoxEnterprise.Info();
        enterpriseInfo.addValue('name', 'Tv Enterprise');
       

        Test.startTest();
        list<BoxEvent.Info> events = enterprise.getEnterpriseEvents();
            list<BoxEvent.Info> events2 = enterprise.getEnterpriseEvents(1, 'test', 'Test', '12', '12');
        // String mockResponseBody ='{"total_count":9,"entries":[{"type":"folder","id":"81273866976","sequence_id":"0","etag":"0","name":"Viewable-ClientDocs"},{"type":"file","id":"484625073666","file_version":{"type":"file_version","id":"513028838466","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd"},"sequence_id":"0","etag":"0","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd","name":"2019 3:44:31 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484640237864","file_version":{"type":"file_version","id":"513043916264","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d"},"sequence_id":"0","etag":"0","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d","name":"2019 4:08:22 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484641397127","file_version":{"type":"file_version","id":"513045260327","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42"},"sequence_id":"0","etag":"0","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42","name":"2019 4:20:11 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484642269212","file_version":{"type":"file_version","id":"513046175612","sha1":"ecf850c16713a532e3ad88faddbb74de67450400"},"sequence_id":"0","etag":"0","sha1":"ecf850c16713a532e3ad88faddbb74de67450400","name":"2019 4:22:44 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484647539143","file_version":{"type":"file_version","id":"513052364743","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466"},"sequence_id":"0","etag":"0","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466","name":"2019 4:29:46 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"485224761411","file_version":{"type":"file_version","id":"513669701811","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33"},"sequence_id":"0","etag":"0","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33","name":"2019.7.2 -   Receipt  0261161 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485234018678","file_version":{"type":"file_version","id":"513678960278","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890"},"sequence_id":"0","etag":"0","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890","name":"2019.7.2 -   Receipt  0261165 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485226499651","file_version":{"type":"file_version","id":"513671783251","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb"},"sequence_id":"0","etag":"0","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb","name":"2019.7.2 -   Receipt  0261166 -   Grey Test, Meredith  Test.pdf"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}]}';
	BoxFolder.Info responseFromJsonString = new BoxFolder.Info(mockResponseBody);
        BoxEnterprise.Info emailAliasInfojson = new BoxEnterprise.Info(mockResponseBody);
      
        Test.stopTest();

        System.assertEquals(3, events.size());
    }
}