@isTest(seeAllData=false)
public class CampaignHierarchyBatchTest {
    
    @testSetup 
    static void setup() {
        List<Campaign> camps = new List<Campaign>();
        LIst<Campaign> css=new List<Campaign>();
        set<id> cids=new set<id>();
        for (Integer i=0;i<10;i++) {
            camps.add(new Campaign(name='camp '+i,status='planned',isActive=true,Total_Collected__c=5,Total_Collected_for_Hierarchy__c=10));
        }
        insert camps;
        for(Integer i=0;i<10;i++)
        {
            css.add( new Campaign(name='camp1',status='planned',isActive=true,Total_Collected__c=5,Total_Collected_for_Hierarchy__c=10, ParentID = camps[i].Id));
        }
        insert css;
    }
    static testmethod void test() {        
        Test.startTest();        
        CampaignhierarchyBatch cbb = new CampaignhierarchyBatch();
        Id batchId = Database.executeBatch(cbb);
        Test.stopTest();
    }
}