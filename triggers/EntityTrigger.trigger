trigger EntityTrigger on Entities__c (before delete, before insert, before update,after delete, after insert, after update, after undelete) {
    
    if (Trigger.isAfter){
        if(checkRecursive.runOnceEntityafterUpdate()){
            EntityTriggerHelper etAfterHelper = new EntityTriggerHelper();
            if (Trigger.isInsert)
            {
                Boolean ret = etAfterHelper.afterEntityInsertEntitySaleCreation( Trigger.new );
                EntityRenewalSalesHelper.createRenewalSales(Trigger.New);
                if( !ret ) { System.debug('No sale is selected in the entity.'); }
            }
            if(Trigger.isUpdate)
            {
                Boolean ret = etAfterHelper.afterEntityUpdateCopyComments( Trigger.new, Trigger.newMap, Trigger.oldMap );
                if( !ret ) { System.debug('No tasks for updation'); } 
                try { TrustBinder.updateTrustMember(trigger.new,trigger.oldmap); }catch (Exception e) { System.debug('Exception occured during TrustBinder: ' + e); }
            }
            
            if(trigger.isInsert ||Trigger.isUpdate)
            {
                list<Entities__c> entityList = new list<Entities__c>();
                Id recordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Non-Profit Entity').getRecordTypeId();
                Entities__c oldCase = new Entities__c();
                for(Entities__c inst : trigger.new)
                {
                    if(Trigger.isUpdate)
                    {
                       oldCase = Trigger.oldMap.get(inst.ID);
                    }
                    
                    system.debug('EntityList0 =' + EntityList);
                    if( (trigger.isInsert && inst.RecordTypeId == recordTypeId && inst.Organizational_Date__c != null && inst.Non_Profit_Compliance_Package__c == 'true')
                      || (trigger.isUpdate && inst.RecordTypeId == recordTypeId && inst.Organizational_Date__c != null && oldCase.Organizational_Date__c == null && inst.Non_Profit_Compliance_Package__c == 'true'))
                    {
                        entityList.add(inst);
                        system.debug('EntityList1 =' + EntityList);
                    }
                }
                
                 if(entityList.size()>0)
                    {
                        Map<String, Object> params = new Map<String, Object>();
                        params.put('EntityList', entityList);
                        system.debug('EntityList2 =' + EntityList);
                        system.debug('Params2:' + params);
                        flow.Interview.Entity_Non_Profit_State_Renewal StaterenewalFlow = new flow.Interview.Entity_Non_Profit_State_Renewal(params);
                        StaterenewalFlow.start();
                    }
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
            if(Trigger.IsUpdate)
            {
                Entity_BeforeUpdateHelper.populateRA(Trigger.new, Trigger.oldMap);
            }
        }
    }
}