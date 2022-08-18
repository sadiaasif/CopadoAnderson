/* 
* Author: Rabeea Aqil
* Date: 7/19
* Purpose: Create sale record for entities with recordtype "Pension Plan" and SLA as "Prepaid Admin" OR "Admin Service"
* Updated on : 13-October-2021
* Purpose : Added a new filter using current plan year date field. Custom Label has been used for year comparison "PensionBatchCurrentPlanYearDate".
* Run from Anonymous Window: PensionMonthEndCrtAdminSales t = new PensionMonthEndCrtAdminSales(date.parse('08/31/2021'));
Database.executeBatch(t,15);
*/
global class PensionMonthEndCrtAdminSales implements Database.Batchable<sObject>,System.Schedulable, Database.Stateful 
{
    private Date d = date.today();
    public PensionMonthEndCrtAdminSales()
    {
        
    }
    public PensionMonthEndCrtAdminSales(Date paramDate) {
        d = paramDate;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query;
        if(Test.isRunningTest())
        {
            query = 'SELECT Id,Current_Plan_Year_End__c, Name,Year_End_Month__c, SLA__c,PlanType__c,Primary_Client__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND (SLA__c=\'Prepaid Admin\' OR SLA__c=\'Admin Service\') AND FU__c!=True LIMIT 30';
            
        }
        else
        {
            query = 'SELECT Id,Current_Plan_Year_End__c,Year_End_Month__c, Name, SLA__c,PlanType__c,Primary_Client__c FROM Entities__c WHERE RecordType.DeveloperName = \'Pension_Plan\' AND (SLA__c=\'Prepaid Admin\' OR SLA__c=\'Admin Service\') AND FU__c!=True';
            
        }
        
        system.debug('QUERYYYYYY=====>'+query);
        return Database.getQueryLocator(query);
        
        
    }
    global void execute(Database.BatchableContext BC, List<Entities__c> scopeLstEntity)
    {
        System.debug('SCOPE=====>'+scopeLstEntity);
        //Date selectedDate =Date.today();
        Date selectedDate =d;
        //Integer currentMonth = Date.Today().Month();
        Integer currentMonth = d.Month(); //will uncomment
        //Integer currentMonth = 8;//---
        Date firstDate = selectedDate.toStartOfMonth();
        //Integer currentYear = Date.today().Year();
        Integer currentYear = d.Year(); //uncomment it later
       // Integer currentYear = 2021; //----
        //Date oppCloseDte = Date.newInstance(currentYear, 08, 31);
        Date lastDate = firstDate.addDays(date.daysInMonth(selectedDate.year() , selectedDate.month())  - 1);
        system.debug(firstDate  + ' **** ' +lastDate );
        Boolean isCurrentAndLastDateSame = selectedDate.isSameDay(lastDate); //will uncomment it
        //Boolean isCurrentAndLastDateSame = true;
        Boolean currentYearIsLeapYear = Date.isLeapYear(currentYear);
        //Integer nextYear = Date.Today().Year()+1;
        Integer nextYear = d.Year()+1; //uncomment it later
        //Integer nextYear = 2022; //------        
        Boolean nextYearIsLeapYear = Date.isLeapYear(nextYear);
        recordtype[] tt = [Select  id From RecordType where sobjecttype ='Opportunity' AND Name='Pension Renewal'];
        Pricebook2[] pb = [Select id From Pricebook2 where name='Renewals'];
        Product2[] pd = [Select id from Product2 where name='Pension - Annual Maintenance' ];
        Product2[] pdTaxPrep = [Select id from Product2 where name='Tax Prep, 5500 Return'];
        PricebookEntry[] pbe = [Select id, name, unitprice,createddate from PricebookEntry where product2.name='Pension - Annual Maintenance' order by createddate DESC LIMIT 1];
        PricebookEntry[] pbeTaxPrep = [Select id, name, unitprice,createddate from PricebookEntry where product2.name='Tax Prep, 5500 Return' order by createddate DESC LIMIT 1];
        Campaign[] cId = [select id from Campaign where name='Pension Renewals'];
        List<Opportunity> lstOpp = new List<Opportunity>();
        List<Opportunity> lstOpp2 = new List<Opportunity>();
        List<OpportunityLineItem> lstOLI = new List<OpportunityLineItem>();
        List<OpportunityLineItem> lstOLI2 = new List<OpportunityLineItem>();
        List<SaleEntity__c> lstSaleEntity = new List<SaleEntity__c>();
        List<SaleEntity__c> lstSaleEntity2 = new List<SaleEntity__c>();
        if(scopeLstEntity.size()>0)
        {
            for(Entities__c e: scopeLstEntity)
            {
                String yearEndMonth = e.Year_End_Month__c;
                Date currentPlanYearEndDate = e.Current_Plan_Year_End__c;
                if((isCurrentAndLastDateSame==true && yearEndMonth=='January' && currentPlanYearEndDate.year() == d.year() && currentMonth==3))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 8, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 6, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp2);
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='February' && currentPlanYearEndDate.year() == d.year() && currentMonth==4))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 9, 30);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 7, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='March' && currentPlanYearEndDate.year() == d.year() && currentMonth==5))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 10, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 8, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='April' && currentPlanYearEndDate.year() ==d.year() && currentMonth==6))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 11, 30);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 9, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='May' && currentPlanYearEndDate.year() == d.year() && currentMonth==7))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 12, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 10, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='June' && currentPlanYearEndDate.year() == d.year() && currentMonth==8))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear+1, 1, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 11, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='July' && currentPlanYearEndDate.year() == d.year() && currentMonth==9))
                    {
                        if(nextYearIsLeapYear==false)
                        {
                            Opportunity oppty = new Opportunity();
                            oppty.Name ='Pension - 5500 Tax Prep';
                            oppty.AccountId = e.Primary_Client__c;
                            oppty.RecordTypeId = tt[0].Id;
                            oppty.CloseDate = date.newInstance(currentYear+1, 2, 28);
                            oppty.Sale_Campaign__c = cId[0].id;
                            oppty.StageName = 'Qualification';
                            oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 12, 1);
                            oppty.Entity__c = e.Id;
                            lstOpp2.add(oppty);
                            System.debug('LS==========='+lstOpp);
                            
                        }
                        else if(nextYearIsLeapYear==true)
                        {
                            Opportunity oppty = new Opportunity();
                            oppty.Name ='Pension - 5500 Tax Prep';
                            oppty.AccountId = e.Primary_Client__c;
                            oppty.RecordTypeId = tt[0].Id;
                            oppty.CloseDate = date.newInstance(currentYear+1, 2, 29);
                            oppty.Sale_Campaign__c = cId[0].id;
                            oppty.StageName = 'Qualification';
                            oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 12, 1);
                            oppty.Entity__c = e.Id;
                            lstOpp2.add(oppty);
                            System.debug('LS==========='+lstOpp);
                        }
                        
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='August' && currentPlanYearEndDate.year() == d.year() && currentMonth==10))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear+1, 3, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear+1, 1, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='September' && currentPlanYearEndDate.year() == d.year() && currentMonth==11))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear+1, 4, 30);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear+1, 2, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='October' && currentPlanYearEndDate.year() == d.year() && currentMonth==12))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear+1, 5, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear+1, 3, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='November' && currentPlanYearEndDate.year() < d.year() && currentMonth==1))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 6, 30);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 4, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='December' && currentPlanYearEndDate.year() < d.year() && currentMonth==2 && currentYearIsLeapYear==false))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 7, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 5, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                    else if((isCurrentAndLastDateSame==true && yearEndMonth=='December' && currentPlanYearEndDate.year() < d.year() && currentMonth==2 && currentYearIsLeapYear==true))
                    {
                        Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 7, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 5, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                        
                    }
                	// Delete it later
              /*  else if(yearEndMonth=='March')
                {
                    Opportunity oppty = new Opportunity();
                        oppty.Name ='Pension - 5500 Tax Prep';
                        oppty.AccountId = e.Primary_Client__c;
                        oppty.RecordTypeId = tt[0].Id;
                        oppty.CloseDate = date.newInstance(currentYear, 10, 31);
                        oppty.Sale_Campaign__c = cId[0].id;
                        oppty.StageName = 'Qualification';
                        oppty.Pension_Due_Date_2__c = date.newInstance(currentYear, 8, 1);
                        oppty.Entity__c = e.Id;
                        lstOpp2.add(oppty);
                        System.debug('LS==========='+lstOpp);
                }*/
       
                                            
                
            }
            try
            {
                
                if(lstOpp2.size()>0)
                {
                    insert lstOpp2;
                }
              
            }
            catch (Exception ex)
            {
                System.Debug('Insert failed ' + ex);
                
            }
            
            if(lstOpp2.size()>0)
            {
                for(Opportunity op:lstOpp2)
                {
                    SaleEntity__c saleEntity = new SaleEntity__c();
                    saleEntity.Opportunity__c=op.Id;
                    saleEntity.Entity__c=op.Entity__c;
                    saleEntity.Name = [Select name from entities__c where id=:op.Entity__c]?.name;
                    lstSaleEntity2.add(saleEntity);
                }
                
                try
                {
                    if(lstSaleEntity2.size()>0)
                    {
                        insert lstSaleEntity2;
                    }
                }
                catch (Exception ex)
                {
                    System.Debug('Sales Entity Junction Record failed ' + ex);
                    
                }
                
            }
            
            if(lstOpp2.size()>0)
            {
                for(Opportunity opp:[Select id,name from Opportunity where id IN: lstOpp2])
                {
                    OpportunityLineItem OLI2 = new OpportunityLineItem();
                    // SaleEntity__c saleEntity = new SaleEntity__c();
                    OLI2.OpportunityId = opp.Id; //Opportunity Id has to be assigned
                    //OLI.Service_Name__c = 'Pension - Annual Maintenance';
                    OLI2.Product2Id = (pdTaxPrep.size() > 0) ? pdTaxPrep[0].id : null;
                    OLI2.PricebookEntryId = (pbeTaxPrep.size() > 0) ? pbeTaxPrep[0].id : null;
                    //OLI2.UnitPrice = 675;
                    // OLI2.ListPrice = 500;
                    //OLI2.Discount = 175;
                    OLI2.Quantity = 1;
                    OLI2.UnitPrice = (pbeTaxPrep.size() > 0) ? pbeTaxPrep[0].UnitPrice : null;
                    lstOLI2.add(OLI2);
                }
                
                try
                {
                    if(lstOLI2.size()>0)
                    {
                        insert lstOLI2;
                        /*for(OpportunityLineItem opptyItem:[Select id,name,UnitPrice from OpportunityLineItem where id IN: lstOLI2])
{
opptyItem.TotalPrice=675;
// opptyItem.Discount=175;
lstOLI.add(opptyItem);

}
update lstOLI;*/
                        
                    }
                }
                catch (Exception ex)
                {
                    System.Debug('OLI Insertion failed ' + ex);
                    
                }
                
                
            }
           
        }
        
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }
    global void execute(SchedulableContext SC) 
    {
        //  database.executebatch(new BatchableSaleCreationEntity(null),10);
        database.executebatch(new PensionMonthEndCrtAdminSales(),15);
    }
    
}