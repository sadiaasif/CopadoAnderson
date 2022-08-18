@isTest
public class TestAutoConvertLeadsWithAcc {
    static testMethod void myUnitTest()   
    {
        Campaign newCampaign = new Campaign();
        newCampaign.IsActive = True;
        newCampaign.Name = 'Code Coverage';
        newCampaign.Status = 'In Progress';
        insert newCampaign;
       
        //create the data
        Lead newLead = new Lead() ;
        newLead.FirstName = 'Swain';
        newLead.LastName = 'Cole';
        newLead.Company = 'Bluewave';
        newLead.Status = 'New Lead';
        newLead.Main_Lead_Source__c = 'Affiliate';
        newLead.Original_Campaign_Source__c = newCampaign.id;
        insert newLead;
        
        Lead newLead2 = new Lead() ;
        newLead2.FirstName = 'Swain2';
        newLead2.LastName = 'Cole2';
        newLead2.Company = 'Bluewave2';
        newLead2.Status = 'New Lead';  
        newLead2.Main_Lead_Source__c = 'Affiliate';
        newLead2.Original_Campaign_Source__c = newCampaign.id;
        insert newLead2;
        
        Lead newLead3 = new Lead() ;
        newLead3.FirstName = 'Cole3';
        newLead3.LastName = 'Swain3';
        newLead3.Company = 'BlueWave3';
        newLead3.Status = 'New Lead';
        newLead3.Main_Lead_Source__c = 'Affiliate';
        newLead3.Original_Campaign_Source__c = newCampaign.id;
        insert newLead3;
        
        //Account
        Account newAccount = new Account();
        newAccount.Name = 'Bluewave'; 
        insert newAccount;
        
        Account newAccount2 = new Account();
        newAccount2.Name = 'Bluewave2'; 
        insert newAccount2;
        
        //Contact
        Contact newContact = new Contact();
        newContact.AccountId = newAccount.id;
        newContact.FirstName = 'Anderson';
        newContact.LastName = 'Cole2';
        insert newContact;
        
        List<List<Id>> OutterListIds = new List<List<Id>>();
        List<Id> LeadIds = new List<Id>();
        LeadIds.add(newLead.id);
        LeadIds.add(newAccount.id);
        LeadIds.add(newContact.id); 
        OutterListIds.add(LeadIds);
         
        AutoConvertLeadsWithAcc.LeadAssign(OutterListIds);
        /*
        List<List<Id>> Outter2ListIds = new List<List<Id>>();
        List<Id> Inner2Ids = new List<Id>();
        Inner2Ids.add(newLead2.id);
        Inner2Ids.add(newAccount2.id);
        Outter2ListIds.add(Inner2Ids);
        
        AutoConvertLeadsWithAcc.LeadAssign(Outter2ListIds);
        
        List<List<Id>> Outter3ListIds = new List<List<Id>>();
        List<Id> Inner3Ids = new List<Id>();
        Inner3Ids.add(newLead3.id);
        Outter3ListIds.add(Inner3Ids);
        
        AutoConvertLeadsWithAcc.LeadAssign(Outter3ListIds);
*/
    }
}