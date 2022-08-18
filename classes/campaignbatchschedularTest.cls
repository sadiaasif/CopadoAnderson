@isTest
public class campaignbatchschedularTest {
    @isTest static void executeTest(){
        SchedulableContext sc = null;
        CampaignBatchSchedular cbs = new CampaignBatchSchedular();
        cbs.execute(sc);        
    }  

}