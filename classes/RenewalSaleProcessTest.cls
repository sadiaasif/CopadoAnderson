@isTest
public class RenewalSaleProcessTest {
    Public static List<Entities__c>  updateLLcEnList=new List<Entities__c>();
     Public static List<Entities__c>  updateCorpEnListMailSCAP=new List<Entities__c>();
     Public static List<Entities__c>  updateCorpEnListMailSMailF=new List<Entities__c>();
     Public static Id clientIdLLC;
     Public static Id clientIdCorp;
    public static void getEntities(){
                 TestDatafactoryBulk.createTestData();
        
        for(Entities__c en:TestDatafactoryBulk.EnItemList){
            System.debug('en.RecordType.Name==='+en.RecordTypeId);
            if(en.RecordTypeId=='012U0000000DE8SIAW'){
                 en.Organizational_Date__c=system.today();
            clientIdCorp=en.Primary_Client__c;
            en.Registered_Agent_Services__c='True';
            en.Nominee_Services__c='Nominee';
            en.Mailing_Services__c='Corporate Assistance Program';
            updateCorpEnListMailSCAP.add(en);
            }
           
               if(en.RecordTypeId=='012U0000000DE8mIAG'){
                 en.Organizational_Date__c=system.today();
            clientIdLLC=en.Primary_Client__c;
            en.Registered_Agent_Services__c='True';
            en.Nominee_Services__c='Nominee';
            en.Mailing_Services__c='Corporate Assistance Program';
            updateLLcEnList.add(en);
            }
        }
        
           
    }
        
  @isTest
    public static void TestCorpFlowOrgDateisChangedMailServiceCAP(){
getEntities();
        Test.startTest();
       
        System.debug('updateEn=='+updateCorpEnListMailSCAP.size());
        update updateCorpEnListMailSCAP;
        
      List<opportunity> oplist=[select id,name from opportunity where AccountId=:clientIdCorp and (name ='WY Annual List, Nom' or name ='Corporate Assistance Program Renewal')];
        
       
    System.assertEquals(2, oplist.size(), 'Please check!');
    Test.stopTest();
    }
    @isTest
    public static void TestCorpFlowOrgDateisChangedMailServiceMailForwarding(){

        Test.startTest();
       Id devoppEnCorpTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Corporation').getRecordTypeId();
        Entities__c En = (Entities__c)TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     'Registered_Agent_Services__c'=>'True',
      'Nominee_Services__c'=>'Nominee',
      'Name'=>'Test En LLC Mail Forwarding',
          'Mailing_Services__c'=>'Mail Forwarding',
          'Reminder_Email_10__c'=>'abc@123.com',
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' =>  clientIdCorp      
});
        en.Organizational_Date__c=system.today();
      
       update en;
        
      List<opportunity> oplist=[select id,name from opportunity where AccountId=:clientIdCorp and name ='Mail Forwarding Renewal'];
        
       
    System.assertEquals(1, oplist.size(), 'Please check!');
    Test.stopTest();
    }
      @isTest
    public static void TestLLcFlowOrgDateisChangedMailServiceCAP(){
         Test.startTest();
   getEntities();
    
        update updateLLcEnList;
      List<opportunity> oplist=[select id,name from opportunity where AccountId=:clientIdLLC and name ='WY Annual List, Nom'];
       
    System.assertEquals(1, oplist.size(), 'Please check!');
        Test.stopTest();
    
    }
        @isTest
    public static void TestLLcFlowOrgDateisChangedMailServiceForwarding(){

        Test.startTest();
       Id devoppEnLLCTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Limited Liability Company (LLC)').getRecordTypeId();
        Entities__c En = (Entities__c)TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     'Registered_Agent_Services__c'=>'True',
      'Nominee_Services__c'=>'Nominee',
      'Name'=>'Test En LLC Mail Forwarding',
          'Mailing_Services__c'=>'Mail Forwarding',
          'Reminder_Email_10__c'=>'abc@123.com',
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnLLCTypeId,
  'Primary_Client__c' =>  clientIdCorp      
});
        en.Organizational_Date__c=system.today();
      
       update en;
        
      List<opportunity> oplist=[select id,name from opportunity where AccountId=:clientIdCorp and name ='Mail Forwarding Renewal'];
        
       
    System.assertEquals(1, oplist.size(), 'Please check!');
    Test.stopTest();
    }
    @isTest
    public static void TestLPFlowOrgDateisChangedMailServiceForwarding(){

        Test.startTest();
       Id devoppEnLPTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Limited Partnership (LP)').getRecordTypeId();
        Entities__c En = (Entities__c)TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     'Registered_Agent_Services__c'=>'True',
      'Nominee_Services__c'=>'Nominee',
      'Name'=>'Test En LLC Mail Forwarding',
          'Mailing_Services__c'=>'Mail Forwarding',
          'Reminder_Email_10__c'=>'abc@123.com',
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnLPTypeId,
  'Primary_Client__c' =>  clientIdCorp      
});
        en.Organizational_Date__c=system.today();
      
       update en;
        
      List<opportunity> oplist=[select id,name from opportunity where AccountId=:clientIdCorp and name ='Mail Forwarding Renewal'];
        
       
    System.assertEquals(1, oplist.size(), 'Please check!');
    Test.stopTest();
    }
    @isTest
    public static void TestLPFlowOrgDateisChangedMailServiceCap(){

        Test.startTest();
       Id devoppEnLPTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Limited Partnership (LP)').getRecordTypeId();
        Entities__c En = (Entities__c)TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     'Registered_Agent_Services__c'=>'True',
      'Nominee_Services__c'=>'Nominee',
      'Name'=>'Test En LLC Mail Forwarding',
          'Mailing_Services__c'=>'Corporate Assistance Program',
          'Reminder_Email_10__c'=>'abc@123.com',
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnLPTypeId,
  'Primary_Client__c' =>  clientIdCorp      
});
        en.Organizational_Date__c=system.today();
      
       update en;
        
      List<opportunity> oplist=[select id,name from opportunity where AccountId=:clientIdCorp and  (name ='WY Annual List, Nom' or name ='Corporate Assistance Program Renewal')];
        
       
    System.assertEquals(2, oplist.size(), 'Please check!');
    Test.stopTest();
    }
}