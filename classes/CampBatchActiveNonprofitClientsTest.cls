@istest
public class CampBatchActiveNonprofitClientsTest {
    
    @testSetup 
    static void setup() {
        
        // insert Campaign
        Campaign camp=new Campaign(name='Active Nonprofit Clients', isActive=true);
        
        insert camp;
        
        //Insert Account
        List<Account> acLst= new List<Account>();
        for(Integer i=0;i<9;i++){
          Account ac= new Account();
          ac.Name='testaccount'+i;
          acLst.add(ac);
        }
        insert acLst;
        
        List<Contact> ctLst=new List<Contact>();
        for(Integer i=0;i<7;i++){
          Contact ct=new contact();
          ct.LastName='testcontact' + i;
          ct.Account_Roles__c = 'Primary Contact'; 
          ct.AccountId=acLst.get(i).Id;
          ctLst.add( ct );
        }

        insert ctLst;

        List<Contact> nonPrimary=new List<Contact>();
        for(Integer i=7;i<9;i++){
          Contact ct=new contact();
          ct.LastName='testcontact' + i;
          ct.AccountId=acLst.get(i).Id;
          nonPrimary.add( ct );
        }

        insert nonPrimary;

        list<Entities__c> etlist =new LIST<Entities__c>();
        for(Integer i=0;i<9;i++){
          Entities__c et=new Entities__c();
          et.Name='testentity'+i;
          et.Primary_Client__c=acLst.get(i).Id;
          et.Organizational_Date__c=system.today();
          et.Organization_State__c='Alabama';
          et.RecordTypeId=Schema.SobjectType.Entities__c.getRecordTypeInfosByName().get('Non-Profit Entity').getRecordTypeId();
          et.Status__c='Active';
          etlist.add(et);
        }
        insert etlist;

        /**
         * Insert old members to campaign
         */

        list<CampaignMember> cmpMembers= new list<CampaignMember>();
        for(Integer i=0;i<5;i++){
          cmpMembers.add(new CampaignMember( 
            CampaignId=camp.id,
            Account__c  = acLst.get(i).Id,
            ContactId=ctLst.get(i).Id
          ));
        }
        insert cmpMembers;

    }
    static testmethod void test() {    
        Test.startTest();
          CampBatchANCSchedular c = new CampBatchANCSchedular();
          c.execute(null);

          Campaign cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Nonprofit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
          [Select Id, Name From Campaign Where Name = 'Active Nonprofit Clients' AND IsActive = true Limit 1] : 
          null;
          String query = 'Select Id, Name, Account__c From CampaignMember Where CampaignId = \'' + cmpT.Id+'\'';

          Entities__c entOld= [Select Id, Name, Status__c From Entities__c Limit 1];
          entOld.Status__c = 'Inactive';
          Update entOld;
          Id deleteJob = Database.executeBatch(new DeleteCampBatchActiveNonprofitClients(query),200);
          
          Entities__c entNew= [Select Id, Name, Status__c From Entities__c Where Id !=: entOld.Id  Limit 1];
          entNew.Status__c = 'Inactive';
          Update entNew;
        
          System.schedule('DeleteCampBatchActiveNonprofitClients Test', '0 00 05 ? * 2',  new DeleteCampBatchActiveNonprofitClients() );
          
        Test.stopTest();

        List<CronTrigger> ctDel = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'DeleteCampBatchActiveNonprofitClients Test'];

        System.assert( deleteJob != null, 'Delete batch did not run');
        System.assert( ctDel.size() > 0, 'Delete Job is not scheduled');
    }
}