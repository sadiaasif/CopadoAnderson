/***********************************
* Author      : Ifrahim Afzal
* Description : 
* Class       : Account_RollUpFields
***********************************/
public class Account_RollUpFields {
    
    public static Boolean RECURRSION = false;
    public static Final String CLIENT_DEED = 'Client Deed Weight';
    public static Final String CLIENT_BADGE = 'Client Badges';
    public static Final String CLOSED_WON = 'Closed Won';
    
    public static Map<Id,Decimal> accFullFilment = new Map<Id,Decimal>();
    public static Map<Id, Set<String>> asidBadgeSet = new Map<Id,Set<String>>();
    public static Map<String,Account_Deeds_Badges__mdt> metaDataMap = new Map<String,Account_Deeds_Badges__mdt>();
    
    /***********************************
    * Author      : Ifrahim Afzal
    * Description : 
    * Class       : deedPackage (Helper Function is called When the service Item is added)
    ***********************************/
    public static void deedPackage(Map<Id,List<Opportunity>> badgeMap,List<Account_Deeds_Badges__mdt> accBadgeLst){
        try{
            Decimal serviceWeight;
            List<Account> accList = new List<Account>();
            Set<String> ASIDSet= new Set<String>();
            Set<String> exisintSet = new Set<String>();
            Set<String> fulFilmentServices = new Set<String>();
            Map<String,Integer> serviceQuantitiesMap = new Map<String,Integer>();
            Account acc;
            
            if(!accBadgeLst.isEmpty()){
                for(Account_Deeds_Badges__mdt accBadge : accBadgeLst){
                    metaDataMap.put(accBadge.ASID__c, accBadge);
                }
                
                for(Id accId : badgeMap.keySet()) { 		// For Every account get all the Opportunities that are updated ServiceItem 
                    fulfilmentServices = new Set<String>();
                    ASIDSet= new Set<String>();
                    serviceWeight = 0;
                    
                    for(Opportunity opp : badgeMap.get(accId)){
                        serviceQuantitiesMap = prepareServiceQuantitiesMap(opp.Service_Items_Quantities__c);
                        exisintSet = new Set<String>(opp.Service_Item_List__c.split(';'));
                        for(String asid : exisintSet){ 	
                            // Match every ServiceItem against the MetaData for FullFilment 
                            if(metaDataMap.containsKey(asid) && 
                               metaDataMap.get(asid).Service_Weight__c != NULL &&
                               metaDataMap.get(asid).Automation_Type__c == CLIENT_DEED){
                                   if(metaDataMap.get(asid).Service_Weight__c != 1){ 	// For everyOpportunity CLOSED WON  add service weight if exist in metadata 
                                       serviceWeight += (metaDataMap.get(asid).Service_Weight__c * 
                                                         (serviceQuantitiesMap.containsKey(asid)?serviceQuantitiesMap.get(asid):0));    
                                   }else{		// For everyOpportunity  CLOSED WON  subract service weight 
                                       
                                       serviceWeight -= (metaDataMap.get(asid).Service_Weight__c *
                                                         (serviceQuantitiesMap.containsKey(asid)?serviceQuantitiesMap.get(asid):0));   
                                   }
                               }
                            
                            if(metaDataMap.containsKey(asid) && 
                               metaDataMap.get(asid).Automation_Type__c == CLIENT_BADGE){
                                   ASIDSet.add(asid);
                               }
                        }
                    }
                    accFullFilment.put(accId,serviceWeight);      													// Map for Deed FulFilment 
                    if(!ASIDSet.isEmpty()){ 					  							    					// Map for Bage and Stage 
                        asidBadgeSet.put(accId, ASIDSet);   
                    }
                }
                
               		//For every Account differeniate  Accounts need to Updated on Deed -- Badge 
                
                if(!accFullFilment.isEmpty() || !asidBadgeSet.isEmpty()){
                    for(Id accId : badgeMap.keySet()){
                        acc = new Account(Id=accId);
                        acc.Deed_Package_Fulfillment__c = accFullFilment.containsKey(accId)?accFullFilment.get(accId):null;
                        if(asidBadgeSet.containsKey(accId) && asidBadgeSet.get(accId)!=null){
                            acc.BadgeServiceItems__c = String.join(new List<String>(asidBadgeSet.get(accId)), ';')+';';
                        }else{
                            acc.BadgeServiceItems__c = '';
                        }
                        accList.add(acc);
                    }
                }
                if(!accList.isEmpty()){
                    update accList;
                }
            }
        }catch(Exception e){
            System.debug('e.getMessage'+e.getMessage() + 'Number'+e.getLineNumber());
        }
    }
    
    /***********************************
    * Author      : Ifrahim Afzal
    * Description : 
    * Class       : prepareServiceQuantitiesMap (Helper function is called Spilt By Colon)
    ***********************************/
    
    private static Map<String,Integer> prepareServiceQuantitiesMap(String serviceItemsList){
        Map<String,Integer> mapServiceQuantities = new Map<String,Integer>();
        if(serviceItemsList!=null){
            List<String> serviceItem = new List<String>();
            List<String> lstSIQuantities = serviceItemsList.split(';');
            for(String asid:lstSIQuantities){
                serviceItem = asid.split(':');
                if(serviceItem.size() == 2){
                    mapServiceQuantities.put(serviceItem[0],Integer.valueOf(serviceItem[1]));
                }
              
            }
        }
        return mapServiceQuantities;
    }  
    
}