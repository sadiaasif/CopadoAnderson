/**
* A controller class to used to fetch case question and pagination.
* 
* @author prateeks
* @version 1.0 - Dec 28, 2017
*/
Public with sharing class CaseController {
    public Case cse{get; set;}
    Public User usObj{get;set;}
    Public RecordType RecordTypeId {get;set;}
    public Id PlatinumQuestionRecordType  {get; set;}
    Public List<Case>caseList{get;set;}
    public String userId{get;set;}
    public Static Boolean triggerExecution = false;
    //public String errorLg {get;set;}
    //For Pagination
    private Integer counterCase=0;   //to keep track of offset
    private Integer Caselist_size=10; //to set the page size to show the rows/records
    public Integer Casetotal_size; //used to show user the total size of the list 
    Public string selectedPageCase{get;set{selectedPageCase=value;} }
    
    public CaseController(ApexPages.StandardController controller){
        userId = Userinfo.getUserId();
        PlatinumQuestionRecordType = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Platinum Questions').getRecordTypeId();
        RecordTypeId = [Select id,Name,SobjectType from RecordType where Name =:'Community Platinum Case' and SobjectType  = :'Case' Limit 1];
        usObj=[Select id,AccountId,ContactId from User where Id=:UserInfo.getUserId() Limit 1];   
        cse = new Case();     
        Casetotal_size=[Select count() From Case where AccountId = :usObj.AccountId and ((RecordTypeId = :RecordTypeId.Id OR RecordTypeId = :PlatinumQuestionRecordType) OR Origin = 'Partner Community')];//set the total size in the constructor
        selectedPageCase='0';        
    }
    
    /**
* This method is used to save case question.
* 
* @author prateeks
* @date Dec 08, 2017
*/
    @RemoteAction
    public static Boolean saveClientQuestion(String subj, String descr,String usrAccId,String usrRecId) {
        triggerExecution = true;
        try {
            Case cse = new Case();
            cse.Subject = subj;
            cse.Description = descr;
            cse.AccountId = usrAccId;
            cse.RecordTypeId = usrRecId;
            cse.Origin = 'Partner Community';
            insert cse;
            return null;
        }catch(exception e) {
            system.debug('exception === ' + e);
            return null;
        }
    }
    
    /**
* This method is used to save case question with opportunity to make payment.
* 
* @author prateeks
* @date Mar 23, 2018
*/
    @RemoteAction
    public static String saveClientQuestionWithPayment(String usrAccId, String crdNo, String expYear, String expMonth, String cardHolderName, String cardSecurity) {   
        triggerExecution = true;
        try {
            Id RecordType = [SELECT Id, Name FROM RecordType WHERE  Name = :'Entity Formation' and SobjectType = 'Opportunity' LIMIT 1].Id;    
            //String acctName = [SELECT Id, Name FROM Account WHERE Id = :usrAccId].Name;
            //Id gatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name = :'AuthorizeNetTestPayment' and ChargentBase__Active__c = true].Id;            
            Id gatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name = :'Platinum' and ChargentBase__Active__c = true].Id;
            Opportunity opp = new Opportunity();
            opp.AccountId = usrAccId;
            opp.RecordTypeId = RecordType;
            opp.Name = 'Case Opportunity';
            opp.CloseDate = Date.today();
            opp.StageName = 'Agreement Sent';            
            opp.ChargentSFA__Card_Month__c = expMonth;
            opp.ChargentSFA__Card_Name__c = cardHolderName;
            opp.ChargentSFA__Card_Number__c = crdNo;
            opp.ChargentSFA__Card_Year__c = expYear;
            opp.ChargentSFA__Gateway__c = gatewayId;
            opp.Amount = 250.00;            
            opp.ChargentSFA__Charge_Amount__c = 250.00;
            insert opp;   
            return opp.Id;
        }catch(exception e) {
            system.debug('exception === ' + e);
            return null;
        }
    }
    
    
    /**
* This method is used to make payment of Expedite Case.
* 
* @author prateeks
* @date Mar 26, 2018
*/
    @RemoteAction
    public static String ChargeExpedited(Id oppId, String subj, String descr,String usrAccId,String usrRecId)
    {
        try
        {    
            // if (!Test.isRunningTest() ) {
            ChargentSFA.TChargentOperations.TChargentResult result= ChargentSFA.TChargentOperations.ChargeOpportunity_click(oppId);
            system.debug('=== Case Expedite Payment Result === ' + result);
            List<ChargentSFA__Transaction__c> transLog = [Select Id,Name,ChargentSFA__Response_Status__c,ChargentSFA__Response_Message__c,ChargentSFA__Opportunity__c,ChargentSFA__Amount__c from ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c = :oppId Order By CreatedDate Desc Limit 1];
            if(transLog.size() > 0) {   
                String[] transactionId = New String[]{};
                    String[] transactionStatus = New String[]{};
                        String[] transactionMsg = New String[]{};
                            Decimal[] transactionAmount = New Decimal[]{};
                                system.debug('=== transLog ===' + transLog);          
                for(ChargentSFA__Transaction__c c: transLog){
                    transactionId.add(c.Name);
                    transactionStatus.add(c.ChargentSFA__Response_Status__c);
                    transactionMsg.add(c.ChargentSFA__Response_Message__c);
                    transactionAmount.add(c.ChargentSFA__Amount__c);
                }
                String transVal = transactionId +','+ transactionStatus +','+ transactionAmount+','+transactionMsg ;
                system.debug(' == transVal == ' + transVal ); 
                if(String.valueOf(transactionStatus) == '(Approved)') { 
                    Case cse = new Case();
                    cse.Subject = subj;
                    cse.Description = descr;
                    cse.AccountId = usrAccId;
                    cse.RecordTypeId = usrRecId;
                    cse.Origin = 'Partner Community';
                    cse.Priority = 'Expedited';
                    insert cse;
                } else {                              
                    system.debug('== Payment Error == ');
                }  
                return transVal;
            } else {                
                return null; 
            }
        }
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
        }            
    }
    
    /**
* This method is used to show questions in dropdown list of case subject on visualforce page.
* 
* @author prateeks
* @date Dec 08, 2017
*/
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Platinum Bookkeeping Question','Platinum Bookkeeping Question'));
        options.add(new SelectOption('Platinum Tax Question','Platinum Tax Question'));
        options.add(new SelectOption('Platinum Living Trust Question','Platinum Living Trust Question'));
        options.add(new SelectOption('Platinum Corporation Question','Platinum Corporation Question'));
        options.add(new SelectOption('Platinum LLC Question','Platinum LLC Question'));
        options.add(new SelectOption('Platinum Retirement Question','Platinum Retirement Question'));
        options.add(new SelectOption('Platinum Life Insurance Question','Platinum Life Insurance Question'));
        return options;
    }      
    
    /**
* This method is used to show Months dropdown on visualforce page.
* 
* @author prateeks
* @date Mar 24, 2018
*/
    public List<SelectOption> getMonths() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('01','01'));
        options.add(new SelectOption('02','02'));
        options.add(new SelectOption('03','03'));
        options.add(new SelectOption('04','04'));
        options.add(new SelectOption('05','05'));
        options.add(new SelectOption('06','06'));
        options.add(new SelectOption('07','07'));
        options.add(new SelectOption('08','08'));
        options.add(new SelectOption('09','09'));
        options.add(new SelectOption('10','10'));
        options.add(new SelectOption('11','11'));
        options.add(new SelectOption('12','12'));        
        return options;
    }    
    
    /**
* This method is used to show Year dropdown on visualforce page.
* 
* @author prateeks
* @date Mar 24, 2018
*/
    public List<SelectOption> getYears() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('2018','2018'));
        options.add(new SelectOption('2019','2019'));
        options.add(new SelectOption('2020','2020'));
        options.add(new SelectOption('2021','2021'));
        options.add(new SelectOption('2022','2022'));
        options.add(new SelectOption('2023','2023'));
        options.add(new SelectOption('2024','2024'));
        options.add(new SelectOption('2025','2025'));
        options.add(new SelectOption('2026','2026'));
        options.add(new SelectOption('2027','2027'));
        options.add(new SelectOption('2028','2028'));
        options.add(new SelectOption('2029','2029'));
        options.add(new SelectOption('2030','2030'));
        options.add(new SelectOption('2031','2031'));
        options.add(new SelectOption('2032','2032'));
        options.add(new SelectOption('2033','2033'));
        options.add(new SelectOption('2034','2034'));
        options.add(new SelectOption('2035','2035'));
        return options;
    }    
    
    /**
* This method is used to save case question from frontend.
* 
* @author prateeks
* @date Dec 08, 2017
*/
    @RemoteAction
    public static Boolean saveClientCase(String caseCmt,String caseUsrCmt) {     
        CaseComment cc = new CaseComment();
        cc.CommentBody = caseCmt;
        cc.CreatedById = UserInfo.getUserId();
        cc.ParentId = caseUsrCmt;
        insert cc;
        return true;
    }
    
    /**
* This method is used to show all case question in open case section on visualforce page.
* 
* @author prateeks
* @date Dec 08, 2017
*/    
    Public List<Case> getCaseAnswer() {
        if (selectedPageCase != '0'){
            counterCase = Caselist_size * integer.valueOf(selectedPageCase) - Caselist_size;
        }  
        try {
            List<Case> cases = [Select Id, CaseNumber, Subject, Priority, AccountId, Description, Status, LastModifiedDate From Case where AccountId = :usObj.AccountId and ((RecordTypeId = :RecordTypeId.Id OR RecordTypeId = :PlatinumQuestionRecordType) OR Origin = 'Partner Community') ORDER BY LastModifiedDate DESC limit :Caselist_size offset :counterCase];  
            return cases;
        } catch (QueryException e) {                            
            ApexPages.addMessages(e);                   
            return null;
        }        
    }
    
    /**
* This is a remote method for case deatil which call when a user click on any case number.
* 
* @author prateeks
* @date Dec 13, 2017
*/
    @RemoteAction
    public static List<Tuple> getCaseDetails(String caseNum) {        
        List<Tuple> quesAns = new List<Tuple>();
        List<Case> caseList = [Select Case.Id,Case.CaseNumber,Case.Subject,Case.AccountId,Case.Description,Case.CreatedDate,Case.Status,Case.OwnerId, (Select Id, ParentId, CommentBody, CreatedById, CreatedDate, LastModifiedDate, LastModifiedById From CaseComments order by CreatedDate DESC) From Case where Case.CaseNumber =:caseNum];
        for(Case c : caseList)
        {
            List<CaseComment> caseCom = [Select Id, ParentId, CommentBody, CreatedById, CreatedDate, LastModifiedDate, LastModifiedById From CaseComment where Parentid=:c.id];
            User cseBName =  [select Name from User where id = :c.OwnerId];
            String cseByName = cseBName.Name;            
            if(caseCom.size() > 0) { 
                for(CaseComment comm : c.CaseComments)
                {                
                    User comBName =  [select Name from User where id = :comm.CreatedById];                    
                    String commentedByName = comBName.Name;                    
                    Tuple tup = new Tuple(c.Id,c.CaseNumber,c.Subject,c.Description,c.CreatedDate,c.Status,cseByName,comm.CreatedById,comm.CommentBody,commentedByName,comm.CreatedDate);
                    quesAns.add(tup);
                }
            } else {
                Tuple tup = new Tuple(c.Id,c.CaseNumber,c.Subject,c.Description,c.CreatedDate,c.Status,cseByName,'','','',null);
                quesAns.add(tup);
            }
        }
        return quesAns;
    }
    
    /**
* This class is used to merge all case question and their comment into one object list.
* 
* @author prateeks
* @date Dec 08, 2017
*/
    @RemoteAction
    public class Tuple
    {
        public Id CaseId {get; set;}
        public String CaseNumber {get; set;}
        public String caseName {get; set;}
        public String caseDesc {get; set;}  
        public Datetime caseCreateDate {get; set;}
        public String caseStatus {get; set;}
        public String caseOwner {get; set;}
        public String commById {get; set;}
        public String commBody {get; set;}
        public String commBy {get; set;}
        public Datetime commDate {get; set;}
        
        public Tuple(Id cseId, String cseNo, String cseName, String cseDesc, Datetime cseDate, String cseStatus, String cseOwner, String commentById, String commentBdy, String commentBy, Datetime commentdate)
        {
            CaseId = cseId;
            CaseNumber = cseNo;
            caseName = cseName;
            caseDesc = cseDesc;
            caseCreateDate = cseDate;
            caseStatus = cseStatus;
            caseOwner = cseOwner;
            commById = commentById;
            commBody = commentBdy;            
            commBy = commentBy;
            commDate = commentdate;
        }
    }
    
    // Case Pagination Methods Start
    /**
* This method is used for pagination numbering.
* 
* @author prateeks
* @date Dec 18, 2017
* @return <code>All Buttons for pagination</code>
*/
    public Component.Apex.pageBlockButtons getCasePaginationButtons() {
        
        //the reRender attribute is a set NOT a string
        Set<string> theCaseSet = new Set<string>();
        theCaseSet.add('pb');
        theCaseSet.add('myCaseButtons');
        
        integer totalPagesCase;
        System.debug('=== Casetotal_size === ' + Casetotal_size);
        System.debug('=== Caselist_size === ' + Caselist_size);
        if (math.mod(Casetotal_size, Caselist_size) > 0) {
            totalPagesCase = Casetotal_size/Caselist_size + 1;
        } else {
            totalPagesCase = (Casetotal_size/Caselist_size);
        }
        integer currentPageCase;        
        if (selectedPageCase == '0') {
            currentPageCase = counterCase/Caselist_size + 1;
        } else {
            currentPageCase = integer.valueOf(selectedPageCase);
        }
        Component.Apex.pageBlockButtons pbCaseButtons = new Component.Apex.pageBlockButtons();        
        pbCaseButtons.location = 'top';
        pbCaseButtons.id = 'myCasePBButtons';
        Component.Apex.outputPanel opCasePanel = new Component.Apex.outputPanel();
        opCasePanel.id = 'myCaseButtons';        
        //the Previous button will alway be displayed
        Component.Apex.commandButton b11 = new Component.Apex.commandButton();
        b11.expressions.action = '{!PreviousCase}';
        b11.title = 'Prev';
        b11.value = 'Prev';
        b11.expressions.disabled = '{!casedisablePrevious}';        
        b11.reRender = theCaseSet;
        opCasePanel.childComponents.add(b11); 
        for (integer j=0;j<totalPagesCase;j++) {
            Component.Apex.commandButton btns = new Component.Apex.commandButton();
            btns.title = 'Page ' + string.valueOf(j+1) + ' ';
            btns.value = ' ' + string.valueOf(j+1) + ' ';
            btns.rendered = false;
            if (   (j+1 <= 5 && currentPageCase < 5)
                || (j+1 >= totalPagesCase-4 && currentPageCase > totalPagesCase-4)
                || (j+1 >= currentPageCase-2 && j+1 <= currentPageCase+2))
            {
                btns.rendered = true;
            }
            if (j+1==currentPageCase) {
                btns.disabled = true; 
                btns.style = 'color: #fff; background: #2a4467; border:none;';
            }  
            btns.onclick = 'queryByPageCase(\''+string.valueOf(j+1)+'\');return false;';
            opCasePanel.childComponents.add(btns);
            if (j+1 == 1 || j+1 == totalPagesCase-1) { //put text after page 1 and before last page
                Component.Apex.outputText text = new Component.Apex.outputText();
                text.value = '';        
                opCasePanel.childComponents.add(text);
            } 
        }
        //the Next button will alway be displayed
        Component.Apex.commandButton b22 = new Component.Apex.commandButton();
        b22.expressions.action = '{!NextCase}';
        b22.title = 'Next';
        b22.value = 'Next';
        b22.expressions.disabled = '{!casedisableNext}';        
        b22.reRender = theCaseSet;
        opCasePanel.childComponents.add(b22);
        //add all buttons as children of the outputPanel                
        pbCaseButtons.childComponents.add(opCasePanel);
        return pbCaseButtons;
    }    
    
    /**
* This method is used for refereshing grid of buttons in pagination.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public PageReference refreshGridCase() { //user clicked a page number        
        return null;
    }
    
    /**
* This method is used to counter value of previuos page.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public PageReference PreviousCase() { //user clicked previous button
        selectedPageCase = '0';        
        counterCase -= Caselist_size;
        return null;
    }
    
    /**
* This method is used to increased counter value for next page.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public PageReference NextCase() { //user clicked next button        
        selectedPageCase = '0';        
        counterCase += Caselist_size;
        return null;
    }
    
    /**
* This method is used to counter value of last page.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public PageReference End() { //user clicked end
        selectedPageCase = '0';
        counterCase = Casetotal_size - math.mod(Casetotal_size, Caselist_size);
        return null;
    }
    
    /**
* This method is used to disable previuos button.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public Boolean getCaseDisablePrevious() { //this will disable the previous and beginning buttons
        if (counterCase>0) return false; else return true;
    }
    
    /**
* This method is used to disable next button.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public Boolean getCaseDisableNext() { //this will disable the next and end buttons
        if (counterCase + Caselist_size < Casetotal_size) return false; else return true;
    }
    
    /**
* This method is used to get total size of entity records.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public Integer getCaseTotal_size() {
        return Casetotal_size;
    }
    
    /**
* This method is used to current pagenumber in pagination.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public Integer getCasePageNumber() {
        return counterCase/Caselist_size + 1;
    }
    public Integer getCaseCount() {
        return counterCase;
    }
    
    /**
* This method is used to get total pages for pagination.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public Integer getCaseTotalPages() {
        if (math.mod(Casetotal_size, Caselist_size) > 0) {
            return Casetotal_size/Caselist_size + 1;
        } else {
            return (Casetotal_size/Caselist_size);
        }
    }
    
    /**
* This method is used to get list size from visualforce page.
* 
* @author prateeks
* @date Dec 18, 2017
*/
    public Integer getCaseListSize() {
        return Caselist_size;
    }
    
    /**
* This method is used to set list size for limiting records from visualforce page.
* 
* @author prateeks
* @date Dec 13, 2017
*/
    public void setCaseListSize(Integer Caselist_size) {
        this.Caselist_size = Caselist_size;
    }
    
    
}