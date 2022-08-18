public class SyncPlantinumandSfctrl {
    @AuraEnabled
    public static SFplatinumListWrapper getSfplatimumdetails(String accountId){
        SFplatinumListWrapper accSFWrapper = new SFplatinumListWrapper();
        List<Account> aclist=[Select Platinum_Sale_Closed_Won__c from account where id=:accountId limit 1];
        if(aclist.size()>0){
            accSFWrapper.accPlatinumsaleStage=aclist[0].Platinum_Sale_Closed_Won__c;
        }
        System.debug('accSFWrapper.accPlatinumsaleStage=='+accSFWrapper.accPlatinumsaleStage);
        List<contact> conList = [SELECT Id,Platinum_Wordpress_Id__c,Wordpress_User_Roles__c,Platinum_Email__c,FirstName,LastName from contact WHERE  AccountId=: accountId and Account_Roles__c='Primary Contact'  Order by LastmodifiedDate Desc ];
        if(conList.size()>1){
            accSFWrapper.hasmorethanoneprimarycontact=true;
            
        }else{
            accSFWrapper.hasmorethanoneprimarycontact=false;
            if(!conList.isEmpty()){
                accSFWrapper.acccontactId=conList[0].id;
                accSFWrapper.acccontactWPId=conList[0].Platinum_Wordpress_Id__c;
                accSFWrapper.roles = conList[0].Wordpress_User_Roles__c;
                accSFWrapper.accPlatinumEmail = conList[0].Platinum_Email__c;//
                accSFWrapper.accconFirstName = conList[0].FirstName;//
                accSFWrapper.accconLastName = conList[0].LastName;//
            }
            List<opportunity> oppList = [SELECT Id FROM Opportunity WHERE RecordTypeId = '012U0000000g5s4' AND AccountId = :accountId Order by LastmodifiedDate Desc limit 1 ];
            if(!oppList.isEmpty()){
                accSFWrapper.accsaleId=oppList[0].id;
            }
            
        }
        
        return accSFWrapper;
    }
    @AuraEnabled
    public static wordpressplatinumListWrapper getPlatinumUserdetailsfromwordpress(String wordpressidSF,string SFaccountid,string SFSaleid,string SFcontactid,string SFPlatinumSale) {
        wordpressplatinumListWrapper wpreturnedvalues=new wordpressplatinumListWrapper();
        wpreturnedvalues=  makePostCallout(wordpressidSF,SFaccountid,SFSaleid,SFcontactid,SFPlatinumSale);
        return wpreturnedvalues;
        
    }
    @AuraEnabled
    public static wordpressplatinumListWrapper syncPlatinumandsf(String wordpressidSF,string SFaccountid,string SFSaleid,string SFcontactid,string SFPlatinumSale) {
        wordpressplatinumListWrapper wpandplatinumsyncval=new wordpressplatinumListWrapper();
        wpandplatinumsyncval=  updatewordpress(wordpressidSF,SFaccountid,SFSaleid,SFcontactid,SFPlatinumSale);
        
        return wpandplatinumsyncval;
    }
    
    @AuraEnabled
    public static DigitalproductsListWrapper checkforDigitalservice(String accountId) {
        String AfsName='';
        String taxtooboxname='';
        string Afs='No';
        string taxtoolbox='No';
        String Infinity='No';
        string conInfinityItem='';
        Boolean ReplacedInfinityitemoncon=false;
        List<string> digicodeonCustomMetadataList         = new List<String>();
        Map<decimal,string> InfinityLevelandmembershipMap = new Map<decimal,string>();
        List<wrapContact> wrapPrimarycondetailList     = new list<wrapContact>();
        List<id> accountidList                    = new List<Id>();
        String ServicesPurchasedByclient='';
        String ServicesASIDcodePurchasedByclient='';
        DigitalproductsListWrapper dpw=new DigitalproductsListWrapper();
        SyncPlantinumandSfctrl SynClassInstance=new SyncPlantinumandSfctrl();
        List<wrapoppaccountIdandServiceitems> wrapoppaccountIdandServiceitemsList = new list<wrapoppaccountIdandServiceitems>();
        Map <id,string> accountoppserviceitemsMap        = new Map<id,string>();
        wrapContact ConPrimaryCondetail = getPrimaryOrOldestContact(accountId);
        wrapPrimarycondetailList.add(ConPrimaryCondetail);
        
        
        // Select all Digital Product ASIDs
        
        List <Digital_Course__mdt> DigitalAsIDfromCsetting = [SELECT  ASID__c FROM Digital_Course__mdt];
        for(Digital_Course__mdt DC : DigitalAsIDfromCsetting){
            digicodeonCustomMetadataList.add(DC.ASID__c);
        }
        
        // Select all Infinity Membership Levels
        
        List <Infinity_Subscription_Product__mdt> InfinitycodefromCsetting = [SELECT  Infinity_Membership__c,Level__c FROM Infinity_Subscription_Product__mdt];
        for(Infinity_Subscription_Product__mdt InfinityC : InfinitycodefromCsetting){
            InfinityLevelandmembershipMap.put(InfinityC.Level__c, InfinityC.Infinity_Membership__c);
        }
        
        Set<id> oppids=new set<id>();
        
        
        List<OpportunityLineItem> dpoppln=[Select id,name, ASID__c,ProductCode,Service_Name__c from OpportunityLineItem where ASID__c IN:digicodeonCustomMetadataList and OpportunityId IN (Select id from opportunity where (StageName='Closed Won' or StageName='Fulfillment/Partial Payment') and AccountId=:accountId) ];
        
        
        for(OpportunityLineItem opl:dpoppln){
            if(!string.isBlank(ServicesPurchasedByclient)){
                ServicesPurchasedByclient=ServicesPurchasedByclient+opl.Service_Name__c+'\n';
                ServicesASIDcodePurchasedByclient=ServicesASIDcodePurchasedByclient+opl.ASID__c+',';
            }else{
                ServicesPurchasedByclient=opl.Service_Name__c+'\n';
                ServicesASIDcodePurchasedByclient=opl.ASID__c+',';
            }
            System.debug('ServicesPurchasedByclient in Loop=='+ServicesPurchasedByclient);
            
            
        }
        Decimal levelofInfinityproduct = 0;
        String InfinityMebershipDisplayName='';
        for(opportunity opinfinityDigitalproduct : [Select id,Service_Item_List__c ,accountID,RecordType.name,Infinity_Memebership__c,toLabel(Infinity_Memebership__c) Membershiplabel from opportunity where accountID=:accountid and HasDigitalProducts__c = 'Yes' and RecordType.name = 'Infinity Subscription']){
            
            
            for(decimal InfLevelNumber : InfinityLevelandmembershipMap.keyset()){
                
                
                If(!string.isBlank(opinfinityDigitalproduct.Infinity_Memebership__c) ?opinfinityDigitalproduct.Infinity_Memebership__c.contains(InfinityLevelandmembershipMap.get(InfLevelNumber)) && InfLevelNumber>levelofInfinityproduct :false){
                    
                    SyncPlantinumandSfctrl SyncPlatClassInstance=new SyncPlantinumandSfctrl();
                    InfinityMebershipDisplayName=SyncPlatClassInstance.getPicklistvalueLabel('opportunity','Infinity_Memebership__c',opinfinityDigitalproduct.Infinity_Memebership__c);
                    System.debug('InfinityMebershipDisplayName=='+InfinityMebershipDisplayName);
                    levelofInfinityproduct = InfLevelNumber; // Level = InfCodeNumber
                    System.debug('Reached loop 2'+ levelofInfinityproduct);
                    System.debug('Reached loop 2 incode' + InfLevelNumber);
                    
                }
                
            }
            
        }
        
        if(levelofInfinityproduct != 0){
            if(string.isBlank(ServicesPurchasedByclient)){
                System.debug('Reached loop 3');
                ServicesASIDcodePurchasedByclient = InfinityLevelandmembershipMap.get(levelofInfinityproduct)+',';
                ServicesPurchasedByclient   =InfinityMebershipDisplayName+'\n';
            }else{
                System.debug('Reached loop 3');
                ServicesASIDcodePurchasedByclient    = ServicesASIDcodePurchasedByclient+InfinityLevelandmembershipMap.get(levelofInfinityproduct)+',';
                ServicesPurchasedByclient =ServicesPurchasedByclient+InfinityMebershipDisplayName+'\n';
            }
            system.debug('ServicesPurchasedByclient=='+ServicesPurchasedByclient);
            
            
        }
        accountoppserviceitemsMap.put(accountid,ServicesASIDcodePurchasedByclient);
        System.debug('ServicesPurchasedByclient=='+ServicesPurchasedByclient);
        
        dpw.ServicesPurchasedByClientswrapped=ServicesPurchasedByclient;
        
        for(Id accountids:accountoppserviceitemsMap.keySet()){
            wrapoppaccountIdandServiceitems wp=new wrapoppaccountIdandServiceitems(accountoppserviceitemsMap.get(accountids),accountids);
            system.debug('REached for accountids');
            wrapoppaccountIdandServiceitemsList.add(wp);
        }
        //   System.debug('Conwrap Size=='+wrapPrimarycondetailList.size());
        System.debug('oppwrapsize Size=='+wrapoppaccountIdandServiceitemsList.size());
        
        for(wrapContact wPrimarycondetail:wrapPrimarycondetailList){
            
            
            for(wrapoppaccountIdandServiceitems wOppaccountIdandServiceitems:wrapoppaccountIdandServiceitemsList ){
                if(wPrimarycondetail.accountID == wOppaccountIdandServiceitems.oppaccountID){
                    System.debug('account id update=='+ wPrimarycondetail.accountID);
                    System.debug('opp id update=='+ wOppaccountIdandServiceitems.oppaccountID);
                    if(wPrimarycondetail.ContactID != null){
                        System.debug('Con id update=='+wPrimarycondetail.ContactID);
                        
                        
                        contact ContactToBeupdated = [Select id,Service_Item_List__c from contact where id = :wPrimarycondetail.ContactID];
                        if(ContactToBeupdated != null){
                            if(wPrimarycondetail.serviceItems != '' && wPrimarycondetail.serviceItems!=null){
                                
                                
                                List<string> contactserviceSplit = wPrimarycondetail.serviceItems.split(',');
                                List<string> oppeserviceSplit    = wOppaccountIdandServiceitems.oppserviceItems.split(',');
                                Boolean updateContactservice     = SynClassInstance.Stringcompare(contactserviceSplit,oppeserviceSplit);
                                if(!updateContactservice){
                                    dpw.conhasserviceitems=false;
                                    system.debug('Service does not contain');
                                    dpw.hasDigitalproducts= wOppaccountIdandServiceitems.oppserviceItems;
                                    dpw.Conid=ContactToBeupdated.id;
                                    system.debug('final service iem 1' + wOppaccountIdandServiceitems.oppserviceItems);
                                    
                                }else{
                                    dpw.conhasserviceitems=true;
                                }
                            }else{
                                dpw.conhasserviceitems=false;
                                dpw.Conid=ContactToBeupdated.id;
                                dpw.hasDigitalproducts=  wOppaccountIdandServiceitems.oppserviceItems;
                                system.debug('final service iem 2==' + wOppaccountIdandServiceitems.oppserviceItems);
                                
                            }
                            
                        }
                    }
                    
                    
                }
                
            }
            
        }
        
        return dpw;
    }
    @AuraEnabled
    public static boolean updatedigitalproductsoncon(ID contactid, string digitalproduct) {
        List<contact> con=[Select id,Service_Item_List__c from contact where id=:contactid ];
        if(!con.isEmpty()){
            con[0].Service_Item_List__c=digitalproduct;
            try{
                update con;
                return true; 
            }catch(Exception e) {
                return false; 
            }
        }else{
            return false; 
        }
        
    }
    @AuraEnabled
    public static SFplatinumListWrapper generaterandomPassword(Id accountId) {
        SFplatinumListWrapper spw=new SFplatinumListWrapper();
        Integer len = 10;
        Blob blobKey = crypto.generateAesKey(128);
        String key = EncodingUtil.convertToHex(blobKey);
        String pwd = key.substring(0,len);
        
        List<Contact> conList = [SELECT Platinum_Wordpress_Id__c, Platinum_Password__c, FirstName, LastName, Platinum_Email__c FROM Contact  WHERE  AccountId=: accountId and Account_Roles__c='Primary Contact'  Order by LastmodifiedDate Desc];
        if(conList.size()>1){
            spw.hasmorethanoneprimarycontact=true;
            
        }else{
            spw.hasmorethanoneprimarycontact=false;
            if(!conList.isEmpty()){
                conList[0].Platinum_Password__c= pwd;
                try{
                    update conList;
                    
                }catch(DmlException e) {
                    System.debug('An unexpected error has occurred: ' + e.getMessage());
                }
                conList = [SELECT id,Platinum_Wordpress_Id__c, Platinum_Password__c, FirstName, LastName, Platinum_Email__c FROM Contact  WHERE  AccountId=: accountId and Account_Roles__c='Primary Contact'  Order by LastmodifiedDate Desc];
                wordpressUpdatePlatinumUser.processContactsforreset(conList);
                spw.accPlatinumGeneratedPass=conList[0].Platinum_Password__c;
                spw.accPlatinumEmail=conList[0].Platinum_Email__c;
               spw.accconFirstName = conList[0].FirstName;
                spw.accconLastName = conList[0].LastName;
                spw.acccontactId=conList[0].id;
                
            }
            
            
        }
        
        
        
        return spw;
        
    }
    
    public static wordpressplatinumListWrapper makePostCallout(String wordpressid,string SFaccountid,string SFSaleid,string SFcontactid, string SFPlatinumSale){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal'+'/'+wordpressid);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        HttpResponse response = http.send(request);
        // Parse the JSON response
        
        
        System.debug(response.getBody());
        wordpressplatinumListWrapper accwordpressWrapper = new wordpressplatinumListWrapper();
        String responseBody = response.getBody();
        //  List<Object> wordpressResponseList = (List<Object>) JSON.deserializeUntyped(responseBody);
        //  if list size > 1
        //     Map<String, Object> wordpressResponse = (Map<String, Object>)wordpressResponseList[0];
        //  else
        //     return error;
        Map<String, Object> wordpressResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
        Map<String, Object> metadatadetails = (Map<String, Object>) wordpressResponse.get('meta');
        String PlatinumaccountID=String.valueof(metadatadetails.get('Sf_ClientAccountId'));
        String PlatinumsaleID=String.valueof(metadatadetails.get('Sf_PlatinumSaleId'));
        String PlatinumconID=String.valueof(metadatadetails.get('Sf_PrimaryContactId'));
        String PlatinumSaleStage=String.valueof(metadatadetails.get('Sf_PlatinumSaleStage'));
        
        PlatinumaccountID=PlatinumaccountID.replace('(', '');
        PlatinumaccountID=PlatinumaccountID.replace(')', '');
        PlatinumsaleID=PlatinumsaleID.replace('(', '');
        PlatinumsaleID=PlatinumsaleID.replace(')', '');
        PlatinumconID=PlatinumconID.replace('(', '');
        PlatinumconID=PlatinumconID.replace(')', '');
        if(!TEst.isRunningTest()){
            PlatinumSaleStage=PlatinumSaleStage.replace('(', '');
            PlatinumSaleStage=PlatinumSaleStage.replace(')', '');}
        System.debug('PlatinumaccountID=='+PlatinumaccountID);
        System.debug('PlatinumsaleID=='+PlatinumsaleID);
        System.debug('PlatinumconID=='+PlatinumconID);
        System.debug('SFaccountid=='+SFaccountid);
        System.debug('SFSaleid=='+SFSaleid);
        System.debug('SFcontactid=='+SFcontactid);
        System.debug('PlatinumSaleStage=='+PlatinumSaleStage);
        
        accwordpressWrapper.WplatinumaccountId=PlatinumaccountID;
        accwordpressWrapper.WplatinumcontactId=PlatinumconID;
        accwordpressWrapper.WplatinumaccsaleId=PlatinumsaleID;
        accwordpressWrapper.WplatinumsaccPlatinumSaleStage=PlatinumSaleStage;
        If((SFaccountid != accwordpressWrapper.WplatinumaccountId)|| (SFSaleid !=accwordpressWrapper.WplatinumaccsaleId)|| (SFcontactid !=accwordpressWrapper.WplatinumcontactId)||(SFPlatinumSale !=accwordpressWrapper.WplatinumsaccPlatinumSaleStage )|| PlatinumaccountID=='' || PlatinumsaleID=='' || PlatinumconID==''|| PlatinumSaleStage==''){
            accwordpressWrapper.WplatinumsfMatch=true;
        } 
        
        
        PlatinumUser.newUser brandNewUser = (PlatinumUser.newUser)JSON.deserialize(responseBody, PlatinumUser.newUser.class);
        String wordPressIdr = brandNewUser.Id;
        accwordpressWrapper.WordPressRoles = (brandNewUser.roles!=null && brandNewUser.roles.size()>0)?String.join(brandNewUser.roles,';'):'';
        System.debug('wordPressIdr=='+wordPressIdr);
        
        return accwordpressWrapper;
    }
    public static wordpressplatinumListWrapper updatewordpress(String wordPressId, string SFaccountid,string SFSaleid,string SFcontactid,string SFPlatinumSale) {
        wordpressplatinumListWrapper accSyncsWrapper = new wordpressplatinumListWrapper();
        String body = '{"roles":"platinum", "meta" : { "Sf_ClientAccountId": "'+ SFaccountid +'", "Sf_PlatinumSaleId": "'+ SFSaleid+ '", "Sf_PrimaryContactId":"'+ SFcontactid +'", "Sf_PlatinumSaleStage":"'+ SFPlatinumSale +'"}}';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal/'+wordPressId);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(body);
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug('Update=='+response.getBody());
            wordpressplatinumListWrapper accwordpressWrapper = new wordpressplatinumListWrapper();
            String responseBody = response.getBody();
            Map<String, Object> wordpressResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
            Map<String, Object> metadatadetails = (Map<String, Object>) wordpressResponse.get('meta');
            List<String> role = (List<String>) wordpressResponse.get('roles');
            String PlatinumaccountID=String.valueof(metadatadetails.get('Sf_ClientAccountId'));
            String PlatinumsaleID=String.valueof(metadatadetails.get('Sf_PlatinumSaleId'));
            String PlatinumconID=String.valueof(metadatadetails.get('Sf_PrimaryContactId'));
            String PlatinumSaleStage=String.valueof(metadatadetails.get('Sf_PlatinumSaleStage'));
            PlatinumaccountID=PlatinumaccountID.replace('(', '');
            PlatinumaccountID=PlatinumaccountID.replace(')', '');
            PlatinumsaleID=PlatinumsaleID.replace('(', '');
            PlatinumsaleID=PlatinumsaleID.replace(')', '');
            PlatinumconID=PlatinumconID.replace('(', '');
            PlatinumconID=PlatinumconID.replace(')', '');
            if(!TEst.isRunningTest()){
                PlatinumSaleStage=PlatinumSaleStage.replace('(', '');
                PlatinumSaleStage=PlatinumSaleStage.replace(')', '');
                
            }
            System.debug('PlatinumaccountID=='+PlatinumaccountID);
            System.debug('PlatinumsaleID=='+PlatinumsaleID);
            System.debug('PlatinumconID=='+PlatinumconID);
            System.debug('SFaccountid=='+SFaccountid);
            System.debug('SFSaleid=='+SFSaleid);
            System.debug('SFcontactid=='+SFcontactid);
            System.debug('PlatinumSaleStage=='+SFcontactid);
            accSyncsWrapper.WplatinumaccountId=PlatinumaccountID;
            accSyncsWrapper.WplatinumcontactId=PlatinumconID;
            accSyncsWrapper.WplatinumaccsaleId=PlatinumsaleID;
            accwordpressWrapper.WplatinumsaccPlatinumSaleStage=PlatinumSaleStage;
            accwordpressWrapper.WordPressRoles = (role!=null && role.size()>0)?String.join(role,';'):'';
            If((SFaccountid != accwordpressWrapper.WplatinumaccountId)|| (SFSaleid !=accwordpressWrapper.WplatinumaccsaleId)|| (SFcontactid !=accwordpressWrapper.WplatinumcontactId)||(SFPlatinumSale !=accwordpressWrapper.WplatinumsaccPlatinumSaleStage )|| PlatinumaccountID=='' || PlatinumsaleID=='' || PlatinumconID==''|| PlatinumSaleStage==''){
                accwordpressWrapper.WplatinumsfMatch=true;
            } 
        }
        return accSyncsWrapper;
    }
    /**New Callout Start*************************************///////
    public static Contact searchUserCallout(Contact cont){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal?search='+cont.Email);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        String responseBody = response.getBody();
        List<PlatinumUser.newUser> lstbrandNewUser = (List<PlatinumUser.newUser>)JSON.deserialize(responseBody, List<PlatinumUser.newUser>.class);
        if(lstbrandNewUser.size()==1){
            cont.Platinum_Wordpress_Id__c = lstbrandNewUser[0].id;
            cont.Wordpress_User_Roles__c = (lstbrandNewUser[0].roles!=null && lstbrandNewUser[0].roles.size()>0)?String.join(lstbrandNewUser[0].roles, ','):'';
            update cont;
        }
        
        return cont;
    }
    /**New Callout End*************************************///////
    @AuraEnabled
    public static string processEmail(String email, String password,String accconId){
        
        String sMessage='';
        EmailTemplate emailTemplate = [Select Id,Subject,Description,HtmlValue,DeveloperName,Body from EmailTemplate where developername  = 'Password_Reset_Email'];
        String currentUserEmail = UserInfo.getUserEmail();
        String[] ccAddresses = new String[] {currentUserEmail};
            try{
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {email}; 
                    System.debug('email=='+toAddresses);
                mail.setToAddresses(toAddresses);
                mail.setTemplateID(emailTemplate.Id);
                mail.setTargetObjectId(accconId);
                mail.setCcAddresses(ccAddresses);
                mail.setTreatTargetObjectAsRecipient(false); 
                
                Messaging.SendEmailResult [] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
                sMessage='Success';
                system.debug(results);
            }
        catch(Exception ex){
            sMessage=ex.getLineNumber()+'\n'+ex.getCause()+'\n'+ex.getMessage()+'\n'+ex.getStackTraceString();
        }
        return sMessage;
    }
    @AuraEnabled
    public static SFplatinumListWrapper getcreateuserdetailsfromcontact(String accountId){
        SFplatinumListWrapper acccontdetailsSFWrapper = new SFplatinumListWrapper();
        Contact cont;
        List<contact> conList = [SELECT Id,Platinum_Wordpress_Id__c,Email,FirstName,LastName,Platinum_Email__c,Email_Username__c 
                                 from contact WHERE  AccountId=: accountId and Account_Roles__c='Primary Contact'  
                                 Order by LastmodifiedDate Desc ];
        
        if(conList.size()>1){
            acccontdetailsSFWrapper.hasmorethanoneprimarycontact=true;
        }
        else if(conList.size()==1){
            acccontdetailsSFWrapper.hasmorethanoneprimarycontact=false;
            cont = conList[0];
            if(String.isBlank(cont.Platinum_Wordpress_Id__c)){
                //test 
                if(!Test.isRunningTest()) {
                    try{
                        cont = searchUserCallout(cont);
                       }
                    catch (Exception e) {
                    debugInfo.createDebugLog(e);
                }
                }
                //
               // cont = searchUserCallout(cont);
            }
            
            acccontdetailsSFWrapper.acccontactWPId=cont.Platinum_Wordpress_Id__c;
            acccontdetailsSFWrapper.acccontactId=cont.id;
            acccontdetailsSFWrapper.accconEmail=cont.Email;
            acccontdetailsSFWrapper.accconFirstName=cont.FirstName;
            acccontdetailsSFWrapper.accconLastName=cont.LastName;
            acccontdetailsSFWrapper.accPlatinumEmail=cont.Platinum_Email__c;
           
            
        }
        return acccontdetailsSFWrapper;
    }
    @AuraEnabled
    public static SFplatinumListWrapper createPlatinumUser(List<Id> conIds ) {
        SFplatinumListWrapper acccontdetailsSFWrapper = new SFplatinumListWrapper();
        List<Contact> conList = [SELECT Id,AccountId,Platinum_Username__c,Email,FirstName,LastName FROM Contact Where Id IN :conIds LIMIT 1];
    
        String username = conList[0].Email;
        String email = conList[0].Email;
        String firstName = conList[0].FirstName;
        String lastName = conList[0].LastName;
        String password;
        Id oppId;
        String accId = conList[0].accountId;
        String platinumSaleId ='';
        String conId = conList[0].Id;
        List<opportunity> opplist = [SELECT Id FROM Opportunity WHERE RecordTypeId = '012U0000000g5s4' AND AccountId = :accId LIMIT 1];
        List<opportunity> InfinityProductList=[Select id,name,Infinity_Memebership__c from opportunity where (StageName='Closed Won' or StageName='Fulfillment/Partial Payment') and AccountId=:accId and RecordType.Name='Infinity Subscription'and (Infinity_Memebership__c='Free' or Infinity_Memebership__c='Stock' or Infinity_Memebership__c='Real'or Infinity_Memebership__c='360' )limit 1];
        if(opplist.size()>0){
            oppId=opplist[0].id;
            acccontdetailsSFWrapper.hasplatinumSubscription=true;
            platinumSaleId = String.valueOf(oppId);
            
            
            system.debug('entering platinum callout');
            system.debug(username + '' + email + '' + password + '' + accId + '' + platinumSaleId + '' + conId + '' + firstName + '' + lastName);
            
            if(!Test.isRunningTest()) {
                
                createPlatinumUserFromCmpCallout.makePostCallout(username, email, password, accId, platinumSaleId, conId, firstName, lastName);
            }
        }else {
            if(InfinityProductList.size()>0){
                
                
                if(!Test.isRunningTest()) {
                    createPlatinumUserFromCmpCallout.makePostCallouttoaddServiceUser(username, email, password, accId, platinumSaleId, conId, firstName, lastName);
                    
                }
                
            }
        }
        If(opplist.size()==0 && InfinityProductList.size()==0){
            acccontdetailsSFWrapper.showerror=true;
            
        }else{
            acccontdetailsSFWrapper.showerror=false;
        }
        
        
            acccontdetailsSFWrapper.accconFirstName=conList[0].FirstName;
            acccontdetailsSFWrapper.accconLastName=conList[0].LastName;
            acccontdetailsSFWrapper.accconEmail=conList[0].Email;
        
        return acccontdetailsSFWrapper;
    } 
    @AuraEnabled
    public static void sendUpdate(Id conId,String Email){
        
        List<Contact> conList = [SELECT Platinum_Wordpress_Id__c, Platinum_Password__c, FirstName, LastName, Platinum_Email__c FROM Contact WHERE Id = :conId];
        conList[0].Platinum_Email__c=Email;
        update conList;
        List<Contact> updatedconList = [SELECT Platinum_Wordpress_Id__c, Platinum_Password__c, FirstName, LastName, Platinum_Email__c FROM Contact WHERE Id = :conId];
        
        wordpressUpdatePlatinumUser.processContacts(updatedconList);
    }
    public class SFplatinumListWrapper{
        @AuraEnabled
        public boolean hasmorethanoneprimarycontact{get;set;}
        @AuraEnabled
        public boolean hasplatinumSubscription{get;set;}
        @AuraEnabled
        public boolean hasdidgitalproducts{get;set;}
        @AuraEnabled
        public boolean has{get;set;}
        @AuraEnabled
        public ID acccontactId{get;set;}
        @AuraEnabled
        public string acccontactWPId{get;set;}
        @AuraEnabled
        public Id accsaleId{get;set;}
        @AuraEnabled
        public Decimal accPlatinumsaleStage{get;set;}
        @AuraEnabled
        public string accPlatinumGeneratedPass{get;set;}
        @AuraEnabled
        public string accPlatinumEmail{get;set;}
        @AuraEnabled
        public string accconEmail{get;set;}
        @AuraEnabled
        public string accconFirstName{get;set;}
        @AuraEnabled
        public string accconLastName{get;set;}
        @AuraEnabled
        public boolean showerror{get;set;}
        @AuraEnabled
        public String roles{get;set;}
    }
    public class wordpressplatinumListWrapper{
        @AuraEnabled
        public string WplatinumcontactId{get;set;}
        @AuraEnabled
        public string  WplatinumaccountId{get;set;}
        @AuraEnabled
        public string WplatinumaccsaleId{get;set;}
        @AuraEnabled
        public Boolean WplatinumsfMatch{get;set;}
        @AuraEnabled
        public string WplatinumsaccPlatinumSaleStage{get;set;}
        // change
        @AuraEnabled
        public String WordPressRoles{get;set;}
        @AuraEnabled
        public string WplatinumEmail{get;set;}
        
    }
    public class DigitalproductsListWrapper{
        @AuraEnabled
        public boolean hasmorethanoneprimarycontactDp{get;set;}
        @AuraEnabled
        public ID Conid{get;set;}
        @AuraEnabled
        public string ConHasService{get;set;}
        @AuraEnabled
        public string  hasDigitalproducts{get;set;}
        @AuraEnabled
        public boolean  conhasAfs{get;set;}
        @AuraEnabled
        public boolean  conhastaxtoolbox{get;set;}
        @AuraEnabled
        public string  oplhasAfs{get;set;}
        @AuraEnabled
        public string  oplhastaxtoolbox{get;set;}
        
        @AuraEnabled
        public boolean  oplhasNooppnoservice{get;set;}
        @AuraEnabled
        public string  oplhasinfinitysubcription{get;set;}
        @AuraEnabled
        public boolean  conhasInfinity{get;set;}
        @AuraEnabled
        public boolean  conhasserviceitems{get;set;}
        @AuraEnabled
        public string  ServicesPurchasedByClientswrapped{get;set;}
    }
    public class wrapContact {
        public string ContactID {get; set;}
        public string wordPressID {get; set;}
        public string serviceItems {get; set;}
        public Id accountID {get; set;}
        
        
        public wrapContact(string conID,string wPID,String sIs, Id aid) {
            ContactID    = conID;
            wordPressID  = wPID;
            serviceItems = sIs;
            accountID    = aid;
        }
    }
    public class wrapoppaccountIdandServiceitems {
        
        public string oppserviceItems {get; set;}
        public Id oppaccountID {get; set;} 
        
        
        public wrapoppaccountIdandServiceitems(String sIs, Id aid) {   
            oppserviceItems = sIs;
            oppaccountID    = aid;
        }
    }
    
    private static wrapContact getPrimaryOrOldestContact(Id accountId) {
        
        List<Contact> conList = new List<Contact>();
        
        // What does IDC stand for? Why is it important?
        string contactIDC   = '';
        string wordPressIDC = '';
        string serviceIDC   = '';
        List<Contact> PrimaryContact = [Select id from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC];
        
        if(PrimaryContact.size()==1){
            ContactIdC   = [Select id from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC]?.Id;
            wordPressIDC = [SELECT  Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
            serviceIDC   = [SELECT  Service_Item_List__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Service_Item_List__c;
        } else if(PrimaryContact.size()>1){
            ContactIdC   = [SELECT Id FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact' and Platinum_Wordpress_Id__c != '' ORDER BY CreatedDate ASC limit 1]?.Id;
            
            if(ContactIdC !=''){
                wordPressIDC  = [SELECT  Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact' and Platinum_Wordpress_Id__c !=''ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
                serviceIDC    = [SELECT  Service_Item_List__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact' and Platinum_Wordpress_Id__c !='' ORDER BY CreatedDate ASC limit 1]?.Service_Item_List__c;
            }else{
                ContactIdC    = [SELECT Id FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1]?.Id;
                wordPressIDC  = [SELECT Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
                serviceIDC    = [SELECT Service_Item_List__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'  ORDER BY CreatedDate ASC limit 1]?.Service_Item_List__c;
                
            }
        }else{
            ContactIdC        = [SELECT Id FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Id;
            wordPressIDC      = [SELECT Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
            serviceIDC        = [SELECT Service_Item_List__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Service_Item_List__c;
        }
        
        
        
        System.debug('wordPressID=='+wordPressIDC);
        System.debug('serviceIDC=='+serviceIDC);
        System.debug('serviceIDC=='+accountId);
        wrapContact wc = new wrapContact(ContactIdC,wordPressIDC,serviceIDC,accountId);
        return wc;
        
    }
    public boolean  stringCompare(List<string> conService,List<string> oppService){
        
        //con sert vice sorted? How could this be named better?
        //opp sert vice sorted? How could this be named better?
        string consertvicesorted   = '';
        string oppsertvicesorted   = '';
        boolean conserviceupdated  = false;
        conService.sort();
        oppService.sort();
        
        for(string cs : conService){
            if(string.isBlank(consertvicesorted)){
                consertvicesorted = cs +', ';
            }else{
                consertvicesorted = consertvicesorted+cs +', ';
            }
            
            
        }
        for(string os:oppService){
            if(string.isBlank(oppsertvicesorted)){
                oppsertvicesorted = os +', ';
            }else{
                oppsertvicesorted = oppsertvicesorted+os +', ';
            }
            
            
        }
        System.debug('consertvicesorted--'+consertvicesorted);
        System.debug('oppsertvicesorted--'+oppsertvicesorted);
        if(consertvicesorted==oppsertvicesorted){
            System.debug('true');
            conserviceupdated=true;
        }else{
            conserviceupdated=false;
        }
        return conserviceupdated;
        
        
    }
    Public string getPicklistvalueLabel(string objectName, string fieldName,String actualPicklistValue){
        
        String autualPicklistlabel='';
        Schema.SObjectType sobjDetail = Schema.getGlobalDescribe().get(objectName) ;
        Schema.DescribeSObjectResult sobjResult = sobjDetail.getDescribe() ;
        Map<String,Schema.SObjectField> fields = sobjResult.fields.getMap() ;
        Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : picklistValues){
            if(actualPicklistValue==pickListVal.getValue()){
                autualPicklistlabel=pickListVal.getLabel();
            }
            System.debug(pickListVal.getLabel() +' '+pickListVal.getValue());
            
        }
        return autualPicklistlabel;
    }
}