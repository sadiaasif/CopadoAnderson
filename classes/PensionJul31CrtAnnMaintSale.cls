/*
This batch will create sales for the entitites that fall under the query criteria
Schedule Date: 7/31 after BatachableSaleStageUpdate batch is scheduled
Developer: Rabeea Aqil
Final touch date: 6/28/2021

*/

global class PensionJul31CrtAnnMaintSale implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful
{
    global   DebugInfo__c Dinfo=new DebugInfo__c();
    List<String> exceptionLst = new List<String>();
    List<String> exceptionLstSE = new List<String>();
    List<String> exceptionLstOLI = new List<String>();
    global boolean ManualOverride = false;
    /*  Exception[] errors = new Exception[0];
Set<String> setErrorIds = new Set<String>();
Set<String> setFailedIds = new Set<String>();
BatchRetryAttempts__c cs = BatchRetryAttempts__c.getInstance('BatchableSaleCreationEntity');
public BatchableSaleCreationEntity()
{

}
public BatchableSaleCreationEntity(Set<String> setIds)
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
    global PensionJul31CrtAnnMaintSale(boolean manualMode){
        ManualOverride = manualMode;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query;
        /*if(!setErrorIds.isEmpty())
{
query = 'SELECT Id, Name, SLA__c,PlanType__c,Primary_Client__c FROM Entities__c WHERE Id IN: setErrorIds' ;
cs.Current_Iteration__c= cs.Current_Iteration__c+1;
update cs;
system.debug('Failed Batch===>>>>');

}
else
{
query = 'SELECT Id, Name, SLA__c,PlanType__c,Primary_Client__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND SLA__c!= \'Prepaid Admin\' AND (PlanType__c!=\'ROBS Solo 401(k)\' OR PlanType__c!=\'ROBS Profit Sharing\') ';
cs.Current_Iteration__c = 1;
update cs;
system.debug('Success Batch===>>>');

}*/		if(Test.isRunningTest())
{
    query = 'SELECT Id, Name, SLA__c,PlanType__c,Primary_Client__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND (SLA__c= \'No Service\' OR SLA__c= \'Admin Service\' ) AND (PlanType__c=\'Money Purchase Plan\' OR PlanType__c=\'Profit Sharing Plan\'OR PlanType__c=\'Solo 401(k)\') AND FU__c=False LIMIT 200';
    
}
        else
        {
            query = 'SELECT Id, Name, SLA__c,PlanType__c,Primary_Client__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND (SLA__c= \'No Service\' OR SLA__c= \'Admin Service\' ) AND (PlanType__c=\'Money Purchase Plan\' OR PlanType__c=\'Profit Sharing Plan\'OR PlanType__c=\'Solo 401(k)\') AND FU__c=False';
            
        }
        
        system.debug('QUERYYYYYY=====>'+query);
        return Database.getQueryLocator(query);
        
        
    }
    global void execute(Database.BatchableContext BC, List<Entities__c> scopeLstEntity)
    {
        System.debug('SCOPE=====>'+scopeLstEntity);
        Date selectedDate =Date.today();
        Integer currentMonth = Date.Today().Month();
        Date firstDate = selectedDate.toStartOfMonth();
        Integer currentYear = Date.today().Year();
        Date oppCloseDte = Date.newInstance(currentYear, 08, 31);
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate);
        recordtype[] tt = [Select  id From RecordType where sobjecttype ='Opportunity' AND Name='Pension Renewal'];
        Pricebook2[] pb = [Select id From Pricebook2 where name='Renewals'];
        Product2[] pd = [Select id from Product2 where name='Pension - Annual Maintenance' ];
        PricebookEntry[] pbe = [select id, name, unitprice,createddate from PricebookEntry where product2.name='Pension - Annual Maintenance' order by createddate DESC];
        Campaign[] cId = [select id from Campaign where name='Pension Renewals'];
        List<Opportunity> lstOpp = new List<Opportunity>();
        List<OpportunityLineItem> lstOLI = new List<OpportunityLineItem>();
        List<SaleEntity__c> lstSaleEntity = new List<SaleEntity__c>();
        if(scopeLstEntity.size()>0)
        {            
            if((currentMonth==7 && isCurrentAndLastDateSame==true)|| Test.isRunningTest() || ManualOverride)
            {
                System.debug('SCOPE========='+scopeLstEntity);
                for(Entities__c e: scopeLstEntity)
                {
                    Opportunity oppty = new Opportunity();
                    oppty.Name ='Annual Plan Maintenance';
                    oppty.AccountId = e.Primary_Client__c;
                    oppty.RecordTypeId = tt[0].Id;
                    oppty.CloseDate = oppCloseDte;
                    oppty.Sale_Campaign__c = cId[0].id;
                    oppty.StageName = 'Qualification';
                    oppty.Entity__c = e.Id;
                    lstOpp.add(oppty);
                    System.debug('LS==========='+lstOpp);
                }
                try
                {
                    if(lstOpp.size()>0)
                    {
                        insert lstOpp;
                    }
                }
                catch (Exception ex)
                {
                    System.Debug('Insert failed ' + ex);
                    
                    exceptionLst.add(string.valueOf(ex));
                    // Dinfo.DebugData__c=ex.getMessage();
                    // upsert Dinfo;
                    Dinfo.DebugData__c=string.valueOf(exceptionLst);
                    upsert Dinfo;
                }
                
                
                /*    if(lstOpp.size()>0)
{
Database.SaveResult[] updateResult = Database.insert(lstOpp,false);

for (Integer i = 0; i < updateResult.size(); i++) {
if (!updateResult.get(i).isSuccess()) {
setFailedIds.add(lstOpp.get(i).Id);
// Dinfo.DebugData__c ='Failed Record IDs: '+string.valueOf(setFailedIds);
Dinfo.DebugData__c ='Failed Record IDs: '+string.valueOf(lstOpp.get(i).Id)+',';
}

}
insert Dinfo;
}*/
                if(lstOpp.size()>0)
                {
                    for(Opportunity op:lstOpp)
                    {
                        SaleEntity__c saleEntity = new SaleEntity__c();
                        saleEntity.Opportunity__c=op.Id;
                        saleEntity.Entity__c=op.Entity__c;
                        // saleEntity.Name = op.Entity_Name_2__c;
                        saleEntity.Name = [Select name from entities__c where id=:op.Entity__c]?.name;
                        lstSaleEntity.add(saleEntity);
                    }
                    try
                    {
                        if(lstSaleEntity.size()>0)
                        {
                            insert lstSaleEntity;
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Debug('Sales Entity Junction Record failed ' + ex);
                        exceptionLstSE.add(string.valueOf(ex));
                        // Dinfo.DebugData__c=ex.getMessage();
                        // upsert Dinfo;
                        Dinfo.DebugData__c=string.valueOf(exceptionLstSE);
                        upsert Dinfo;
                        //  Dinfo.DebugData__c=ex.getMessage();
                        // upsert Dinfo;
                    }
                    // insert Dinfo;
                    
                }
                if(lstOpp.size()>0)
                {
                    for(Opportunity opp:[Select id,name from Opportunity where id IN: lstOpp])
                    {
                        //lstSaleEntity
                        System.debug('OPPP====>'+opp);
                        OpportunityLineItem OLI = new OpportunityLineItem();
                        // SaleEntity__c saleEntity = new SaleEntity__c();
                        OLI.OpportunityId = opp.Id; //Opportunity Id has to be assigned
                        //OLI.Service_Name__c = 'Pension - Annual Maintenance';
                        OLI.Product2Id = (pd.size() > 0) ? pd[0].id : null;
                        OLI.PricebookEntryId = (pbe.size() > 0) ? pbe[0].id : null;
                        OLI.Quantity = 1;
                        OLI.UnitPrice = (pbe.size() > 0) ? pbe[0].UnitPrice : null;
                        lstOLI.add(OLI);              
                        // saleEntity.Opportunity__r.id = opp.Id;
                        //lstSaleEntity.add(saleEntity);
                    }
                    try
                    {
                        if(lstOLI.size()>0)
                        {
                            insert lstOLI;
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Debug('OLI Insertion failed ' + ex);
                        exceptionLstOLI.add(string.valueOf(ex));
                        // Dinfo.DebugData__c=ex.getMessage();
                        // upsert Dinfo;
                        Dinfo.DebugData__c=string.valueOf(exceptionLstOLI);
                        upsert Dinfo;
                        //Dinfo.DebugData__c=ex.getMessage();
                        //upsert Dinfo;
                    }
                    
                    
                }
                
            }
            
        }
    }
    global void finish(Database.BatchableContext BC)
    {
        /*if(!setFailedIds.isEmpty() && cs.Current_Iteration__c <= cs.Maximum_Iteration__c)
{
database.executebatch(new BatchableSaleCreationEntity(setFailedIds),10);
}*/
        
    }
    global void execute(SchedulableContext SC) 
    {
        Pension_Batch_Setting__mdt batchSetting = [Select MasterLabel,Manual_Override__c,batch_size__c from Pension_Batch_Setting__mdt where MasterLabel = 'PensionJul31CrtAnnMaintSale' limit 1];
        //  database.executebatch(new BatchableSaleCreationEntity(null),10);
        database.executebatch(new PensionJul31CrtAnnMaintSale(batchSetting.Manual_Override__c),Integer.valueOf(batchSetting.Batch_Size__c));
    }
    
}