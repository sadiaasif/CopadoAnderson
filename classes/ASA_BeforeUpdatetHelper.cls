/***********************************
* Author : Ifrahim Afzal
* Description : Helper class of Trigger event Before Update for ASA Object
* Class : ASA_BeforeUpdatetHelper
***********************************/
public class ASA_BeforeUpdatetHelper {

    public static Final String  FOLLOW_UP_YEAR= '1 Year Follow-up';
    
    /***********************************
    * Author : Ifrahim Afzal
    * Description : ASA - Logic Holder (Process Builder) migration to APEX
    * 				Populate the Follow up Date if the date is not populated. 
    * 				Stage is changed to FollowUp
    * Method : populateFollowUp
    ***********************************/
    public static void populateFollowUp(List<ASA__C> asaList, Map<Id,ASA__c> oldMap){
        try{
            for(ASA__C asa : asaList){
                if(asa.ASA_Stage__c == FOLLOW_UP_YEAR && asa.ASA_Stage__c != oldMap.get(asa.Id).ASA_Stage__c
                    && asa.Yearly_Follow_up_Date__c == null){
                	asa.Yearly_Follow_up_Date__c = Date.today().addyears(Integer.valueOf(Follow_up_task_owner__c.getValues('Follow Up').year__c));
                        //New follow up date is one year from today
                }
            }
        }catch(Exception e){
             System.debug('e.getMessage'+e.getMessage());
        }
    }
   
}