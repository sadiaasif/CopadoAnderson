@isTest
public class BoxFolderTests {
    public static testMethod void testMoveWithRename() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"New Folder Name!","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":1,"entries":[{"type":"file","id":"5000948880","sequence_id":"3","etag":"3","sha1":"134b65991ed521fcfe4724b7d814ab8ded5185dc","name":"tigers.jpeg"}],"offset":0,"limit":100}, "tags":["super", "happy"]}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'OK', 200)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folderToMove = new BoxFolder(api, '11446498');
        BoxFolder destination = new BoxFolder(api, '0');

        Test.startTest();
        BoxFolder.Info movedFolderInfo = (BoxFolder.Info) folderToMove.move(
            destination,
            'New Folder Name!'
        );
        BoxFolder.Info newParent = new BoxFolder.Info(
            movedFolderInfo.getValue('parent')
        );
        Test.stopTest();

        System.assertEquals(
            'New Folder Name!',
            movedFolderInfo.getValue('name')
        );
        System.assertEquals('0', newParent.getValue('id'));
    }

    public static testMethod void testMoveWithoutRename() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Old folder name","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":1,"entries":[{"type":"file","id":"5000948880","sequence_id":"3","etag":"3","sha1":"134b65991ed521fcfe4724b7d814ab8ded5185dc","name":"tigers.jpeg"}],"offset":0,"limit":100}}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'OK', 200)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folderToMove = new BoxFolder(api, '11446498');
        BoxFolder destination = new BoxFolder(api, '0');

        Test.startTest();
        BoxFolder.Info movedFolderInfo = (BoxFolder.Info) folderToMove.move(
            destination
        );
        BoxFolder.Info newParent = new BoxFolder.Info(
            movedFolderInfo.getValue('parent')
        );
        Test.stopTest();

        System.assertEquals('0', newParent.getValue('id'));
    }

    public static testMethod void testCopyWithRename() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":1,"entries":[{"type":"file","id":"5000948880","sequence_id":"3","etag":"3","sha1":"134b65991ed521fcfe4724b7d814ab8ded5185dc","name":"tigers.jpeg"}],"offset":0,"limit":100}}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'Created', 201)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folderToCopy = new BoxFolder(api, '11446498');
        BoxFolder destination = new BoxFolder(api, '0');

        Test.startTest();
        BoxFolder.Info copiedFolderInfo = (BoxFolder.Info) folderToCopy.copy(
            destination,
            'Pictures'
        );
        BoxFolder.Info newParent = new BoxFolder.Info(
            copiedFolderInfo.getValue('parent')
        );
        Test.stopTest();

        System.assertEquals('Pictures', copiedFolderInfo.getValue('name'));
        System.assertEquals('0', newParent.getValue('id'));
    }

    public static testMethod void testCopyWithoutRename() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":1,"entries":[{"type":"file","id":"5000948880","sequence_id":"3","etag":"3","sha1":"134b65991ed521fcfe4724b7d814ab8ded5185dc","name":"tigers.jpeg"}],"offset":0,"limit":100}}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'Created', 201)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folderToCopy = new BoxFolder(api, '11446498');
        BoxFolder destination = new BoxFolder(api, '0');

        Test.startTest();
        BoxFolder.Info copiedFolderInfo = (BoxFolder.Info) folderToCopy.copy(
            destination
        );
        BoxFolder.Info newParent = new BoxFolder.Info(
            copiedFolderInfo.getValue('parent')
        );
        Test.stopTest();

        System.assertEquals('0', newParent.getValue('id'));
    }

    public static testMethod void testGetObjectType() {
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folder = new BoxFolder(api, '11446498');
        System.assertEquals('folder', folder.getObjectType());
    }

    public static testMethod void testSetInfo() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":1,"entries":[{"type":"file","id":"5000948880","sequence_id":"3","etag":"3","sha1":"134b65991ed521fcfe4724b7d814ab8ded5185dc","name":"tigers.jpeg"}],"offset":0,"limit":100}}';
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folder = new BoxFolder(api, '11446498');
        BoxFolder.Info subfolderInfo = new BoxFolder.Info(mockResponseBody);
        BoxFolder.Info parentFolderInfo = new BoxFolder.Info(
            subfolderInfo.getValue('parent')
        );
        folder.setInfo(parentFolderInfo);
      
        System.assertEquals('0', folder.getInfo().getValue('id'));
    }
 public static testmethod void getBoxchildren(){
       String mockResponseBody ='{"total_count":9,"entries":[{"type":"folder","id":"81273866976","sequence_id":"0","etag":"0","name":"Viewable-ClientDocs"},{"type":"file","id":"484625073666","file_version":{"type":"file_version","id":"513028838466","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd"},"sequence_id":"0","etag":"0","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd","name":"2019 3:44:31 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484640237864","file_version":{"type":"file_version","id":"513043916264","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d"},"sequence_id":"0","etag":"0","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d","name":"2019 4:08:22 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484641397127","file_version":{"type":"file_version","id":"513045260327","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42"},"sequence_id":"0","etag":"0","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42","name":"2019 4:20:11 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484642269212","file_version":{"type":"file_version","id":"513046175612","sha1":"ecf850c16713a532e3ad88faddbb74de67450400"},"sequence_id":"0","etag":"0","sha1":"ecf850c16713a532e3ad88faddbb74de67450400","name":"2019 4:22:44 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484647539143","file_version":{"type":"file_version","id":"513052364743","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466"},"sequence_id":"0","etag":"0","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466","name":"2019 4:29:46 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"485224761411","file_version":{"type":"file_version","id":"513669701811","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33"},"sequence_id":"0","etag":"0","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33","name":"2019.7.2 -   Receipt  0261161 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485234018678","file_version":{"type":"file_version","id":"513678960278","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890"},"sequence_id":"0","etag":"0","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890","name":"2019.7.2 -   Receipt  0261165 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485226499651","file_version":{"type":"file_version","id":"513671783251","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb"},"sequence_id":"0","etag":"0","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb","name":"2019.7.2 -   Receipt  0261166 -   Grey Test, Meredith  Test.pdf"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}]}';
	BoxFolder.Info responseFromJsonString = new BoxFolder.Info(mockResponseBody);
            Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(mockResponseBody, 'OK', 200));
            BoxApiConnection apitest = new BoxApiConnection('accesstoken');
             BoxFolder folder1 = new BoxFolder(apitest, '11446498');
             BoxFolder.Info responseFromJsonObject = new BoxFolder.Info(responseFromJsonString);
            folder1.setInfo(responseFromJsonObject);
    BoxItem.Info folderinfo = folder1.getFolderInfo();
        BoxItem.Info renamefolderinfo = folder1.rename('Test');
      Document d = new Document(); 
     d.Name = 'my text file'; 
     String myContent = 'aabbcc'; 
     d.Body = Blob.valueOf(myContent); 
     d.ContentType = 'text/plain';
     d.Type = 'txt';
   //  insert d;
     

     //BoxItem.Info uploaddoc = folder1.uploadFile(d, 'Test');
         BoxItem.Info uploadBlob = folder1.uploadFile(Blob.valueOf(myContent), 'test');
  //   BoxItem.Info uploadAttachment = folder1.uploadFile(attachment, 'Test');
     
    folder1.deleteFolder(false);
        list<BoxItem.Info> children = folder1.getChildren();
    }
    
    public static testMethod void testGetRootFolder() {
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder rootFolder = BoxFolder.getRootFolder(api);
        System.assertEquals('0', rootFolder.getId());
    }

    public static testMethod void testCreateFolder() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":0,"entries":[],"offset":0,"limit":100}}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'Created', 201)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder rootFolder = BoxFolder.getRootFolder(api);

        Test.startTest();
        BoxFolder.Info createdFolderInfo = rootFolder.createFolder('Pictures');
        BoxFolder.Info parentFolder = new BoxFolder.Info(
            createdFolderInfo.getValue('parent')
        );
        Test.stopTest();

        System.assertEquals(rootFolder.getId(), parentFolder.getValue('id'));
    }

    public static testMethod void testInfoConstructors() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":0,"entries":[],"offset":0,"limit":100}}';
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        Test.startTest();
        BoxFolder.Info responseFromJsonString = new BoxFolder.Info(
            mockResponseBody
        );
        BoxFolder.Info responseFromNoParams = new BoxFolder.Info();
        BoxFolder.Info responseFromJsonObject = new BoxFolder.Info(
            responseFromJsonString
        );
        Test.stopTest();

        BoxFolder folderFromJsonString = new BoxFolder(api, '11446498');
        folderFromJsonString.setInfo(responseFromJsonString);
        BoxFolder folderFromJsonObject = new BoxFolder(api, '11446498');
        folderFromJsonObject.setInfo(responseFromJsonObject);
        System.assert(folderFromJsonString.equalTo(folderFromJsonObject));
        System.assertEquals(
            responseFromJsonString.getValue('id'),
            responseFromJsonObject.getValue('id')
        );
        System.assert(responseFromNoParams.children.size() == 0);
    }

    public static testMethod void testParseInfo() {
        String mockResponseBody = '{"type":"folder","id":"11446498","sequence_id":"1","etag":"1","name":"Pictures","created_at":"2012-12-12T10:53:43-08:00","modified_at":"2012-12-12T11:15:04-08:00","description":"Some pictures I took","size":629644,"path_collection":{"total_count":1,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"}]},"created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"modified_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"owned_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"shared_link":{"url":"https://www.box.com/s/vspke7y05sb214wjokpk","download_url":null,"vanity_url":null,"is_password_enabled":false,"unshared_at":null,"download_count":0,"preview_count":0,"access":"open","permissions":{"can_download":true,"can_preview":true}},"folder_upload_email":{"access":"open","email":"upload.Picture.k13sdz1@u.box.com"},"parent":{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},"item_status":"active","item_collection":{"total_count":1,"entries":[{"type":"file","id":"5000948880","sequence_id":"3","etag":"3","sha1":"134b65991ed521fcfe4724b7d814ab8ded5185dc","name":"tigers.jpeg"}],"offset":0,"limit":100}}';
        BoxFolder.Info folderInfo = new BoxFolder.Info(mockResponseBody);
        BoxApiConnection api = new BoxApiConnection('accesstoken');

        Test.startTest();
        BoxFolder folder = (BoxFolder) BoxResource.parseInfo(api, folderInfo);
        Test.stopTest();

        System.assertEquals(folderInfo.getValue('id'), folder.getId());
        System.assertEquals(
            folderInfo.getValue('id'),
            folder.getInfo().getValue('id')
        );
        System.assertNotEquals(null, folderInfo.uploadEmail);
        System.assertEquals(
            'upload.Picture.k13sdz1@u.box.com',
            folderinfo.uploadEmail.email
        );
    }

    public static testMethod void testGetApi() {
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folder = BoxFolder.getRootFolder(api);
        Test.startTest();
        BoxApiConnection apiFromFolder = folder.getApi();
        Test.stopTest();

        System.assertEquals(
            api.getAccessToken(),
            apiFromFolder.getAccessToken()
        );
    }

    public static testMethod void testCollaborate() {
        String mockResponseBody = '{"type":"collaboration","id":"791293","created_by":{"type":"user","id":"17738362","name":"sean rose","login":"sean@box.com"},"created_at":"2012-12-12T10:54:37-08:00","modified_at":"2012-12-12T11:30:43-08:00","expires_at":null,"status":"accepted","accessible_by":{"type":"user","id":"18203124","name":"sean","login":"sean+test@box.com"},"role":"editor","acknowledged_at":"2012-12-12T11:30:43-08:00","item":{"type":"folder","id":"11446500","sequence_id":"0","etag":"0","name":"Shared Pictures"}}';
        Test.setMock(
            HttpCalloutMock.class,
            new BoxTestMockCallout(mockResponseBody, 'Created', 201)
        );

        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folder = new BoxFolder(api, '11446500');

        Test.startTest();
        BoxCollaboration.Role collabRole = BoxCollaboration.Role.EDITOR;
        BoxCollaboration.Info newCollab = folder.collaborate(
            'sean+test@box.com',
            collabRole
        );
        Test.stopTest();

        System.assertEquals('791293', newCollab.id);
    }

    public static testMethod void testParseMember() {
        BoxApiConnection api = new BoxApiConnection('accesstoken');
        BoxFolder folder = new BoxFolder(api, '10543463');
        BoxFolder.Info folderInfo = new BoxFolder.Info();

        Test.startTest();
        folderInfo.parseMember('has_collaborations', 'true');
        folderInfo.parseMember('sync_state', 'synced');
        folderInfo.parseMember('permissions', 'can_download');
        folderInfo.parseMember('can_non_owners_invite', 'false');
        Test.stopTest();

        System.assertEquals(true, folderInfo.hasCollaborations);
        System.assertEquals(BoxFolder.SyncState.SYNCED, folderInfo.syncState);
        System.assertEquals(
            BoxFolder.Permission.CAN_DOWNLOAD,
            folderInfo.permissions
        );
        System.assertEquals(false, folderInfo.canNonOwnersInvite);
    }

    public static testMethod void testParseSyncState() {
        System.assertEquals(
            BoxFolder.SyncState.SYNCED,
            BoxFolder.parseSyncState('synced')
        );
        System.assertEquals(
            BoxFolder.SyncState.NOT_SYNCED,
            BoxFolder.parseSyncState('not_synced')
        );
        System.assertEquals(
            BoxFolder.SyncState.PARTIALLY_SYNCED,
            BoxFolder.parseSyncState('partially_synced')
        );
          
    }
    public static testMethod void testgetSyncStateAsString() {
        
            BoxFolder.getSyncStateAsString( BoxFolder.SyncState.SYNCED);
         BoxFolder.getSyncStateAsString( BoxFolder.SyncState.NOT_SYNCED);
                 BoxFolder.getSyncStateAsString( BoxFolder.SyncState.PARTIALLY_SYNCED);
        
        
          
    }

    public static testMethod void testParsePermissions() {
        System.assertEquals(
            BoxFolder.Permission.CAN_DOWNLOAD,
            BoxFolder.parsePermission('can_download')
        );
        System.assertEquals(
            BoxFolder.Permission.CAN_UPLOAD,
            BoxFolder.parsePermission('can_upload')
        );
        System.assertEquals(
            BoxFolder.Permission.CAN_RENAME,
            BoxFolder.parsePermission('can_rename')
        );
        System.assertEquals(
            BoxFolder.Permission.CAN_DELETE,
            BoxFolder.parsePermission('can_delete')
        );
        System.assertEquals(
            BoxFolder.Permission.CAN_SHARE,
            BoxFolder.parsePermission('can_share')
        );
        System.assertEquals(
            BoxFolder.Permission.CAN_INVITE_COLLABORATOR,
            BoxFolder.parsePermission('can_invite_collaborator')
        );
        System.assertEquals(
            BoxFolder.Permission.CAN_SET_SHARE_ACCESS,
            BoxFolder.parsePermission('can_set_share_access')
        );
    }

    public static testMethod void testGetPermissionAsString() {
        System.assertEquals(
            BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_DOWNLOAD),
            'can_download'
        );
        System.assertEquals(
            BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_UPLOAD),
            'can_upload'
        );
        System.assertEquals(
            BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_RENAME),
            'can_rename'
        );
        System.assertEquals(
            BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_DELETE),
            'can_delete'
        );
        System.assertEquals(
            BoxFolder.getPermissionAsString(BoxFolder.Permission.CAN_SHARE),
            'can_share'
        );
        System.assertEquals(
            BoxFolder.getPermissionAsString(
                BoxFolder.Permission.CAN_INVITE_COLLABORATOR
            ),
            'can_invite_collaborator'
        );
        System.assertEquals(
            BoxFolder.getPermissionAsString(
                BoxFolder.Permission.CAN_SET_SHARE_ACCESS
            ),
            'can_set_share_access'
        );
    }
}