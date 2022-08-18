/*-------------------------------------------------
 * Class Name:   EntityRenewalSalesHelper
 * Author:       Moiz Ahmad
 * Description:  Create RA and State Renewal Sales
 *               when an entity is created with 
 *               Registered Agent Service as 'NWRA'
--------------------------------------------------*/

public class EntityRenewalSalesHelper {
    private static Map<ID, Schema.RecordTypeInfo> entityRecordTypeMap = Schema.getGlobalDescribe().get('Entities__c').getDescribe().getRecordTypeInfosById();
    private static Map<String, Schema.RecordTypeInfo> saleRecordTypeMap = Schema.getGlobalDescribe().get('Opportunity').getDescribe().getRecordTypeInfosByName();
    private static Map<ID, Schema.RecordTypeInfo> saleRecordTypeMapById = Schema.getGlobalDescribe().get('Opportunity').getDescribe().getRecordTypeInfosById();
    private static final string QUALIFICATION = 'Qualification'; 
    private static final string STATE_RENEWAL = 'State Renewal';
    private static final string STANDARD_RENEWAL = 'Standard Renewal';
    private static final string STATIC_DATE = 'Static';
    private static final string LAST_DAY_OF_ORG_DATE_MONTH ='Last day of Org Date Month';
    private static final string ADD_YEAR ='Add a Year';
    private static final String NWRA= 'NWRA';
    private static final Map<String,PricebookEntry> priceBookEntriesMap = new Map<String,PricebookEntry>();
    private static final Map<String,Campaign> campaignsMap = new Map<String,Campaign>();
    
    /*-------------------------------------------------
     * Method Name:   createRenewalSales
     * Author:        Moiz Ahmad
     * Description:   Filter out entities with registered agent 
     *                as 'NWRA' and Create RA and
     *                State Renewal Sales
    --------------------------------------------------*/
    public static void createRenewalSales(List<Entities__c> newList){
        
        Map<String,Entity_Sales_Renewal_Settings__mdt> mdMapWithSaleType = new Map<String,Entity_Sales_Renewal_Settings__mdt>(); 
        Entity_Sales_Renewal_Settings__mdt renewalSetting = new Entity_Sales_Renewal_Settings__mdt();

        String entityRecordTypeName ='';
        List<Opportunity> newSales = new List<Opportunity>();
        List<Entities__c> entList = new List<Entities__c>();
        Map<Id,Entities__c> mEntities = new Map<Id,Entities__c>();
        
        Set<String> sStates = new Set<String>();
        Set<String> PriceBookNames = new Set<String>();
        Set<String> ProductNames = new Set<String>();
        Set<String> campaignNames = new Set<String>();
        List<String> priceBookEntryList = new List<String>();
        
        try{
            
            for(Entities__c ent:newList){
                if(ent.Registered_Agent_Services__c ==NWRA && ent.Organization_State__c!=null){
                    entList.add(ent);
                    sStates.add(ent.Organization_State__c);
                }
            }
            if(!entList.isEmpty()){
                //Add the new fields in query
                for(Entity_Sales_Renewal_Settings__mdt md : [select Label,Organizational_State__c,Entity_Type__c,Date_RA__c,Date_Type_RA__c,
                                                             Date_State__c,Date_Type_State__c,RA_Fee_Price__c,Sale_Campaign_Name_State__c,
                                                             Pricebook_Entry_Name_RA__c,Chargent_Gateway_Id__c,Sale_Campaign_Name_RA__c,
                                                             Pricebook_Entry_Name_State__c,Annual_List_Price__c,State_Code__c,
                                                             Combine_Sales_if_within_3_months__c
                                                             from Entity_Sales_Renewal_Settings__mdt where 
                                                             Organizational_State__c IN :sStates])
                {
                    mdMapWithSaleType.put(md.Organizational_State__c+'-'+md.Entity_Type__c,md);
                    if(String.isNotBlank(md.Pricebook_Entry_Name_RA__c)){
                        priceBookEntryList = md.Pricebook_Entry_Name_RA__c.split('-');
                        if(priceBookEntryList.size()>1){
                            PriceBookNames.add(priceBookEntryList[0]);
                            ProductNames.add(priceBookEntryList[1]);
                        }
                    }
                    if(String.isNotBlank(md.Pricebook_Entry_Name_State__c)){
                        priceBookEntryList = md.Pricebook_Entry_Name_State__c.split('-');
                        if(priceBookEntryList.size()>1){
                            PriceBookNames.add(priceBookEntryList[0]);
                            ProductNames.add(priceBookEntryList[1]);
                        }
                    }
                    if(String.isNotBlank(md.Sale_Campaign_Name_State__c)){
                        campaignNames.add(md.Sale_Campaign_Name_State__c);
                    }
                    if(String.isNotBlank(md.Sale_Campaign_Name_RA__c)){
                        campaignNames.add(md.Sale_Campaign_Name_RA__c);
                    }
                }
                
                if(!PriceBookNames.isEmpty() && !ProductNames.isEmpty()){
                    for(PricebookEntry pbEntry:[Select Id,Name,Product2Id,Pricebook2Id,Product2.Name,Pricebook2.Name from PricebookEntry where 
                                                         Pricebook2.Name IN :PriceBookNames and Product2.Name IN :ProductNames LIMIT 5000]){
                        priceBookEntriesMap.put(pbEntry.Pricebook2.Name+'-'+pbEntry.Product2.Name,pbEntry);
                    }
                }
                if(!campaignNames.isEmpty()){
                    for(Campaign camp:[Select Id,Name from Campaign where Name IN :campaignNames LIMIT 5000]){
                        campaignsMap.put(camp.Name,camp);
                    }
                }
                if(!mdMapWithSaleType.isEmpty()){
                    for(Entities__c ent : entList)
                    {
                        entityRecordTypeName = entityRecordTypeMap.get(ent.RecordTypeId)?.getName();
                        
                        if(mdMapWithSaleType.containsKey(ent.Organization_State__c+'-'+entityRecordTypeName)){
                            renewalSetting = mdMapWithSaleType.get(ent.Organization_State__c+'-'+entityRecordTypeName);
                            newSales.addAll(createSalesFromMetadata(ent,renewalSetting));
                            mEntities.put(ent.Id,ent);
                        }                    
                    }
                    if(!newSales.isEmpty()){
                        insert newSales;
                        createSaleEntities(newSales,mEntities);
                        createServiceItems(newSales, mdMapWithSaleType);
                    }
                }
                
            }   
        }catch(Exception e){
            system.debug('Error = '+e.getLineNumber()+' '+e.getMessage());
        }   
    }
    
    /*-------------------------------------------------
     * Method Name:   createSalesFromMetadata
     * Author:        Moiz Ahmad
     * Description:   Create RA and State Renewal Sales
     *                based on metadata settings
    --------------------------------------------------*/
    private static List<Opportunity> createSalesFromMetadata(Entities__c entity,Entity_Sales_Renewal_Settings__mdt renewalSetting){
        List<Opportunity> newSales = new List<Opportunity>();
        List<String> saleTypes = new List<String>();
        Opportunity opp;
        //Date checkDate=calculateDatewithin3Months(renewalSetting);
        try{
           
            Boolean isDatewithin3Months = renewalSetting.Combine_Sales_if_within_3_months__c && 
                                        isStateDatewithin3Months(entity.Organizational_Date__c,renewalSetting.Date_State__c);
            
            if(renewalSetting.Annual_List_Price__c !=null){
                opp = new Opportunity();
                opp.RecordTypeId = saleRecordTypeMap.get(STATE_RENEWAL).getRecordTypeId();
                opp.Entity__c = entity.Id;
                opp.AccountId = entity.Primary_Client__c;
                opp.CloseDate = calculateCloseDate(renewalSetting.Date_State__c,renewalSetting.Date_Type_State__c,entity);
                opp.Renewal_Effective_Date__c = opp.CloseDate.addDays(1);
                opp.Renewal_End_Date__c = opp.CloseDate.addYears(1);
                opp.Pricebook2Id = priceBookEntriesMap.get(renewalSetting.Pricebook_Entry_Name_State__c)?.PriceBook2Id;
                opp.StageName = QUALIFICATION;
                opp.Made_by_Automation__c = true;
                opp.ChargentSFA__Gateway__c = renewalSetting.Chargent_Gateway_Id__c;
                opp.Sale_Campaign__c = campaignsMap.get(renewalSetting.Sale_Campaign_Name_State__c)?.Id;
                //if(opp.CreatedDate<=checkDate.addMonths(3) && opp.CreatedDate>=checkDate.addMonths(3)){
                if(!isDatewithin3Months){  
                    opp.Name = 'State Renewal '+renewalSetting.State_Code__c;
                }
                else{
                    opp.Name = 'RA and State Renewal '+renewalSetting.State_Code__c;
                }
                newSales.add(opp);
           }
          
           if(!isDatewithin3Months && renewalSetting.RA_Fee_Price__c!=null){
                opp = new Opportunity();
                opp.RecordTypeId = saleRecordTypeMap.get(STANDARD_RENEWAL).getRecordTypeId();
                opp.Entity__c = entity.Id;
                opp.AccountId = entity.Primary_Client__c;
                opp.CloseDate = calculateCloseDate(renewalSetting.Date_RA__c,renewalSetting.Date_Type_RA__c, entity);
                opp.Renewal_Effective_Date__c = opp.CloseDate.addDays(1);
                opp.Renewal_End_Date__c = opp.CloseDate.addYears(1);
                opp.Pricebook2Id = priceBookEntriesMap.get(renewalSetting.Pricebook_Entry_Name_RA__c)?.PriceBook2Id;
                opp.StageName = QUALIFICATION;
                opp.Made_by_Automation__c = true;
                opp.ChargentSFA__Gateway__c = renewalSetting.Chargent_Gateway_Id__c;
                opp.Sale_Campaign__c = campaignsMap.get(renewalSetting.Sale_Campaign_Name_RA__c)?.Id;
                opp.Name = 'RA Renewal '+ renewalSetting.State_Code__c;
                
                newSales.add(opp);
           }
            
            
        }catch(Exception e){
            system.debug('Error = '+e.getLineNumber()+' '+e.getMessage());
        }
        return newSales;
    }
        /*-------------------------------------------------
     * Method Name:   isDatewithin3Months
     * Author:        Moiz Ahmad
     * Description:  Parsing State Date from string to
     * 				 Date.
    --------------------------------------------------*/
    private static Boolean isStateDatewithin3Months(Date orgDate,String dateStr){
        if(orgDate == null){
            return false;
        }
        dateStr = dateStr+'/'+String.valueOf(Date.today().year());
        Date stateCloseDate = Date.parse(dateStr); 
        if(orgDate >stateCloseDate){
            stateCloseDate = stateCloseDate.addYears(1);
        }
        dateStr = dateStr+'/'+String.valueOf(Date.today().year());
        return orgDate.addMonths(3) >= stateCloseDate;

    }
    
    /*-------------------------------------------------
     * Method Name:   calculateCloseDate
     * Author:        Moiz Ahmad
     * Description:   Calculate Close Dates for RA and State 
     *                Renewal Sales based on metadata settings
    --------------------------------------------------*/
    private static Date calculateCloseDate(String dateStr,String dateType,Entities__c ent){
        Date todaysDate = Date.today();
        Date closeDate = Date.today();
        
        try{
            if(STATIC_DATE.equals(dateType)){
                dateStr = dateStr+'/'+String.valueOf(todaysDate.addYears(1).year());
                closeDate = Date.parse(dateStr);   
            }
            else if(LAST_DAY_OF_ORG_DATE_MONTH.equals(dateType) && ent.Organizational_Date__c!=null){
                closeDate =  ent.Organizational_Date__c.addYears(1).addMonths(1).toStartOfMonth().addDays(-1);        
            }else if(ADD_YEAR.equals(dateType) &&  ent.Organizational_Date__c!=null){
                closeDate = ent.Organizational_Date__c.addYears(1);
            }
        }catch(Exception e){
            system.debug('Error = '+e.getLineNumber()+' '+e.getMessage());
        }
        return closeDate;
    }
    
    /*-------------------------------------------------
     * Method Name:   createSaleEntities
     * Author:        Moiz Ahmad
     * Description:   Create Sale Entities
    --------------------------------------------------*/
    private static void createSaleEntities(List<Opportunity> newSales,Map<Id,Entities__c> mEntities){
        List<SaleEntity__c> saleEntities = new List<SaleEntity__c>();
        SaleEntity__c saleEntity;
        try{
            for(Opportunity opp:newSales){
                saleEntity = new SaleEntity__c();
                saleEntity.Entity__c = opp.Entity__c;
                saleEntity.Opportunity__c = opp.Id;
                saleEntity.Name = mEntities.get(opp.Entity__c)?.Name;
                saleEntities.add(saleEntity);
            }
            
            if(!saleEntities.isEmpty()){
                insert saleEntities;
            }
        }catch(Exception e){
            system.debug('Error = '+e.getLineNumber()+' '+e.getMessage());
        }
    }
    
    /*-------------------------------------------------
     * Method Name:   createServiceItems
     * Author:        Moiz Ahmad
     * Description:   Create Configured Service Items for 
     *                RA and State Renewal Sales
    --------------------------------------------------*/
    private static void createServiceItems(List<Opportunity> newSales, Map<String,Entity_Sales_Renewal_Settings__mdt> mdMap){
        List<OpportunityLineItem> oppProducts = new List<OpportunityLineItem>();
        OpportunityLineItem oppLineItem = new OpportunityLineItem();
        Entity_Sales_Renewal_Settings__mdt renewalSetting;
        Boolean isDatewithin3Months = false;
        try{
            for(Opportunity opp:[Select Id,RecordType.Name,Pricebook2Id,Entity__c,Entity__r.Organization_State__c,
                                 Entity__r.Organizational_Date__c,
                                 Entity__r.RecordType.Name from Opportunity where Id IN:newSales LIMIT 5000])
            {
                renewalSetting = mdMap.get(opp.Entity__r.Organization_State__c+'-'+opp.Entity__r.RecordType.Name);
                if(renewalSetting!=null)
                {
                    isDatewithin3Months = renewalSetting.Combine_Sales_if_within_3_months__c &&  
                    isStateDatewithin3Months(opp.Entity__r.Organizational_Date__c,renewalSetting.Date_State__c);
                    if(renewalSetting.RA_Fee_Price__c!=null && 
                    priceBookEntriesMap.containsKey(renewalSetting.Pricebook_Entry_Name_RA__c) &&
                    (isDatewithin3Months || (!isDatewithin3Months  && 
                    opp.RecordTypeId == saleRecordTypeMap.get(STANDARD_RENEWAL).getRecordTypeId())))
                    {
                        
                        oppLineItem = new OpportunityLineItem(Quantity = 1,OpportunityId = opp.Id);
                        oppLineItem.PricebookEntryId = priceBookEntriesMap.get(renewalSetting.Pricebook_Entry_Name_RA__c).Id;
                        oppLineItem.UnitPrice = renewalSetting?.RA_Fee_Price__c;
                        oppProducts.add(oppLineItem);
                    }

                    if(renewalSetting.Annual_List_Price__c!=null && 
                    priceBookEntriesMap.containsKey(renewalSetting.Pricebook_Entry_Name_State__c)&&
                    (isDatewithin3Months || (!isDatewithin3Months  && 
                        opp.RecordTypeId == saleRecordTypeMap.get(STATE_RENEWAL).getRecordTypeId())))
                    {
                        
                        oppLineItem = new OpportunityLineItem(Quantity = 1,OpportunityId = opp.Id);
                        oppLineItem.PricebookEntryId = priceBookEntriesMap.get(renewalSetting.Pricebook_Entry_Name_State__c).Id;
                        oppLineItem.UnitPrice = renewalSetting?.Annual_List_Price__c;
                        oppProducts.add(oppLineItem);
                    }

               }
                
            }
            if(!oppProducts.isEmpty()){
                insert oppProducts;
            }
        }catch(Exception e){
            system.debug('Error = '+e.getLineNumber()+' '+e.getMessage());
        }
    }
}