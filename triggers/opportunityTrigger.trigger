trigger opportunityTrigger on Opportunity (before insert, after insert, before update, after update, before delete) {
    Id PlatinumRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
    Id InfinityRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Infinity Subscription').getRecordTypeId();
    List<String> ASIDs = new List<String>();
    List<id> oppid=new List<id>();
    List<Digital_Course__mdt> digitalList = [select id, ASID__c from Digital_Course__mdt limit 50000];
    List<Infinity_Subscription_Product__mdt> infinityList = [select id, ASID__c,Infinity_Membership__c from Infinity_Subscription_Product__mdt limit 50000];
            
    
    for(Digital_Course__mdt dg : digitalList){
        ASIDs.add(dg.ASID__c);
    }
    for(Infinity_Subscription_Product__mdt idt : infinityList){
        ASIDs.add(idt.ASID__c);
    }
    Switch on trigger.OperationType {
        
        when BEFORE_INSERT{
            //pass
        }
        
        when AFTER_INSERT{
            if(!DigitalProductsSaleWPuserCreation.alreadyProcessed){
                for (opportunity opp : trigger.new) {
                    if(opp.stageName == 'Closed Won' && opp.RecordTypeId == PlatinumRecordTypeId){
                    //    PlatinumSale.prepareCallout(opp.AccountId, opp.Id);
                    WordpressUserCreationUtility.createPlatinumUser(opp);
                    }
                    else{
                        for(String asid : ASIDs){
                            If(opp.stageName == 'Closed Won' && (!string.isBlank(opp.Service_Item_List__c)) && opp.Service_Item_List__c.contains(asid + ';') && opp.Infinity_Sale_Dataload__c==false){ 
                                System.debug('DigitalProductsSaleWPuserCreation.alreadyProcessed==='+DigitalProductsSaleWPuserCreation.alreadyProcessed);
                               // DigitalProductsSaleWPuserCreation.prepareCalloutfromTrigger(opp.id, infinityList, digitalList);
                               WordpressUserCreationUtility.createServiceUser(opp);
                                break;
                            }      
                        }
                    }  
                }
            }
        }
        when BEFORE_UPDATE {
            Opportunity_BeforeUpdateHelper.updateDateOfNextFollowUp(Trigger.New,Trigger.oldMap);
        }
        
        when AFTER_UPDATE {
            if(!DigitalProductsSaleWPuserCreation.alreadyProcessed){
                for (opportunity opp : trigger.new) {
                    for(String asid : ASIDs){
                        if( Trigger.oldmap.get(opp.id).stageName != Trigger.newmap.get(opp.id).stageName || Trigger.oldmap.get(opp.id).Service_Item_List__c != Trigger.newmap.get(opp.id).Service_Item_List__c){
                            If(opp.stageName == 'Closed Won' && (!string.isBlank(opp.Service_Item_List__c)) && opp.Service_Item_List__c.contains(asid + ';') && opp.Infinity_Sale_Dataload__c==false){ 
                                System.debug('DigitalProductsSaleWPuserCreation.alreadyProcessed==='+DigitalProductsSaleWPuserCreation.alreadyProcessed);
                             //   DigitalProductsSaleWPuserCreation.prepareCalloutfromTrigger(opp.id, infinityList, digitalList);
                               WordpressUserCreationUtility.createServiceUser(opp,infinityList, digitalList);
                                break;
                            } 
                        }
                        
                    }
                }
                    
                Opportunity_AfterUpdateHelper.updateClientCritiera(Trigger.new,Trigger.oldMap,Trigger.newMap);               
            }
        }
    }
    
    
    
    If((Trigger.isDelete && Trigger.isBefore)) {
           Opportunity_BeforeDeleteHelper.removeClientBadge(Trigger.oldMap);
    }
}