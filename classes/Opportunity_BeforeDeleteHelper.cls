/*********************************
* Author      : Ifrahim Afzal
* Description : Class is invoked on Before Delete of the Trigger 
* Class       : Opportunity_UpdateHelper
**********************************/
public class Opportunity_BeforeDeleteHelper {
    
  public static Map<String,Account_Deeds_Badges__mdt> metaDataMap = new Map<String,Account_Deeds_Badges__mdt>();
    
    /***********************************
    * Author      : Ifrahim Afzal
    * Description : 
    * Class       : updateClientDeedBadge (Helper Function of the Opportunity_BeforeDeleteHelper)
    ***********************************/
    public static void removeClientBadge(Map<Id,Opportunity> oppMap){
        try{
            Set<Id> sAccountIds = new Set<Id>();
            Account acc;
            List<Account> accList = new List<Account>();
            
            List<Opportunity> oppListAdd = new List<Opportunity>();
            Map<Id,List<Opportunity>> accMap = new Map<Id,List<Opportunity>>();
            
            List<Account_Deeds_Badges__mdt> accBadgeLst = [Select id,ASID__c,Automation_Type__c,Service_Weight__c from Account_Deeds_Badges__mdt limit 50000];
            
            for(Opportunity opp:oppMap.values()){
                sAccountIds.add(opp.AccountId);
            }
            
            for(Opportunity opp : [Select Id, AccountId, Account.BadgeServiceItems__c, Service_Item_List__c, StageName, Name                                 ,Service_Items_Quantities__c 
                                   From Opportunity 
                                   Where AccountId IN: sAccountIds AND StageName='Closed Won' AND Service_Item_List__c!=null AND 
                                   (NOT Id IN :oppMap.keyset())]) 
            {
                oppListAdd = new List<Opportunity>();
                if(accMap.containsKey(opp.AccountId)){
                    oppListAdd = accMap.get(opp.AccountId);
                }
                oppListAdd.add(opp);
                accMap.put(opp.AccountId, oppListAdd);
                
            }
            if(!accMap.isEmpty()){
                Account_RollUpFields.deedPackage(accMap, accBadgeLst);
            }
            
            for(String accId:sAccountIds){
                if(!accMap.containsKey(accId)){
                    acc = new Account(Id=accId);
                    acc.BadgeServiceItems__c = '';
                    acc.Deed_Package_Fulfillment__c = 0;
                    accList.add(acc);
                }
            }
            if(!accList.isEmpty()){
                update accList;
            }
            
        }catch(Exception e){
            System.debug('e'+e.getMessage());
        } 
    } 
}