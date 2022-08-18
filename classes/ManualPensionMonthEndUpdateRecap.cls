/*
* Manual Batch: ManualPensionMonthEndUpdateRecap
* Manual Batch Query: 
* Id batchJobId1 = Database.executeBatch(new ManualPensionMonthEndUpdateRecap('SELECT Id, Name, SLA__c,Current_Plan_Year_End__c,Year_End__c,PlanType__c,Year_End_Month__c,Primary_Client__c,Recap_Start_Date__c,Recap_End_Date__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND Current_Plan_Year_End__c<THIS_YEAR AND FU__c!=True',date.parse('10/31/2021')), 10);
* System.debug('Batch1--'+batchJobId1);
* Format: MM/DD/YYYY

*/
global class ManualPensionMonthEndUpdateRecap implements Database.Batchable<sObject>, Database.Stateful
{
    private String query;
    private Date dte;
    
   
    global ManualPensionMonthEndUpdateRecap(String query, Date dte)
    {
        this.query = query;
        this.dte = dte;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        
       
        return Database.getQueryLocator(this.query);
        
        
    }
    global void execute(Database.BatchableContext BC, List<Entities__c> scopeLstEntity)
    {
        Date dte;
        List<Entities__c> lstEntities = new List<Entities__c>();    
        Integer currentYear = this.dte.Year();//uncomment later
        //Integer currentYear = 2021; //----
        Integer   currentMonth = this.dte.Month();//uncomment it later
        //Integer currentMonth =8;//---
        Date   selectedDate = this.dte;
        Date firstDate = selectedDate.toStartOfMonth();
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);// uncomment it later
        //Boolean isCurrentAndLastDateSame = true;//---
        Boolean currentYearIsLeapYear = Date.isLeapYear(currentYear);
        //Integer nextYear = Date.Today().Year()+1;
        Integer nextYear = this.dte.Year()+1; //uncomment it later
        //Integer nextYear = 2022; //----
        Boolean nextYearIsLeapYear = Date.isLeapYear(nextYear);
         if(scopeLstEntity.size()>0)
        {
            for(Entities__c entity: scopeLstEntity)
            {
                String yearEndMonth = entity.Year_End_Month__c;
                
                Date updateRecapDates = entity.Current_Plan_Year_End__c;
                if(updateRecapDates!=null)
                {
                    
                    Date dtUpdateCurrentPlanYear= Date.newInstance(updateRecapDates.year()+1, updateRecapDates.month(), updateRecapDates.Day());                  
                    
                    if((isCurrentAndLastDateSame==true && yearEndMonth=='January' && currentMonth==3))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        ///Current Plan Year Date
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='February' && currentMonth==4))
                    {
                        if(nextYearIsLeapYear==true)
                        {
                            entity.Current_Plan_Year_End__c = Date.newInstance(updateRecapDates.year()+1,2, 29);
                        }
                        else if(nextYearIsLeapYear==false)
                        {
                            entity.Current_Plan_Year_End__c = Date.newInstance(updateRecapDates.year()+1, 2, 28);
                        }
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='March' && currentMonth==5))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='April' && currentMonth==6))
                    {
                       
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='May' && currentMonth==7))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='June' && currentMonth==8))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='July' && currentMonth==9))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='August' && currentMonth==10))
                    {
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='September' && currentMonth==11))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='October' && currentMonth==12))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='November' && currentMonth==1))
                    {
                        
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='December' && currentMonth==2 && currentYearIsLeapYear==true && this.dte.day()==29))
                    {
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='December' && currentMonth==2 && currentYearIsLeapYear==false && this.dte.day()==28))
                    {
                        entity.Current_Plan_Year_End__c = dtUpdateCurrentPlanYear;
                        lstEntities.add(entity);
                        
                    }
                    
                    
                    
                }
                
            }
            if(lstEntities.size()>0)
                {
                    update lstEntities;
                    //Database.SaveResult[] upsertAnnualRecapDtes = Database.upsert(lstEntities,false);
                    
                }
        }
        
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }
 /*   global void execute(SchedulableContext SC) 
    {
        // database.executebatch(new BatchableSaleStageUpdate(null),20);
        database.executebatch(new ManualPensionMonthEndUpdateRecap(null,null),10);
    }*/

}