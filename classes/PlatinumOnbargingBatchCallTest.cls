@isTest(SeeAllData=false)
public class PlatinumOnbargingBatchCallTest {

    static testmethod void test() {        
       
        String CRON_EXP = '0 0 0 15 3 ? *';
        
        // Create your test data
               List<Campaign> CampaignList = new List<Campaign>();
        List<Account> accounts = new List<Account>();
        List<opportunity> oppList=new List<Opportunity>();
        List<OpportunityLineItem> opLineitemlist=new List<OpportunityLineItem>();
     
        
        List<Contact> contacts = new List<Contact>();
        Campaign c1=new campaign();
        c1.Name='New Client Law and Tax Sale';
        CampaignList.add(c1);
       
        Campaign c2=new campaign();
        c2.Name='New Client Tax Sale';
        CampaignList.add(c2);
        
        Campaign c3=new campaign();
        c3.Name='New Client Law Sale';
        CampaignList.add(c3);
      
       
        insert CampaignList;
        
        
    
        
        
        for (Integer i=0;i<5;i++) {
            accounts.add(new Account(name='Apples '+i,Last_Name__c='Bobby '+i,First_Name__c='Apples'+i,Teams__c='Team 5'
                ));
        }
        insert accounts;
       
        for (Account account : [select id from account]) {
            contacts.add(new Contact(firstname='Bobby', 
                lastname='Apples', accountId=account.id,
                                    Account_Roles__c='Primary Contact'));
        }
        insert contacts;
        CampaignMember cm=new  CampaignMember();
        cm.ContactId=contacts[0].id;
        cm.CampaignId=c2.id;
        insert cm;
        contacts[1].CampaignID__c='New Client Law Sale';
        update contacts;
        Opportunity opp=new Opportunity();
        opp.Name='Test Sale 1';
        opp.AccountId=accounts[0].id;
        opp.RecordTypeId='012U0000000DFSx';
        opp.StageName='Closed Won';
        opp.CloseDate = Date.Today();
        oppList.add(opp);
        
         Opportunity opp2=new Opportunity();
        opp2.Name='Test Sale 2';
        opp2.AccountId=accounts[1].id;
        opp2.RecordTypeId='012U0000000DFSx';
         opp2.StageName='Closed Won';
        opp2.CloseDate = Date.Today();
        oppList.add(opp2);
        
        Opportunity opp3=new Opportunity();
        opp3.Name='Test Sale 3';
        opp3.AccountId=accounts[2].id;
        opp3.RecordTypeId='012U0000000DFSx';
         opp3.StageName='Closed Won';
        opp3.CloseDate = Date.Today();
        oppList.add(opp3);
       
      
        
   insert oppList;
        
        Id pricebookId = Test.getStandardPricebookId();

List<Product2> products=new List<Product2>();
Product2 prod = new Product2(
     Name = 'Test2',
     ProductCode = 'Pro-X',
     isActive = true,
    welcome_call__c=true,
    Type__c ='Tax'
    
);
        products.add(prod);
        Product2 prod1 = new Product2(
     Name = 'Test 1',
     ProductCode = 'Pro-X',
     isActive = true,
    welcome_call__c=true,
    Type__c ='Law'
    
);
         products.add(prod1);
        
insert products;

List<PricebookEntry> pbList=new List<PricebookEntry>();
PricebookEntry pbEntry1 = new PricebookEntry(
     Pricebook2Id = pricebookId,
     Product2Id = products[0].Id,
     UnitPrice = 100.00,
     IsActive = true
);
        pbList.add(pbEntry1);  
        PricebookEntry pbEntry2 = new PricebookEntry(
     Pricebook2Id = pricebookId,
     Product2Id = products[1].Id,
     UnitPrice = 100.00,
     IsActive = true
);
      pbList.add(pbEntry2);  

insert pbList;

OpportunityLineItem oli1 = new OpportunityLineItem(
     OpportunityId = oppList[0].Id,
     Quantity = 5,
     PricebookEntryId = pbList[0].Id,
     TotalPrice =  pbList[0].UnitPrice
);
        opLineitemlist.add(oli1);
        
        OpportunityLineItem oli2 = new OpportunityLineItem(
     OpportunityId = oppList[1].Id,
     Quantity = 5,
     PricebookEntryId =pbList[1].Id,
     TotalPrice =  pbList[1].UnitPrice
);
        opLineitemlist.add(oli2);
             OpportunityLineItem oli3 = new OpportunityLineItem(
     OpportunityId = oppList[1].Id,
     Quantity = 5,
     PricebookEntryId = pbList[0].Id,
     TotalPrice =  pbList[0].UnitPrice
);
       opLineitemlist.add(oli3);
             OpportunityLineItem oli4 = new OpportunityLineItem(
     OpportunityId = oppList[2].Id,
     Quantity = 5,
     PricebookEntryId = pbList[1].Id,
     TotalPrice =  pbList[1].UnitPrice
);
        opLineitemlist.add(oli4);
		insert opLineitemlist;
        List <ChargentSFA__Transaction__c> transactions=new List<ChargentSFA__Transaction__c>();
        ChargentSFA__Transaction__c t1= new ChargentSFA__Transaction__c();
       t1.ChargentSFA__Amount__c=100.00;
        t1.ChargentSFA__Opportunity__c=oppList[0].Id;
          t1.ChargentSFA__Payment_Method__c='Credit Card';
        t1.ChargentSFA__Response_Status__c='Approved';
        t1.ChargentSFA__Gateway_Date__c=System.today();
      
        t1.ChargentSFA__Gateway_ID__c='a0P6C000000cwEp';
        transactions.add(t1);
        ChargentSFA__Transaction__c t2= new ChargentSFA__Transaction__c();
       t2.ChargentSFA__Amount__c=200.00;
        t2.ChargentSFA__Opportunity__c=oppList[1].Id;
        t2.ChargentSFA__Response_Status__c='Approved';
        t2.ChargentSFA__Payment_Method__c='Credit Card';
         t2.ChargentSFA__Response_Status__c='Approved';
        t2.ChargentSFA__Gateway_Date__c=System.today();
          transactions.add(t2);
         ChargentSFA__Transaction__c t3= new ChargentSFA__Transaction__c();
       t3.ChargentSFA__Amount__c=100.00;
        t3.ChargentSFA__Opportunity__c=oppList[2].Id;
        t3.ChargentSFA__Response_Status__c='Approved';
        t3.ChargentSFA__Payment_Method__c='Credit Card';
         t3.ChargentSFA__Response_Status__c='Approved';
        t3.ChargentSFA__Gateway_Date__c=System.today();
          transactions.add(t3);
        insert transactions;
        
               /* Datetime modifiedDatetime = Datetime.now().addDays(-90);     
Test.setCreatedDate(accounts[3].id, modifiedDatetime);
        Test.setCreatedDate(accounts[4].id, modifiedDatetime);
        Test.setCreatedDate(accounts[5].id, modifiedDatetime);*/
        Test.startTest();
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new PlatinumOnboadingBatchCall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);

        Test.stopTest();
     
        
      
    }
    
}