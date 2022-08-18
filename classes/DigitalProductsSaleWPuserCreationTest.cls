@isTest(seeAllData = false)
public class DigitalProductsSaleWPuserCreationTest {
@testSetup static void createTestData() {
        
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
    	c.service_item_list__c = 'A11774,360,';
        insert c;
        
        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Qualification';
    	o.service_item_list__c = 'A11774;A11775;';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        insert o;
        
    }
    
    @isTest
    public static void makeserviceUser() {
        List<id> saleIDs=new List<Id>();
     Opportunity o = [SELECT Id, AccountId, StageName FROM Opportunity limit 1];
        saleIDs.add(o.id);
     DigitalProductsSaleWPuserCreation.prepareCallout(saleIDs);
     List<Digital_Course__mdt> digitalList = [select id, ASID__c from Digital_Course__mdt limit 50000];
     List<Infinity_Subscription_Product__mdt> infinityList = [select id, ASID__c,Infinity_Membership__c from Infinity_Subscription_Product__mdt limit 50000];
     DigitalProductsSaleWPuserCreation.prepareCalloutfromTrigger(SaleIDs[0],infinityList,digitalList);   
    }
    
    @isTest
    public static void testContactServiceItemUpdate(){
        Opportunity opp = [select id,service_item_list__c from opportunity limit 1];
        Contact con = [select id, service_item_list__c from contact limit 1];
        List<Digital_Course__mdt> digitalList = [select id, ASID__c from Digital_Course__mdt limit 50000];
     	List<Infinity_Subscription_Product__mdt> infinityList = [select id, ASID__c,Infinity_Membership__c from Infinity_Subscription_Product__mdt limit 50000];
        ContactServiceItemUpdateHandler.FlowInputs inp = new ContactServiceItemUpdateHandler.FlowInputs();
        inp.incomingSIs = opp.service_item_list__c;
        inp.existingSIs = con.Service_Item_List__c;
        inp.infinityProds = infinityList;
        inp.digitalProds = digitalList;
        ContactServiceItemUpdateHandler.getServiceItems(new List<ContactServiceItemUpdateHandler.FlowInputs>{inp});
    }
}