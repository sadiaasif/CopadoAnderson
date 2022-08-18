@isTest(SeeAllData=false)
public class AccountPrimaryContactCountTest {
 static testmethod void test() {        
       
        String CRON_EXP = '0 0 0 15 3 ? *';
        
        // Create your test data
               List<Campaign> CampaignList = new List<Campaign>();
        List<Account> accounts = new List<Account>();
       List<Contact> contacts = new List<Contact>();
       for (Integer i=0;i<5;i++) {
            accounts.add(new Account(name='Apples '+i,Last_Name__c='Bobby '+i,First_Name__c='Apples'+i
                ));
        }
        insert accounts;
       
        for (Account account : [select id from account]) {
            contacts.add(new Contact(firstname='Bobby', 
                lastname='Apples', accountId=account.id,
                                    Account_Roles__c='Primary Contact'));
        }
        insert contacts;
        Test.startTest();
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new AccountPrimaryContactCount());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);

        Test.stopTest();
 }
}