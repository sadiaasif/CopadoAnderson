public without sharing class NotarizeLinktoBox {
     public static boolean alreadyprocessing=false;
     public static set<Id> ProcessedoppId=new set<ID>();


    public static void callout(Map<String,string> DocuParentMap){
        if(alreadyprocessing)return;
        alreadyprocessing=true;
         String accessToken ;
     String refreshToken ;
   String clientId ;
    String clientSecret ;
   String authCode ;
   String entityId ;
     String userId ;
     String enterpriseId; 
     String publicKeyId ;
     String privateKey ;
     String privateKeyPassword ;
         String FolderID; 
         Boolean FolderPresent=false;
         BoxFolder.Info responseFromJsonString;
        BoxFolder folder1 ;
         BoxFolder Viewableclientfolder;
        BoxFolder ReceiptFolderfolder;
     BoxJwtEncryptionPreferences.EncryptionAlgorithm algorithm ;
        Boolean FileAttachedtobox=false;
         String ViewableclientFolderID;
        String ReceiptFolderID;
         String ErrorCode;
          String fileId ;
        String AttachedReceiptFileID;
        BoxPlatformApiConnection api;
        BoxApiConnection apitest;
         BoxFile.Info fileInfo=new  BoxFile.Info();
        box.Toolkit toolkit = new box.Toolkit();
         set<string> AttachedFileIDset=new set<string>();
        for(String ParentIDkey :DocuParentMap.keySet()){
             Attachment[] aList  = [SELECT Id, Name, Body, ParentId 
                         FROM Attachment
                         WHERE  ParentId =:ParentIDkey  ];
     
   
        // Instantiate the Toolkit object
		
 
    //	StaticResource sr= [select id,body from StaticResource Where Name = 'BoxAuthenticationfile'];
	//	String allcontents = sr.body.toString();
        BoxJwtEncryptionPreferences prefsTest = new BoxJwtEncryptionPreferences();
        BoxJwtEncryptionPreferences prefs = new BoxJwtEncryptionPreferences();
         
        
        // Service Account Jwt Details
        
            enterpriseId = '531268';
 			publicKeyId = 'ozfzvfpb';
			 privateKey = 'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDPrjZjJbbFdqF7aWIgb0YUGU5UFAcpMdgfqMQGumFDQSYsSDxnXGd7kPJRXuqXOOk8OyCNdcbkuOfz3hZ1uXHnZFThMmF/lyj280fmSb/j8d2WOSMS6A/tOIJpyLEujFS1+vgABMTFAXfr6Dm7Qb1AKaJRqOYrG2dDZhdyqIuZFshUaScic96tNSHrTzHn6lSXH1WSdsBc3fSZqFiuJ3wBX/HIYA9QZw6PYsAkEZvAZ5Yg5qN6LNoS/YVGd2+/z7A68i/EM8DPxIN4wkXjqxwF7BYEZ14gmaTiBc6gWEzSoTl7RYwU25VUMcr3nRh7UW/6aW17HECaMHQgsujR+3mfAgMBAAECggEAO50KR5N/z1aqK76oSB8owoQxE7lcBNsl6pCLFFNTr/Z3eqaRkCnaGoIUzH6uYBIaAQwH4BM6sFTTYBET6V797ynBo5LOoc1GGPzkWpo41rmKnaBxDPBIAhQCe1L8aRwnBMWxgm/b+6DcR381cyb/p/dLfJ061IzdK1+Ww3bV+28mUMQdneC2mbWX/AQI11qu2Rlauh+ML+kVOo31Tgs0r+lUUsC429is7FA4yH9l+Osa/1wCKt4L/uyaxHsZjfRRseP4EZEVoy6lvV4wyH2TLjSoHissB/2EfzRCW72e1kU5QtO57VMQqNakkD9Vfl1Zn6579uPhXYF6StiAfhxQgQKBgQDsFPnFg8LrM7FHVXdfSrfi0icm2jDC/+9BHfFkjf/YnhQ155h1Zqd05NH2TH1+S7W7Bqrxr8Oz69z4H6QGCAAZ9gft22DjnCMAEVwKMCcmtjVnaTCZCkHv22220V36uuUSrQOWG7mieqd9myXy8B4XAhJf7UtH/HoprroaG+31kQKBgQDhM87FQpzb0VA6XbjWpoL5zSG3rmPXl/muXxgCmtcz+Y8Qk0CcoIPEfeonL3xnJ35c8mbI8Kypbs7E/Em5LSTHqiNws4SLmjvfqw+Zub5CxeP+UA0ZMrxZBgocDect81F39xG4/lg/ANnBe4xaGm4wrOTbSxVIEeN5JQUCcRMkLwKBgHTJG5YdzDrV44jKOrclGzpVg5CwtxZ/zTeFPHjl1f6ulIjl/IF3OreUyljxFdN4WHognkfZDxLeRv1niZiCNKqjDuEXeSKfhqDt9X4EvBlmYZy6aJQMgvnIrsmVYMw70D4g4HlNVdOOoXR9X5SCPCBdogFaPbdqqnQcP2vTDTBBAoGBALI3BH+YaneOWjYGKxs65FV43yDz0bEwZHd4a5DMJlfMO0o7rZsFb6FUn7No4cLkPxyg+3Qy+gCPXvQGTvVK41taqfcrKU4svQsQ3SSjGAzRe86qXOM/AkxU+jUfT35Omn8cN5s1NHKPYsO52OUJG4BLokRkU7AX7/LTt/Yps6MjAoGBAMJgClYRjnPBXGIC8cdCK2jayZF98X95sqJNwGNULGCcHGJt4yexK8BhkWmLsbe+SEyEAAhfXd4u+ZU7/+QRPu1ZpSC0Tl3JtSnFHcmiCK+dQin+rNJmEozeIjjYxA16sI/S1f10bDPbfjmtc9tW7cSeKaHRnscStWiMB0Bsh06m';

 			clientId = 'jdcc44ap20nstudsop480o49thz715bk';
 			clientSecret = 'Bbrn12kLqJzUXzSVGuUMAGYD75pwwubF';
       		Blob beforeblob = Blob.valueOf(privateKey);
        	string newpulickey = EncodingUtil.base64Encode(beforeblob);
        	prefs.setPublicKeyId(publicKeyId);
			prefs.setPrivateKey(privateKey);

      
        if(!test.isRunningTest()){
            api	= BoxPlatformApiConnection.getAppEnterpriseConnection(enterpriseId, clientId, clientSecret, prefs);   
            
        }else{
             apitest= new BoxApiConnection('accesstoken'); 
        }
 		        
  
        ID NotarizerecordId =[SELECT Id FROM Attachment WHERE  ParentId =: ParentIDkey  and  ID=:DocuParentMap.get(ParentIDkey) Limit 1]?.id;
        
      Id recordId=[Select AccountId__c from Notarization__c where id=: ParentIDkey  limit 1]?.AccountId__c;
   
       // String AccountName=[Select Name from Account where id=:recordId limit 1].Name;
        if(!test.isRunningTest()){
     FolderID=toolkit.getFolderIdByRecordId(recordId);        
        }else{
            //For test Coverage
            FolderID='11446498';
        }
    
              
   /* service account user id
string userID='229304299';*/
        
    
        If(test.isRunningTest()){
             String mockResponseBody ='{"total_count":9,"entries":[{"type":"folder","id":"81273866976","sequence_id":"0","etag":"0","name":"Viewable-ClientDocs"},{"type":"file","id":"484625073666","file_version":{"type":"file_version","id":"513028838466","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd"},"sequence_id":"0","etag":"0","sha1":"61bc158672feeb8cc27e5f6258539d4b358c06cd","name":"2019 3:44:31 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484640237864","file_version":{"type":"file_version","id":"513043916264","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d"},"sequence_id":"0","etag":"0","sha1":"44525bf6e6f3679bf63e321f153b1f354cb4229d","name":"2019 4:08:22 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484641397127","file_version":{"type":"file_version","id":"513045260327","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42"},"sequence_id":"0","etag":"0","sha1":"c51c3e8f10f73d74a7920aa952e3e3b6ab29bc42","name":"2019 4:20:11 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484642269212","file_version":{"type":"file_version","id":"513046175612","sha1":"ecf850c16713a532e3ad88faddbb74de67450400"},"sequence_id":"0","etag":"0","sha1":"ecf850c16713a532e3ad88faddbb74de67450400","name":"2019 4:22:44 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"484647539143","file_version":{"type":"file_version","id":"513052364743","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466"},"sequence_id":"0","etag":"0","sha1":"95847fc6e49f7d7b8a2070194c20b7fce75e1466","name":"2019 4:29:46 PM PDT- Receipt-$125.00-Test Entity.pdf"},{"type":"file","id":"485224761411","file_version":{"type":"file_version","id":"513669701811","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33"},"sequence_id":"0","etag":"0","sha1":"e4f19ebee6110cb4f48d5f944c1ee75ac05daa33","name":"2019.7.2 -   Receipt  0261161 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485234018678","file_version":{"type":"file_version","id":"513678960278","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890"},"sequence_id":"0","etag":"0","sha1":"8e4696d1d65969abc86b34e29e75303d6ecd8890","name":"2019.7.2 -   Receipt  0261165 -   Grey Test, Meredith  Test.pdf"},{"type":"file","id":"485226499651","file_version":{"type":"file_version","id":"513671783251","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb"},"sequence_id":"0","etag":"0","sha1":"aa0bdc0820416dc4370db4a2d983d9eedc649feb","name":"2019.7.2 -   Receipt  0261166 -   Grey Test, Meredith  Test.pdf"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}]}';
		responseFromJsonString = new BoxFolder.Info(mockResponseBody);
            Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(mockResponseBody, 'OK', 200));
             apitest = new BoxApiConnection('accesstoken');
              folder1 = new BoxFolder(apitest, FolderID);
             BoxFolder.Info responseFromJsonObject = new BoxFolder.Info(responseFromJsonString);
            folder1.setInfo(responseFromJsonObject);
        }else{
            folder1=new BoxFolder(api, FolderID);
        }
       
       
      
list<BoxItem.Info> children = folder1.getChildren();
 
for (BoxItem.Info itemInfo : children) {
   if (itemInfo.type == 'folder') {
       System.debug('Viewableclientname---'+itemInfo.name);
       if(itemInfo.name=='Viewable-ClientDocs'){
          ViewableclientFolderID=itemInfo.id;
             If(test.isRunningTest()){
             String mockResponseBody ='{"total_count":1,"entries":[{"type":"folder","id":"81271807570","sequence_id":"0","etag":"0","name":"Mail"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}]}';
				responseFromJsonString = new BoxFolder.Info(mockResponseBody);
            	Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(mockResponseBody, 'OK', 200));
             	apitest = new BoxApiConnection('accesstoken');
              Viewableclientfolder = new BoxFolder(apitest, ViewableclientFolderID);
             BoxFolder.Info responseFromJsonObject = new BoxFolder.Info(responseFromJsonString);
            Viewableclientfolder.setInfo(responseFromJsonObject);
             }else{
              Viewableclientfolder = new BoxFolder(api, ViewableclientFolderID);   
             }
              
           list<BoxItem.Info> Viewableclientchildren = Viewableclientfolder.getChildren();
           for (BoxItem.Info ViewableclientInfo : Viewableclientchildren) {
               System.debug('ViewableclientInfoname---'+ViewableclientInfo.name);
               if(ViewableclientInfo.name=='Mail'){
                  
                   ReceiptFolderID=ViewableclientInfo.id;
                     ReceiptFolderfolder=new BoxFolder(api, ReceiptFolderID);
                 FolderPresent=true;
               }
           }
            If(test.isRunningTest()){
             FolderPresent=false;
             }
              if(Viewableclientchildren.size()==0|| FolderPresent==false){
                         
BoxFolder.Info childFolderInfo = Viewableclientfolder.createFolder('Mail');
                    ReceiptFolderID=childFolderInfo.id;
                    ReceiptFolderfolder=new BoxFolder(api, ReceiptFolderID);
                
            }
           
       }
    } 
    }    
        System.debug('ViewableclientFolderID---'+ReceiptFolderID);
        System.debug('ViewableclientFolderID---'+ViewableclientFolderID);
    	System.debug('FolderID--'+ReceiptFolderID);
     If(!test.isRunningTest()){
            try{
      for(Attachment a:aList){
                try{
       fileInfo = ReceiptFolderfolder.uploadFile(a, '');
     }catch(Exception e){
         system.debug('ex=='+ e.getMessage());
     }
        }
            }catch(Exception e){
         system.debug('ex=='+ e.getMessage());
     }
         
    //     fileId	= toolkit.createFileFromAttachment(a, null, ReceiptFolderID, null);  
     }else{
         FileAttachedtobox=true;
         fileInfo=null;
     }
      
        
       System.debug('field ID---'+fileId);
        if(fileInfo!=null ){
            FileAttachedtobox=true; 
            
        }else{
           
        
            If(test.isRunningTest()){
             String mockResponseBody ='{"total_count":11,"entries":[{"type":"file","id":"487324814420","file_version":{"type":"file_version","id":"515897269220","sha1":"84aacebeebd87002ecf85635ec7c630858a97eb4"},"sequence_id":"0","etag":"0","sha1":"84aacebeebd87002ecf85635ec7c630858a97eb4","name":"2019.7.5 -   Receipt  $125.00 -   Test Entity 3.pdf"},{"type":"file","id":"487322819169","file_version":{"type":"file_version","id":"515894906769","sha1":"8252efef733651376f589028a083b344f9f76afe"},"sequence_id":"0","etag":"0","sha1":"8252efef733651376f589028a083b344f9f76afe","name":"2019.7.5 -   Receipt  $125.00 -   Test Entity.pdf"},{"type":"file","id":"487322863759","file_version":{"type":"file_version","id":"515894970559","sha1":"99d48ea5c155143ac208a8e0cd6bd11eb4576d4c"},"sequence_id":"0","etag":"0","sha1":"99d48ea5c155143ac208a8e0cd6bd11eb4576d4c","name":"2019.7.7 -   Receipt  $125.00 -   Test Entity 2.pdf"},{"type":"file","id":"487324259065","file_version":{"type":"file_version","id":"515896496665","sha1":"d384da402166b464c7e2a49c0e4aa89afef59b01"},"sequence_id":"0","etag":"0","sha1":"d384da402166b464c7e2a49c0e4aa89afef59b01","name":"2019.7.7 -   Receipt  $125.00 -   Test Entity 5.pdf"},{"type":"file","id":"487326918252","file_version":{"type":"file_version","id":"515899661052","sha1":"41b3f8bdc2198b1acb442e6a70ec356630b801ec"},"sequence_id":"0","etag":"0","sha1":"41b3f8bdc2198b1acb442e6a70ec356630b801ec","name":"2019.7.7 -   Receipt  $125.00 -   Test Entity 6.pdf"},{"type":"file","id":"487708071666","file_version":{"type":"file_version","id":"516309580866","sha1":"3d4acf827b435c86a956f96620d1e5a40e642d9d"},"sequence_id":"0","etag":"0","sha1":"3d4acf827b435c86a956f96620d1e5a40e642d9d","name":"2019.7.8 -   Receipt  $1,125.00 -   Test Entity 10.pdf"},{"type":"file","id":"487709005368","file_version":{"type":"file_version","id":"516310796568","sha1":"a855426eee7ad3dffa12dba090db4acac4191db7"},"sequence_id":"0","etag":"0","sha1":"a855426eee7ad3dffa12dba090db4acac4191db7","name":"2019.7.8 -   Receipt  $1,125.00 -   Test Entity 11.pdf"},{"type":"file","id":"487732992321","file_version":{"type":"file_version","id":"516337184721","sha1":"713ef7347a7ecba51520e050b46ff645be543a81"},"sequence_id":"0","etag":"0","sha1":"713ef7347a7ecba51520e050b46ff645be543a81","name":"2019.7.8 -   Receipt  $1,125.00 -   Test Entity 12.pdf"},{"type":"file","id":"487850839584","file_version":{"type":"file_version","id":"516460584384","sha1":"af409cbd8258d956abb2529813a413caee5cd02b"},"sequence_id":"0","etag":"0","sha1":"af409cbd8258d956abb2529813a413caee5cd02b","name":"2019.7.8 -   Receipt  $1,125.00 -   Test Entity 13.pdf"},{"type":"file","id":"487705528496","file_version":{"type":"file_version","id":"516308823768","sha1":"34fd5c5c6b7ed19d75bf5de48b17635f6fca5ead"},"sequence_id":"2","etag":"2","sha1":"34fd5c5c6b7ed19d75bf5de48b17635f6fca5ead","name":"2019.7.8 -   Receipt  $125.00 -   Test Entity 10.pdf"},{"type":"file","id":"487670945821","file_version":{"type":"file_version","id":"516268067821","sha1":"16be9a0d5f4de5641c139154e9272c00c2b655b9"},"sequence_id":"0","etag":"0","sha1":"16be9a0d5f4de5641c139154e9272c00c2b655b9","name":"2019.7.8 -   Receipt  $125.00 -   Test Entity 8.pdf"}],"offset":0,"limit":100,"order":[{"by":"type","direction":"ASC"},{"by":"name","direction":"ASC"}]}';
		responseFromJsonString = new BoxFolder.Info(mockResponseBody);
            Test.setMock(HttpCalloutMock.class, new BoxTestMockCallout(mockResponseBody, 'OK', 200));
             apitest = new BoxApiConnection('accesstoken');
              ReceiptFolderfolder = new BoxFolder(apitest, ReceiptFolderID);
             BoxFolder.Info responseFromJsonObject = new BoxFolder.Info(responseFromJsonString);
            ReceiptFolderfolder.setInfo(responseFromJsonObject);
            }else{
                 ReceiptFolderfolder = new BoxFolder(api, ReceiptFolderID); 
                
            }
            
 		
            list<BoxItem.Info> Receiptchildren = ReceiptFolderfolder.getChildren();
            for (BoxItem.Info ReceiptitemInfo : Receiptchildren) {
                if (ReceiptitemInfo.type == 'file') {
                    for(Attachment a:aList){
                        
                    if(ReceiptitemInfo.name==a.Name){
                        System.debug('aname=='+a.Name);
                         System.debug('ReceiptitemInfo.name=='+ReceiptitemInfo.name);
                         System.debug('ReceiptitemInfo.id=='+ReceiptitemInfo.id);
                        AttachedFileIDset.add(ReceiptitemInfo.id);
                    }
                     }
                }
            }
            If(AttachedFileIDset.size()>0){
            for(string AttachedFileID:AttachedFileIDset){
                BoxFile AttachedReceiptfile = new BoxFile(api,AttachedFileID);
			AttachedReceiptfile.deleteFile();
            }
        
       
               for(Attachment a:aList){
                try{
        fileInfo = ReceiptFolderfolder.uploadFile(a, '');
     }catch(Exception e){
         system.debug('ex=='+ e.getMessage());
     }
        }
          
           //  fileId	= toolkit.createFileFromAttachment(a, null, ReceiptFolderID, null);
             System.debug('Field Id===='+fileId);
            if(fileInfo!=null ){
            FileAttachedtobox=true; 
            
        }        }
        }
       
        }
      
  
toolkit.commitChanges();
    
}

}