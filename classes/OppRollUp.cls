public class OppRollUp {
    public static set<Id> ProcessedoppRollupId=new set<ID>();
    Public static Integer Processed=0;
    Public static boolean rollupprocessing=false;
    public OppRollUp(){
        
    }
    
   /* public void QRPCount(){
       
        Id QRP      = '01tU00000035gVE';
        Id State    = '012U0000000DhZQ';
        Id Standard = '012U0000000DhZz';
    
    for (Opportunity opp : (List<Opportunity>)Trigger.new) {
       
        if(opp.RecordTypeId != State && opp.RecordTypeId != Standard) {
        
        // Count QRP service items
        Integer OLI = [SELECT Count() 
                       FROM OpportunityLineItem 
                       WHERE OpportunityId = :Opp.Id
                       AND Product2Id = :QRP];
        
     	// Update QRP count field
     	
        opp.QRP_Count__c = OLI;
            
        }
    }
      

}*/ 
    public static void BalancedueRollup(set<ID> oppaccID){
       if(rollupprocessing == true) return;
        rollupprocessing = true;
      
          map<id,double> amtmap = new map<id,double>();
        map<id,double> capmap = new map<id,double>();
        map<id,double> TLSmap = new map<id,double>();
        map<id,double> TTSmap = new map<id,double>();
        map<id,double> TTWCmap = new map<id,double>();
          map<id,double> TLWCmap = new map<id,double>();
         map<id,Date> ExpDatemap = new map<id,Date>();
    
        
      
          map<id,Account>  oppopltMap=new map<id,Account>();
        ID stdrenwalId=Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
        System.debug('Sr--'+stdrenwalId);   
        ID EntityFormID=Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        System.debug('EF--'+EntityFormID);   
       
        if(oppaccID.size()>0){
            for(Account a:[select Id,Total_Balance_Due__c,Total_Law_Sale__c,Total_Tax_Sale__c,Total_Law_Sale_Welcome_Call__c,Total_Tax_Sale_Welcome_Call__c,Total_Welcome_call__c
                                                                  from Account
                                                                  where Id in :oppaccID]){
                                                                                                             
                               oppopltMap.put(a.id,a);                                       
                
            }
            
        
         for( aggregateresult ag : [select AccountId, SUM(ChargentSFA__Balance_Due__c) BAL,SUM(Total_Law_Sale__c) TLS,SUM(Total_Tax_Sale__c) TTS,SUM(Total_Tax_Sale_Welcome_Call__c) TTWC,SUM(Total_Law_Sale_Welcome_Call__c) TLWC from opportunity where AccountId IN:oppaccID group by AccountId ]){
                           amtmap.put((ID)ag.get('AccountId'), double.valueof(ag.get('BAL')));
             
             TTSmap.put((ID)ag.get('AccountId'), double.valueof(ag.get('TTS')));
             TLSmap.put((ID)ag.get('AccountId'), double.valueof(ag.get('TLS')));
             TTWCmap.put((ID)ag.get('AccountId'), double.valueof(ag.get('TTWC')));
             TLWCmap.put((ID)ag.get('AccountId'), double.valueof(ag.get('TLWC')));
             
         }
          for( aggregateresult ag2 : [select AccountId, SUM(hasCAP__c) CAP,MAX(First_Transaction__c) ExpDate  from opportunity where AccountId IN:oppaccID and (StageName='Fulfillment/Partial Payment'or StageName='Closed Won') and (RecordTypeId=:stdrenwalId or RecordTypeId=:EntityFormID) and hasCAP__c>0  group by AccountId  ]){
                          
             capmap.put((ID)ag2.get('AccountId'), double.valueof(ag2.get('CAP')));
            ExpDatemap.put((ID)ag2.get('AccountId'), Date.valueof(ag2.get('ExpDate')));
             
         }
         
        
        for(id iid : oppaccID){
            for(Account acc:oppopltMap.values()){
                if(iid==acc.id){
                      if(amtmap.containskey(iid)){
            acc.Total_Balance_Due__c = amtmap.get(iid);
        }else{
            acc.Total_Balance_Due__c = 0;
        } 
                     if(capmap.containskey(iid)){
                         Double hascapval=capmap.get(iid);
                         if(hascapval>0){
                              acc.hasCAP__c = 1;
                         }
            
        }else{
            acc.hasCAP__c = 0;
        } 
                     if(ExpDatemap.containskey(iid)){
            acc.CAP_Renewal_Expiration__c = ExpDatemap.get(iid);
        }
                     if(TTSmap.containskey(iid)){
            acc.Total_Tax_Sale__c = TTSmap.get(iid);
        }else{
            acc.Total_Tax_Sale__c = 0;
        } 
                     if(TLSmap.containskey(iid)){
            acc.Total_Law_Sale__c = TLSmap.get(iid);
        }else{
            acc.Total_Law_Sale__c = 0;
        } 
                    
                     if(TLWCmap.containskey(iid)){
            acc.Total_Law_Sale_Welcome_Call__c = TLWCmap.get(iid);
        }else{
            acc.Total_Law_Sale_Welcome_Call__c = 0;
        } 
                      
                     if(TTWCmap.containskey(iid)){
            acc.Total_Tax_Sale_Welcome_Call__c = TTWCmap.get(iid);
        }else{
            acc.Total_Tax_Sale_Welcome_Call__c = 0;
        } 
                  
                }
                 
            }
        }
      
        if(oppopltMap.size()>0){
			update  oppopltMap.values();
        }
        
        
        }
    }
        
    }