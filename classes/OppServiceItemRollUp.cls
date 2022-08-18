public class OppServiceItemRollUp {
    
    public static boolean alreadyProcessed = false;
    Public static Integer Processed=0;
    
    
    public static set<id> oppLineitemRollupProcessed = new set<id>();
    
    
    public static void oppTyeandwelcomecallRollup(set<ID> oppsID){
        
        
        Integer TotalServiceCount=0;
        
        map<id,Integer> TotalServicemap = new map<id,Integer>();
        
        List<OpportunityLineItem> OPTL=new List<OpportunityLineItem>();
        List<OpportunityLineItem> agreopli=new List<OpportunityLineItem>();
        Map<id,opportunity> opListtoMap=new  Map<id,opportunity>();
        List<opportunity> opListtoupdate=new List<opportunity>();
        
        set<Id> OpportunityZoneLLccount=new Set<ID>();
        String OlUniqueNumber='';
        
        aggregateresult[] oppTotalService=[Select Count(id) ServiceSum From OpportunityLineItem where OpportunityId IN:oppsID ];
        TotalServiceCount=Integer.valueof(oppTotalService[0].get('ServiceSum'));
        Map<Id,Product2> products=new Map<Id,Product2>([SELECT Id,Name FROM Product2 WHERE Name IN('Opportunity Zone LLC') ]);
        
        if(!products.isEmpty()){
            
            for(Product2 p:products.values()){
                
                if(p.Name == 'Opportunity Zone LLC'){
                    OpportunityZoneLLccount.add(p.id);
                }
            }
        }
        
        
        map<opportunity,list<OpportunityLineItem>>  oppopltMap=new map<opportunity,list<OpportunityLineItem>>();
        for( aggregateresult ag : [Select OpportunityId,Count(id) ServiceSum From OpportunityLineItem where OpportunityId IN:oppsID group by OpportunityId ]){
            
            TotalServicemap.put((ID)ag.get('OpportunityId'), Integer.valueof(ag.get('ServiceSum')));
            
            
        }
        if(oppsID.size()>0){
            for(opportunity opp:[select Id,Service_Items_Quantities__c, Account.CreatedDate,Has_Opportunity_Zone_Service__c,Service_Item_List__c,(Select id, Product2Id,ASID__c,Type_of_Sale__c,Welcome_Call__c,Opportunity.Account.CreatedDate,Quantity from OpportunityLineItems Limit 200)
                                 from opportunity
                                 where Id in :oppsID]){
                                     for(opportunityLineItem ol:opp.OpportunityLineItems){
                                         agreopli.add(ol);
                                     }
                                     oppopltMap.put(opp,agreopli);
                                     
                                 }
        } 
        if(!oppopltMap.isEmpty()){
            for(opportunity opps:oppopltMap.keyset()){
                
                OPTL=oppopltMap.get(opps);    
                
                
                opps.Service_Item_List__c='';
                
                if(!OPTL.isEmpty()){
                    
                    opps.Has_Opportunity_Zone_Service__c=0;
                    opps.Service_Item_List__c='';
                    opps.Service_Items_Quantities__c ='';
                    if(TotalServicemap.containskey(opps.id)){
                        opps.Total_Service_Count__c=TotalServicemap.get(opps.id);
                    }
                    OlUniqueNumber='';
                    for(OpportunityLineItem ol:OPTL){
                        
                        
                        if(opps.id==ol.OpportunityId){
                            OlUniqueNumber=ol.ASID__c+';';
                            opps.Service_Item_List__c=opps.Service_Item_List__c+OlUniqueNumber;
                            opps.Service_Items_Quantities__c += (ol.ASID__c+':' + ol.Quantity + ';');
                            if(OpportunityZoneLLccount.contains(ol.Product2Id)){
                                opps.Has_Opportunity_Zone_Service__c=1;
                            }
                            opListtoMap.put(opps.id,opps);
                        }
                        
                        
                        
                        
                    }
                }
                else{
                    
                    opps.Has_Opportunity_Zone_Service__c=0;
                    opps.Service_Item_List__c='';
                     opps.Service_Items_Quantities__c = '';
                    opListtoMap.put(opps.id,opps);
                }
                
                
            }
        }
        if(opListtoMap.size()>0){
            Processed=Processed+1;
            update opListtoMap.values();
        }
        
        
    }
    
    
}