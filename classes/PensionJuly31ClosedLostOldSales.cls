/*
This batch will close lost renemal sales that are in the system and meets the criteria
Schedule Date: 7/31
Developer: Rabeea Aqil
Final touch date: 6/28/2021

*/

global class PensionJuly31ClosedLostOldSales implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful
{
    global   DebugInfo__c Dinfo=new DebugInfo__c();
    global boolean ManualOverride = false;
    /*Exception[] errors = new Exception[0];
Set<String> setErrorIds = new Set<String>();
Set<String> setFailedIds = new Set<String>();
BatchRetryAttempts__c cs = BatchRetryAttempts__c.getInstance('PensionJuly31ClosedLostOldSales');
public PensionJuly31ClosedLostOldSales()
{

}
public PensionJuly31ClosedLostOldSales(Set<String> setIds)
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
    global PensionJuly31ClosedLostOldSales(boolean manualMode){
        ManualOverride = manualMode;

    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query;
        /* if(!setErrorIds.isEmpty())
{
query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE Id IN: setErrorIds' ;
cs.Current_Iteration__c= cs.Current_Iteration__c+1;
update cs;
system.debug('Failed Batch===>>>>');
}
else
{
query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND StageName=\'Qualification\'';            
cs.Current_Iteration__c = 1;
update cs;
system.debug('Success Batch===>>>');
}*/
        //query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\'';
        if(Test.isRunningTest())
        {
            query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND StageName=\'Qualification\' LIMIT 200';
        }
        else
        {
            query = 'SELECT Id,Name,StageName,Closed_Lost_Reason__c FROM Opportunity WHERE RecordType.Name = \'Pension Renewal\' AND StageName=\'Qualification\'';            
            
            
        }
        System.debug('Query===='+query);
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> scopeOppList)
    {
        System.debug('xyyyyy'+scopeOppList);
        Date selectedDate =Date.today();
        Integer currentMonth = Date.Today().Month();
        Date firstDate = selectedDate.toStartOfMonth();
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);
        List<Opportunity> lstOppty = new List<Opportunity>();
        if(scopeOppList.size()>0)
        {
            if((currentMonth==7 && isCurrentAndLastDateSame==true)|| Test.isRunningTest() || ManualOverride)
            {
                System.debug('SCOPE====>'+scopeOppList.size());
                for(Opportunity o: scopeOppList)
                {
                    
                    // {
                    
                    system.debug('CHECK FOR FOR LOOP===>'+o);
                    o.Closed_Lost_Reason__c = 'Non Payment';
                    o.StageName = 'Closed Lost';
                    lstOppty.add(o);
                    
                    // }
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
                    Dinfo.DebugData__c=ex.getMessage();
                    upsert Dinfo;
                    
                }
                
                /* if(lstOppty.size()>0)
{
Database.SaveResult[] updateResult = Database.update(lstOppty,false);
for (Integer i = 0; i < updateResult.size(); i++) {
if (!updateResult.get(i).isSuccess()) {
setFailedIds.add(lstOppty.get(i).Id);
Dinfo.DebugData__c ='Failed Record IDs: '+string.valueOf(lstOppty.get(i).Id)+',';
// lstOppty.get(i).Id+',';
}

}
insert Dinfo;
}*/
            }
        }
        
    }
    global void finish(Database.BatchableContext BC)
    {
        /* if(!setFailedIds.isEmpty() && cs.Current_Iteration__c <= cs.Maximum_Iteration__c)
{
database.executebatch(new BatchableSaleStageUpdate(setFailedIds),10);
}*/
        
    }
    global void execute(SchedulableContext SC) 
    {
        Pension_Batch_Setting__mdt batchSetting = [Select MasterLabel,Manual_Override__c,batch_size__c from Pension_Batch_Setting__mdt where MasterLabel = 'PensionJuly31ClosedLostOldSales' limit 1];
        // database.executebatch(new BatchableSaleStageUpdate(null),20);
        database.executebatch(new PensionJuly31ClosedLostOldSales(batchSetting.Manual_Override__c),Integer.valueOf(batchSetting.Batch_Size__c));
    }
    
}