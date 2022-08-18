@isTest
public class SaleDeletecomponentctrlTest {
 Public static opportunity  SaletestData=new opportunity();
     public static Campaign cam =new Campaign();
      public static Account acc =new Account();
    public static  ContentDocumentLink cdl =new ContentDocumentLink(); 
      public static  ContentDocument cd =new ContentDocument(); 
    public static  List<ContentDocument> documents=new  List<ContentDocument>();
    public static Id devoppPlatinumSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
      @testSetup
    public static void createTestData(){
            
         cam = (Campaign)TestDataFactory.createSObject('Campaign', new Map<String,Object>{
  'Name' => 'Existing Client',
  'IsActive' => True
     
}); 
                acc=    (Account)TestDataFactory.createSObject('Account', new Map<String,Object>{
   'First_Name__c'=>new List<String>{'Bobby1','Bobby2','Bobby3'},
  'Last_Name__c' => new List<String>{'Apples1','Apples2','Apples3'},
      'E_Mail__c'=>'abc@123.com',
 'Main_Lead_Source__c'=> 'Existing Client',
      'BadgeServiceItems__c'=>'',
       'PCV_PriorVal__c'=>''
     
}); 
            SaletestData=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'Platinum subscription',
    'ChargentSFA__Charge_Amount__c'=>35.00,
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppPlatinumSalesRecordTypeId,
     
  'Account' =>  acc
     
}); 
        
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
cdl.LinkedEntityId = SaletestData.id;
cdl.ContentDocumentId = documents[0].Id;
cdl.shareType = 'V';
insert cdl;       
    }
    @isTest
    public static void getContenDocumentTitlelTest(){
        test.startTest();
        createTestData();
       Map<string,string> Picklistval= SaleDeletecomponentctrl.getContenDocumentTitle(SaletestData.Id);
        for(string attname:Picklistval.values()){
              System.assertEquals('Penguins',attname , 'Please Check!');
            
        }
    
        
        test.stopTest();
        
    }
        @isTest
    public static void updatedAttachmentNameOnSaleTest(){
        test.startTest();
        createTestData();
      Boolean updatedSale= SaleDeletecomponentctrl.updatedAttachmentNameOnSale(SaletestData.Id,documents[0].title );
      
              System.assertEquals(true,updatedSale , 'Please Check!');
        Opportunity updateopp=[Select id, Attachment_Name__c from Opportunity where id=: SaletestData.Id limit 1];
            System.assertEquals(updateopp.Attachment_Name__c,documents[0].title , 'Please Check!');
            

     String CRON_EXP = '0 0 0 15 3 ? *';
   
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new SaleDeleteAttachmentBatchCall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
    
        
        test.stopTest();
        
    }
}