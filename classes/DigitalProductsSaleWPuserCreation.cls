public class DigitalProductsSaleWPuserCreation {
    public static boolean alreadyProcessed = false;
    @InvocableMethod( label='Create WP User' description='Create WP User' category='Callout' )
    
    public static void prepareCallout(List<Id> SaleIDs) {
        alreadyProcessed=true;
        
        List <String> conIDs=new List <String>();
        Boolean UserCreated=False;
        ID SaleId = [SELECT ID FROM opportunity WHERE Id In :SaleIDs Limit 1]?.id;
        ID accountID = [SELECT accountID FROM opportunity WHERE Id In:SaleIDs Limit 1]?.accountID;
        
        wrapConatct wcreturned= getPrimaryOrOldestContact(accountId);
        
        System.debug('wpid=='+wcreturned.wordPressID);
        
        
        if(wcreturned.wordPressID==null || wcreturned.wordPressID=='') {
            System.debug('Callout');
            String username = [SELECT E_mail__c FROM Account WHERE Id = :accountId Limit 1]?.E_mail__c;
            String email = [SELECT E_mail__c FROM Account WHERE Id = :accountId Limit 1]?.E_mail__c;
            String firstName = [SELECT First_Name__c FROM Account WHERE Id = :accountId Limit 1]?.First_Name__c;
            String lastName = [SELECT Last_Name__c FROM Account WHERE Id = :accountId Limit 1]?.Last_Name__c;
            String password;
            String accId = accountId;
            String oppId = SaleId;
            String conId = wcreturned.ContactID; 
            if(!Test.isRunningTest()) {
                try{ 
                    System.debug('UserName--'+username);
                    System.debug('Email--'+email);
                    makeCallout(username, email, password, accId, oppId, conId, firstName, lastName);
                } catch (Exception e) {
                    debugInfo.createDebugLog(e);
                }
            }
            
        }
        conIDs.add(wcreturned.ContactID);
        System.debug('ConDI ==='+wcreturned.ContactID);
        
        
    }
    @future(Callout=true)
    public static void makeCallout(String username, String email, String password, String accId, String oppId, String conId, String firstName, String lastName) {
        
        try{ 
            System.debug('UserName--'+username);
            System.debug('Email--'+email);
            createPlatinumUserCallout.makePostCallouttoaddServiceUser(username, email, password, accId, oppId, conId, firstName, lastName);
        } catch (Exception e) {
            debugInfo.createDebugLog(e);
        }
        
    }
    
    private static wrapConatct getPrimaryOrOldestContact(Id accountId) {
        
        List<Contact> conList = new List<Contact>();
        string contactIDC ='';
        string wordPressIDC='';
        string serviceIDC='';
        ContactIdC=  [SELECT Id FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Id;
        if(ContactIdC !=''){
            wordPressIDC=[SELECT  Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
            serviceIDC=[SELECT  Service_Item_List__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Service_Item_List__c;
            System.debug('wordPressID=='+wordPressIDC);
        }else{
            ContactIdC=  [SELECT Id FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Id;
            wordPressIDC=[SELECT  Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
            serviceIDC=[SELECT  Service_Item_List__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Service_Item_List__c;
        }
        System.debug('wordPressID=='+wordPressIDC);
        wrapConatct wc=new wrapConatct(ContactIdC,wordPressIDC,serviceIDC);
        return wc;
        
    }
    public class wrapConatct {
        public string ContactID {get; set;}
        public string wordPressID {get; set;}
        public string serviceItems {get; set;}
        
        
        public wrapConatct(string conID,string wPID,String sIs) {
            ContactID = conID;
            wordPressID = wPID;
            serviceItems=sIs;
        }
    }
    
    public static void prepareCalloutfromTrigger(Id SaleIDs, List<Infinity_Subscription_Product__mdt> infinityList, List<Digital_Course__mdt> digitalList) {
        List <String> conIDs=new List <String>();
        ID SaleId = [SELECT ID FROM opportunity WHERE Id =: SaleIDs Limit 1]?.id;
        ID accountID = [SELECT accountID FROM opportunity WHERE Id =: SaleIDs Limit 1]?.accountID;
        string OppServiceItem = [SELECT Service_Item_List__c FROM opportunity WHERE Id =: SaleIDs Limit 1]?.Service_Item_List__c;
        
        wrapConatct wcreturned= getPrimaryOrOldestContact(accountId);
        updateContactServiceItemList(OppServiceItem, accountId, wcreturned.ContactID, infinityList, digitalList, wcreturned.serviceItems);
        System.debug('wpid=='+wcreturned.wordPressID);
        
        
        if(wcreturned.wordPressID==null || wcreturned.wordPressID=='') {
            System.debug('Callout');
            String username = [SELECT E_mail__c FROM Account WHERE Id = :accountId Limit 1]?.E_mail__c;
            String email = [SELECT E_mail__c FROM Account WHERE Id = :accountId Limit 1]?.E_mail__c;
            String firstName = [SELECT First_Name__c FROM Account WHERE Id = :accountId Limit 1]?.First_Name__c;
            String lastName = [SELECT Last_Name__c FROM Account WHERE Id = :accountId Limit 1]?.Last_Name__c;
            String password;
            String accId = accountId;
            String oppId = SaleId;
            String conId = wcreturned.ContactID; 
            if(!Test.isRunningTest()) {
                try{ 
                    System.debug('UserName--'+username);
                    System.debug('Email--'+email);
                    makeCallout(username, email, password, accId, oppId, conId, firstName, lastName);
                    alreadyProcessed = true;
                } catch (Exception e) {
                    debugInfo.createDebugLog(e);
                }
            }
            /*Map<String, Object> inputs = new Map<String, Object>();
            inputs.put('PrimaryContactID', wcreturned.ContactID);
            inputs.put('ServiceItem', OppServiceItem);
            inputs.put('CurrentServiceItems',wcreturned.serviceItems); 
            
            Flow.Interview.Sale_ServiceItemUpdate myFlow = 
                new Flow.Interview.Sale_ServiceItemUpdate(inputs);
            myFlow.start();*/
        }
        conIDs.add(wcreturned.ContactID);
        System.debug('ConDI ==='+wcreturned.ContactID);
        
        
    }
    
    public static void updateContactServiceItemList(String incServiceItems, Id accId, Id conId, List<Infinity_Subscription_Product__mdt> infinityProds, List<Digital_Course__mdt> digitalProds, String existingSI){
        Map<String, Object> inputs = new Map<String, Object>();
        if(accId != Null && incServiceItems != Null && conId != Null && infinityProds.size() > 0 && digitalProds.size() > 0){
            inputs.put('AccountId', accId);
            inputs.put('ServiceItemList', incServiceItems);
            inputs.put('ExistingServiceItems',existingSI);
            inputs.put('InfinityProds', infinityProds);
            inputs.put('DigitalProds', digitalProds);
            inputs.put('ConId', ConId);
            Flow.Interview.Sale_Platinum_Courses_Update_Contact_Service_Item_List myFlow = new Flow.Interview.Sale_Platinum_Courses_Update_Contact_Service_Item_List(inputs);
        	myFlow.start();
        }
        
    }
}