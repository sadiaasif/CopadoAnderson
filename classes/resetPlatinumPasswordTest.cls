@isTest
public class resetPlatinumPasswordTest {
    
    @testSetup static void setUp() {
        
        Account a = new Account();
        a.Name = '123';
        a.First_Name__c = 'Rob';
        a.Last_Name__c = 'Apples';
        a.E_Mail__c = 'nfrates+123@andersonadvisors.com';
        insert a;
        
        Id platinumId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        
        Opportunity o = new Opportunity();
        o.RecordTypeId = platinumId;
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.Name = 'Platinum Subscription';
        o.AccountId = a.id;
        insert o;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.Email = 'nfrates+123@andersonadvisors.com';
        c.FirstName = 'Rob';
        c.LastName = 'Apples';
        c.Account_Roles__c = 'Primary Contact';
        c.Password__c = 'Anderson123';
        insert c;
        
        Profile pf = [SELECT Id FROM profile WHERE name='Partner Community User' LIMIT 1]; 
        User u = new User(contactId=c.Id,
                                                                   username=c.Email, 
                                                                   firstname=c.FirstName,
                                                                   lastname=c.LastName, 
                                                                   email=c.Email,
                                                                   communityNickname = c.LastName + '_'+Math.random(),
                                                                   alias = string.valueof(c.FirstName.substring(0,1) + 
                                                                                          c.LastName.substring(0,1) + Math.random() ).substring(0,5), 
                                                                   profileid = pf.Id, emailencodingkey='ISO-8859-1',
                                                                   languagelocalekey='en_US', 
                                                                   localesidkey='en_US', 
                                                                   timezonesidkey='GMT'); 
        insert u;
      
    }
        
        @isTest
        static void testMethod1() {
  
            List<Account> a1 = [SELECT Id, Platinum_Client_View__c FROM Account];
            a1[0].Platinum_Client_View__c = 'Platinum';
        	update a1;
            
            List<Contact> c = [SELECT Id,Email From Contact];
            
            system.debug(c);
  
            List<id> contactIds = new List<Id>();
            
            contactIds.add(c[0].Id);

            system.debug(contactIds);
           
            ResetPlatinumPassword.contactToBeReset(contactIds);
        }
    
            @isTest
        	static void testMethod2() {
  
            List<Account> a1 = [SELECT Id, Platinum_Client_View__c FROM Account];
            a1[0].Platinum_Client_View__c = 'Platinum';
        	update a1;
            
            List<Contact> c = [SELECT Id,Email From Contact];
            
            system.debug(c);
  
            List<id> contactIds = new List<Id>();
            
            contactIds.add(c[0].Id);

            system.debug(contactIds);
           
            setPlatinumPassword.contactToBeSet(contactIds);
        }
}