public class DigitalProductsSaleWPusercreationBatch {
public static List<ID> prepareCallout(List<Id> accountIDs) {
        List <Id> conIDs=new List <Id>();
	List<Account> Acclist=[Select id,E_mail__c,First_Name__c,Last_Name__c from account where ID IN:accountIDs];
   
    List<wrapWpUserDetails> wpuserdetailList=new  List<wrapWpUserDetails>();
        for(account a:Acclist){
		  wrapConatct wcreturned= getPrimaryOrOldestContact(a.id);
            if(wcreturned.wordPressID==null || wcreturned.wordPressID=='') {
                Integer len = 10;
			Blob blobKey = crypto.generateAesKey(128);
			String key = EncodingUtil.convertToHex(blobKey);
			String password = key.substring(0,len);
                 wrapWpUserDetails wpuserdetail=new wrapWpUserDetails(a.E_mail__c,a.E_mail__c,a.id, wcreturned.ContactID,a.First_Name__c,a.Last_Name__c,password,'');
              
                conIDs.add(wcreturned.ContactID);
                wpuserdetailList.add(wpuserdetail);
                    if(!Test.isRunningTest()) {
            try{ 
               
        		 makeCallout( wpuserdetail.WPusername, wpuserdetail.WPemail, wpuserdetail.WPpassword, wpuserdetail.WPaccountID, wpuserdetail.WPoppid , wpuserdetail.WPcontactID, wpuserdetail.WPfirstName,  wpuserdetail.WPlastName);
            } catch (Exception e) {
            debugInfo.createDebugLog(e);
            }
         }
               
            }
          
        }
    
    
        return conIDs;
        
    }

    public static void makeCallout(String username, String email, String password, String accId, String oppId, String conId, String firstName, String lastName) {
   	 
            try{ 
                System.debug('UserName--'+username);
                System.debug('Email--'+email);
        		createPlatinumUserFromCmpCallout.makePostCallouttoaddServiceUser(username, email, password, accId, oppId, conId, firstName, lastName);
            } catch (Exception e) {
            debugInfo.createDebugLog(e);
           }
       
  }
    
    public static wrapConatct getPrimaryOrOldestContact(Id accountId) {

        List<Contact> conList = new List<Contact>();
         string contactIDC ='';
        string wordPressIDC='';
      ContactIdC=  [SELECT Id FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Id;
        if(ContactIdC !=null){
             wordPressIDC=[SELECT  Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
            System.debug('wordPressID=='+wordPressIDC);
        }else{
              ContactIdC=  [SELECT Id FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Id;
        }
       System.debug('ContactIdC=='+ContactIdC);
        wrapConatct wc=new wrapConatct(ContactIdC,wordPressIDC);
        return wc;

    }
     public class wrapConatct {
        public string ContactID {get; set;}
        public string wordPressID {get; set;}
 
      
        public wrapConatct(string conID,string wPID) {
            ContactID = conID;
            wordPressID = wPID;
            
        }
    }
    
        public class wrapWpUserDetails {
        
       public string WPusername {get; set;}
   	
            public string WPemail {get; set;}
            public string WPaccountID {get; set;}
            public string WPcontactID {get; set;}
            public string WPfirstName {get; set;}
            public string WPlastName {get; set;}
             public string WPpassword {get; set;}
             public string WPoppid {get; set;}
      
        public wrapWpUserDetails(string username,string email,string accountID,string contactID,string firstName,string lastName,string password, String opp) {
            WPusername = username;
            WPemail = email;
              WPaccountID = accountID;
              WPcontactID = contactID;
              WPfirstName = firstName;
              WPlastName = lastName;
            WPpassword=password;
            WPoppid=opp;
             
            
        }
    }
}