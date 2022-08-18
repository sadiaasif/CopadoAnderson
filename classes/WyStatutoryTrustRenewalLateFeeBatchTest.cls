@isTest(SeeAllData= True)
public class WyStatutoryTrustRenewalLateFeeBatchTest {
 static testmethod void WyStatutoryTrustRenewalLateFeeBatchTestwithoutPlatinum() {  
     
  String WYLateFeeASID =  [Select ASID__c from Product2 where name ='WY Statutory Trust Annual Renewal Late Fee']?.ASID__c;
      ID OwnerId=[select Id from Group where Type = 'Queue' AND DeveloperNAME = 'RenewalAdvisors']?.Id;
    campaign cm=new campaign();
     cm.name='Test Campaign';
     insert cm;
  
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.FirstName = 'Bob';
        c.LastName = 'Apples';
        c.Email = 'bazam123@gmail.com';
        c.Account_Roles__c = 'Primary Contact';
        insert c;
     
  
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'WY Statutory Trust Annual Renewal';
  		o.StageName = 'Qualification';
     	
    	o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
     	o.Sale_Campaign__c=cm.id;
     o.CloseDate= system.today();
  		insert o;
     Id WYTrenewalProductID=[Select Id from Product2 where name ='WY Statutory Trust Annual Renewal' ]?.id;
    Id  WYTrenewalPricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:WYTrenewalProductID and Pricebook2.name='Renewals']?.id;
          List<OpportunityLineitem> WYAnnualRenewalLatefeeList = new  List<OpportunityLineitem>();
            opportunityLineitem wyAnnualRLatefee= new opportunityLineitem();
            wyAnnualRLatefee.OpportunityId=o.id;
            wyAnnualRLatefee.Product2Id=WYTrenewalProductID;
            wyAnnualRLatefee.PricebookEntryId=WYTrenewalPricebookEntryId;
            wyAnnualRLatefee.Quantity=1;
            wyAnnualRLatefee.TotalPrice=100;
     WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee);
     
     Id WyStRFulfilProductID=[Select Id from Product2 where name ='WY Statutory Trust Annual Renewal' ]?.id;
    Id  WyStRFulfilPricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:WyStRFulfilProductID and Pricebook2.name='Renewals']?.id;
           opportunityLineitem wyAnnualRLatefee1= new opportunityLineitem();
            wyAnnualRLatefee1.OpportunityId=o.id;
            wyAnnualRLatefee1.Product2Id=WyStRFulfilProductID;
            wyAnnualRLatefee1.PricebookEntryId=WyStRFulfilPricebookEntryId;
            wyAnnualRLatefee1.Quantity=1;
            wyAnnualRLatefee1.TotalPrice=100;
     WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee1);
     
     Id RARProductID=[Select Id from Product2 where name ='Registered Agent Annual Renewal' ]?.id;
    Id  RARPricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:RARProductID and Pricebook2.name='Renewals']?.id;
           opportunityLineitem wyAnnualRLatefee2= new opportunityLineitem();
            wyAnnualRLatefee2.OpportunityId=o.id;
            wyAnnualRLatefee2.Product2Id=RARProductID;
            wyAnnualRLatefee2.PricebookEntryId=RARPricebookEntryId;
            wyAnnualRLatefee2.Quantity=1;
            wyAnnualRLatefee2.TotalPrice=100;
     WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee2);
     
     insert WYAnnualRenewalLatefeeList;
     
     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new WyStatutoryTrystRenewalLateFeeBatch());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
	 String exeQuery='Select id ,Name,accountid from opportunity where name =\'WY Statutory Trust Annual Renewal\' and StageName=\'Qualification\' and   account.E_Mail__c=\'bazam123@gmail.com\'';
     
          Id batchJobId1 = Database.executeBatch(new WyStatutoryTrustRenewalLateFeeBatchcls(exeQuery), 5); 
          Test.stopTest();
Task t=[Select id,OwnerId,Subject from task where Subject='WY Renewal Sale Late fee added to WY Statutory Trust Annual Renewal Sale' and Client__r.E_Mail__c = 'bazam123@gmail.com' limit 1];
        System.debug('t.OwnerId=='+t.OwnerId);
     
     }
    
     static testmethod void WyStatutoryTrustRenewalLateFeeBatchTestwithPlatinum() {   
           String WYLateFeeASID =  [Select ASID__c from Product2 where name ='WY Statutory Trust Annual Renewal Late Fee']?.ASID__c;
    campaign cm=new campaign();
     cm.name='Test Campaign';
     insert cm;
  
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.FirstName = 'Bob';
        c.LastName = 'Apples';
        c.Email = 'bazam123@gmail.com';
        c.Account_Roles__c = 'Primary Contact';
        insert c;
     
  
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'WY Statutory Trust Annual Renewal';
  		o.StageName = 'Qualification';
     	
    	o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
     	o.Sale_Campaign__c=cm.id;
     o.CloseDate= system.today();
  		insert o;
         
          Opportunity o2 = new Opportunity();
        o2.AccountId = a.Id;
        o2.Name = 'Platinum Subscription';
  		o2.StageName = 'Closed Won';
     	
    	o2.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
     	o2.Sale_Campaign__c=cm.id;
     o2.CloseDate= system.today();
  		insert o2;
     Id WYTrenewalProductID=[Select Id from Product2 where name ='WY Statutory Trust Annual Renewal' ]?.id;
    Id  WYTrenewalPricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:WYTrenewalProductID and Pricebook2.name='Renewals']?.id;
         List<OpportunityLineitem> WYAnnualRenewalLatefeeList = new  List<OpportunityLineitem>();
            opportunityLineitem wyAnnualRLatefee= new opportunityLineitem();
            wyAnnualRLatefee.OpportunityId=o.id;
            wyAnnualRLatefee.Product2Id=WYTrenewalProductID;
            wyAnnualRLatefee.PricebookEntryId=WYTrenewalPricebookEntryId;
            wyAnnualRLatefee.Quantity=1;
            wyAnnualRLatefee.TotalPrice=100;
     WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee);
     
     Id WyStRFulfilProductID=[Select Id from Product2 where name ='WY Statutory Trust Annual Renewal' ]?.id;
    Id  WyStRFulfilPricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:WyStRFulfilProductID and Pricebook2.name='Renewals']?.id;
           opportunityLineitem wyAnnualRLatefee1= new opportunityLineitem();
            wyAnnualRLatefee1.OpportunityId=o.id;
            wyAnnualRLatefee1.Product2Id=WyStRFulfilProductID;
            wyAnnualRLatefee1.PricebookEntryId=WyStRFulfilPricebookEntryId;
            wyAnnualRLatefee1.Quantity=1;
            wyAnnualRLatefee1.TotalPrice=100;
     WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee1);
     
     Id RARProductID=[Select Id from Product2 where name ='Registered Agent Annual Renewal' ]?.id;
    Id  RARPricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:RARProductID and Pricebook2.name='Renewals']?.id;
           opportunityLineitem wyAnnualRLatefee2= new opportunityLineitem();
            wyAnnualRLatefee2.OpportunityId=o.id;
            wyAnnualRLatefee2.Product2Id=RARProductID;
            wyAnnualRLatefee2.PricebookEntryId=RARPricebookEntryId;
            wyAnnualRLatefee2.Quantity=1;
            wyAnnualRLatefee2.TotalPrice=100;
     WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee2);
     
     insert WYAnnualRenewalLatefeeList;
     
     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   

        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new WyStatutoryTrystRenewalLateFeeBatch());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
         String exeQuery='Select id ,Name,accountid from opportunity where name =\'WY Statutory Trust Annual Renewal\' and StageName=\'Qualification\' and   account.E_Mail__c=\'bazam123@gmail.com\'';
     
          Id batchJobId1 = Database.executeBatch(new WyStatutoryTrustRenewalLateFeeBatchcls(exeQuery), 5); 
          Test.stopTest();
Opportunity opp=[Select id,name,Service_Item_List__c from opportunity where name='WY Statutory Trust Annual Renewal' and account.E_Mail__c='bazam123@gmail.com' limit 1];
        System.debug('opp.Service_Item_List__c=='+opp.Service_Item_List__c);
         
 System.assert(opp.Service_Item_List__c.Contains(WYLateFeeASID));
       
     }
}