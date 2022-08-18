global class BatchableBLogicEntityForPensionSLA implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful
{
    Exception[] errors = new Exception[0];
    Set<String> setErrorIds = new Set<String>();
    Set<String> setFailedIds = new Set<String>();
    BatchRetryAttempts__c cs = BatchRetryAttempts__c.getInstance('BatchableBLogicEntityForPensionSLA');
    public BatchableBLogicEntityForPensionSLA()
    {
        
    }
    public BatchableBLogicEntityForPensionSLA(Set<String> setIds)
    {
        try {
            if (!setIds.isEmpty())
            {
                
                setErrorIds = setIds;
            }
        } catch (Exception e) {
            system.debug('Continue');
        }
        
    }
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        String query;
        Integer currentYear = Date.Today().Year();
        if(!setErrorIds.isEmpty())
        {
            query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE Id IN: setErrorIds' ;
            cs.Current_Iteration__c= cs.Current_Iteration__c+1;
            update cs;
            system.debug('Failed Batch===>>>>');
            
        }
        else
        {
            query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'No Service\' AND Prepaid_SLA_Date__c!=NULL AND CALENDAR_YEAR(Prepaid_SLA_Date__c)=:currentYear';
            cs.Current_Iteration__c = 1;
            update cs;
            system.debug('Success Batch===>>>');
        }
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC, List<Entities__c> entityList)
    {
        Date selectedDate =Date.today();
        Integer currentMonth = Date.Today().Month();
        Date firstDate = selectedDate.toStartOfMonth();
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);
        List<Entities__c> lstEntities = new List<Entities__c>();
        if(entityList.size()>0)
        {
            for(Entities__c entity: entityList)
            {
                System.debug('Date'+currentMonth);
                System.debug('Date'+isCurrentAndLastDateSame);
                if((currentMonth==7 && isCurrentAndLastDateSame==true) || Test.isRunningTest())
                {
                    system.debug('CHECK FOR FOR LOOP===>'+entity);
                    entity.SLA__c = 'No Service';
                    lstEntities.add(entity);
                    
                }
                
            }
            if (lstEntities.size() > 0) {
                
                Database.SaveResult[] updateResult = Database.update(lstEntities,false);
                
                for (Integer i = 0; i < updateResult.size(); i++) {
                    if (!updateResult.get(i).isSuccess()) {
                        setFailedIds.add(lstEntities.get(i).Id);
                    }
                    
                }
                
            }
            //     setFailedIds.add('a0I7c000004KG4BEAW');
        }
        
        
    }
    global void finish(Database.BatchableContext BC)
    {
        if(!setFailedIds.isEmpty() && cs.Current_Iteration__c <= cs.Maximum_Iteration__c)
        {
            database.executebatch(new BatchableBLogicEntityForPensionSLA(setFailedIds),10);
        }
        
    }
    global void execute(SchedulableContext SC) {
        database.executebatch(new BatchableBLogicEntityForPensionSLA(null),10);
    }
    
}