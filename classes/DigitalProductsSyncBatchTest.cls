@isTest
public class DigitalProductsSyncBatchTest {
      @testSetup  static void setup() {
       
       List<opportunity> oppList=new List<Opportunity>();
        List<OpportunityLineItem> opLineitemlist=new List<OpportunityLineItem>();
      Id pricebookId = Test.getStandardPricebookId();
 List<Account> accList = new List<Account>();
       for(Integer i=0; i<10; i++){
         
           Account acc = new Account();
           acc.name='Test Apples'+i;
           acc.First_Name__c= 'Bobby'+ i;
           acc.Last_Name__c = 'Apples' +i;
           acc.E_Mail__c='apples'+i+'@abc.com';
           accList.add(acc);
       }

       insert accList;
    

       // Create Contacts
       
   
       List<Contact> PrimaryconList = new List<Contact>();
  Contact con = new Contact();
           con.FirstName =  'Bobby0';
           con.LastName = 'Apples0';
         con.Email = 'apples0@abc.com';
           con.Accountid = accList[0].id;
           Con.Account_Roles__c='Primary Contact';
          
          PrimaryconList.add(con);
           Contact con2pr = new Contact();
           con2pr.FirstName =  'Bobby0';
           con2pr.LastName = 'Apples0';
         con2pr.Email = 'apples0@abc.com';
           con2pr.Accountid = accList[0].id;
           con2pr.Account_Roles__c='Primary Contact';
          con2pr.Service_Item_List__c='360,';
          PrimaryconList.add(con2pr);
          
          Contact con1 = new Contact();
           con1.FirstName =  'Bobby1';
           con1.LastName = 'Apples1' ;
         con1.Email = 'apples1@abc.com';
           con1.Accountid = accList[1].id;
           Con1.Account_Roles__c='Primary Contact';
          
          PrimaryconList.add(con1);
          
            Contact con2 = new Contact();
           con2.FirstName =  'Bobby2';
           con2.LastName = 'Apples2' ;
         con2.Email = 'apples2@abc.com';
           con2.Accountid = accList[2].id;
           con2.Account_Roles__c='Primary Contact';
            con2.Service_Item_List__c='A09275,Free,';
          PrimaryconList.add(con2);

           Contact con3 = new Contact();
           con3.FirstName =  'Bobby3';
           con3.LastName = 'Apples3' ;
         con3.Email = 'apples2@abc.com';
           con3.Accountid = accList[3].id;
           con3.Account_Roles__c='Primary Contact';
        
          con3.Service_Item_List__c='A06459,';
          PrimaryconList.add(con3);
          
           Contact con4 = new Contact();
           con4.FirstName =  'Bobby4';
           con4.LastName = 'Apples4' ;
         con4.Email = 'apples2@abc.com';
           con4.Accountid = accList[4].id;
           con4.Account_Roles__c='Primary Contact';
          con4.Service_Item_List__c='RealA12363';

          PrimaryconList.add(con4);
          
         
          
           Contact con5 = new Contact();
           con5.FirstName =  'Bobby5';
           con5.LastName = 'Apples5' ;
         con5.Email = 'apples2@abc.com';
           con5.Accountid = accList[5].id;
           con5.Account_Roles__c='Primary Contact';
          
          PrimaryconList.add(con5);
          
          
            Contact con2primary = new Contact();
           con2primary.FirstName =  'Bobby5';
           con2primary.LastName = 'Apples5' ;
         con2primary.Email = 'apples2@abc.com';
           con2primary.Accountid = accList[5].id;
           con2primary.Account_Roles__c='Primary Contact';
          con2primary.Platinum_Wordpress_Id__c='1234';
          con2primary.Service_Item_List__c='Free,A06459,';
          PrimaryconList.add(con2primary);

          
          
           Contact con6 = new Contact();
           con6.FirstName =  'Bobby6';
           con6.LastName = 'Apples6' ;
         con6.Email = 'apples2@abc.com';
           con6.Accountid = accList[6].id;
        
          
          PrimaryconList.add(con6);
          
           Contact con7 = new Contact();
           con7.FirstName =  'Bobby7';
           con7.LastName = 'Apples7' ;
         con7.Email = 'apples2@abc.com';
           con7.Accountid = accList[7].id;
           con7.Account_Roles__c='Primary Contact';
            con7.Service_Item_List__c='360,';
          PrimaryconList.add(con7);
          
         /*  Contact con8 = new Contact();
           con8.FirstName =  'Bobby8';
           con8.LastName = 'Apples8' ;
         con8.Email = 'apples2@abc.com';
           con8.Accountid = accList[8].id;
           con8.Account_Roles__c='Primary Contact';
          
          PrimaryconList.add(con8);*/
          
           Contact con9 = new Contact();
           con9.FirstName =  'Bobby9';
           con9.LastName = 'Apples9' ;
         con9.Email = 'apples2@abc.com';
           con9.Accountid = accList[9].id;
           con9.Account_Roles__c='Primary Contact';
          
          PrimaryconList.add(con9);

     /*  for (Integer i=0; i<accList.size(); i++){

           Contact con = new Contact();
           con.FirstName =  'Bobby'+ i;
           con.LastName = 'Apples' +i;
         con.Email = 'apples'+i+'@abc.com';
           con.Accountid = accList[i].id;
           Con.Account_Roles__c='Primary Contact';
           
                PrimaryconList.add(con);
          
         
       }*/  
       insert PrimaryconList;
          
          
             List<Contact> secondaryconList = new List<Contact>();

       for (Integer i=0; i<accList.size(); i++){

           Contact consec = new Contact();
           consec.FirstName =  'Bobby'+ i;
           consec.LastName = 'Apples' +i;
         consec.Email = 'applessec'+i+'@abc.com';
           consec.Accountid = accList[i].id;
          
           if(i!=8){
               secondaryconList.add(consec);
           }
                
          
         
       }  
       insert secondaryconList;
   


    
         Opportunity opp=new Opportunity();
        opp.Name='Test Sale 1';
        opp.AccountId=accList[0].id;
         
        opp.RecordTypeId='012U0000000DhZQIA0';
        opp.StageName='Qualification';
        opp.CloseDate = Date.Today();
        oppList.add(opp);
        
         Opportunity opp2=new Opportunity();
        opp2.Name='Test Sale 2';
        opp2.AccountId=accList[1].id;
        opp2.RecordTypeId='012U0000000DhZzIAK';
         opp2.StageName='Closed Won';
    opp2.Service_Item_List__c='A09275;A06459;';
        opp2.CloseDate = Date.Today();
        oppList.add(opp2);
        

      Opportunity opp3=new Opportunity();
        opp3.Name='Test Sale 3';
        opp3.AccountId=accList[2].id;
        opp3.RecordTypeId='012U0000000DFSx';
         opp3.StageName='Closed Won';
    opp3.Service_Item_List__c='A09275;';
        opp3.CloseDate = Date.Today();
        oppList.add(opp3);
          
           Opportunity oppfree=new Opportunity();
        oppfree.Name='Test Sale 5';
        oppfree.AccountId=accList[2].id;
        oppfree.RecordTypeId='0120B000000N8E5QAK';
    oppfree.Infinity_Memebership__c='Free';
         oppfree.StageName='Closed Won';
        oppfree.CloseDate = Date.Today();
        oppList.add(oppfree);
          
          Opportunity oppAFC=new Opportunity();
        oppAFC.Name='Test Sale 3';
        oppAFC.AccountId=accList[3].id;
        oppAFC.RecordTypeId='012U0000000DFSx';
         oppAFC.StageName='Closed Won';
    oppAFC.Service_Item_List__c='A06459;';
        oppAFC.CloseDate = Date.Today();
        oppList.add(oppAFC);
           
      Opportunity o = new Opportunity();
        o.AccountId = accList[3].Id;
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
          oppList.add(o);
       
           Opportunity opp4=new Opportunity();
        opp4.Name='Test Sale 4';
        opp4.AccountId=accList[4].id;
        opp4.RecordTypeId='012U0000000DFSx';
         opp4.StageName='Closed Won';
     opp4.Service_Item_List__c='A12363;';
        opp4.CloseDate = Date.Today();
        oppList.add(opp4);
          
         Opportunity oppReal=new Opportunity();
        oppReal.Name='Test Sale 5';
        oppReal.AccountId=accList[4].id;
        oppReal.RecordTypeId='0120B000000N8E5QAK';
    oppReal.Infinity_Memebership__c='Real';
         oppReal.StageName='Closed Won';
        oppReal.CloseDate = Date.Today();
        oppList.add(oppReal);
          
           Opportunity opp5=new Opportunity();
        opp5.Name='Test Sale 5';
        opp5.AccountId=accList[5].id;
        opp5.RecordTypeId='012U0000000DFSx';
         opp5.StageName='Closed Won';
       opp5.Service_Item_List__c='A06459;';
        opp5.CloseDate = Date.Today();
        oppList.add(opp5);
    
      Opportunity opp7=new Opportunity();
        opp7.Name='Test Sale 5';
        opp7.AccountId=accList[5].id;
        opp7.RecordTypeId='0120B000000N8E5QAK';
    opp7.Infinity_Memebership__c='Free';
         opp7.StageName='Closed Won';
        opp7.CloseDate = Date.Today();
        oppList.add(opp7);
    
     Opportunity opp6=new Opportunity();
        opp6.Name='Test Sale 5';
        opp6.AccountId=accList[5].id;
        opp6.RecordTypeId='0120B000000N8E5QAK';
    opp6.Infinity_Memebership__c='360';
         opp6.StageName='Closed Won';
        opp6.CloseDate = Date.Today();
        oppList.add(opp6);
    
        Opportunity oppstock=new Opportunity();
        oppstock.Name='Test Sale 5';
        oppstock.AccountId=accList[6].id;
        oppstock.RecordTypeId='0120B000000N8E5QAK';
    oppstock.Infinity_Memebership__c='Stock';
         oppstock.StageName='Closed Won';
        oppstock.CloseDate = Date.Today();
        oppList.add(oppstock);
          
          Opportunity opp360=new Opportunity();
        opp360.Name='Test Sale 5';
        opp360.AccountId=accList[7].id;
        opp360.RecordTypeId='0120B000000N8E5QAK';
    opp360.Infinity_Memebership__c='360';
         opp360.StageName='Closed Won';
        opp360.CloseDate = Date.Today();
        oppList.add(opp360);
          
       Opportunity opp9=new Opportunity();
        opp9.Name='Test Sale 9';
        opp9.AccountId=accList[8].id;
        opp9.RecordTypeId='012U0000000DhZzIAK';
         opp9.StageName='Closed Won';
    opp9.Service_Item_List__c='A09275;';
        opp9.CloseDate = Date.Today();
     oppList.add(opp9);
          
    Opportunity opp10=new Opportunity();
        opp10.Name='Test Sale 10';
        opp10.AccountId=accList[8].id;
        opp10.RecordTypeId='012U0000000DhZzIAK';
         opp10.StageName='Closed Won';
    opp10.Service_Item_List__c='A06459;';
        opp10.CloseDate = Date.Today();
           oppList.add(opp10);
    
    Opportunity opp11=new Opportunity();
        opp11.Name='Test Sale 11';
        opp11.AccountId=accList[8].id;
        opp11.RecordTypeId='012U0000000DhZzIAK';
         opp11.StageName='Closed Won';
    opp11.Service_Item_List__c='A12363;';
        opp11.CloseDate = Date.Today();
     oppList.add(opp11);
    
      Opportunity opp12=new Opportunity();
        opp12.Name='Test Sale 12';
        opp12.AccountId=accList[8].id;
         opp12.RecordTypeId='0120B000000N8E5QAK';
    opp12.Infinity_Memebership__c='360';
         opp12.StageName='Closed Won';
  
        opp12.CloseDate = Date.Today();
          oppList.add(opp12);
   insert oppList;
            
    }
@isTest
    static  void testConPrimaryConServiceitemnull() {        
 
   
  
  

     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
      
        
        Test.stopTest();
        
          List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples1, Bobby1'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);
 List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact'];
 System.debug('ConList name =='+ updatedconlIst[0].Service_Item_List__c);
   List<opportunity> updatedconopplist=[Select id,Service_Item_List__c from opportunity where name='Test Sale 2'];
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact'];
        System.assert(updatedconlIst[0].Service_Item_List__c.contains('A09275,'));
//System.assertEquals('A06459,A09275,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
    

    @isTest
    static  void testConPrimaryConServiceitemcorrectval() {        
  
     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples2, Bobby2'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);
 
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
   
        
        Test.stopTest();
       
        
  List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact'];
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact'];
System.assertEquals('A09275,Free,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
        
        
     }
    
      @isTest
    static  void testConPrimaryConServicePlatinumandAFCcorrectval() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples3, Bobby3'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);

     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
  
        Test.stopTest();
        
         List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact'];
  
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact'];
System.assertEquals('A06459,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
    
    @isTest
    static  void testConPrimaryConServiceATWRealincorrectval() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples4, Bobby4'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);
 
     String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
        
        Test.stopTest();
        
        List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact'];
  
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact'];
System.assertEquals('A12363,Real,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
    
    @isTest
    static  void test2PrimaryConServiceATWFreeincorrectval() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples5, Bobby5'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);

      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
   
        
        Test.stopTest();
        
        List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact' and Platinum_Wordpress_Id__c !=''ORDER BY CreatedDate ASC limit 1];
          List<contact> nowpconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact' and Platinum_Wordpress_Id__c =''ORDER BY CreatedDate ASC limit 1];
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact'];
System.assertEquals('A06459,360,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, nowpconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
     @isTest
    static  void test2PrimaryConService360incorrectval() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples0, Bobby0'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);
 String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
      
        
        Test.stopTest();
        
        List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact' ORDER BY CreatedDate ASC limit 1];
  
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact'];
System.assertEquals(null, updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
       @isTest
    static  void testnoPrimaryConServiceStockBlank() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples6, Bobby6'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);

      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
      
        Test.stopTest();
        
        List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id  ORDER BY CreatedDate ASC limit 1];
  
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id ORDER BY CreatedDate DESC limit 1];
System.assertEquals('Stock,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
    
    @isTest
    static  void testPrimaryConService360Correct() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples7, Bobby7'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);
 
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
     
        
        Test.stopTest();
        
        List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact' ORDER BY CreatedDate ASC limit 1];
  
        List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact' ORDER BY CreatedDate ASC limit 1];
System.assertEquals('360,', updatedconlIst[0].Service_Item_List__c, 'Please checK!');
        System.assertEquals(null, NotupdatedconlIst[0].Service_Item_List__c, 'Please checK!');
     }
    
    @isTest
    static  void testnocontact() {        

     List<Account> accL=[Select id,Name,Digital_Products_count__c from account where name='Apples8, Bobby8'];
        System.debug('ConList name =='+ accL[0].Digital_Products_count__c);
 
      Test.startTest();
   string   accountQuery='Select id,Name from account where Digital_Products_count__c>0';
  ID batchJobId1 = Database.executeBatch(new DigitalProductsSyncBatchcls(accountQuery));
        
       
        
        Test.stopTest();
        
        List<contact> updatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c='Primary Contact' ORDER BY CreatedDate ASC limit 1];
  
       // List<contact> NotupdatedconlIst=[Select id,Name,Service_Item_List__c from contact where accountid=:accL[0].id and Account_Roles__c!='Primary Contact' ORDER BY CreatedDate ASC limit 1];
System.assertEquals(0, updatedconlIst.size(), 'Please checK!');
      
     }
     @isTest
    static  void BatchscheduleclassTest() {        

 String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
  
        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new DigitalProductsSyncBatchcall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        
        Test.stopTest();
        
      
      
     }
}