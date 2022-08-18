public with sharing class OpportunityTriggerHandler {
    public static boolean OpportunityTriggerIsRunning = false;
    public static set<id> oppProcessed = new set<id>();
    
    public static void OpportunityRenewal(map<id,Opportunity>  oppIdToOpps){
        
        if(OpportunityTriggerIsRunning == true) return;
        OpportunityTriggerIsRunning = true;
        
        map<id,Opportunity> oppToClone = new map<id,Opportunity>();
        
        List<ChargentBase__Gateway__c> gateway = new List<ChargentBase__Gateway__c>([SELECT Id FROM ChargentBase__Gateway__c WHERE Name = 'LV' LIMIT 1]);
        List<Campaign> campaign = new List<Campaign>([SELECT Id FROM Campaign WHERE Name = 'BCP' LIMIT 1]);
        
        Map<string,List<Default_Renewal_Oppty_Fields__mdt>> renewalStateDefaultMap = new Map<string,List<Default_Renewal_Oppty_Fields__mdt>>();
        for(Default_Renewal_Oppty_Fields__mdt drof : [select Id,Renewal_State__c,Entity_Type__c,Add_Year__c from Default_Renewal_Oppty_Fields__mdt]){
            if(renewalStateDefaultMap.containskey(drof.Renewal_State__c))
                renewalStateDefaultMap.get(drof.Renewal_State__c).add(drof);
            else
                renewalStateDefaultMap.put(drof.Renewal_State__c, new list<Default_Renewal_Oppty_Fields__mdt>{drof});
        }
        for(Opportunity each : oppIdToOpps.values()){
            Opportunity o = each.clone(false,true);
            system.debug('CloseDate%%%'+o.CloseDate);
            // set fields for clone
            o.StageName = 'Qualification';
            o.ChargentSFA__Manual_Charge__c = FALSE;
            o.Override_Automation__c = FALSE;
            o.ChargentSFA__Gateway__c = gateway[0].Id;
            
            if(each.Sale_Campaign__c == NULL){
                o.Sale_Campaign__c = campaign[0].Id;}
            
            if(each.Renewal_effective_Date__c != null){
                if(each.Renewal_State__c != null && renewalStateDefaultMap.containskey(each.Renewal_State__c)){
                    Boolean matchFound = false; 
                    for(Default_Renewal_Oppty_Fields__mdt dfSet : renewalStateDefaultMap.get(each.Renewal_State__c)){
                        
                        if(dfSet.Entity_Type__c != null){
                            if(dfSet.Entity_Type__c == each.Entity_Type__c){                      
                                o.Renewal_effective_Date__c = each.Renewal_effective_Date__c.addYears(Integer.valueOf(dfSet.Add_Year__c));
                                if(each.Renewal_End_Date__c != null)
                                    o.Renewal_End_Date__c = o.Renewal_End_Date__c.addYears(Integer.valueOf(dfSet.Add_Year__c));
                                if(each.ChargentSFA__Payment_Start_Date__c != null)
                                    o.ChargentSFA__Payment_Start_Date__c = each.Due_Date__c.addYears(Integer.valueOf(dfSet.Add_Year__c));
                                matchFound = true;
                                if(each.RecordTypeId == Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId()){matchFound = false;}
                            }
                        }else{
                            o.Renewal_effective_Date__c = each.Renewal_effective_Date__c.addYears(Integer.valueOf(dfSet.Add_Year__c));
                            if(each.Renewal_End_Date__c != null)
                                o.Renewal_End_Date__c = o.Renewal_End_Date__c.addYears(Integer.valueOf(dfSet.Add_Year__c));
                            if(each.ChargentSFA__Payment_Start_Date__c != null)
                                o.ChargentSFA__Payment_Start_Date__c = each.Due_Date__c.addYears(Integer.valueOf(dfSet.Add_Year__c));
                            matchFound = true;
                            if(each.RecordTypeId == Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId()){matchFound = false;}
                        }
                    }
                    if(!matchFound){
                        o.Renewal_effective_Date__c = each.Renewal_effective_Date__c.addYears(1);
                        if(each.Renewal_End_Date__c != null)
                            o.Renewal_End_Date__c = each.Renewal_End_Date__c.addYears(1);
                        if(each.ChargentSFA__Payment_Start_Date__c != null)
                            o.ChargentSFA__Payment_Start_Date__c = each.Due_Date__c.addYears(1);
                    }   
                }else{
                    o.Renewal_effective_Date__c = each.Renewal_effective_Date__c.addYears(1);
                    if(each.Renewal_End_Date__c != null)
                        o.Renewal_End_Date__c = each.Renewal_End_Date__c.addYears(1);
                    if(each.ChargentSFA__Payment_Start_Date__c != null)
                        o.ChargentSFA__Payment_Start_Date__c = each.Due_Date__c.addYears(1);
                    
                }             
            }
            system.debug('CloseDateAfter%%%'+o.CloseDate); 
            if(each.Name.contains('**')){
                o.Name=each.Name.left(each.Name.length()-2)+each.Name.right(0);
            }
            oppToClone.put(each.id, o);
        }
        set<id> oppToCloneKeys = oppToClone.keyset();
        
        // insert clones
        if(!oppToClone.values().isEmpty())
            insert oppToClone.values();
        
        List<Opportunity> updateOppWithEntityID = new List<Opportunity>();
        Map<Id, Opportunity> updateOppWithEntityIDMap = new Map<Id, Opportunity>();
        
        list<SaleEntity__c> saleEntities = new list<SaleEntity__c>();
        string SEQ = cloneQuery('SaleEntity__c') +' WHERE Opportunity__c IN  :oppToCloneKeys';
        system.debug(seq);
        for(SaleEntity__c each : database.query(SEQ))
        {
            SaleEntity__c s = each.clone(false,true);
            s.Opportunity__c = oppToClone.get(each.Opportunity__c).id;
            saleEntities.add(s);
            
            // "updateOppWithEntityID" ADDED BY "Umer Amjad" ON "19-Nov-2021"
            if(oppToClone.get(each.Opportunity__c) != null && 
               oppToClone.get(each.Opportunity__c).Name != 'Corporate Headquarters Renewal' && 
               oppToClone.get(each.Opportunity__c).Name != 'Corporate Assistance Program Renewal' )
            {
                Opportunity oppObj = new Opportunity();
                oppObj.Id = oppToClone.get(each.Opportunity__c).id;
                oppObj.Entity__c = s.Entity__c;
                oppObj.Populate_the_Entity_lookup_Processed__c = true;
                
                //updateOppWithEntityID.add(oppObj);
                updateOppWithEntityIDMap.put(oppObj.Id, oppObj);
                                
            }
            // "updateOppWithEntityID" ADDED BY "Umer Amjad" ON "19-Nov-2021"
        }
        
        list<OpportunityLineItem> products = new list<OpportunityLineItem>();
        string pq = cloneQuery('OpportunityLineItem') +' WHERE Product2.Subscription_Product__c = true AND OpportunityId IN :oppToCloneKeys'; 
        for(OpportunityLineItem each : database.Query(pq))
        {
            OpportunityLineItem op = each.clone(false,true);
            op.OpportunityId = oppToClone.get(each.OpportunityId).id;
            op.TotalPrice = null;
            products.add(op);
        }
        
        if(!saleEntities.isEmpty())
        {
            updateOppWithEntityID = updateOppWithEntityIDMap.Values();
            
            insert saleEntities;
        	UPDATE updateOppWithEntityID; // ADDED BY "Umer Amjad" ON "19-Nov-2021"
        }
            
        
        if(!products.isEmpty())
            insert products;
    }
    
    public static string cloneQuery(string objectName){
        string q = 'SELECT ';
        for(string each :  Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().keySet())
            q += each +',';
        q = q.removeEnd(',');
        q += ' FROM '+objectName + ' ';
        return q;
    }
    
    
}