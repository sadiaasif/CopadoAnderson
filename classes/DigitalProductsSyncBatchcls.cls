//Add SCH-0377
//Test class with test data setup -DigitalProductsSyncBatchTest 
//Test class with all data -DigitalProductsSyncBatchTestwithallData

public class DigitalProductsSyncBatchcls implements   Database.Batchable<sObject>,    Database.AllowsCallouts, Database.Stateful {
    private String query; 
    public Integer recordsProcessed = 0;
    public   DebugInfo__c Dinfo=new DebugInfo__c();
    
    List<task> taskList=new List<task>();
    
    public DigitalProductsSyncBatchcls(string query){
        this.query = query;    
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc) { 
        return Database.getQueryLocator(this.query);
    }
    
    public void execute(Database.BatchableContext bc, List<account> ClientwithDigitalProducts){
        List<wrapContact> wrapPrimarycondetailList     = new list<wrapContact>();
        List<wrapoppaccountIdandServiceitems> wrapoppaccountIdandServiceitemsList = new list<wrapoppaccountIdandServiceitems>();
        List<id> accountidList                    = new List<Id>();
        List<string> digicodeonCustomMetadataList         = new List<String>();
        
        Map<decimal,string> InfinityLevelandmembershipMap = new Map<decimal,string>();
        String ServicesPurchasedByclient           = '';
        Map <id,contact> contactserviceUpdateMap   = new Map<id,contact>();
        Map <id,string> accountoppserviceitemsMap        = new Map<id,string>();
        
        for(Account client : ClientwithDigitalProducts){
            wrapContact ConPrimaryCondetail = getPrimaryOrOldestContact(client.id);
            wrapPrimarycondetailList.add(ConPrimaryCondetail);
            accountidList.add(client.Id);
            
        }
        
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
        
        // Loops through all the accountId and sales specific to a Account
        // compares if it matches with the digital products/Infinity metatdata.
        // If present it will store it on ServicesPurchasedByclient variable
        
        // Making the loop variable and collection name so similar is confusing
        // Why the name ServicePresent? How could that be more descriptive?
        // contactServiceItemList?
        for(Id accountid : accountidList){
            ServicesPurchasedByclient = '';
            system.debug('The accountId is: ' + accountid);
            for(opportunity oppDiditalProductNoInfinity : [Select id,Service_Item_List__c ,accountID,RecordType.name,Infinity_Memebership__c from opportunity where accountID = :accountid and HasDigitalProducts__c = 'Yes'  and RecordType.name != 'Infinity Subscription']){
                for(string digicodeonCustomMetadata : digicodeonCustomMetadataList){
                    System.debug('Reached 1');
                    If(!string.isBlank(oppDiditalProductNoInfinity.Service_Item_List__c) ? oppDiditalProductNoInfinity.Service_Item_List__c.contains(digicodeonCustomMetadata):false){
                        System.debug('Reached 2');
                        if(string.isBlank(ServicesPurchasedByclient)){
                            System.debug('Reached 3');
                            ServicesPurchasedByclient = digicodeonCustomMetadata+',';
                        }else{
                            System.debug('Reached 3');
                            ServicesPurchasedByclient = ServicesPurchasedByclient+digicodeonCustomMetadata+',';
                        }
                        system.debug('ServicesPurchasedByclient=='+ServicesPurchasedByclient);
                        
                        
                    }
                }
                
                
            }   
            
            // The levelofInfinityproduct is a number field 
            // It is used to compare the infinity digital products and upgrade them. 
            // For example if the client purchases free and then 360, this code will upgrade then to 360
              
            Decimal levelofInfinityproduct = 0;
            for(opportunity opinfinityDigitalproduct : [Select id,Service_Item_List__c ,accountID,RecordType.name,Infinity_Memebership__c from opportunity where accountID=:accountid and HasDigitalProducts__c = 'Yes' and RecordType.name = 'Infinity Subscription']){
                
                // Why the name incode? Is that like "encode"? Does that mean we're "inside the code"? 
                // Better might be InfCodeNumber <== longer to type but brings meaning to all future uses
                // The easy part is getting the functionality working
                // The hard part is making the code tell a story that make future edits for a new developer simple
                
                for(decimal InfLevelNumber : InfinityLevelandmembershipMap.keyset()){
                    
                    
                    If(!string.isBlank(opinfinityDigitalproduct.Infinity_Memebership__c) ?opinfinityDigitalproduct.Infinity_Memebership__c.contains(InfinityLevelandmembershipMap.get(InfLevelNumber)) && InfLevelNumber>levelofInfinityproduct :false){
                        levelofInfinityproduct = InfLevelNumber; // Level = InfCodeNumber
                        System.debug('Reached loop 2'+ levelofInfinityproduct);
                        System.debug('Reached loop 2 incode' + InfLevelNumber);
                        
                    }
                    
                }
                
            }
            
            if(levelofInfinityproduct != 0){
                if(string.isBlank(ServicesPurchasedByclient)){
                    System.debug('Reached loop 3');
                    ServicesPurchasedByclient = InfinityLevelandmembershipMap.get(levelofInfinityproduct)+',';
                }else{
                    System.debug('Reached loop 3');
                    ServicesPurchasedByclient = ServicesPurchasedByclient+InfinityLevelandmembershipMap.get(levelofInfinityproduct)+',';
                }
                system.debug('ServicesPurchasedByclient=='+ServicesPurchasedByclient);
                
                
            }
            
            system.debug('FinalServicePresent=='+ServicesPurchasedByclient);
            system.debug('accoid=='+ServicesPurchasedByclient);
            accountoppserviceitemsMap.put(accountid,ServicesPurchasedByclient);
        }
        // wrapopportunity is a wrapper class
        // it is used to store the accountID and its respective service ids that needs to updated on the contact service item
        for(Id accountid:accountoppserviceitemsMap.keySet()){
            wrapoppaccountIdandServiceitems wp=new wrapoppaccountIdandServiceitems(accountoppserviceitemsMap.get(accountid),accountid);
            wrapoppaccountIdandServiceitemsList.add(wp);
        }
        System.debug('Conwrap Size=='+wrapPrimarycondetailList.size());
        System.debug('oppwrapsize Size=='+wrapoppaccountIdandServiceitemsList.size());
        
        // wrapConatct is a contact wrapper class 
        // It is used to store the contact id, Wordpress id, and Service items that are present on the Contact
        // The below for loop queries through the contact wrapper list and opportunity wrapper listand compares the service item list
        // and then updates the contact if the correct digital product is not present 
        
        // What does the mispelling "wrapConatct" communicate about you as a developer? 
        // I know you care about your work and want to write the best code. If I didn't know that I might think:
        // 1) This developer doesn't know how to spell 
        // 2) Or does know how to spell but doesn't care to spell properly
        // 3) Made a typo but too lazy or rushed to go back and fix it 
        // 4) Doesn't care or realize the impact when someone else has to read the code
        
        // What could WC be renamed to in order to make it easier to understand through line 185?
        for(wrapContact wPrimarycondetail:wrapPrimarycondetailList){
         
        // What could WP be renamed to in order to make it easier to understand through line 185?
            for(wrapoppaccountIdandServiceitems wOppaccountIdandServiceitems:wrapoppaccountIdandServiceitemsList ){
                if(wPrimarycondetail.accountID == wOppaccountIdandServiceitems.oppaccountID){
                    System.debug('account id update=='+ wPrimarycondetail.accountID);
                    System.debug('opp id update=='+ wOppaccountIdandServiceitems.oppaccountID);
                    if(wPrimarycondetail.ContactID != null){
                        System.debug('Con id update=='+wPrimarycondetail.ContactID);
                        
                        // How could this be named better?
                        contact ContactToBeupdated = [Select id,Service_Item_List__c from contact where id = :wPrimarycondetail.ContactID];
                        if(ContactToBeupdated != null){
                            if(wPrimarycondetail.serviceItems != '' && wPrimarycondetail.serviceItems!=null){
                                
                                // How could these be named better?
                                List<string> contactserviceSplit = wPrimarycondetail.serviceItems.split(',');
                                List<string> oppeserviceSplit    = wOppaccountIdandServiceitems.oppserviceItems.split(',');
                                Boolean updateContactservice     = Stringcompare(contactserviceSplit,oppeserviceSplit);
                                if(!updateContactservice){
                                    system.debug('Service does not contain');
                                    ContactToBeupdated.Service_Item_List__c = wOppaccountIdandServiceitems.oppserviceItems;
                                    system.debug('final service iem 1' + wOppaccountIdandServiceitems.oppserviceItems);
                                    
                                }
                            }else{
                                ContactToBeupdated.Service_Item_List__c = wOppaccountIdandServiceitems.oppserviceItems;
                                system.debug('final service iem 2==' + wOppaccountIdandServiceitems.oppserviceItems);
                                
                            }
                            contactserviceUpdateMap.put(wPrimarycondetail.ContactID,ContactToBeupdated);
                        }
                    }
                    
                    
                }
                
            }
            
        }
        if(!contactserviceUpdateMap.isEmpty()){
            
            update contactserviceUpdateMap.values();
        }          
        
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
    public boolean stringCompare(List<string> conService,List<string> oppService){
        
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
    public void finish(Database.BatchableContext bc){
        
        //SOQL Query very easy to read
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
                            JobItemsProcessed,
                            TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        integer cpuTime = Limits.getCpuTime();
        integer Queries = Limits.getQueries();
        
        Dinfo.DebugData__c = 'Job Name:SFFBuploadBatchClass; Records deleted:'+recordsProcessed;
        insert Dinfo;
    }
}