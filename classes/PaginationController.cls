/**
* A controller class to used to fetch Entity Records and also for pagination data.
* 
* @author prateeks
* @version 1.0 - Dec 28, 2017
*/
public with sharing class PaginationController {
    Public User usObj{get;set;}
    Public Contact con{get;set;}
    Public static String preparedByName{get;set{preparedByName = 'abcabc';}}
    Public static List<wrapperBlueprint> blueprintListWrapper;
   
    
    // Public Account acc{get;set;}
    // Public List<Attachment> BluePrint{get;set;}
    //For Pagination
    private integer counter=0;   //to keep track of offset
    private integer list_size=10; //to set the page size to show the rows/records
    public integer total_size; //used to show user the total size of the list 
    // Public List<Entities__c> cnd {get; set;}
    Public string selectedPage{get;set{selectedPage=value;} }
    Public List<Tax_Deadline__c> tD {get; set;}
    String recId;
    
    public PaginationController(ApexPages.StandardController controller) {
        usObj=[Select id, Name, FirstName, LastName, Phone, ContactId, SmallPhotoUrl, FullPhotoUrl, AccountId, Email, Alias, ProfileId, Title, MobilePhone from User where Id=:UserInfo.getUserId() Limit 1];
        con=new Contact();
        con=[Select id,accountid,account.Assigned_CAM__c,account.Assigned_CSR__c,account.Phone From contact where id =:usObj.contactid limit 1];
        total_size=[Select count() from Entities__c where Primary_Client__c =:con.accountid AND Entity_Owned_By__c = null];//set the total size in the constructor
        selectedPage='0';
        recId = controller.getId();
        //getBlueprintAttachment();
        try{
            td = [Select Id, Name, Tax_Year_End__c, Tax_Return_Due_Date__c, Extended_Filing_Due_Date__c, Expedite__c from Tax_Deadline__c];                
            system.debug(' td === ' + td);         
            
        } catch(Exception e){
            system.debug('==== Exception  ====' + e);
        }
    }
    
   
    /* This method is used to show blueprint with sliders on visualforce page.
* 
* @author prateeks
* @date May 05, 2019
* @return <code>Blueprint Records</code>
*/
    @RemoteAction
    public static List<wrapperBlueprint> getBlueprintAttachment(){
        try {
            blueprintListWrapper = new List<wrapperBlueprint>();
            wrapperBlueprint wrapperCon = new wrapperBlueprint();
            blueprintListWrapper = wrapperCon.initializeBlueprint();
            
            return blueprintListWrapper;
        } catch (QueryException e) {
            ApexPages.addMessages(e);                   
            return null;
        }   
    }
    
    /**
* This method is used to show records list on visualforce page.
* 
* @author prateeks
* @date Dec 13, 2017
* @return <code>Entity Records</code>
*/
    public List<SelectOption> getPageSize() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('10','10'));
        options.add(new SelectOption('15','15'));
        options.add(new SelectOption('20','20'));
        options.add(new SelectOption('25','25'));
        return options;
    }
    
    
    /**
* This method is used to Get All Blueprint to show on MyEntity page.
* 
* @author prateeks
* @date Jan 08, 2018
*/
    public List<Blueprint__c> getAllBluePrint() {            
        List<Blueprint__c> attachedFiles = [select Id, Name, AttachmentId__c from Blueprint__c where AccountId__c =:usObj.AccountId  order By CreatedDate DESC];
        return attachedFiles;    
    }
    /**
* This method is used to Get particular Blueprint when user click on it.
* 
* @author prateeks
* @date Jan 08, 2018
*/     
    @RemoteAction
    public static String getPrintImage(String bpId) {       
        sObject o = [select Id, ParentId, Name, ContentType, BodyLength, Body, OwnerId, CreatedDate, Description from Attachment where Id =:bpId LIMIT 1];
        String sfUrl=URL.getSalesforceBaseUrl().getHost().replace('comm-platinum.cs19','c.cs19.visual');
        system.debug('=== sfUrl ==='+ sfUrl);       
        String bpFiles = o.Id; 
        return bpFiles;
    }     
    
    /**
* This method is used to get entity records with limit for pagination.
* 
* @author prateeks
* @date Nov 16, 2017
* @return <code>Entity Records</code>
*/
    public Entities__c[] getAllEntities() {
        
        if (selectedPage != '0'){
            counter = list_size * integer.valueOf(selectedPage) - list_size;
        }  
        try { //we have to catch query exceptions in case the list is greater than 2000 rows
            
            Entities__c[] allEnt = [Select id, Name, Tax_Status__c, Organization_State__c, Primary_Client__c,
                                    RecordType.Name, Business_Purpose__c  from Entities__c where Primary_Client__c =:con.accountid AND Entity_Owned_By__c = null ORDER BY id limit :list_size offset :counter];
            return allEnt;
            
        } catch (QueryException e) {
            ApexPages.addMessages(e);                   
            return null;
        }        
    }
    
    /**
* This method is used to get particular entity details to show on popup.
* 
* @author prateeks
* @date Nov 16, 2017
* @return <code>Entity Details</code>
*/ 
    @RemoteAction
    public static Entities__c[] getEntityDetail(String entId) { 
        Entities__c[] entDt = [Select Id, Name, CreatedDate, EIN__c, EIN_Received__c, Tax_Status__c, Tax_Form__c, Organization_State__c, 
                               Organizational_Date__c, Business_Address__c, Business_Location__c, SOS_Number__c, Tax_Year_Ended__c, Tracking_Number__c, 
                               Articles_Prepared__c, Articles_Sent__c, Shipping_Method__c, Date_Shipped__c, Dissolution_Date__c, Federal_Return__c, 
                               Documents_Complete__c, Mailing_Address__c,Shareholder__c,Structure__c,Nominee__c,State_Renewal__c, 
                               Registered_Agent_Address__c, Registered_Agent_Name__c, Manager_1__c, Manager_2__c, Manager_3__c,
                               Member_1__c, Member_2__c , Member_3__c , Member_4__c, Member_5__c, Ownership__c, Ownership1__c, Ownership2__c,
                               Ownership3__c, Ownership4__c, Share_Holder_1__c, Share_Holder_2__c, Share_Holder_3__c, Share_Holder_4__c, Second_Shareholder__c,
                               Third_Shareholder__c, Fourth_Shareholder__c, Director_1__c, Director_2__c , Director_3__c , Director_4__c,
                               Director_5__c, Director_6__c, President__c, Treasurer__c, Vice_President__c,Secretary__c, Type__c, Tax_Matter_Representative__c
                               FROM Entities__c where Id=:entId Limit 1]; //LLC_Members__c
        return entDt;
        //return results;
    }
    
    /**
* This method is used to get particular entity LLC Cells to show on popup.
* 
* @author prateeks
* @date Apr 01, 2019
* @return <code>Entity LLC Cells</code>
*/    
    @RemoteAction
    public static LLC_Cells__c[] getEntityLLCs(String entId) { 
        LLC_Cells__c[] entLLC = [SELECT Id, Name, EIN__c, Manager_1__c, Master_LLC__c, Manager_2__c, Manager_3__c, Manager_4__c, Member_1__c, Member_2__c, Member_3__c, Member_4__c, Member_6__c, Member_5__c, Member_7__c, Name__c, Taxed__c,Address__c FROM LLC_Cells__c where Master_LLC__c=:entId order by id]; //LLC_Members__c
        return entLLC;
    }
    
    
    /**
* This method is used for pagination numbering.
* 
* @author prateeks
* @date Nov 16, 2017
* @return <code>All Buttons for pagination</code>
*/
    public Component.Apex.pageBlockButtons getPaginationButtons() {
        
        //the reRender attribute is a set NOT a string
        Set<string> theSet = new Set<string>();
        theSet.add('myPanel');
        theSet.add('myButtons');
        
        integer totalPages;
        if (math.mod(total_size, list_size) > 0) {
            totalPages = total_size/list_size + 1;
        } else {
            totalPages = (total_size/list_size);
        }
        
        integer currentPage;        
        if (selectedPage == '0') {
            currentPage = counter/list_size + 1;
        } else {
            currentPage = integer.valueOf(selectedPage);
        }
        
        Component.Apex.pageBlockButtons pbButtons = new Component.Apex.pageBlockButtons();        
        pbButtons.location = 'top';
        pbButtons.id = 'myPBButtons';
        
        Component.Apex.outputPanel opPanel = new Component.Apex.outputPanel();
        opPanel.id = 'myButtons';
        
        //the Previous button will alway be displayed
        Component.Apex.commandButton b1 = new Component.Apex.commandButton();
        b1.expressions.action = '{!Previous}';
        b1.title = 'Prev';
        b1.value = 'Prev';
        b1.expressions.disabled = '{!disablePrevious}';        
        b1.reRender = theSet;
        
        opPanel.childComponents.add(b1);        
        
        for (integer i=0;i<totalPages;i++) {
            Component.Apex.commandButton btn = new Component.Apex.commandButton();
            btn.title = 'Page ' + string.valueOf(i+1) + ' ';
            btn.value = ' ' + string.valueOf(i+1) + ' ';
            btn.rendered = false;
            
            if (   (i+1 <= 5 && currentPage < 5)
                || (i+1 >= totalPages-4 && currentPage > totalPages-4)
                || (i+1 >= currentPage-2 && i+1 <= currentPage+2))
            {
                btn.rendered = true;
            }
            
            if (i+1==currentPage) {
                btn.disabled = true; 
                btn.style = 'color: #fff; background: #2a4467; border: 1px solid #2a4467;';
            }  
            
            btn.onclick = 'queryByPage(\''+string.valueOf(i+1)+'\');return false;';
            
            opPanel.childComponents.add(btn);
            
            if (i+1 == 1 || i+1 == totalPages-1) { //put text after page 1 and before last page
                Component.Apex.outputText text = new Component.Apex.outputText();
                text.value = '';        
                opPanel.childComponents.add(text);
            } 
            
        }
        
        //the Next button will alway be displayed
        Component.Apex.commandButton b2 = new Component.Apex.commandButton();
        b2.expressions.action = '{!Next}';
        b2.title = 'Next';
        b2.value = 'Next';
        b2.expressions.disabled = '{!disableNext}';        
        b2.reRender = theSet;
        opPanel.childComponents.add(b2);
        //add all buttons as children of the outputPanel            
        pbButtons.childComponents.add(opPanel);
        system.debug(' === pbButtons === ' + pbButtons);
        return pbButtons;
        
    }    
    
    /**
* This method is used for refereshing grid of buttons in pagination.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public PageReference refreshGrid() { //user clicked a page number    
        return null;
    }
    
    /**
* This method is used to counter value of previuos page.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public PageReference Previous() { //user clicked previous button
        selectedPage = '0';        
        counter -= list_size;
        return null;
    }
    
    /**
* This method is used to increased counter value for next page.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public PageReference Next() { //user clicked next button      
        selectedPage = '0';        
        counter += list_size;
        return null;
    }
    
    /**
* This method is used to counter value of last page.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public PageReference End() { //user clicked end
        selectedPage = '0';
        counter = total_size - math.mod(total_size, list_size);
        return null;
    }
    
    /**
* This method is used to disable previuos button.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public Boolean getDisablePrevious() { //this will disable the previous and beginning buttons
        if (counter>0) return false; else return true;
    }
    
    /**
* This method is used to disable next button.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public Boolean getDisableNext() { //this will disable the next and end buttons
        if (counter + list_size < total_size) return false; else return true;
    }
    
    /**
* This method is used to get total size of entity records.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public Integer getTotal_size() {
        return total_size;
    }
    
    /**
* This method is used to current pagenumber in pagination.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public Integer getPageNumber() {
        return counter/list_size + 1;
    }
    public Integer getCount() {
        return counter;
    }
    
    /**
* This method is used to get total pages for pagination.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public Integer getTotalPages() {
        if (math.mod(total_size, list_size) > 0) {
            return total_size/list_size + 1;
        } else {
            return (total_size/list_size);
        }
    }
    
    /**
* This method is used to get list size from visualforce page.
* 
* @author prateeks
* @date Dec 13, 2017
*/
    public Integer getListSize() {
        return list_size;
    }
    
    /**
* This method is used to set list size for limiting records from visualforce page.
* 
* @author prateeks
* @date Dec 13, 2017
*/
    public void setListSize(Integer list_size) {
        this.counter = counter;
        this.list_size = list_size;
    }
    /**
* This method is used to get the Session id from visualforce page.
* 
* @author Dushyant Betav
* @date July 09, 2019
*/    
    @RemoteAction
    public static String getSessionId(){
        String sessionId = UserInfo.getSessionId().SubString(15);
        return sessionId;
    }
        /**
* This wrapper class is used to show PreparedBy value dynamically on visualforce page (MyEntities).
* 
* @author DeepeshK
* @date Oct 07, 2019
*/ 
    public class wrapperBlueprint
    {
        String preparedBy{get;set;}
        Id attachementId{get; set;}
        String attachmentName{get; set;}
        String attachementDescription{get; set;}
        Public List<wrapperBlueprint> blueprintListWrapper;
        
        
        public List<wrapperBlueprint> initializeBlueprint() {
            blueprintListWrapper = new List<wrapperBlueprint>();
      User usObj=[Select id, Name, FirstName, LastName, Phone, ContactId, SmallPhotoUrl, FullPhotoUrl, AccountId, Email, Alias, ProfileId, Title, MobilePhone from User where Id=:UserInfo.getUserId() Limit 1];
      Blueprint__c uId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c,PreparedBy__c FROM Blueprint__c WHERE AccountId__c =:usObj.AccountId ORDER By CreatedDate DESC LIMIT 1];
            if(uId.PreparedBy__c != null && uId.PreparedBy__c != '') {
                preparedBy = uId.PreparedBy__c;
            }
            else {
                preparedBy = 'test user dd';
            }
            
            //preparedBy = 'Test';
            List<Blueprint__c> attachmentId = [SELECT AttachmentId__c,Unique_Blueprint_Id__c FROM Blueprint__c WHERE Unique_Blueprint_Id__c = :uId.Unique_Blueprint_Id__c ORDER By CreatedDate ASC];
            Set<String> attSet = new Set<String>();
            for(Blueprint__c bp : attachmentId){
                attSet.add(bp.AttachmentId__c);
            }
            List<Attachment> attList=new List<Attachment>();
            attList= [select Id, Name, Description from Attachment where Id in :attSet ORDER By CreatedDate DESC];
            system.debug(' attList[0] === ' + attList.size());     
            
            for(Attachment atch : attList) {
                wrapperBlueprint bluePrintWrapp = new wrapperBlueprint();
                bluePrintWrapp.preparedBy = preparedBy;
                bluePrintWrapp.attachementId = atch.Id;
                bluePrintWrapp.attachmentName = atch.Name;
                bluePrintWrapp.attachementDescription = atch.Description;
                blueprintListWrapper.add(bluePrintWrapp);
            }
            return blueprintListWrapper;   
        }
    }
}