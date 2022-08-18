global class BatchableBLogicEntity implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful {
    Exception[] errors = new Exception[0];
    Set<String> setErrorIds = new Set<String>();
    Set<String> setFailedIds = new Set<String>();
    
    Integer currentYear;
    Integer currentMonth;
    Date selectedDate; //Give your date

    BatchRetryAttempts__c cs = BatchRetryAttempts__c.getInstance('BatchableBLogicEntity');
    public BatchableBLogicEntity()
    {
        
    }
    public BatchableBLogicEntity(Set<String> setIds, Integer cy, Integer cm, Date sd){
        if (test.isRunningTest() && cy != null && cm != null && sd != null) {
            currentYear = cy;
            currentMonth = cm;
            selectedDate = sd;
        } else {
            currentYear = Date.Today().Year();
            currentMonth = Date.Today().Month();
            selectedDate = Date.Today();
        }
        
        try {
            if (!setIds.isEmpty())
            {
                
                setErrorIds = setIds;
            }
        } catch (Exception e) {
            system.debug('Continue');
        }
        
    } 
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        //SLA not equal NO Service
        //SLA Month should be equal to the conditions
        
        String query;
        
       if (!setErrorIds.isEmpty())
        {
            query = 'SELECT Id,Name,SLA__c,Current_Plan_Year_End__c,Plan_Adoption_Date__c,Year_End__c,Year_End_Month__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE Id IN: setErrorIds' ;
            cs.Current_Iteration__c= cs.Current_Iteration__c+1;
            update cs;
            system.debug('Failed Batch===>>>>');
            
        }
        else
        {
            query = 'SELECT Id,Name,SLA__c,Plan_Adoption_Date__c,Current_Plan_Year_End__c,Year_End__c,Year_End_Month__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' ';
            cs.Current_Iteration__c = 1;
            update cs;
            system.debug('Success Batch===>>>');
        }
        // query = 'SELECT Id,Name,SLA__c,Plan_Adoption_Date__c,Year_End__c,Year_End_Month__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE Id IN: setErrorIds ';
        
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Entities__c> entityList)
    {
        List<Entities__c> lstEntities = new List<Entities__c>();
        
        Date firstDate = selectedDate.toStartOfMonth();
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);
        Boolean currentYearIsLeapYear = Date.isLeapYear(currentYear);
        Integer nextYear = Date.Today().Year()+1;
        Boolean nextYearIsLeapYear = Date.isLeapYear(nextYear);
        // Date nextLeapFebruaryDte = Date.newInstance(nextYear,2, 29);
        //Date notNextLeapFebruaryDte = Date.newInstance(nextYear, 2, 28);
        
        //  Map<String,List<Entities__c>> mapOfEntitiesId = new Map<String,List<Entities__c>>();
        if(entityList.size()>0)
        {
            
            for(Entities__c entity: entityList)
            {
                //Uncomment the slaMonths line of code and put the if condition again
                //String slaMonths = entity.Year_End_Month__c;
                Date firstTaxYearEndDate = entity.Year_End__c;
                Date dtUpdateCurrentPlanYear= Date.newInstance(firstTaxYearEndDate.year()+1, firstTaxYearEndDate.month(), firstTaxYearEndDate.Day());
                system.debug('entity =====>>> '+ entity);
               // system.debug('SLAMonth =====>>> '+ slaMonths);
                system.debug('isCurrentAndLastDateSame =====>>> '+ isCurrentAndLastDateSame);
                system.debug('CurrentMonth =====>>> '+ currentMonth);
                system.debug('selectedDate =====>>> '+ selectedDate);
                system.debug('lastDate =====>>> '+ lastDate);
                // system.debug('nextLeapFebruaryDte =====>>> '+ nextLeapFebruaryDte);
                //system.debug('notNextLeapFebruaryDte =====>>> '+ notNextLeapFebruaryDte);
                
                If(isCurrentAndLastDateSame==true && currentMonth==3)
                {
                    //Put this in the if condition if SLA logic is implemented
                    //slaMonths == 'January' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==4)
                {
                    //slaMonths == 'February' && 
                    //entity.SLA__c = 'No Service';
                    if(nextYearIsLeapYear==true)
                    {
                        entity.Current_Plan_Year_End__c = Date.newInstance(firstTaxYearEndDate.year()+1,2, 29);
                    }
                    else if(nextYearIsLeapYear==false)
                    {
                        entity.Current_Plan_Year_End__c = Date.newInstance(firstTaxYearEndDate.year()+1, 2, 28);
                    }
                    
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==5)
                {
                    //slaMonths == 'March' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==6)
                {
                    //slaMonths == 'April' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==7)
                {
                    //slaMonths == 'May' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==8)
                {
                    //slaMonths == 'June' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==9)
                {
                    //slaMonths == 'July' && 
                   // entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==10)
                {
                    //slaMonths == 'August' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==11)
                {
                    //slaMonths == 'September' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==12)
                {
                    //slaMonths == 'October' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==1)
                {
                    //slaMonths == 'November' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                    lstEntities.add(entity);
                }
                else if(isCurrentAndLastDateSame==true && currentMonth==2)
                {
                    //slaMonths == 'December' && 
                    //entity.SLA__c = 'No Service';
                    entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
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
        system.debug('Set Failed Ids >>>>>>>>>>>>>>>>>>>>>>>>>>> ' + setFailedIds);
        
        if(!setFailedIds.isEmpty() && cs.Current_Iteration__c <= cs.Maximum_Iteration__c)
        {
            database.executebatch(new BatchableBLogicEntity(setFailedIds, null, null, null),10);
        }
       /*else if(cs.Current_Iteration__c > cs.Maximum_Iteration__c)
        {
            cs.Current_Iteration__c = 0;
            System.debug('Check Custom Setting Value===>>>'+cs.Current_Iteration__c);
        }*/
        // execute any post-processing operations
    }
    global void execute(SchedulableContext SC) {
        database.executebatch(new BatchableBLogicEntity(null, null, null, null),10);
    }
}