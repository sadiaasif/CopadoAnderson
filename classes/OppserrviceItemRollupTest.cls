@isTest
public class OppserrviceItemRollupTest {
     
    @isTest
    public static void TestServiceItemRolluponOpportunity(){
        TestDatafactoryBulk.createTestData();
           OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
        System.debug('TestDatafactoryBulk.oppLineItemList---'+TestDatafactoryBulk.oppLineItemList.size());
       update TestDatafactoryBulk.oppLineItemList;
        string productId;
        id opportunityID;
        for(OpportunityLineItem oPLI:[Select id,ASID__c,OpportunityId from OpportunityLineItem where id=: TestDatafactoryBulk.oppLineItemList[0].id]){
            productId=oPLI.ASID__c;
            opportunityID=oPLI.OpportunityId;
            break;
        }
        
        opportunity opp=[select id,Service_Item_List__c from opportunity where id=: opportunityID limit 1];
        System.assert(opp.Service_Item_List__c.contains(productId), 'Please check!');
      
    }
        @isTest
     public static void TestServiceItemRolluponAccount(){
        TestDatafactoryBulk.createTestData();
         
           OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
       
      
        string productId;
        id opportunityID;
        for(OpportunityLineItem oPLI:[Select id,ASID__c,OpportunityId from OpportunityLineItem where id=: TestDatafactoryBulk.oppLineItemList[0].id]){
            productId=oPLI.ASID__c;
            opportunityID=oPLI.OpportunityId;
            break;
        }
        
        opportunity opp=[select id,Service_Item_List__c,stageName,Amount,AccountId,First_Transaction__c from opportunity where id=: opportunityID limit 1];
         
        
      
         
          ChargentSFA__Transaction__c Tranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>opp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>opp.Amount,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved'
     
}); 
            opportunity updatedopp=[select id,Service_Item_List__c,stageName,Amount,AccountId,First_Transaction__c from opportunity where id=: opportunityID limit 1];
         // Test.setCreatedDate(Tranaction.id, DateTime.now().addMinutes(-5));
            Test.startTest();
        // now = DateTime.now().addMinutes(5);
          System.debug('AccountID--'+opp.AccountId);
         Account Acc=[Select id,BadgeServiceItems__c from Account where id=:opp.AccountId limit 1];
     
    List<FlowInterview> flowInterviews = [SELECT Id FROM FlowInterview];
        System.assertEquals(1, flowInterviews.size());
           BadgesDisplayLogic.BadgesDisplayParameter bd=new  BadgesDisplayLogic.BadgesDisplayParameter();
         bd.accId=Acc.id;
           bd.ServiceItems=opp.Service_Item_List__c;
          List<BadgesDisplayLogic.BadgesDisplayParameter> Params=new List< BadgesDisplayLogic.BadgesDisplayParameter>();
           Params.add(bd);
        BadgesDisplayLogic.updateExpDateAndServiceListOnAcc(Params);
         Account Updatecheck=[Select id,Unlimited_Nominee_Transaction_Date__c from Account where id=: bd.accId limit 1];
         System.assertEquals(updatedopp.First_Transaction__c,Updatecheck.Unlimited_Nominee_Transaction_Date__c , 'Please check!');
         
           Test.stopTest();
        
    }
      @isTest
     public static void TestServiceItemDelete(){
        TestDatafactoryBulk.createTestData();
         
         
        System.debug('TestDatafactoryBulk.oppLineItemList---'+TestDatafactoryBulk.oppLineItemList.size());
      
        string productId;
        id opportunityID;
        for(OpportunityLineItem oPLI:[Select id,ASID__c,OpportunityId from OpportunityLineItem where id=: TestDatafactoryBulk.oppLineItemList[0].id]){
            productId=oPLI.ASID__c;
            opportunityID=oPLI.OpportunityId;
            break;
        }
        Test.startTest();
     
           OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
         DeleteAccountBadgeService.DeleteoppLineitemRollupProcessed.clear();
         delete TestDatafactoryBulk.oppLineItemList[0];
            opportunity opp=[select id,Service_Item_List__c,stageName,Amount,AccountId,First_Transaction__c from opportunity where id=: opportunityID limit 1];
         
        System.debug('productId==='+productId);
          System.debug('opp.Service_Item_List__c==='+opp.Service_Item_List__c);
        String oppserviceitem=opp.Service_Item_List__c;
        System.assert(oppserviceitem!=productId, 'Please check!');
     
      
    
           Test.stopTest();
        
    }
}