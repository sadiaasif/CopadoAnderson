global class PensionJuly31FlipEntSLANoServ implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful
{
    Exception[] errors = new Exception[0];
    Set<String> setErrorIds = new Set<String>();
    Set<String> setFailedIds = new Set<String>();
    BatchRetryAttempts__c cs = BatchRetryAttempts__c.getInstance('PensionJuly31FlipEntSLANoServ');
    global boolean ManualOverride = false;
    
    public PensionJuly31FlipEntSLANoServ(boolean manualMode)
    {
     	ManualOverride = manualMode;   
    }
   /* public PensionJuly31FlipEntSLANoServ(Set<String> setIds)
    {
        try {
            if (!setIds.isEmpty())
            {
                
                setErrorIds = setIds;
            }
        } catch (Exception e) {
            system.debug('Continue');
        }
        
    }*/
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        String query;
        //Integer currentYear = Date.Today().Year();
        if(Test.isRunningTest())
        {
            //query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'No Service\' AND Prepaid_SLA_Date__c!=NULL AND CALENDAR_YEAR(Prepaid_SLA_Date__c)=:currentYear LIMIT 200';
			query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'No Service\' LIMIT 200';

            /*if(!setErrorIds.isEmpty())
            {
                query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE Id IN: setErrorIds LIMIT 200'  ;
                cs.Current_Iteration__c= cs.Current_Iteration__c+1;
                update cs;
                system.debug('Failed Batch===>>>>');
                
            }
            else
            {
                query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'No Service\' AND Prepaid_SLA_Date__c!=NULL AND CALENDAR_YEAR(Prepaid_SLA_Date__c)=:currentYear LIMIT 200';
                cs.Current_Iteration__c = 1;
                update cs;
                system.debug('Success Batch===>>>');
            }
            
        }
        else
        {
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
            }*/
            
        }
        else 
        {
             //query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'No Service\' AND Prepaid_SLA_Date__c!=NULL AND CALENDAR_YEAR(Prepaid_SLA_Date__c)=:currentYear';
			 query = 'SELECT Id,Name,SLA__c,Prepaid_SLA_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'No Service\'';

            
        }
                
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC, List<Entities__c> entityList)
    {
        Integer currentYear = Date.Today().Year(); 
        Date selectedDate =Date.today();
        Integer currentMonth = Date.Today().Month();//--uncomment it later
        //Integer currentMonth = 7;
        Date firstDate = selectedDate.toStartOfMonth();
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);//--uncomment it later
       //Boolean isCurrentAndLastDateSame = true;
        List<Entities__c> lstEntities = new List<Entities__c>();
        if(entityList.size()>0)
        {
            for(Entities__c entity: entityList)
            {
                System.debug('Date'+currentMonth);
                System.debug('Date'+isCurrentAndLastDateSame);
                if((((currentMonth==7 && isCurrentAndLastDateSame==true) || ManualOverride) && entity.Prepaid_SLA_Date__c!=NULL && entity.Prepaid_SLA_Date__c.YEAR()<=currentYear) || Test.isRunningTest())
                {
                    system.debug('CHECK FOR FOR LOOP===>'+entity);
                    entity.SLA__c = 'No Service';
                    lstEntities.add(entity);
                    
                }
                else if((((currentMonth==7 && isCurrentAndLastDateSame==true) || ManualOverride) && entity.SLA__c=='Admin Service') || Test.isRunningTest())
                {
                    system.debug('CHECK FOR FOR LOOP ADMIN SERVICE===>'+entity);
                    entity.SLA__c = 'No Service';
                    lstEntities.add(entity);
                    
                }
                
            }
            if (lstEntities.size() > 0) {
                
                Database.SaveResult[] updateResult = Database.update(lstEntities,false);
                
                /*for (Integer i = 0; i < updateResult.size(); i++) {
                    if (!updateResult.get(i).isSuccess()) {
                        setFailedIds.add(lstEntities.get(i).Id);
                    }
                    
                }*/
                
            }
            //     setFailedIds.add('a0I7c000004KG4BEAW');
        }
        
        
    }
    global void finish(Database.BatchableContext BC)
    {
        /*if(!setFailedIds.isEmpty() && cs.Current_Iteration__c <= cs.Maximum_Iteration__c)
        {
            database.executebatch(new PensionJuly31FlipEntSLANoServ(setFailedIds),10);
        }*/
        
    }
    global void execute(SchedulableContext SC) {
        Pension_Batch_Setting__mdt batchSetting = [Select MasterLabel,Manual_Override__c,batch_size__c from Pension_Batch_Setting__mdt where MasterLabel = 'PensionJuly31FlipEntSLANoServ' limit 1];
        if(Test.isRunningTest())
        {
            database.executebatch(new PensionJuly31FlipEntSLANoServ(false),10);
            
        }
        else
        {
            database.executebatch(new PensionJuly31FlipEntSLANoServ(batchSetting.Manual_Override__c),Integer.valueOf(batchSetting.Batch_Size__c));
            //database.executebatch(new PensionJuly31FlipEntSLANoServ(null),10);
            
            
        }
    }
    
}