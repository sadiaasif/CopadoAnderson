public class PlatinumSaleWPuserflow {
@InvocableMethod( label='Create Platinum WP User' description='Create Platinum WP User' category='Callout' )
       public static List<String> prepareCallout(List<Id> SaleIDs) {
        List <String> conIDs=new List <String>();
ID SaleId = [SELECT ID FROM opportunity WHERE Id IN :SaleIDs Limit 1]?.id;
        ID accountID = [SELECT accountID FROM opportunity WHERE Id IN :SaleIDs Limit 1]?.accountID;

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
        return conIDs;
        
    }
    @future(Callout=true)
    public static void makeCallout(String username, String email, String password, String accId, String oppId, String conId, String firstName, String lastName) {
   	 
            try{ 
                System.debug('UserName--'+username);
                System.debug('Email--'+email);
        		createPlatinumUserCallout.makePostCallout(username, email, password, accId, oppId, conId, firstName, lastName);
            } catch (Exception e) {
            debugInfo.createDebugLog(e);
           }
       
  }
    
    private static wrapConatct getPrimaryOrOldestContact(Id accountId) {

        List<Contact> conList = new List<Contact>();
         string contactIDC ='';
        string wordPressIDC='';
      ContactIdC=  [SELECT Id FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Id;
        if(ContactIdC !=''){
             wordPressIDC=[SELECT  Platinum_Wordpress_Id__c FROM Contact WHERE AccountId = :accountId and Account_Roles__c = 'Primary Contact'ORDER BY CreatedDate ASC limit 1]?.Platinum_Wordpress_Id__c;
            System.debug('wordPressID=='+wordPressIDC);
        }else{
              ContactIdC=  [SELECT Id FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC limit 1]?.Id;
        }
       System.debug('wordPressID=='+wordPressIDC);
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
}