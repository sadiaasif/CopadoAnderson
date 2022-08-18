@isTest
public class DeleteAccountBadgeServiceTest {

    @isTest
    public static void TestServiceItemDelete(){
    TestDatafactoryBulk.createTestData();
        
        
    System.debug('TestDatafactoryBulk.oppLineItemList---'+TestDatafactoryBulk.oppLineItemList.size());
    
    string productId;
    id opportunityID;
    for(OpportunityLineItem oPLI:[Select id,ASID__c,OpportunityId from OpportunityLineItem where id=: TestDatafactoryBulk.oppLineItemList[0].id]){
        System.Debug( 'ASID 1='+TestDatafactoryBulk.oppLineItemList[0].ASID__c );
        SYstem.Debug( 'ASID 2='+TestDatafactoryBulk.oppLineItemList[1].ASID__c );
        productId=oPLI.ASID__c;
        opportunityID=oPLI.OpportunityId;
        break;
    }
    Test.startTest();

        OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
        DeleteAccountBadgeService.DeleteoppLineitemRollupProcessed.clear();
             	      
        delete TestDatafactoryBulk.oppLineItemList[0];
        
        Opportunity opp=[select id,Service_Item_List__c,stageName,Amount,AccountId,First_Transaction__c from opportunity where id=: opportunityID limit 1];
                    
        String oppserviceitem=opp.Service_Item_List__c;
        
    	System.debug('productId==='+productId);
    	System.debug('opp.Service_Item_List__c==='+opp.Service_Item_List__c);
  

        Test.stopTest();
    }  
}