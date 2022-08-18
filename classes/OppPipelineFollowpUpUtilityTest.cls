@isTest(seeAllData=false)
public class OppPipelineFollowpUpUtilityTest {
    @isTest static void testNextBusinessDay(){
        OpportunityPipelineFollowUpUtility.getNextBusinessDay(new List<Date>{Date.today()});
        OpportunityPipelineFollowUpUtility.getNextBusinessDay(Datetime.now().addHours(8));
    }
}