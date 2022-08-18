/* 
* Author: Rabeea Aqil
* Date: 7/19
* Purpose: Closed Lost opportunities with Record Type as "Pension Renewal" and StageName as "Qualification", based on YearEndMonth
*/
global class Pension1stOfMonthCloseOpenSales implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful
{
    private Date d = date.today();
	public Pension1stOfMonthCloseOpenSales()
    {
        
    }
    public Pension1stOfMonthCloseOpenSales(Date paramDate) 
    {
       d = paramDate;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    { 
        String query;
        if(Test.isRunningTest())
        {
            query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c,Year_End_Month__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND StageName=\'Qualification\' LIMIT 200';
            
            
        }
        else
        {
            query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c,Year_End_Month__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND StageName=\'Qualification\'';
        }
        
        
        
        system.debug('QUERYYYYYY=====>'+query);
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> scopeLstOppty)
    {
        List<Opportunity> lstOppty = new List<Opportunity>();
       // Date selectedDate =Date.today();
       	Date selectedDate =d;
        Integer currentMonth = selectedDate.Month();  //uncomment it later
      	//Integer currentMonth = 9;//---
        
        Date firstDate = selectedDate.toStartOfMonth();  //uncomment it later
        Integer firstDay = firstDate.day();     // uncomment it later
       	//Integer firstDay = 1; //---
        if(scopeLstOppty.size()>0)
        {
            
            for(Opportunity o: scopeLstOppty)
            {
                if((o.Year_End_Month__c=='January' && firstDay==1 && currentMonth==9))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='February' && firstDay==1 && currentMonth==10))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='March' && firstDay==1 && currentMonth==11))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='April' && firstDay==1 && currentMonth==12))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='May' && firstDay==1 && currentMonth==1))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='June' && firstDay==1 && currentMonth==2))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='July' && firstDay==1 && currentMonth==3))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='August' && firstDay==1 && currentMonth==4))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='September' && firstDay==1 && currentMonth==5))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='October' && firstDay==1 && currentMonth==6))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='November' && firstDay==1 && currentMonth==7))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                else if((o.Year_End_Month__c=='December' && firstDay==1 && currentMonth==8))
                {
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                }
                //test condition
              /*  else if(o.Year_End_Month__c=='April')
                {
                    
                    System.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                    
                }*/
                
            }
            try
            {
                if(lstOppty.size()>0)
                {
                    update lstOppty;
                }
                
            }
            catch (Exception ex)
            {
                System.Debug('Update failed ' + ex);
                
            }
        }
        
        
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }
    global void execute(SchedulableContext SC) 
    {
        //  database.executebatch(new BatchableSaleCreationEntity(null),10);
        database.executebatch(new Pension1stOfMonthCloseOpenSales(),80);
    }
    
}