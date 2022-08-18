/**
* A controller class used to fetch and Insert Invoice data.
* 
* @author prateeks
* @version 1.0 - Mar 01, 2018
*/
public with sharing class PlatinumInvoiceController {
    Public List<Opportunity> invoiceList {get;set;}
    Public List<Opportunity> invoiceNumberList {get;set;}
    Public RecordType rTypeId {get;set;}
    Public List<Credit_Card_Detail__c> cardList {get;set;}
    Public User usObj{get;set;}
    Public String accId {get;set;}
    public String oppParamIds {get;set;}
    public static boolean run = true;
    
    //For Pagination
    private integer counterInvoice=0;   //to keep track of offset
    private integer list_sizeInvoice=15; //to set the page size to show the rows/records
    public integer total_sizeInvoice; //used to show user the total size of the list 
    Public string selectedPageInvoice{get;set{selectedPageInvoice=value;} }
    
    public PlatinumInvoiceController(ApexPages.StandardController controller) {
        oppParamIds = '';
        rTypeId=[SELECT Id, Name FROM RecordType where Name = :'Platinum Subscription' and SobjectType = 'Opportunity' LIMIT 1];
        usObj=[Select id,Username,AboutMe,Name,FirstName,LastName,Phone,ContactId,SmallPhotoUrl,FullPhotoUrl,AccountId,Email,Alias,ProfileId,Title,MobilePhone,LastLoginDate,CreatedDate,Client_Image__c,IsActive from User where Id=:UserInfo.getUserId() Limit 1];
        accId = usObj.AccountId;
        invoiceList = [SELECT Id, Name, Description, CloseDate, Renewal_Effective_Date__c, Renewal_End_Date__c, QB_Invoice_Number__c, Amount,ChargentSFA__Charge_Amount__c, Entity__r.Name, Due_Date__c, AccountId FROM Opportunity where Name != 'Case Opportunity' and AccountId = :usObj.AccountId and RecordTypeId != :rTypeId.Id and StageName = 'Qualification' and Amount > 0 and CloseDate <= NEXT_N_DAYS:364 ORDER BY CloseDate ASC];
        invoiceNumberList = [select Id, QB_Invoice__c,QB_Invoice_Number__c from Opportunity where AccountId = :usObj.AccountId];
        List<String> OpportunityInvoiceidss=new List<String>();
        for(Opportunity o: invoiceNumberList) {           
            // OpportunityInvoiceidss.add(o.QB_Invoice__c);
            OpportunityInvoiceidss.add(o.QB_Invoice_Number__c);
        }
        system.debug('== OpportunityInvoiceidss ==' + OpportunityInvoiceidss);
        String monthDays = '-05-01 00:00:00';
        String dts = System.Today().year()+monthDays;
        Datetime finalDates = Datetime.valueOf(dts);
        if(!test.isRunningTest()){
            Account cntName = [select Id, Name from Account where Id = :usObj.AccountId  limit 1];
            total_sizeInvoice=[Select count() FROM ChargentSFA__Transaction__c where Client__c = :cntName.Name and ChargentSFA__Response_Status__c = 'Approved' and CreatedDate >= LAST_N_YEARS:2];//set the total size in the constructor
        } else {
            total_sizeInvoice=[Select count() FROM ChargentSFA__Transaction__c where Invoice_Number__c IN :OpportunityInvoiceidss and ChargentSFA__Response_Status__c = 'Approved' and CreatedDate >= LAST_N_YEARS:2];//set the total size in the constructor  
        }
         
        system.debug('== total_sizeInvoice ==' + total_sizeInvoice);
        selectedPageInvoice='0';
        getBillingHistory();
        getcardList();
    }
    
    /**
* This method is used to get transaction history of all approved transaction.
* 
* @author prateeks
* @date Mar 22, 2018
*/
    public List<EntityWrapper> getBillingHistory() {
        List<EntityWrapper> listEntity = new  List<EntityWrapper>();
        if (selectedPageInvoice != '0'){
            counterInvoice = list_sizeInvoice * integer.valueOf(selectedPageInvoice) - list_sizeInvoice;
        }  
        String monthDay = '-05-01 00:00:00';
        String dt = System.Today().year()+monthDay;
        Datetime finalDate = Datetime.valueOf(dt);
        system.debug('== Current May Year==' + finalDate);
        invoiceNumberList = [select Id, QB_Invoice__c,QB_Invoice_Number__c,Entity__r.Name from Opportunity where AccountId = :usObj.AccountId];
        List<String> OpportunityInvoiceids=new List<String>();
        Map<String,String>  mapList = new Map<String,String>();
        system.debug('== invoiceNumberList ==='+ invoiceNumberList );
        for(Opportunity o: invoiceNumberList) {           
            OpportunityInvoiceids.add(o.QB_Invoice_Number__c);
            mapList.put(o.QB_Invoice_Number__c, o.Entity__r.Name);
        }
        if(!test.isRunningTest()){
            Account clientName = [select Id, Name from Account where Id = :usObj.AccountId  limit 1];
            
            // system.debug('=== OpportunityInvoiceids === ' + OpportunityInvoiceids);
            //List<ChargentSFA__Transaction__c> tnsList = [SELECT  Id, Name, Client__c,Invoice_Number__c, ChargentSFA__Amount__c, ChargentSFA__Response_Code__c, ChargentSFA__Response_Message__c, ChargentSFA__Response_Status__c, ChargentSFA__Type__c, Transaction_date__c, Sale_Type__c, CreatedDate, ChargentSFA__Gateway_Date__c  FROM ChargentSFA__Transaction__c where Invoice_Number__c IN :OpportunityInvoiceids and ChargentSFA__Response_Status__c = 'Approved' and CreatedDate >= LAST_N_YEARS:2 ORDER BY ChargentSFA__Gateway_Date__c ASC limit :list_sizeInvoice offset :counterInvoice];          
            List<ChargentSFA__Transaction__c> tnsList = [SELECT Id, Name, Client__c,Invoice_Number__c, ChargentSFA__Amount__c, ChargentSFA__Response_Code__c, ChargentSFA__Response_Message__c, ChargentSFA__Response_Status__c, ChargentSFA__Type__c, Transaction_date__c, Sale_Type__c, CreatedDate, ChargentSFA__Gateway_Date__c  FROM ChargentSFA__Transaction__c where Client__c = :clientName.Name and ChargentSFA__Response_Status__c = 'Approved' and CreatedDate >= LAST_N_YEARS:2 ORDER BY ChargentSFA__Gateway_Date__c ASC limit :list_sizeInvoice offset :counterInvoice];          
            system.debug('=== tnsList === ' + tnsList.size());
            
            for(ChargentSFA__Transaction__c chargentTransaction : tnsList){
                system.debug('=== entitylist === ' + mapList.get(chargentTransaction.Invoice_Number__c));
                listEntity.add(new EntityWrapper(chargentTransaction,mapList.get(chargentTransaction.Invoice_Number__c)));    
            }
        }
        return listEntity; 
    }
    /**
* This method is used to update opportunities and call chargent payment method.
* 
* @author prateeks
* @date Mar 20, 2018
*/
    @RemoteAction
    public static String MyOpportunities(String opId,String crdId){
        String myString = opId;
        String myCardId = crdId;
        Id cardId = Id.valueOf(myCardId);
        Credit_Card_Detail__c cardDetails = [SELECT Id, Name, Card_Month__c, Card_Year__c, Card_Number__c, Card_Security__c, Card_Type__c, Account__c, Credit_Card_Notes__c FROM Credit_Card_Detail__c where Id = :cardId LIMIT 1];
        String allOppId = '';
        //Id gatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name = :'AuthorizeNetTestPayment' and ChargentBase__Active__c = true].Id; //For Sandbox
        Id gatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name = :'Platinum' and ChargentBase__Active__c = true Limit 1].Id; //For Production
        if(myString.contains(',')){ 
            String[] commaSeperatedOppId = New String[]{};
                List<String> myArray = myString.split(',');
            for (String o : myArray) {
                Id oppId = Id.valueOf(o);  
                Opportunity op = new Opportunity(Id = oppId);
                op.ChargentSFA__Card_Type__c = cardDetails.Card_Type__c;
                op.ChargentSFA__Card_Year__c = cardDetails.Card_Year__c;
                op.ChargentSFA__Card_Month__c = cardDetails.Card_Month__c;
                op.ChargentSFA__Card_Name__c = cardDetails.Name;
                op.ChargentSFA__Card_Number__c = cardDetails.Card_Number__c;
                op.ChargentSFA__Gateway__c = gatewayId;
                try{
                    update op;
                    commaSeperatedOppId.add(oppId);
                }catch(exception e) {
                    system.debug('Chargent Exception === ' + e);
                }
            }
            allOppId = string.join(commaSeperatedOppId,',');
        } else {
            Id myArray = Id.valueOf(myString);
            Opportunity op = new Opportunity(Id = myArray);
            op.ChargentSFA__Card_Month__c = cardDetails.Card_Month__c;
            op.ChargentSFA__Card_Name__c = cardDetails.Name;
            op.ChargentSFA__Card_Number__c = cardDetails.Card_Number__c;
            op.ChargentSFA__Card_Type__c = cardDetails.Card_Type__c;
            op.ChargentSFA__Card_Year__c = cardDetails.Card_Year__c;
            op.ChargentSFA__Gateway__c = gatewayId;
            try{
                update op;
            }catch(exception e) {
                system.debug('Chargent Exception === ' + e);
            }
            allOppId = myArray;
        }        
        
        return allOppId;
    }
    
    /**
* This method is used payment of multiple opportunities.
* 
* @author prateeks
* @date Apr 27, 2018
*/    
    @RemoteAction
    public static void Charge(String oppId)
    {
        String allOpp = oppId;
        String transVal = '';
        Date currentDate=date.today();
        String approver = '';
        System.debug('*** DP entered charge function oppId= '+oppId);
        try
        {  
            Opportunity lstOpp = [SELECT Id, RecordTypeId, AccountId, QB_Invoice_Number__c, ChargentSFA__Card_Number__c, Name FROM Opportunity where Id = :oppId Limit 1];
            system.debug('Lstopp'+lstOpp.AccountId);
            Account acId = [SELECT Id, Name, Accounting_Coordinators__c,OwnerId FROM Account where Id = :lstOpp.AccountId LIMIT 1];
            Contact primaryCon = [SELECT Id From Contact WHERE Account_Roles__c = 'Primary Contact' AND AccountId = :lstOpp.AccountId LIMIT 1];
            RecordType tskRecTyp = [SELECT Id, Name, Description, IsActive, SobjectType FROM RecordType where Name = 'Call' and SobjectType = 'Task' LIMIT 1];
            RecordType rId = [SELECT Id, Name FROM RecordType where Id = :lstOpp.RecordTypeId LIMIT 1];
            // approver = 'Edward Lee';
           approver = 'Christian Abraham';
            system.debug('rId Name = ' + rId.Name); 
            List<String> taskCreatedOnInvoice = new List<String>();
            if(taskCreatedOnInvoice.size() == 0 || !(taskCreatedOnInvoice.contains(lstOpp.QB_Invoice_Number__c)))
            {
                Task tsk = new Task();
                system.debug('accountingCoordinator == '+ approver);
                //system.debug('record type Name == '+ rId.Name);
                Id usr = [Select Id,Name from User where Name = :approver Limit 1].Id; 
                    tsk.WhatId = lstOpp.Id;
            		tsk.WhoId = primaryCon.id;
                    tsk.RecordTypeId = tskRecTyp.Id;
                    tsk.Subject = 'Platinum Portal Manual Payment';
                    tsk.OwnerId = usr;
            		tsk.Description = acId.Name + ' paid invoice #' + lstOpp.QB_Invoice_Number__c + ' for their ' + lstopp.Name + ' sale.' +
                        ' They requested we use the card ending in: ' + lstOpp.ChargentSFA__Card_Number__c.right(4) + '. Sale link: https://andersonadvisors.lightning.force.com/lightning/r/Opportunity/' + lstOpp.Id +'/view';
            		//tsk.Opportunity__c = lstOpp.Name;;
                    tsk.ActivityDate = system.today()+1;
                    tsk.Status = 'open';
                    tsk.Priority = 'Normal';
                //}
                system.debug('DP Task created = '+tsk);
                insert tsk;
                taskCreatedOnInvoice.add(lstOpp.QB_Invoice_Number__c);
              system.debug('DP Task created after = '+tsk);
            }
            }  
        
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }            
    }
    public static List<Opportunity> getUpdatedInvoice() {
        try
        {  
            RecordType rTId=[SELECT Id, Name FROM RecordType where Name = :'Platinum Subscription' and SobjectType = 'Opportunity' LIMIT 1];
            User usrObj=[Select id,Username,AboutMe,Name,FirstName,LastName,Phone,ContactId,SmallPhotoUrl,FullPhotoUrl,AccountId,Email,Alias,ProfileId,Title,MobilePhone,LastLoginDate,CreatedDate,Client_Image__c,IsActive from User where Id=:UserInfo.getUserId() Limit 1];
            List<Opportunity> invoiceList = [SELECT Id, Name, Description,Amount,ChargentSFA__Charge_Amount__c, Entity__r.Name, Due_Date__c,CloseDate, Renewal_Effective_Date__c, Renewal_End_Date__c, QB_Invoice_Number__c, AccountId FROM Opportunity where Name != 'Case Opportunity' and AccountId = :usrObj.AccountId and RecordTypeId != :rTId.Id and StageName = 'Qualification' and Amount > 0 and CloseDate <= NEXT_N_DAYS:364 ORDER BY CloseDate ASC];
            return invoiceList;
        } 
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
        }  
    }
    
    /**
* This method is used to show card Lists.
* 
* @author prateeks
* @date Aug 29, 2018
*/    
    public List<Credit_Card_Detail__c> getcardList() {
        cardList = [SELECT Id, Name,Billing_Zip_Postal__c,Card_Month__c, Card_Year__c, Card_Number__c, Card_Security__c, Card_Type__c, Account__c, Credit_Card_Notes__c,Platinum_Subscription_Card__c FROM Credit_Card_Detail__c where Account__c = :usObj.AccountId];
        return cardList;
    }
    
    /**
* This method is used to rerender card Lists.
* 
* @author prateeks
* @date Aug 29, 2018
*/    
    public pageReference CardCall(){
        getcardList();
        return null;
    }    
    /**
* This method is used to rerender invoice Lists.
* 
* @author prateeks
* @date Aug 29, 2018
*/ 
    public pageReference TestCall(){
        getUpdatedInvoice();
        return null;
    }
    //Getting the fields from object
    public String ObjectFields(String ObjectNameval){
        string fieldsVal = '';
        SObjectType objToken = Schema.getGlobalDescribe().get(ObjectNameval);    
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap();
        Set<String> fieldSet = fields.keySet();
        for(string f : fieldSet){
            fieldsVal += f +',';
        }   
        if(fieldsVal.endsWith(','))
            fieldsVal= fieldsVal.substring(0,fieldsVal.length()-1);
        
        /*Adding , string after every fields api name.
e.g  fieldsVal-variable will contains the value like -Name,pincode__c,CreateDate etc.
*/
        return fieldsVal;
    }
    
    
    /**
* This method is used to save credit card details of logged in user.
* 
* @author prateeks
* @date Mar 01, 2018
*/
    
    @RemoteAction
    public static Boolean saveCardDetails( String zipcodeVal, String nameVal, String typeVal,String cardnumberVal, String expiryMonthVal, String expiryYearVal, String cvvVal, String noteVal, Id accId, Boolean isChk) {   
        try { 
           
            
            Credit_Card_Detail__c ccd = new Credit_Card_Detail__c();
            ccd.Name = nameVal;
            ccd.Card_Type__c = typeVal;
            ccd.Card_Number__c = cardnumberVal;
            ccd.Card_Month__c = expiryMonthVal;
            ccd.Card_Year__c = expiryYearVal; 
            ccd.Billing_Zip_Postal__c = zipcodeVal;
            ccd.Card_Security__c = cvvVal;
            ccd.Credit_Card_Notes__c = noteVal;
            ccd.Account__c = accId;
            ccd.Platinum_Subscription_Card__c = isChk;
            ccd.Mail_Check__c = 1;
            insert ccd;
            return true;
        }catch(exception e) {
            system.debug('exception === ' + e);
            return false;
        }
    }
    
    /**
* This method is used to get the credit card details of logged in user.
* 
* @author Ranjitk
* @date Mar 26, 2018
*/ 
    @RemoteAction
    public static List<Credit_Card_Detail__c> getCardDetailsId(String cardId) {   
        try {
            List<Credit_Card_Detail__c>   editCardList  = [SELECT Id, Name,Billing_Zip_Postal__c, Card_Month__c, Card_Year__c, Card_Number__c, Card_Security__c, Card_Type__c, Account__c, Credit_Card_Notes__c,Platinum_Subscription_Card__c FROM Credit_Card_Detail__c where Id =: cardId];  
            return editCardList;
        }catch(exception e) {
            system.debug('exception === ' + e);
            return null;
        }
    }
    
    
    /**** This method is used to delete the  credit card**/
    
    @RemoteAction
    public static Boolean deleteCard(Id cardId) {
        try{
            Credit_Card_Detail__c ccd = [Select Id from Credit_Card_Detail__c where id =: cardId];
        	delete ccd;
            return true;
        }
        catch(exception e) {
            system.debug('exception === ' + e);
            return false;
        }
    }
    
    /**
* This method is used to update edit credit card details of logged in user.
* 
* @author Ranjitk
* @date Mar 26, 2018
*/
    @RemoteAction
    public static Boolean saveEditCardDetails(String zipcodeVal, String nameVal, String typeVal,String cardnumberVal, String expiryMonthVal, String expiryYearVal, String cvvVal, String noteVal, Id accId,Id cardId, Boolean isChk){
        try {
            
            Credit_Card_Detail__c ccd = new Credit_Card_Detail__c();
            ccd.Name = nameVal;
            ccd.Card_Type__c = typeVal;
            ccd.Card_Number__c = cardnumberVal;
            ccd.Billing_Zip_Postal__c = zipcodeVal;
            ccd.Card_Month__c = expiryMonthVal;
            ccd.Card_Year__c = expiryYearVal;        
            ccd.Card_Security__c = cvvVal;
            ccd.Credit_Card_Notes__c = noteVal;
            ccd.Account__c = accId;
            ccd.Id = cardId;
            ccd.Platinum_Subscription_Card__c = isChk;
            ccd.Mail_Check__c = 1;
            update ccd;
            // }
            return true;
        }catch(exception e) {
            system.debug('exception === ' + e);
            return false;
        }
    }
    
    
    //Pagination Script
    // Invoice Pagination Methods Start
    /**
* This method is used for pagination numbering.
* 
* @author prateeks
* @date Apr 02, 2018
* @return <code>All Buttons for pagination</code>
*/
    public Component.Apex.pageBlockButtons getInvoicePaginationButtons() {
        
        //the reRender attribute is a set NOT a string
        Set<string> theInvoiceSet = new Set<string>();
        theInvoiceSet.add('myPanell');
        theInvoiceSet.add('myInvoiceButtons');
        
        integer totalPagesInvoice;
        if (math.mod(total_sizeInvoice, list_sizeInvoice) > 0) {
            totalPagesInvoice = total_sizeInvoice/list_sizeInvoice + 1;
        } else {
            totalPagesInvoice = (total_sizeInvoice/list_sizeInvoice);
        }
        
        integer currentPageInvoice;        
        if (selectedPageInvoice == '0') {
            currentPageInvoice = counterInvoice/list_sizeInvoice + 1;
        } else {
            currentPageInvoice = integer.valueOf(selectedPageInvoice);
        }
        
        Component.Apex.pageBlockButtons pbInvoiceButtons = new Component.Apex.pageBlockButtons();        
        pbInvoiceButtons.location = 'top';
        pbInvoiceButtons.id = 'myInvoicePBButtons';
        
        Component.Apex.outputPanel opInvoicePanel = new Component.Apex.outputPanel();
        opInvoicePanel.id = 'myInvoiceButtons';
        
        //the Previous button will alway be displayed
        Component.Apex.commandButton b13 = new Component.Apex.commandButton();
        b13.expressions.action = '{!PreviousInvoice}';
        b13.title = 'Prev';
        b13.value = 'Prev';
        b13.expressions.disabled = '{!disablePreviousInvoice}';        
        b13.reRender = theInvoiceSet;
        
        opInvoicePanel.childComponents.add(b13);        
        
        for (integer k=0;k<totalPagesInvoice;k++) { 
            Component.Apex.commandButton btns = new Component.Apex.commandButton();
            btns.title = 'Page ' + string.valueOf(k+1) + ' ';
            btns.value = ' ' + string.valueOf(k+1) + ' ';
            btns.rendered = false;
            
            if (   (k+1 <= 5 && currentPageInvoice < 5)
                || (k+1 >= totalPagesInvoice-4 && currentPageInvoice > totalPagesInvoice-4)
                || (k+1 >= currentPageInvoice-2 && k+1 <= currentPageInvoice+2))
            {
                btns.rendered = true;
            }
            if (k+1==currentPageInvoice) {
                btns.disabled = true; 
                btns.style = 'color: #fff; background: #2a4467; border: 1px solid #2a4467;';
            }  
            
            btns.onclick = 'queryByPageInvoice(\''+string.valueOf(k+1)+'\');return false;';
            
            opInvoicePanel.childComponents.add(btns);
            
            if (k+1 == 1 || k+1 == totalPagesInvoice-1) { //put text after page 1 and before last page
                Component.Apex.outputText text = new Component.Apex.outputText();
                text.value = '';        
                opInvoicePanel.childComponents.add(text);
            } 
            
        }
        
        //the Next button will alway be displayed
        Component.Apex.commandButton b22 = new Component.Apex.commandButton();
        b22.expressions.action = '{!NextInvoice}';
        b22.title = 'Next';
        b22.value = 'Next';
        b22.expressions.disabled = '{!disableNextInvoice}';        
        b22.reRender = theInvoiceSet;
        opInvoicePanel.childComponents.add(b22);
        //add all buttons as children of the outputPanel                
        pbInvoiceButtons.childComponents.add(opInvoicePanel);
        return pbInvoiceButtons;
        
    }    
    
    /**
* This method is used for refereshing grid of buttons in pagination.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public PageReference refreshGridInvoice() { //user clicked a page number
        return null;
    }
    
    /**
* This method is used to counter value of previuos page.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public PageReference PreviousInvoice() { //user clicked previous button
        selectedPageInvoice = '0';        
        counterInvoice -= list_sizeInvoice;
        return null;
    }
    
    /**
* This method is used to increased counter value for next page.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public PageReference NextInvoice() { //user clicked next button        
        selectedPageInvoice = '0';        
        counterInvoice += list_sizeInvoice;
        return null;
    }
    
    /**
* This method is used to counter value of last page.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public PageReference End() { //user clicked end
        selectedPageInvoice = '0';
        counterInvoice = total_sizeInvoice - math.mod(total_sizeInvoice, list_sizeInvoice);
        return null;
    }
    
    /**
* This method is used to disable previuos button.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public Boolean getDisablePreviousInvoice() { //this will disable the previous and beginning buttons
        if (counterInvoice>0) return false; else return true;
    }
    
    /**
* This method is used to disable next button.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public Boolean getDisableNextInvoice() { //this will disable the next and end buttons
        if (counterInvoice + list_sizeInvoice < total_sizeInvoice) return false; else return true;
    }
    
    /**
* This method is used to get total size of entity records.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public Integer getTotal_sizeInvoice() {
        return total_sizeInvoice;
    }
    
    /**
* This method is used to current pagenumber in pagination.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public Integer getPageNumberInvoice() {
        return counterInvoice/list_sizeInvoice + 1;
    }
    public Integer getCountInvoice() {
        return counterInvoice;
    }
    
    /**
* This method is used to get total pages for pagination.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public Integer getTotalPagesInvoice() {
        if (math.mod(total_sizeInvoice, list_sizeInvoice) > 0) {
            return total_sizeInvoice/list_sizeInvoice + 1;
        } else {
            return (total_sizeInvoice/list_sizeInvoice);
        }
    }
    
    /**
* This method is used to get list size from visualforce page.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public Integer getListSizeInvoice() {
        return list_sizeInvoice;
    }
    
    /**
* This method is used to set list size for limiting records from visualforce page.
* 
* @author prateeks
* @date Apr 02, 2018
*/
    public void setListSizeInvoice(Integer list_sizeInvoice) {
        this.counterInvoice = counterInvoice;
        this.list_sizeInvoice = list_sizeInvoice;
    }
    public class EntityWrapper{
        public ChargentSFA__Transaction__c chargentTransaction  {get;set;}
        public String entityName {get;set;}
        public String transactionName {get;set;}
        public Date transactionDate { get;set;}
        public String gatewayDate { get;set;}
        public String transactionType {get;set;}
        public String responseStatus {get;set;}
        public Decimal responseAmount {get;set;}
        
        public EntityWrapper(ChargentSFA__Transaction__c chargentTransaction , String entityName){
            this.chargentTransaction = chargentTransaction;
            this.entityName = entityName;
            this.transactionDate = chargentTransaction.Transaction_date__c;
            this.gatewayDate    = string.valueOf(ChargentTransaction.Transaction_date__c);
            this.transactionType = chargentTransaction.ChargentSFA__Type__c;
            this.responseStatus = chargentTransaction.ChargentSFA__Response_Status__c;
            this.transactionName = chargentTransaction.Name;
            this.responseAmount = chargentTransaction.ChargentSFA__Amount__c;
        }
    }     
}