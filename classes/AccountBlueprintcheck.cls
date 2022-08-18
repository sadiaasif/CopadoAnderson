public class AccountBlueprintcheck {
 public static set<Id> ProcessedoppRollupId=new set<ID>();
    public static boolean blueprintCheckprocessing= false;
    public static void UpdateAccountBlueprintcheck(set<ID> accID,set<id> attID){
        
        if(blueprintCheckprocessing) return;
        blueprintCheckprocessing= true;
        Integer Blueprintrollup=0;
        DateTime firstCreatedDate;
        List<Datetime> createdDate=new List<Datetime>();
        Map<id,Attachment> attmap=new Map<id,Attachment>([Select id, CreatedDate from Attachment where parentID IN:accID ]);
        If(!attmap.isEmpty()){
            for(Attachment a:attmap.values()){
                createdDate.add(a.createdDate);
            }
            
        }
      //  List<Account> accLIst=[];
   List<Account> AccToUpdate=new List<Account>();
        Map<id,Account> accountMap=new Map<id,Account>([Select id,Blueprint_Created__c,Blueprint_Rollup_Hidden__c,Blueprint_Created_Date__c from account where id IN : accID]);
        if(!accountMap.isEmpty()){
            if(CreatedDAte.size()>0){
              CreatedDAte.sort();
            }
            firstCreatedDate=CreatedDAte[0];
            Blueprintrollup=0;
             for(Account acc:accountMap.values()){
                 if(accountMap.get(acc.id).Blueprint_Rollup_Hidden__c==0){
               Blueprintrollup=1;
            	acc.Blueprint_Created__c=true;
                 acc.Blueprint_Created_Date__c=firstCreatedDate;
                 acc.Blueprint_Rollup_Hidden__c=Blueprintrollup;
                 AccToUpdate.add(acc);
                 }
             
        }
        }
        if(AccToUpdate.size()>0){
            update AccToUpdate;
            
        }
        
    }
    
}