@isTest
public class TestBizEntitiesUpdate {
 
 public static Account testAccount = new Account();
    public static Contact cont = new Contact ();
    public static User uzr = new User();
    public static Opportunity testOpportunity = new Opportunity();
    Public static Entities__c et =  new Entities__c(); 
       
    public boolean isFirstTime=true;
      @testSetup
    public static void createTestData() {
        Id profileId = [select id from profile where name='Partner Community User'].id;
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.phone='123456782';
        insert testAccount;
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = profileId;
        uzr.IsActive =true;
        insert uzr;        
        testOpportunity.Name= 'Case Opportunity';
        testOpportunity.OwnerId= uzr.id;
        testOpportunity.StageName = 'Qualification';
        testOpportunity.CloseDate = Date.today()+1;
        try{
        insert testOpportunity;
        }catch(Exception e){
            
        }
        //Entities__c et = new Entities__c();
        et.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Limited Liability Company (LLC)' and SobjectType = 'Entities__c'].id;
        et.Name ='Test Dec Entity';
        et.Origin__c = 'Anderson';
        et.Primary_Client__c =testAccount.id;
        System.debug('**** et.Primary_Client__c in test data = '+et.Primary_Client__c);
        //et.Primary_Client__c =test
        et.Organization_State__c = 'Wyoming';
        et.Sale__c = testOpportunity.id;
        et.Status__c = 'Sent To Processing';
        et.Processing_Notes__c='19-11-2019 test1';
        et.X5500_Due_Date__c=date.parse('1/31/2017');
        et.Year_End__c = date.parse('01/01/2018');
        insert et;
}
   @isTest
    static void createEntityMethod() 
    { 
        Entities__c ent = [SELECT Id,Primary_Client__c,Name,RecordTypeId,Account__c,Processing_Notes__c FROM Entities__c]; 
        System.debug('*** ent in test method == '+ent);
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/EntitiesUpdate/';
        request.httpMethod = 'POST';
        String jsonReq = '{"Id":"' + ent.Id + '","Primary_Client__c": "'+ent.Primary_Client__c+'","RecordTypeId ":"'+ent.RecordTypeId+'","Processing_Notes__c ":"'+ent.Processing_Notes__c+'"}';
        request.requestBody = Blob.valueof(jsonReq);
        RestContext.request = request;
        Test.startTest();
        Entities__c returnEntity = BizEntitiesUpdate.UpdateEntities();
        Test.stopTest();
        System.assertNotEquals(null, returnEntity);
        //System.assertEquals('19-11-2019 test1', returnEntity.Processing_Notes__c);
        Account testAcc = [select id from Account];
        System.assertEquals(testAcc.id,ent.Primary_Client__c);
    }
}