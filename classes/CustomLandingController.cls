/**
* A controller class to used to fetch dashboard data.
* 
* @author prateeks
* @version 1.0 - Nov 16, 2017
*/

public without sharing class CustomLandingController {
    
    // Code we will invoke on page load.
    Public User usObj{get;set;}
    public User userObj{get;set;}
    Public Contact con{get;set;}
    Public Account acc{get;set;}
    Public string Bookkeeper{get;set;}
    Public List<Entities__c>lstEntity{get;set;}
    Public List<Opportunity>allOpp{get;set;}
    Public List<Slider_Images__c>listSliderImg{get;set;}
    Public String camPath{get;set;}
    Public String csrPath{get;set;}
    Public String saPath{get;set;}
    Public String taxPath{get;set;}
    Public String bookkeeperPath{get;set;}    
    Public String embededLink {get;set;}
    Public String orgUrl{get;set;}
    
    public CustomLandingController(ApexPages.StandardController controller) { 
        // For slider images with link
        listSliderImg = new List<Slider_Images__c>([Select id, Name, Image__c, Image_Description__c, Slider_path__c, CreatedDate from Slider_Images__c order by CreatedDate]);
        //Calling below method for fetch the entities record.--
        getEntityRecord();  
        orgUrl = URL.getSalesforceBaseUrl().toExternalForm();
    }
    
    Public PageReference GetLink(){  
        string url;
        url = '/embeded?param=' + embededLink;
        PageReference pg = new PageReference(url);
        pg.setRedirect(true);
        return pg;
    }   
    
    /**
* This method is used to get entity records of logged in user.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    
    //Start method fetch the entities record.--
    Public void getEntityRecord(){
        usObj=[Select id,Username,AboutMe,Name,FirstName,LastName,Phone,ContactId,SmallPhotoUrl,FullPhotoUrl,AccountId,Email,Alias,ProfileId,Title,MobilePhone,LastLoginDate,CreatedDate,Client_Image__c,IsActive,Partner_Create_Date__c from User where Id=:UserInfo.getUserId() Limit 1];
        con=new Contact();
        acc=new Account();
        try{
            if(usObj.contactid!=null) {    
                con=[Select id,Name,Email,AccountId,account.Platinum_Client_View__c,account.Phone,FirstName, LastName, MobilePhone, Birthdate From contact where id =:usObj.contactid limit 1];           
                acc=[Select Id, Name,Platinum_Client_View__c,Accounting_Coordinators__c,Assigned_CAM__c, Assigned_CSR__c, Account_Number__c, First_Name__c, Last_Name__c, Email__c, Mobile_Number__c, BillingAddress, ShippingAddress, Phone, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Profile_background__c, E_Mail__c,Bookkeeper_Pic__c, Bookkeeper_Text__c, CAM_Pic__c, CSR_Pic__c, Senior_Advisor_Pic__c, Senior_Advisor_Picklist__c, Tax_Preparer_Pic__c, CAM_Email__c, CAM_Ext__c, CSR_Email__c, CSR_Ext__c, Tax_Preparer__c,Senior_Advisor__c, Bookkeeper__r.name, Bookkeeper_Picklist__c From Account where id =:con.accountid limit 1];               
                String camPic = acc.CAM_Pic__c;
                
                List<String> camSrc = camPic.split('"');
                //String baseURL = Url.getSalesforceBaseUrl().toExternalForm()+'/dashboard';
                camPath = camSrc[1];
                System.debug('camPath===='+camPath);
                
                String csrPic = acc.CSR_Pic__c;
                System.debug('csrPic=='+csrPic);
                List<String> csrSrc = csrPic.split('"');
                System.debug('csrSrc=='+csrSrc);
                csrPath = csrSrc[1];
                //csrPath='';
                System.debug('csrPath===='+csrPath);
                
                String saPic = acc.Senior_Advisor_Pic__c;
                System.debug('saPic==='+saPic);
                List<String> saSrc = saPic.split('"');
                saPath = saSrc[1];
                System.debug('saPath===='+saPath);
                String taxPic = acc.Tax_Preparer_Pic__c;
                system.debug('taxPic==='+taxPic);
                List<String> taxSrc = taxPic.split('"');
                taxPath = taxSrc[1];
                
                String bookkeeperPic = acc.Bookkeeper_Pic__c;
                system.debug('bookkeeperPic==='+bookkeeperPic);
                List<String> bookkeeperSrc = bookkeeperPic.split('"');
                bookkeeperPath = bookkeeperSrc[1];
                system.debug('bookkeeperPath==='+bookkeeperPath);
            }
            
            String accCoord=acc.Accounting_Coordinators__c;
                System.debug('accCoord=='+accCoord);
                if(acc.Accounting_Coordinators__c!=null)
                {
                userObj=[SELECT Id, Username, LastName, Name,Image_URL__c,SmallPhotoUrl,Extension,Email FROM User where Name=:accCoord];
                System.debug('userObj=='+userObj);
                }
                else{
                    system.debug('Error ==== There is some problem');
                }
            
            if(con.AccountId!=null){            
                lstEntity=new List<Entities__c>([Select id, Name, Tax_Status__c, Organization_State__c, Primary_Client__c,
                                                 RecordType.Name from Entities__c where Primary_Client__c =:con.accountid ORDER BY id Limit 3]);
                allOpp = new List<Opportunity>([Select Id, Name, Amount, OwnerId, AccountId, ChargentSFA__Balance_Due__c FROM Opportunity where AccountId = :con.accountid]);
                User u = [select Name from User where Id =:acc.Bookkeeper__c];
                Bookkeeper =  u.Name;
            } else { 
                system.debug('Error ==== There is some problem');
            }
        }catch(Exception e){
            system.debug('Error ==== ' + e);            
        }
    }
    
    /**
* This method is used to show client groups on my profile page.
* 
* @author prateeks
* @date Dec 20, 2017
* @return <code>Group Names</code>
*/
    public List<String> getClientGroup() {
        
        List<String> roleRelatedGroupIds = new List<String>();
        for (Group g : [SELECT id, RelatedId, Type FROM Group where RelatedId= :UserInfo.getUserRoleId()]){
            roleRelatedGroupIds.add(g.id);
        }
        List<String> allGroupNames = new List<String>();
        
        for (GroupMember gm : [SELECT Id, group.id, group.name, group.type FROM GroupMember where (UserOrGroupId = :UserInfo.getUserId() AND group.type='Regular') OR (UserOrGroupId IN :roleRelatedGroupIds AND group.type='Regular') LIMIT 3]){
            allGroupNames.add(gm.group.name);
        }
        return allGroupNames;
    }
    
    /**
* This method is used to update user records from dashboard page or my profile page.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public PageReference updateUser()
    {       
        try{
            update usObj;
        }catch(DMLException e){
            //Report DML exceptions to the Apex Page messages element in Visualforce
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,e.getMessage()));
        }
        String pageName = ApexPages.CurrentPage().getUrl();
        // IT ALWAYS STARTS WITH /APEX/ SO REMOVE IT
        pageName = pageName.replaceFirst('/apex/', '');
        pageName = EncodingUtil.urlEncode(pageName, 'UTF-8');
        // %3F IS THE VALUE OF THE QUESTION MARK IN UTF-8 
        string[] pageNameExtra = pageName.split('%3F', 0);
        // SO YOU MAY SPLIT THE STRING AT THAT POINT
        // FOR THIS PURPOSE YOU ONLY NEED THE FIRST
        // IN THE RESULTING ARRAY
        pageName = pageNameExtra[0];
        PageReference page = new PageReference('/'+pageName);
        page.SetRedirect(true);
        return page;        
        
    }
    
    /**
* This method is used to update account records from dashboard page or my profile page.
* 
* @author prateeks
* @date Nov 16, 2017
*/
    public PageReference updateAccount()
    {       
        try{
            update acc;
        }catch(DMLException e){
            //Report DML exceptions to the Apex Page messages element in Visualforce
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,e.getMessage()));
        }
        String pageName = ApexPages.CurrentPage().getUrl();
        // IT ALWAYS STARTS WITH /APEX/ SO REMOVE IT
        pageName = pageName.replaceFirst('/apex/', '');
        pageName = EncodingUtil.urlEncode(pageName, 'UTF-8');
        // %3F IS THE VALUE OF THE QUESTION MARK IN UTF-8 
        string[] pageNameExtra = pageName.split('%3F', 0);
        // SO YOU MAY SPLIT THE STRING AT THAT POINT
        // FOR THIS PURPOSE YOU ONLY NEED THE FIRST
        // IN THE RESULTING ARRAY
        pageName = pageNameExtra[0];
        PageReference page = new PageReference('/'+pageName);
        page.SetRedirect(true);
        return page;        
    }
    
    /**
* This method is used to count entity records.
* 
* @author prateeks
* @date Nov 16, 2017
* @return <code>Entity Count</code>
*/
    public Integer getCountentities() {        
        Integer countEntity = [SELECT COUNT() FROM Entities__c where Primary_Client__c =:con.accountid];
        return countEntity;
    }
    
    public PageReference forwardToCustomAuthPage() {        
        if(UserInfo.getUserType() == 'Guest'){
            return new PageReference('/Anderson_Login');
        }

        else{
            return null;
        }
        
    } 
    
}