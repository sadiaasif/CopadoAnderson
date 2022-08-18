public class TodoTest_TC
{
   
    static testMethod void myUnitTest() {
    user u = [select id from USer where ProfileId= : '00eU0000000nGPz' limit 1];
   // System.runas(u)
  
        Account a = new Account();
        a.Name = 'Test Account';
        a.BillingCity = 'Test City';
        a.BillingCountry = 'Test Country';
        a.Reason_for_Follow_Up__c = 'Sell Pension';
        a.RecordTypeId = '012U0000000D8qm';
        //insert a;
        a.Reason_for_Follow_Up__c = 'Sell Living Trust ?';
       // update a;
           RecordType RTypes = [select id from RecordType where name = 'Entity Formation' limit 1 ];
        Opportunity o = new Opportunity();
        if(RTypes!=null)
        {
            o.RecordTypeId = RTypes.id;
        }
        o.Name = 'Test Sales';
        o.StageName = 'Prospecting';
        o.CloseDate = System.today();
        o.AccountId = a.id;
        
        insert o;
   
    
    
    RecordType RTypes1 = [select id from RecordType where name = 'Charitable Remainder Trust' limit 1 ];
    Entities__c e = new Entities__c();
    if(RTypes!=null)
        {
           e.RecordTypeId = RTypes1.id;
        }
     
    e.Name = 'Test Entity';
    e.Primary_Client__c = a.id;
    
    insert e;
    
    To_Do__c t = new To_Do__c();
    
    t.Name= 'Test Todo';
    t.Entity__c = e.id;
    
    insert t;
    }
}