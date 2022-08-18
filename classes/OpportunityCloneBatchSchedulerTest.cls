@isTest
public class OpportunityCloneBatchSchedulerTest {
    @isTest
    public static void testOpportunityCloneBatchScheduler(){
        Test.startTest();
        OpportunityCloneBatchScheduler sh = new OpportunityCloneBatchScheduler();
        String sch = '0 0 23 * * ?';
        system.schedule('Test OpportunityCloneBatchScheduler', sch, sh);
        Test.stopTest();
    }
}