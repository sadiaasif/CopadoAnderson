/***********************************
* Author : Ifrahim Afzal
* Description : Helper class of Trigger event Before Inser for ASA Object
* Class : ASA_BeforeInsertHelper
***********************************/

public class ASA_BeforeInsertHelper {
    
    public static Map<Id,Account> clientMap = new Map<Id,Account>();
    public static Set<Id> clientSet = new Set<Id>();
    /***********************************
    * Author : Ifrahim Afzal
    * Description : ASA - Logic Holder (Process Builder) migration to APEX
    * 				This method Populate all the required Fields for ASA Object 
    * Method : populateFields
    ***********************************/
    public static void populateFields(List<ASA__C> asaList){
        try{
            String clientId;
            if(!asaList.isEmpty()){
                for(ASA__C asa : asaList){
                    if(asa.Client_Name__c != null){
                    	clientSet.add(asa.Client_Name__c);   
                    }
                }
                if(!clientSet.isEmpty()){
                   	clientMap = new Map<Id, Account>([Select Id,Financial_Analyst__c,First_Name__c, Last_Name__c, Mobile_Number__c, Name from Account Where Id IN : clientSet LIMIT 50000]);
               		
                    for(ASA__C asa : asaList){
                        if(clientMap.containsKey(asa.Client_Name__c)){
                            asa.Financial_Analyst__c = clientMap.get(asa.Client_Name__c).Financial_Analyst__c != NULL ? clientMap.get(asa.Client_Name__c).Financial_Analyst__c : '' ;
                            asa.First_Name__c = clientMap.get(asa.Client_Name__c).First_Name__c != NULL ? clientMap.get(asa.Client_Name__c).First_Name__c : '' ;
                            asa.Last_Name__c = clientMap.get(asa.Client_Name__c).Last_Name__c != NULL ? clientMap.get(asa.Client_Name__c).Last_Name__c : '' ;
                            asa.Mobile_Phone__c = clientMap.get(asa.Client_Name__c).Mobile_Number__c != NULL ? clientMap.get(asa.Client_Name__c).Mobile_Number__c : '' ;
                            asa.Name = clientMap.get(asa.Client_Name__c).Name +'- '+ String.valueOf(Date.TODAY());
                        }
                    }
                }
            }
       }catch(Exception e){
            System.debug('e.getMessage'+e.getLineNumber());
       }
    }
}