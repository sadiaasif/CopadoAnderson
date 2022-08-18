public class DeleteAccountBadgeService {
     
    public static boolean alreadyProcessed = false;
    Public static Integer Processed=0;
  
    
    public static set<id> DeleteoppLineitemRollupProcessed = new set<id>();
    public static void deleteAccountBadgeservice(set<ID> oppsID){

        List<Opportunity> OPList=new List<Opportunity>();
        List<id> oppsAccID=new List<id>();

        Integer hascap=0;
        Integer hasTrustee=0;
        Integer hasUnlimitedNominee=0;

    for(Opportunity o:[select AccountID from opportunity where id IN:oppsID]){
            oppsAccID.add(o.AccountId); }
        
        map<Account,list<opportunity>>  AccountoppMap=new map<Account,list<opportunity>>();
        map<id,account>  updateAccountMap=new map<id,account>();

        if(oppsAccID.size()>0){
                
            for(Account acc:[
                select Id,Total_Balance_Due__c,Total_Law_Sale__c,Total_Tax_Sale__c,Total_Law_Sale_Welcome_Call__c,Total_Tax_Sale_Welcome_Call__c,Total_Welcome_call__c,
                BadgeServiceItems__c,(Select id,Service_Item_List__c,AccountID from opportunities limit 100) 
                from Account                                                                   
                where Id in :oppsAccID]){
                                                                        
                AccountoppMap.put(acc,acc.opportunities);
                }
            }   
        
        if(AccountoppMap.size()>0){
        Map<id,Integer> hascapmap=new map<id,Integer>();
        Map<id,Integer> hastrusteemap=new map<id,Integer>();
        Map<id,Integer> hasnomineemap=new map<id,Integer>();
            
            for(Account a:AccountoppMap.keyset()){
                OPList=AccountoppMap.get(a);
                if(a.BadgeServiceItems__c==null){a.BadgeServiceItems__c='Empty';}
                    
                for(opportunity opp: OPList){
                    if(opp.Service_Item_List__c==null){opp.Service_Item_List__c='Empty';}
                    
                    if(a.id==opp.AccountID){
                        if(hascap==0 && ( opp.Service_Item_List__c.contains('A00396')||opp.Service_Item_List__c.contains('A00395') ) ){ hascap=1; }
                        if(hasUnlimitedNominee==0 && (opp.Service_Item_List__c.contains('A00399')||opp.Service_Item_List__c.contains('A00398') ) ){ hasUnlimitedNominee=1; }
                        if(hasTrustee==0 && ( opp.Service_Item_List__c.contains('A00407')||opp.Service_Item_List__c.contains('A00415') ) ){ hasTrustee=1; }
                    }                             
                }
                
            if(hascap==0){                 
                a.BadgeServiceItems__c =    a.BadgeServiceItems__c.remove('hasCAP;');
                System.debug('BadgeServiceItems__cCAp=='+ a.BadgeServiceItems__c);
            }
            if(hasUnlimitedNominee==0){
                a.BadgeServiceItems__c =  a.BadgeServiceItems__c.remove('hasUnlimtedNominee;');
                System.debug('BadgeServiceItems__cNom=='+ a.BadgeServiceItems__c);
            }
            if(hasTrustee==0){
                a.BadgeServiceItems__c =  a.BadgeServiceItems__c.remove('hasTrustee;');
                System.debug('BadgeServiceItems__cTrus=='+ a.BadgeServiceItems__c);
            }
                
                
            updateAccountMap.put(a.id,a);
            
            System.debug('BadgeServiceItems__c=='+ a.BadgeServiceItems__c);  
            System.debug('hasCap=='+ hasCap);
            System.debug('hasUnlimitedNominee=='+ hasUnlimitedNominee);
            System.debug('hasTrustee=='+ hasTrustee);
                 
                 
            }
            
        }
    if(updateAccountMap.size()>0){
    update    updateAccountMap.values();         
        }
            
    }
}