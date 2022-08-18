// SCH-0046
trigger OppyLineItemTrigger on OpportunityLineItem (before insert,after delete, after insert, after undelete, after update, before delete) {
    
    set<ID> OppsID=new set<ID>();
    set<ID> OppsAccountId=new set<ID>();
    List<OpportunityLineItem> oppItems = new List<OpportunityLineItem>();
    public static boolean alreadyProcessedoninsert = false;   
    Switch on trigger.OperationType {
        
        
        when AFTER_INSERT{
            for(OpportunityLineItem each : trigger.new){
                oppItems.add(each);
                
                OppsID.add(each.OpportunityID);
                OppServiceItemRollUp.oppLineitemRollupProcessed.add(each.OpportunityID);
                
                
                
            }
            if(OppsID.size()>0){
                alreadyProcessedoninsert=true;
                
                OppServiceItemRollUp.oppTyeandwelcomecallRollup(OppsID);
                
                
            }
            if(oppItems.size() > 0){
                OpportunityLineItemInsertHandler.insertTaxToolBoxOSI(oppItems);
            }
        }
        
        
        when AFTER_UPDATE {
            if(!alreadyProcessedoninsert){
                for(OpportunityLineItem each : trigger.New){
                    
                    
                    if(!OppServiceItemRollUp.oppLineitemRollupProcessed.contains(each.OpportunityID)){
                        
                        OppsID.add(each.OpportunityID);
                        
                        OppServiceItemRollUp.oppLineitemRollupProcessed.add(each.OpportunityID);
                        
                    }
                    
                    
                    
                }
                if(OppsID.size()>0){
                    System.debug('Inside OppyLineItem_Insert isupdate');
                    
                    
                    OppServiceItemRollUp.oppTyeandwelcomecallRollup(OppsID);
                    
                    
                }
            }
            
        }
        
        when AFTER_DELETE {
            
            for(OpportunityLineItem each : trigger.old){
                
                
                if(!OppServiceItemRollUp.oppLineitemRollupProcessed.contains(each.OpportunityID)){
                    OppsID.add(each.OpportunityID);
                    
                    OppServiceItemRollUp.oppLineitemRollupProcessed.add(each.OpportunityID);
                    
                }
                if(!DeleteAccountBadgeService.DeleteoppLineitemRollupProcessed.contains(each.OpportunityID)){
                    OppsAccountId.add(each.OpportunityID);
                    system.debug('test---'+each.OpportunityID);
                    DeleteAccountBadgeService.DeleteoppLineitemRollupProcessed.add(each.OpportunityID);
                }
                
                
            }
            if(OppsID.size()>0){
                
                OppServiceItemRollUp.oppTyeandwelcomecallRollup(OppsID);
            }
            if(OppsAccountId.size()>0){
                
                DeleteAccountBadgeService.deleteAccountBadgeservice(OppsAccountId);
            }
            
        }
        
        
    }
    
}