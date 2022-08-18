@isTest
public class FbSfdatuploadcalloutclsBatchCallTest {
 
static testmethod void testSFFbuploadBatchCallmethod() {        

     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   Test.setMock(HttpCalloutMock.class, new FBcalloutmock());
  List<FacebookoBject__c> fbobList=new List<FacebookoBject__c>();
          for(Integer i=0;i<5;i++)
        {
            FacebookoBject__c  fb=new FacebookoBject__c ();
          fb.Email__c='e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';
             fb.Phone__c='8a557d46fee8cc33276042cd81a04f8c2653bba2f4094a16472be7608923a34e';
            fb.FirstName__c='532eaabd9574880dbf76b9b8cc00832c20a6ec113d682299550d7a6e0f345e25';
            fb.LastName__c='f75e5a8819e2406742a42b3921af597889ef95c589e016fb1aa1019ae0e713d7';
          fb.Amount__c=1750.0;
            fb.Event_Time__c=Datetime.now();
            fb.City__c='e6a35f2e897ce5549d7cae12fb1b043dfdf072097924d77acfc138137ad4b851';
            fb.Country__c='49dca65f362fee401292ed7ada96f96295eab1e589c52e4e66bf4aedda715fdd';
            fb.Service_Items_Name__c='Tax Toolbox';
            fb.Service_Item_Quantity__c='1';
          
            fbobList.add(fb);     
        }
        insert fbobList;
        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new FbSfdatuploadcalloutclsBatchCall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);

        Test.stopTest();
     }
}