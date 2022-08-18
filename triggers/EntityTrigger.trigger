trigger EntityTrigger on Entities__c (before delete, before insert, before update,after delete, after insert, after update, after undelete) {
    
    if (Trigger.isAfter){
        if(checkRecursive.runOnceEntityafterUpdate()){
            EntityTriggerHelper etAfterHelper = new EntityTriggerHelper();
            if (Trigger.isInsert){
                Boolean ret = etAfterHelper.afterEntityInsertEntitySaleCreation( Trigger.new );
                //
                 EntityRenewalSalesHelper.createRenewalSales(Trigger.New);
                if( !ret ) { System.debug('No sale is selected in the entity.'); }
            }
            if(Trigger.isUpdate){
                Boolean ret = etAfterHelper.afterEntityUpdateCopyComments( Trigger.new, Trigger.newMap, Trigger.oldMap );
                if( !ret ) { System.debug('No tasks for updation'); } 
                
          
                try { TrustBinder.updateTrustMember(trigger.new,trigger.oldmap); }
                catch (Exception e) { System.debug('Exception occured during TrustBinder: ' + e); }
                       
                
            }
        }
    }
    
    if(Trigger.isBefore){
        if(checkRecursive.runOnceEntityBeforeUpdate()){
            if(Trigger.isInsert || Trigger.isUpdate){
                try
                {
                    Boolean ret = EntityTriggerHelper5500Update.helper5500Update( Trigger.new, Trigger.oldMap,Trigger.isInsert,Trigger.isUpdate );
                    if( !ret ) { System.debug('Some error occured probably because: First Tax Year End or Updated Tax Year-End is null, dates not updaed'); }
                }catch(Exception e) { System.debug('Exception occured: ' + e); }
            }
            if(Trigger.IsUpdate){
                Entity_BeforeUpdateHelper.populateRA(Trigger.new, Trigger.oldMap);
            }
        }
    }
}