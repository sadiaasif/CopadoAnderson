@isTest
public class OppRollUpTest {
    
  /*  @isTest static void TestOne() {
        Opportunity myOpp = new Opportunity();
        myOpp.Name        = 'Test Sale';
        myOpp.CloseDate   = date.today();
        myOpp.StageName   = 'Qualification';
        myOpp.RecordTypeId='012U0000000DhZQIA0';
        insert myOpp;
        
        myOpp.StageName   = 'Closed Won';
        update myOpp;
    }*/
       @isTest static void BalancedueRolluptest() {
            List<Account> accounts = new List<Account>();
        List<opportunity> oppList=new List<Opportunity>();
        List<OpportunityLineItem> opLineitemlist=new List<OpportunityLineItem>();
           List<ID>accids=new List<Id>();
     
        
        List<Contact> contacts = new List<Contact>();
              for (Integer i=0;i<5;i++) {
            accounts.add(new Account(name='Apples '+i,Last_Name__c='Bobby '+i,First_Name__c='Apples'+i
                ));
        }
        insert accounts;
       
        for (Account account : [select id from account]) {
            contacts.add(new Contact(firstname='Bobby', 
                lastname='Apples', accountId=account.id,
                                    Account_Roles__c='Primary Contact'));
        }
        insert contacts;

        Opportunity opp=new Opportunity();
        opp.Name='Test Sale 1';
        opp.AccountId=accounts[0].id;
         
        opp.RecordTypeId='012U0000000DhZQIA0';
        opp.StageName='Qualification';
        opp.CloseDate = Date.Today();
        oppList.add(opp);
        
         Opportunity opp2=new Opportunity();
        opp2.Name='Test Sale 2';
        opp2.AccountId=accounts[1].id;
        opp2.RecordTypeId='012U0000000DhZzIAK';
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
     Name = 'Unlimited Nominee Annual Renewal',
     ProductCode = 'Pro-X',
     isActive = true,
    welcome_call__c=true,
    Type__c ='Tax'
    
);
        products.add(prod);
        Product2 prod1 = new Product2(
     Name = 'Corporate Assistance Program, 1 Year, Initial',
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
         test.startTest(); 
		insert opLineitemlist; 
       OppRollUp.rollupprocessing=false;
           delete oppList[2];
           undelete oppList[2];
           for(account a:accounts){
               accids.add(a.id);
           }
           HasCapMaxExpirationDate.updateExpirationDate(accids);
          BadgesDisplayLogic.BadgesDisplayParameter bd=new  BadgesDisplayLogic.BadgesDisplayParameter();
         bd.accId=accounts[0].id;
           bd.ServiceItems=opp.Service_Item_List__c;
          List<BadgesDisplayLogic.BadgesDisplayParameter> Params=new List< BadgesDisplayLogic.BadgesDisplayParameter>();
           Params.add(bd);
        BadgesDisplayLogic.updateExpDateAndServiceListOnAcc(Params);
           test.stopTest();
        
    }
    

}