/*
This batch will close lost renemal sales that were created from CreateSalesEntity batch
Schedule Date: 9/1
Developer: Rabeea Aqil
Final touch date: 6/28/2021

*/

global class Pension901ClsAnnMaintSale implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful
{
    global   DebugInfo__c Dinfo=new DebugInfo__c();
    /* Exception[] errors = new Exception[0];
Set<String> setErrorIds = new Set<String>();
Set<String> setFailedIds = new Set<String>();
BatchRetryAttempts__c cs = BatchRetryAttempts__c.getInstance('BatchableFlipSaleStagePensionRenewals');
public BatchableFlipSaleStagePensionRenewals()
{

}
public BatchableFlipSaleStagePensionRenewals(Set<String> setIds)
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
        Integer currentYear = Date.Today().Year();
        Date checkOppDte = Date.newInstance(currentYear, 08, 31);
        String query;
        /*   if(!setErrorIds.isEmpty())
{
query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c,Service_Item_List__c FROM Opportunity WHERE d IN: setErrorIds' ;
cs.Current_Iteration__c= cs.Current_Iteration__c+1;
update cs;
system.debug('Failed Batch===>>>>');
}
else
{
//query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c,Service_Item_List__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND Name=\'Annual Plan Maintenance\' AND CloseDate=:checkOppDte AND pymt__Total_Amount__c=350.00 AND StageName=\'Qualification\'';
query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND Name=\'Annual Plan Maintenance\' AND CloseDate=:checkOppDte AND Service_Item_List__c=\'A00373;\' AND pymt__Total_Amount__c=350.00 AND StageName=\'Qualification\'';
cs.Current_Iteration__c = 1;
update cs;
system.debug('Success Batch===>>>');

}*/		
        if(Test.isRunningTest())
        {
            query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND Name=\'Annual Plan Maintenance\' AND CloseDate=:checkOppDte AND Service_Item_List__c=\'A00373;\' AND Amount=350.00 AND StageName=\'Qualification\' LIMIT 200';
            
            
        }
        else
        {
            query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND Name=\'Annual Plan Maintenance\' AND CloseDate=:checkOppDte AND Service_Item_List__c=\'A00373;\' AND Amount=350.00 AND StageName=\'Qualification\'';
        }
        
        
        
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> scopeListOpp)
    {
        //list<OpportunityLineItem> tprod=[SELECT Name,Quantity, UnitPrice, TotalPrice,PricebookEntry.Name, PricebookEntry.Product2.Family FROM OpportunityLineItem WHERE OpportunityId IN:scopeListOpp AND Product2.Name='Pension - Annual Maintenance'];
        Product2[] pd = [Select id from Product2 where name='Pension - Annual Maintenance' ];
        Integer currentYear = Date.Today().Year();
        Date selectedDate =Date.today();
        Integer currentMonth = Date.Today().Month();
        Date firstDate = selectedDate.toStartOfMonth();
        Date oppCloseDte = Date.newInstance(currentYear, 08, 31);
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);
        List<Opportunity> updateOpp = new List<Opportunity>();
        if(scopeListOpp.size()>0)
        {
            if((currentMonth==9 && selectedDate.day()==1) || Test.isRunningTest())
            {
                for(Opportunity o: scopeListOpp)
                {
                    
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    // o.CloseDate = Date.newInstance(currentYear, 09, 01);
                    updateOpp.add(o);
                    
                }
                try
                {
                    if(updateOpp.size()>0)
                    {
                        update updateOpp;
                    }
                    
                    
                }
                catch (Exception ex)
                {
                    System.Debug('Update failed ' + ex);
                    /*  for (Integer i = 0; i < updateOpp.size(); i++)
{
Dinfo.DebugData__c=ex.getMessage()+updateOpp.get(i).Id;
}*/
                    Dinfo.DebugData__c=ex.getMessage();
                    upsert Dinfo;
                    
                }
                //insert Dinfo;
                /* if(updateOpp.size()>0)
{
Database.SaveResult[] updateResult = Database.update(updateOpp,false);
for (Integer i = 0; i < updateResult.size(); i++) {
if (!updateResult.get(i).isSuccess()) {
setFailedIds.add(updateOpp.get(i).Id);
//Dinfo.DebugData__c ='Failed Record IDs: '+string.valueOf(setFailedIds);
Dinfo.DebugData__c ='Failed Record IDs: '+string.valueOf(updateOpp.get(i).Id)+',';
}

}
insert Dinfo;

}*/
            }
            
        }
        
    }
    global void finish(Database.BatchableContext BC)
    {
        /*   if(!setFailedIds.isEmpty() && cs.Current_Iteration__c <= cs.Maximum_Iteration__c)
{
database.executebatch(new BatchableFlipSaleStagePensionRenewals(setFailedIds),10);
}*/
        
    }
    global void execute(SchedulableContext SC) 
    {
        // database.executebatch(new BatchableFlipSaleStagePensionRenewals(null),10);
        database.executebatch(new Pension901ClsAnnMaintSale(),80);
    }
    
}