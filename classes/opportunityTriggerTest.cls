@isTest
public class opportunityTriggerTest {
   
    @isTest
    public static void createTestData() {
        
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        a.BadgeServiceItems__c = 'A10101';
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
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        insert o;
         Opportunity oInfinity = new Opportunity();
        oInfinity.AccountId = a.Id;
        oInfinity.Name = 'Infinity Basic';
        oInfinity.CloseDate = system.today();
        oInfinity.StageName = 'Closed Won';
        oInfinity.Service_Item_List__c = 'A11774a;';
        oInfinity.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        insert oInfinity;
        
         Opportunity oInfinityupd = new Opportunity();
        oInfinityupd.AccountId = a.Id;
        oInfinityupd.Name = 'Infinity Basic';
        oInfinityupd.CloseDate = system.today();
        oInfinityupd.StageName = 'Qualification';
        oInfinityupd.Service_Item_List__c = 'A11774a;';
        oInfinityupd.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        
        try{
            insert oInfinityupd;
        }
        catch(dmlexception e){
            system.debug('exception line 47: '+ e.getMessage());
        }
        oInfinityupd.StageName='Closed Won';
        try{
        update oInfinityupd;
        }
        catch(dmlexception e){
            system.debug('Exception line 54: '+ e.getMessage());
        }
        List<id> saleIDs=new List<Id>();
        saleIDs.add(o.Id);
         DigitalProductsSaleWPuserCreation.prepareCallout(saleIDs);
        
        
        
    }
    
        
        
    }