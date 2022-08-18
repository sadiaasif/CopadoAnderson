@isTest(SeeAllData=false)
public class BoxUploadBatchClasscallTest {
    static testmethod void BoxUploadBatchClasscallTestmethod() {  
        List<Box_Listener__c> blList=new List<Box_Listener__c>();
     Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c = 'Edward';
        testAccount.Last_Name__c = 'Lee';
        testAccount.Name='Test Account' ;
      
        testAccount.phone='123456782';
        insert testAccount; 
        
        Contact c=new contact();
        c.FirstName='Test';
        C.LastName='Contact';
        c.Account_Roles__c='Primary Contact';
        c.AccountId=testAccount.id;
        insert C;
        
        box__FRUP__c bf= new box__FRUP__c();
        bf.box__Folder_ID__c='125919960440';
        bf.box__Record_ID__c=testAccount.id;
      insert bf;
        for(Integer i=0;i<=30;i++){
           Box_Listener__c  Bl=new Box_Listener__c ();
        Bl.Folder_Name__c='Tax';
        Bl.Parent_Folder_ID__c='125919960440';
      blList.add(Bl);
        }
insert blList;
        
        
     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new BoxUploadBatchClasscall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);

        Test.stopTest();
     }

}