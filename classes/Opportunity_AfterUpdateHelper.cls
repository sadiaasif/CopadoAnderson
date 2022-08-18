/*********************************
* Author      : Ifrahim Afzal
* Description : Class is invoked on After update of the Trigger 
* Class       : Opportunity_UpdateHelper
**********************************/
public class Opportunity_AfterUpdateHelper {
    
   public static Boolean RECURRSION = false;
    public static Final String CLOSED_WON = 'Closed Won';
    public static Map<Id,List<Opportunity>> badeMap = new Map<Id,List<Opportunity>>();
    public static Map<Id,List<Opportunity>> badeMapRemoval = new Map<Id,List<Opportunity>>(); 
    /***********************************
    * Author 	  : Ifrahim Afzal
    * Description : Method check the criteria on the Record based on which Account Fields need to be Updated
    * 				- ((StageName new value is "CLOSED WON" OR Service Item Changed) AND
    * 				-  (AccountId AND Service Item should not be Null))
    * Method      : updateClientCritiera
    ***********************************/
   public static void updateClientCritiera(List<Opportunity> oppList, Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap){
        try{
            
            if(!RECURRSION){
                RECURRSION = TRUE;
                List<Opportunity> oppListAdd = new List<Opportunity>();
                Set<Id> sAccountIds = new Set<Id>();
                Integer oldServiceItemListLength;
                for (Opportunity opp : oppList) {
                    if(opp.AccountId != NULL && opp.Service_Item_List__c != null &&
                       opp.StageName == CLOSED_WON && (oldMap.get(opp.id).StageName != opp.StageName  || 
                                                    oldMap.get(opp.id).Service_Items_Quantities__c != opp.Service_Items_Quantities__c 
                                                      )){
                           sAccountIds.add(opp.AccountId);
                       }              
                }
                if(!sAccountIds.isEmpty()){
                    for(Opportunity opp:[Select Id,AccountId,Service_Item_List__c
                                         ,Service_Items_Quantities__c 
                                         from Opportunity where AccountId IN :sAccountIds
                                         AND StageName =:CLOSED_WON AND Service_Item_List__c!=null LIMIT 5000])
                    {
                        oppListAdd = new List<Opportunity>();
                        if(badeMap.containsKey(opp.AccountId)){
                            oppListAdd = badeMap.get(opp.AccountId);
                        }
                        oppListAdd.add(opp);
                        badeMap.put(opp.AccountId, oppListAdd);
                    }
                } 
                
                if(!badeMap.isEmpty()){
                    List<Account_Deeds_Badges__mdt> accBadgeLst = [select id,ASID__c,Automation_Type__c,Service_Weight__c from Account_Deeds_Badges__mdt limit 50000];
                    if(!badeMap.isEmpty()){
                        Account_RollUpFields.deedPackage(badeMap,accBadgeLst);
                    } 
                }
            }
           
        }catch(Exception e){
            System.debug('e'+e.getMessage());
        } 
    } 
}