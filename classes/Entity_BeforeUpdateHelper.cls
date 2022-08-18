/*********************************
* Author      : Ifrahim Afzal
* Description : Class is invoked on Before update of the Trigger 
                (Process Builder - Entity - Logic Holder)
* Class       : Entity_BeforeUpdateHelper
**********************************/
public class Entity_BeforeUpdateHelper{
    
    public static Final String NWRA= 'NWRA';
    public static List<RA_Address__mdt> raAddress = new List<RA_Address__mdt>();
    public static Map<String,List<Entities__c>> state = new Map<String,List<Entities__c>>();
    
    /*********************************
    * Author      : Ifrahim Afzal
    * Description : Class is invoked on Before update of the Trigger 
                    Criteria : 
                             Registered Agent Services == NWRA
                             Organization State != NULL & State Exist in RA 
    * Function    : populateRA
    **********************************/
   
    public static void populateRA(List<Entities__c> newList, Map<Id, Entities__c> oldMap){
        try{
            List<Entities__c> entityList = new List<Entities__c>();
            
            for(Entities__c et : newList){                          /*Criteria for making a callout*/
                if(et.Registered_Agent_Services__c == NWRA && et.Organization_State__c != NULL && et.Organization_State__c != oldMap.get(et.Id).Organization_State__c){
                    entityList = new List<Entities__c>();
                    if(state.containsKey(et.Organization_State__c)){
                        entityList = state.get(et.Organization_State__c);
                    }
                    entityList.add(et);
                    state.put(et.Organization_State__c,entityList);
                }
            }
            
            if(!entityList.isEmpty()){
                raAddress = [Select Id,State__c,Address__c,Agent_Name__c,County__c from RA_Address__mdt Where State__c IN : state.keySet() Limit 5000];
                if(!raAddress.isEmpty()){
                    for(RA_Address__mdt ra : raAddress){
                        if(state.containsKey(ra.State__c)){
                            for(Entities__c et: state.get(ra.State__c)){
                                et.Registered_Agent_Address__c = ra.Address__c;
                                et.Registered_Agent_Name__c = ra.Agent_Name__c;
                                et.Business_County__c = ra.County__c;
                            }
                        }
                    }
                }
            }
            
        }catch(Exception e){
            System.debug('e'+e.getMessage());
        }
    }
    
}