public class HasCapMaxExpirationDate {
 @InvocableMethod(label='Check for CAP and Unlimited Nominee and the Max Transaction Date')
     public static void updateExpirationDate(List<ID> accIds) {
    List<Date> ExpirationDate = new List<Date>();
       
          map<id,double> amtmap = new map<id,double>();
        map<id,double> capmap = new map<id,double>();
           map<id,double> Nomineemap = new map<id,double>();
           map<id,double> trusteeemap = new map<id,double>();
        map<id,double> TLSmap = new map<id,double>();
        map<id,double> TTSmap = new map<id,double>();
        map<id,double> TTWCmap = new map<id,double>();
          map<id,double> TLWCmap = new map<id,double>();
         map<id,Date> ExpDatemap = new map<id,Date>();
     Double hascapval=0;
          Double hasnomineeval=0;
          Double hastrusteeval=0;
        
      
          map<id,Account>  oppopltMap=new map<id,Account>();
        ID stdrenwalId=Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
        System.debug('Sr--'+stdrenwalId);   
        ID EntityFormID=Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        System.debug('EF--'+EntityFormID);   
       
        if(accIds.size()>0){
            for(Account a:[select Id,Total_Balance_Due__c,Total_Law_Sale__c,Total_Tax_Sale__c,Total_Law_Sale_Welcome_Call__c,Total_Tax_Sale_Welcome_Call__c,Total_Welcome_call__c
                                                                  from Account
                                                                  where Id in :accIds]){
                                                                                                             
                               oppopltMap.put(a.id,a);                                       
                
            }
            
        

          for( aggregateresult ag : [select AccountId, SUM(hasCAP__c) CAP,SUM(hasUnlimitedNominee__c) Nominee,MAX(First_Transaction__c) ExpDate,SUM(Has_Trustee__c) hastrustee  from opportunity where AccountId IN:accIds and (StageName='Fulfillment/Partial Payment'or StageName='Closed Won') and (RecordTypeId=:stdrenwalId or RecordTypeId=:EntityFormID) and( hasCAP__c>0 or hasUnlimitedNominee__c>0 or Has_Trustee__c>0)   group by AccountId  ]){
            
  Nomineemap.put((ID)ag.get('AccountId'), double.valueof(ag.get('Nominee'))); 
              trusteeemap.put((ID)ag.get('AccountId'), double.valueof(ag.get('hastrustee')));
             capmap.put((ID)ag.get('AccountId'), double.valueof(ag.get('CAP')));
            ExpDatemap.put((ID)ag.get('AccountId'), Date.valueof(ag.get('ExpDate')));
              
             
         }
         
        
        for(id iid : accIds){
            for(Account acc:oppopltMap.values()){
               
                     if(capmap.containskey(iid)){
                          hascapval=capmap.get(iid);
                         if(hascapval>0){
                              acc.hasCAP__c = 1;
                         }
            
        }else{
            acc.hasCAP__c = 0;
        } 
                                     if(Nomineemap.containskey(iid)){
                          hasnomineeval=Nomineemap.get(iid);
                         if(hasnomineeval>0){
                              acc.hasUnlimitedNominee__c = 1;
                         }
            
        }else{
            acc.hasUnlimitedNominee__c = 0;
        }  
                     if(ExpDatemap.containskey(iid)){
                         if(hascapval>0){
            acc.CAP_Renewal_Expiration__c = ExpDatemap.get(iid);
                         }
                         if(hasnomineeval>0){
                             acc.Unlimited_Nominee_Transaction_Date__c = ExpDatemap.get(iid);
                         }
        }
                if(trusteeemap.containskey(iid)){
                    hastrusteeval=trusteeemap.get(iid);
                    if(hastrusteeval>0){
                              acc.Has_Trustee__c = 1;
                         }
                }
                 
                  
                }
                 
            }
        }
      
        if(oppopltMap.size()>0){
      update  oppopltMap.values();
        }
        
        
        }
    
}