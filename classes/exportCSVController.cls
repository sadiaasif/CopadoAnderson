public class exportCSVController 
{

    public List<List<myClass>> myList {get;set;}
    
    public exportCSVController() 
    {
        myList = new List<List<myClass>>();
        integer mo = date.today().month();
        List<myClass> temp = new List<myClass>();
        integer yr = date.today().year();
        date dt = date.today();
        
       
        List<Entities__c> ent = [select id,RecordTypeId,State_Renewal__c,Renewal_Printed__c,Vice_President__c,Treasurer__c,Secretary__c,President__c,Director_1__c,Director_2__c,Director_3__c,Director_4__c, Primary_Client__c, Name, Business_Address__c,Email__c,Primary_Client__r.BillingStreet,Primary_Client__r.BillingCity,Primary_Client__r.BillingState,Primary_Client__r.BillingCountry,Primary_Client__r.BillingPostalCode from Entities__c where (CALENDAR_MONTH(State_Renewal__c) =: mo and CALENDAR_YEAR(State_Renewal__c) =: yr)];
        List<Entities__c> ents = new List<Entities__c>();
        for(Entities__c en: ent)
        {     
        string orgdate = '';
        myClass m = new myClass();
        if(en.State_Renewal__c != null)
            orgdate = + en.State_Renewal__c.month() + '-' + en.State_Renewal__c.day() + '-' + en.State_Renewal__c.year();
    
         Account ac = [select Id, Name, First_Name__c, Last_Name__c from Account where Id =: en.Primary_Client__c]; 
         
         Integer cnt = [select count() from Subscription__c where Account__c =: ac.Id]; 
         if(cnt >0)
         {
         Subscription__c sc = [Select Id, Name, Opportunity__c, Account__c, Product__c from Subscription__c where Account__c =: ac.Id]; 
         
         Integer cnt2 = [select count() from OpportunityLineItem where OpportunityId = :sc.Opportunity__c limit 1];
         if(cnt2 >0)
         {
             OpportunityLineItem OLI = [Select UnitPrice, Quantity, PricebookEntry.Product2Id, PricebookEntry.Product2.Name From OpportunityLineItem where OpportunityId = :sc.Opportunity__c limit 1];   
             m.Price = OLI.UnitPrice;
         }
        
         }
            
            m.first = ac.First_Name__c;
            m.last = ac.Last_Name__c ;
            m.Addr = en.Primary_Client__r.BillingStreet;           
            m.City = en.Primary_Client__r.BillingCity;
            m.State = en.Primary_Client__r.BillingState;
            m.Zip= en.Primary_Client__r.BillingPostalCode;
            m.Entity= en.Name;
            m.Vice_President = en.Vice_President__c;
            m.Treasurer = en.Treasurer__c;
            m.Secretary = en.Secretary__c;
            m.President = en.President__c; 
            m.Director_1 = en.Director_1__c;
            m.Director_2 = en.Director_2__c;
            m.Director_3 = en.Director_3__c;
            m.Director_4 = en.Director_4__c;
            m.State_Renewal = orgdate;
            
                    
            temp.add(m);
            
            
           
            
            en.Renewal_Printed__c = dt;
            en.State_Renewal__c = en.State_Renewal__c.addyears(1);
             
            ents.add(en);
            //upsert en;
        
        } 
         myList.add(temp);
       // if(ents.size() >0)
       // update ent;   
}
    

    public class myClass
    {
        public string first {get;set;}
        public string last  {get;set;}
        public string Addr {get;set;}
        public string City {get;set;}
        public string State {get;set;}
        public string Zip {get;set;}
        public string Entity {get;set;}  
        public string Vice_President {get;set;} 
        public string Treasurer {get;set;} 
        public string Secretary {get;set;} 
        public string President {get;set;} 
        public string Director_1 {get;set;} 
        public string Director_2 {get;set;} 
        public string Director_3 {get;set;} 
        public string Director_4 {get;set;} 
        public string State_Renewal {get;set;}
        public double Price {get;set;}
        
        
    }
}