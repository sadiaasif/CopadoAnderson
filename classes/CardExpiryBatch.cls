global class CardExpiryBatch implements Database.Batchable<sObject> {

    public Date cDate{get;set;}
    
    global CardExpiryBatch(){
      cDate = Date.today();
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        string lifePlatinum = 'Lifetime Platinum';
        string frequency= 'Once';
        string query = 'SELECT Id, AccountId, Account.E_Mail__c, CreditCardExpiry__c, Account.Platinum_Membership__c'
          +' FROM Opportunity WHERE  Account.Platinum_Membership__c != null AND Account.Platinum_Membership__c != :lifePlatinum AND ChargentSFA__Payment_Frequency__c != :frequency ';
        return Database.getQueryLocator(query);
    }
    
    public static sObject findItem(string propertyName, string propertyValue, List<sObject> collection)
    {
        if (!string.isNotBlank(propertyValue) || collection==null) return null;
        for(sObject item : collection) {
           if (item.get(propertyName) == propertyValue)
             return item;
        }
    
        return null;
     }
     
     public static string SelectEmail(string eName)
     {
        string eId = '';
        List<EmailTemplate> eIds = [SELECT Id FROM EmailTemplate WHERE Name = :ename ];
        if(eIds == null ) return '';
        for (EmailTemplate item : (List<EmailTemplate>)eIds) {
            eId = item.id;
        }
        
        return eId;
     }
     
     private static void SendEmail(string templateId,string contactId,string opportunityId)
     {
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
         email.setSaveAsActivity(false);
         email.setTemplateId(templateId);
         email.setTargetObjectId(contactId);
         email.setWhatId(opportunityId);
         Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); 
     }

    global void execute(Database.BatchableContext BC, List<sObject> scope){
      string templateId = '';
      
      List<string> accountIds = new List<string>();
      for(opportunity item : (List<Opportunity>)scope) {
          accountIds.add(item.AccountId);
      }
      List<Contact> contacts = [SELECT Id,AccountId,Magentrix_User_Role__c FROM Contact WHERE AccountId IN :accountIds];
          
      for (Opportunity item : (List<Opportunity>)scope) {
            Contact contact = (Contact)findItem('AccountId',item.AccountId, contacts);
            if (contact==null) continue;

            string cId = contact.Id;
            
            if(item.CreditCardExpiry__c == cDate.addDays(10))
            {
                SendEmail(SelectEmail('Card Expiry Reminder(10 days)'),cId,item.Id);    
            }
            else if(item.CreditCardExpiry__c == cDate.addDays(1))
            {
                SendEmail(SelectEmail('Card Expiry Reminder(1 day)'),cId,item.Id);              
            }
            else if(item.CreditCardExpiry__c == cDate.addDays(-1))
            {
                Account a = new Account(Id=item.AccountId,Platinum_Membership__c=null);
                update a;
                
                contact.Magentrix_User_Role__c = 'Client';
                update contact;
                
                Note n = new Note();
                n.Title = 'Platinum Termination_Credit card expired';
                n.Body = 'Nightly job changed the value of the Account from Platinum client to Client due to expired credit card';
                n.ParentId = item.Account.Id;
                Insert n;
            }
                               
        }   
    }   
     

    global void finish(Database.BatchableContext BC){

        DateTime now = DateTime.now();
        Integer ms = now.millisecond();
        Integer second = now.second();
        Integer minute = now.minute();
        Integer hour = now.hour();
        Integer day = now.day();
        Integer year = now.year();

        String jobName = 'Batch: ' + ms + ':' + second + ':' + minute + ':' + hour + ':' + day + ':' + year;

        CardExpiryBatch batch = new CardExpiryBatch();
        string cronID = System.scheduleBatch(batch, jobName, 5, 1440);
    }
}