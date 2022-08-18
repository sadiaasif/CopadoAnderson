@isTest
public class CampaignBatchTest {
    
     @testSetup 
    static void setup() {
        List<Campaign> camps = new List<Campaign>();
        List<opportunity> opps = new List<opportunity>();
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            camps.add(new Campaign(name='camp '+i, status='planned', isActive=true ,Total_Collected__c=10));
        }
        insert camps;
        // find the account just inserted. add contact for each
        for (Campaign c : [select id from Campaign]) {
            opps.add(new opportunity(Name='first', 	StageName='Qualification',
                CloseDate=Date.today(), CampaignId=c.id));
        }
        insert opps;
    }
    static testmethod void test() {        
        Test.startTest();
        CampaignBatch cb = new CampaignBatch();
        Id batchId = Database.executeBatch(cb);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        //System.assertEquals(10, [select count() from contact where MailingCity = 'New York']);
    }

}