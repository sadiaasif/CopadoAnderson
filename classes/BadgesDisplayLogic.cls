public class BadgesDisplayLogic {
   public class  BadgesDisplayParameter{
        @InvocableVariable(required=true)
        public Id accId;
        @InvocableVariable(required=true)
        public String ServiceItems;
        
    }
@InvocableMethod(label='Check for CAP and Unlimited Nominee and the Max Transaction Date')
     public static void updateExpDateAndServiceListOnAcc(BadgesDisplayParameter[] BadgesDisplayParameters) {
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
          map<id,Account>  UpdateAccountMap=new map<id,Account>();
         map<id,string> BadgesDisplayParametermap=new map<id,string>();
        ID stdrenwalId=Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
        System.debug('Sr--'+stdrenwalId);   
        ID EntityFormID=Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        System.debug('EF--'+EntityFormID);   
         for(BadgesDisplayParameter opp : BadgesDisplayParameters){
           BadgesDisplayParametermap.put(opp.accId,opp.ServiceItems);
         }
    Set<Id> AccountIDinParam = BadgesDisplayParametermap.keySet();
         
        if(BadgesDisplayParametermap.size()>0){
            for(Account a:[select Id,Total_Balance_Due__c,Total_Law_Sale__c,Total_Tax_Sale__c,Total_Law_Sale_Welcome_Call__c,Total_Tax_Sale_Welcome_Call__c,Total_Welcome_call__c,BadgeServiceItems__c
                                                                  from Account
                                                                  where Id IN: AccountIDinParam]){
                                                                                                             
                               oppopltMap.put(a.id,a);                                       
                
            }
            
        

          for( aggregateresult ag : [select AccountId,MAX(First_Transaction__c) ExpDate  from opportunity where AccountId IN: AccountIDinParam and (StageName='Fulfillment/Partial Payment'or StageName='Closed Won')  group by AccountId  ]){
            
  
            ExpDatemap.put((ID)ag.get('AccountId'), Date.valueof(ag.get('ExpDate')));
              
             
         }
            for(Account acc:oppopltMap.values()){
                for(ID eachaccountID:AccountIDinParam){
                    
                
                if(acc.id==eachaccountID){
                  if(ExpDatemap.containskey(eachaccountID)){
                         if(BadgesDisplayParametermap.get(eachaccountID).contains('hasCAP;')){
            acc.CAP_Renewal_Expiration__c = ExpDatemap.get(eachaccountID);
                         }
                         if(BadgesDisplayParametermap.get(eachaccountID).contains('hasUnlimtedNominee;')){
                             acc.Unlimited_Nominee_Transaction_Date__c = ExpDatemap.get(eachaccountID);
                         }
                       
        }
                if(acc.BadgeServiceItems__c!=null && !acc.BadgeServiceItems__c.contains(BadgesDisplayParametermap.get(eachaccountID)) ){
                    acc.BadgeServiceItems__c= acc.BadgeServiceItems__c+BadgesDisplayParametermap.get(eachaccountID);
                }else{
                    if(acc.BadgeServiceItems__c==null || acc.BadgeServiceItems__c==''){
                         acc.BadgeServiceItems__c=BadgesDisplayParametermap.get(eachaccountID);
                    }
                   
                }
              
               UpdateAccountMap.put(acc.id,acc);
                System.debug('BadgeServiceItems__c---'+acc.BadgeServiceItems__c);
                }
            }
        
     /*   for(id iid : accIds){
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
                 
            }*/
                }
        }
      
       
        
         
    
         if(UpdateAccountMap.size()>0){
      update  UpdateAccountMap.values();
        }
        }
}