@isTest
public class WebFormAttachmentToBoxTest {
private static String accessToken = 'accesstoken'; 
    private static String refreshToken = 'refreshtoken';  
    private static String clientId = 'clientid'; 
    private static String clientSecret = 'clientsecret';
    private static String authCode = 'authcode';
    private static String entityId = 'entityid';
    private static String userId = 'userid';
    private static String enterpriseId = 'enterpriseid';
    private static String publicKeyId = 'publicKeyId';
    private static String privateKey = BoxTestJsonResponseFactory.AUTH_PRIVATE_KEY;
    private static String privateKeyPassword = 'privateKeyPassword';
    private static BoxJwtEncryptionPreferences.EncryptionAlgorithm algorithm = BoxJwtEncryptionPreferences.EncryptionAlgorithm.RSA_SHA_256;
	
	private static BoxJwtEncryptionPreferences constructEncryptionPrefs() {
		BoxJwtEncryptionPreferences prefs = new BoxJwtEncryptionPreferences();
		prefs.setEncryptionAlgorithm(algorithm);
		prefs.setPrivateKey(privateKey);
		prefs.setPrivateKeyPassword(privateKeyPassword);
		prefs.setPublicKeyId(publicKeyId);
		return prefs;
	}
        public static testmethod void testParseSyncState() {
   		System.assertEquals(BoxFolder.SyncState.SYNCED, BoxFolder.parseSyncState('synced'));
    	System.assertEquals(BoxFolder.SyncState.NOT_SYNCED, BoxFolder.parseSyncState('not_synced'));
    	System.assertEquals(BoxFolder.SyncState.PARTIALLY_SYNCED, BoxFolder.parseSyncState('partially_synced'));
   	 }
   	 
   	 public static testmethod void testParsePermissions() {
   		System.assertEquals(BoxFolder.Permission.CAN_DOWNLOAD, BoxFolder.parsePermission('can_download'));
   		System.assertEquals(BoxFolder.Permission.CAN_UPLOAD, BoxFolder.parsePermission('can_upload'));
   		System.assertEquals(BoxFolder.Permission.CAN_RENAME, BoxFolder.parsePermission('can_rename'));
   		System.assertEquals(BoxFolder.Permission.CAN_DELETE, BoxFolder.parsePermission('can_delete'));
   		System.assertEquals(BoxFolder.Permission.CAN_SHARE, BoxFolder.parsePermission('can_share'));
   		System.assertEquals(BoxFolder.Permission.CAN_INVITE_COLLABORATOR, BoxFolder.parsePermission('can_invite_collaborator'));
   		System.assertEquals(BoxFolder.Permission.CAN_SET_SHARE_ACCESS, BoxFolder.parsePermission('can_set_share_access'));  	
   	 }
   	 
   	 public static testmethod void testGetPermissionAsString() {
   	  	System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_DOWNLOAD), 'can_download');
   		System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_UPLOAD), 'can_upload');
   		System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_RENAME), 'can_rename');
   		System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_DELETE), 'can_delete');
   		System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_SHARE), 'can_share');
   		System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_INVITE_COLLABORATOR), 'can_invite_collaborator');
   		System.assertEquals(BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_SET_SHARE_ACCESS), 'can_set_share_access');  	
   	
   	 }
    static testmethod void calloutTEstClass(){
        List<id> Parentid=new List<id>();
        id RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Account acc=new account();
        acc.Name='test Account';
        acc.First_Name__c='Test';
        acc.Last_Name__c='Account';
        
        insert acc; 
        
        Web_Form__c wb = new Web_Form__c(name='test 1',Client__c = acc.id);
        insert wb;
        wb.name='test 2';
        update wb;
       
       String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":9,"entries":[{"type":"folder","id":"81273866976","sequence_id":"0","etag":"0","name":"Viewable-ClientDocs"},{"type":"file","id":"484625073666","file_version":{"type":"file_version","id":"513028838466","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd"},"sequence_id":"0","etag":"0","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd","name":"2019 3:44:31 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484640237864","file_version":{"type":"file_version","id":"513043916264","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d"},"sequence_id":"0","etag":"0","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d","name":"2019 4:08:22 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484641397127","file_version":{"type":"file_version","id":"513045260327","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42"},"sequence_id":"0","etag":"0","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42","name":"2019 4:20:11 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484642269212","file_version":{"type":"file_version","id":"513046175612","sha1":"ecf850c16713a532e3ad88faddbb74de67450400"},"sequence_id":"0","etag":"0","sha1":"ecf850c16713a532e3ad88faddbb74de67450400","name":"2019 4:22:44 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484647539143","file_version":{"type":"file_version","id":"513052364743","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466"},"sequence_id":"0","etag":"0","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466","name":"2019 4:29:46 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"485224761411","file_version":{"type":"file_version","id":"513669701811","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33"},"sequence_id":"0","etag":"0","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33","name":"2019.7.2 -   Receipt  0261161 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485234018678","file_version":{"type":"file_version","id":"513678960278","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890"},"sequence_id":"0","etag":"0","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890","name":"2019.7.2 -   Receipt  0261165 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485226499651","file_version":{"type":"file_version","id":"513671783251","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb"},"sequence_id":"0","etag":"0","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb","name":"2019.7.2 -   Receipt  0261166 -   Grey Test, Meredith  Test.pdf"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}],"offset":0,"limit":100}}';
		BoxFolder.Info responseFromJsonString = new BoxFolder.Info(mockResponseBody);
       BoxJwtEncryptionPreferences encryptionPref = constructEncryptionPrefs();
		String authResponse = BoxTestJsonResponseFactory.AUTH_APP_USER_TOKEN;
        Test.setMock(HttpCalloutMock.class, (new BoxTestMockCallout(authResponse, 'OK', 200)));
        Attachment Att =new Attachment ();
        Att.Name='test 1';
        Att.ParentId=wb.id;
        Att.Body=Blob.valueOf('test 1');
        Test.startTest();
        insert att;
        
            Parentid.add(wb.id);
        
        WebFormAttachmentToBox.WebformToboxCallout(Parentid);
        test.stopTest();
    }
    
 
    
}