@isTest
public class ContentDocumentSetVisiblityTest {
      public static Account acc =new Account();
    public static  ContentDocumentLink cdl =new ContentDocumentLink(); 
      public static  ContentDocument cd =new ContentDocument(); 
    public static  List<ContentDocument> documents=new  List<ContentDocument>();
@isTest
    public static void SetVisiblityTestMethod(){
   
     
        acc.Name = 'Bob Apples';
        acc.First_Name__c='Bob';
        acc.Last_Name__c='Apples';
           insert acc;
        
ContentVersion contentVersion = new ContentVersion(
  Title = 'Penguins',
  PathOnClient = 'Penguins.jpg',
  VersionData = Blob.valueOf('Test Content'),
  IsMajorVersion = true
);
insert contentVersion;    
documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];

//create ContentDocumentLink  record 
ContentDocumentLink cdl = New ContentDocumentLink();
cdl.LinkedEntityId = acc.id;
cdl.ContentDocumentId = documents[0].Id;
cdl.shareType = 'V';
insert cdl;  
        ContentDocumentLink cdlInserted=[Select id,visibility from ContentDocumentLink where LinkedEntityId=:acc.id limit 1];
        
        System.assertEquals('AllUsers',cdlInserted.visibility , 'Please check!');
    }
}