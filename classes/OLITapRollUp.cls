public class OLITapRollUp {
    
    public static boolean alreadyProcessed = false;
     Public static Integer Processed=0;
  
    
     public static set<id> oppLineitemRollupProcessed = new set<id>();
    

     public static void oppTyeandwelcomecallRollup(set<ID> oppsID){
           Id tapId;
         Id CAPI;
         Id CAPA;
       Boolean ValueChanged=false;
         Integer TotalServiceCount=0;
     
        map<id,Integer> TotalServicemap = new map<id,Integer>();
         Integer tapServiceCount=0;
      List<OpportunityLineItem> OPTL=new List<OpportunityLineItem>();
         List<OpportunityLineItem> agreopli=new List<OpportunityLineItem>();
         Map<id,opportunity> opListtoMap=new  Map<id,opportunity>();
         List<opportunity> opListtoupdate=new List<opportunity>();
         set<Id>  taxAdvantagepackagecount=new Set<ID>();
         set<Id> taxpackagecount=new Set<ID>();
          set<Id> Cappackagecount=new Set<ID>();
           set<Id> taxreplenpackagecount=new Set<ID>();
          set<Id> UnlimitedNominepackagecount=new Set<ID>();
          set<Id> Trusteepackagecount=new Set<ID>();
           set<Id> OpportunityZoneLLccount=new Set<ID>();
         
      aggregateresult[] oppTotalService=[Select Count(id) ServiceSum From OpportunityLineItem where OpportunityId IN:oppsID ];
         TotalServiceCount=Integer.valueof(oppTotalService[0].get('ServiceSum'));
         Map<Id,Product2> products=new Map<Id,Product2>([SELECT Id,Name FROM Product2 WHERE Name IN('Anderson Tax Advantage Program' , 'Corporate Assistance Program, 1 Year, Initial' , 'Corporate Assistance Program Annual Renewal', 'Investor Tax Planning Package' , 'Professional Tax Planning Package', 'Executive Tax Planning Package' , 'Bookkeeping Starter Package - Existing Entity', 'Bookkeeping Starter Package - New Entity', 'Accounting Starter Package' , 'Rollovers as Business Start-Ups','Tax Services Retainer Replenishment','Accounting Starter Package', 'Tax Prep 1120', 'Tax Prep, 1120 S', 'Tax Prep 1065', 'Tax Prep, 1040','Unlimited Nominee','Unlimited Nominee Annual Renewal','Privacy Trust with LLC Trustee','LLC Trustee','Opportunity Zone LLC') ]);
       //   List<Product2> p2=[SELECT Id FROM Product2 WHERE Name = 'Corporate Assistance Program, 1 Year, Initial' or Name = 'Corporate Assistance Program Annual Renewal'];
         
         //List<Product2> p3=[SELECT Id FROM Product2 WHERE Name = 'Investor Tax Planning Package' or Name = 'Professional Tax Planning Package'or Name = 'Executive Tax Planning Package' or Name = 'Bookkeeping Starter Package - Existing Entity' or Name = 'Bookkeeping Starter Package - New Entity' or Name = 'Accounting Starter Package'or  Name = 'Rollovers as Business Start-Ups' ];
        
        if(!products.isEmpty()){
          
            for(Product2 p:products.values()){
                if(p.Name== 'Anderson Tax Advantage Program'){
                     taxAdvantagepackagecount.add( p.id); 
                } 
                if(p.Name== 'Corporate Assistance Program, 1 Year, Initial' || p.Name== 'Corporate Assistance Program Annual Renewal' ){
                      Cappackagecount.add(p.Id);
                }
                       
                       
                 if(p.Name == 'Investor Tax Planning Package' || p.Name == 'Professional Tax Planning Package'|| p.Name == 'Executive Tax Planning Package' || p.Name == 'Bookkeeping Starter Package - Existing Entity' || p.Name == 'Bookkeeping Starter Package - New Entity' || p.Name == 'Accounting Starter Package'||  p.Name == 'Rollovers as Business Start-Ups'){
                 taxpackagecount.add(p.id);
            
            }
                 if(p.Name == 'Tax Services Retainer Replenishment' || p.Name == 'Accounting Starter Package' || p.Name == 'Tax Prep 1120' || p.Name == 'Tax Prep, 1120 S' || p.Name == 'Tax Prep 1065'||  p.Name == 'Tax Prep, 1040'){
                 taxreplenpackagecount.add(p.id);
            
            }
                
                 if(p.Name == 'Unlimited Nominee' || p.Name == 'Unlimited Nominee Annual Renewal'){
                 UnlimitedNominepackagecount.add(p.id);
            
            }
                  if(p.Name == 'Privacy Trust with LLC Trustee' || p.Name == 'LLC Trustee'){
                 Trusteepackagecount.add(p.id);
            
            }
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
             for(opportunity opp:[select Id, Tax_Package_Count__c,hasCAP__c,hasUnlimitedNominee__c,Has_Trustee__c,Tax_Replenishment_Count__c,Total_Law_Sale__c,Total_Tax_Sale__c,Total_Law_Sale_Welcome_Call__c,TAP_Service_Count__c,Total_Tax_Sale_Welcome_Call__c,Account.CreatedDate,Has_Opportunity_Zone_Service__c,(Select id, Product2Id,Type_of_Sale__c,Welcome_Call__c,Opportunity.Account.CreatedDate from OpportunityLineItems Limit 200)
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
                
                  opps.TAP_Service_Count__c=0;
                  opps.Tax_Package_Count__c=0;
                    opps.hasCAP__c=0;
                    opps.Tax_Replenishment_Count__c=0;
                  opps.Total_Law_Sale__c=0;
                 opps.Total_Tax_Sale__c=0;
                  opps.Total_Law_Sale_Welcome_Call__c=0;
                 opps.Total_Tax_Sale_Welcome_Call__c=0;
                  opps.hasUnlimitedNominee__c=0;
                 opps.Has_Trustee__c=0;
                  
                 
                 if(!OPTL.isEmpty()){
                      opps.TAP_Service_Count__c=0;
                  opps.Tax_Package_Count__c=0;
                    opps.hasCAP__c=0;
                    opps.Tax_Replenishment_Count__c=0;
                  opps.Total_Law_Sale__c=0;
                 opps.Total_Tax_Sale__c=0;
                  opps.Total_Law_Sale_Welcome_Call__c=0;
                 opps.Total_Tax_Sale_Welcome_Call__c=0;
                  opps.hasUnlimitedNominee__c=0;
                 opps.Has_Trustee__c=0;
                      opps.Has_Opportunity_Zone_Service__c=0;
                  
                     if(TotalServicemap.containskey(opps.id)){
                         opps.Total_Service_Count__c=TotalServicemap.get(opps.id);
                     }
                   
                     for(OpportunityLineItem ol:OPTL){
                         if(opps.id==ol.OpportunityId){
                              If(ol.Type_of_Sale__c=='LAW'){
                            
                             opps.Total_Law_Sale__c=1;
                             System.debug('Total Law sale--'+opps.Total_Law_Sale__c);
                         } 
                           If(ol.Type_of_Sale__c=='TAX'){
                              
                             opps.Total_Tax_Sale__c=1;
                               System.debug('Total_Tax_Sale__c--'+opps.Total_Tax_Sale__c);
                          } 
                          If(ol.Type_of_Sale__c=='LAW'  && (ol.Opportunity.Account.CreatedDate < Date.today().addDays(-60))){
                             
                              opps.Total_Law_Sale_Welcome_Call__c=1;
                               System.debug('Total_Law_Sale_Welcome_Call__c--'+opps.Total_Law_Sale_Welcome_Call__c);
                          }
                          If(ol.Type_of_Sale__c=='TAX'  && (ol.Opportunity.Account.CreatedDate < Date.today().addDays(-60))){
                             
                              opps.Total_Tax_Sale_Welcome_Call__c=1;
                              System.debug('Total_Tax_Sale_Welcome_Call__c--'+opps.Total_Tax_Sale_Welcome_Call__c);
                         }
                           if(taxAdvantagepackagecount.contains(ol.Product2Id)){
                            System.debug('Reached--');
                              opps.TAP_Service_Count__c=1; 
                         }
                          if(taxpackagecount.contains(ol.Product2Id)){
                            
                               opps.Tax_Package_Count__c=1;
                         }
                           if(Cappackagecount.contains(ol.Product2Id) ){
                             
                                 opps.hasCAP__c=1;
                                
                            }
                          if(taxreplenpackagecount.contains(ol.Product2Id) ){
                           
                                 opps.Tax_Replenishment_Count__c=1;
                                
                          }
                          if(UnlimitedNominepackagecount.contains(ol.Product2Id) ){
                           
                                 opps.hasUnlimitedNominee__c=1;
                                
                          }
                          if(Trusteepackagecount.contains(ol.Product2Id) ){
                           
                                 opps.Has_Trustee__c=1;
                                
                          }
                         opListtoMap.put(opps.id,opps);
                         }
                         if(OpportunityZoneLLccount.contains(ol.Product2Id)){
                             opps.Has_Opportunity_Zone_Service__c=1;
                         }
                         
                        
                         
                     }
                  
                 }
                 else{
                     opps.hasUnlimitedNominee__c=0; 
                     opps.TAP_Service_Count__c=0; 
                       opps.Tax_Package_Count__c=0;
                       opps.hasCAP__c=0;
                   opps.Total_Law_Sale__c=0;
                    opps.Total_Tax_Sale__c=0;
                     opps.Total_Law_Sale_Welcome_Call__c=0;
                     opps.Total_Tax_Sale_Welcome_Call__c=0;
                      opps.Tax_Replenishment_Count__c=0;
                      opps.Has_Trustee__c=0;
                        opps.Has_Opportunity_Zone_Service__c=0;
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