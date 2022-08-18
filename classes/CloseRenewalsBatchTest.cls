@isTest (seeAllData = false)
public class CloseRenewalsBatchTest {
    @testsetup
    static void setupData(){
        RecordType rt  = [select Id,Name from RecordType where sObjectType='Opportunity' and name = 'Standard Renewal'];
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Sale';
        opp.AccountId = a.Id;
        opp.stageName = 'Qualification';
        opp.closeDate = Date.today().addMonths(-10);
        opp.RecordTypeId = rt.Id;
        insert opp;
    }
    @isTest
    static void testexecute(){
        Test.startTest();
        CloseRenewalsBatchScheduler sh1 = new CloseRenewalsBatchScheduler();
        String sch = '0 0 23 * * ?'; 
        system.schedule('Test Renewal Batch', sch, sh1); 
        Test.stopTest(); 
    }
}