@istest
public class ActiveNonProfitClientCampBatchTest {
    @testSetup 
    static void setup() {
        
        // insert Campaign
        Campaign camp=new Campaign(name='Active Non-Profit Clients', isActive=true);
        
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
          Contact ct = new contact();
          ct.LastName = 'testcontact' + i;
          ct.AccountId = acLst.get(i).Id;
          nonPrimary.add( ct );
        }

        insert nonPrimary;

        List<Opportunity> oplist =new List<Opportunity>();
        List<String> services = new  List<String>();
        services.add('A01218');
        services.add('A52211');
        services.add('A52210');
        services.add('A01467');
        services.add('A52209');
        for(Integer i=0;i<9;i++){
            Integer index = Integer.valueof((Math.random() * 5));
            Opportunity op=new Opportunity();
            op.Name = 'Test Sale'+i;
            op.CloseDate = date.parse('1/1/2022');
            op.AccountId = acLst.get(i).Id;
            op.StageName = 'Closed Won';
            op.Service_Item_List__c = services.get(index) + ';';
            oplist.add(op);
        }
        insert oplist;

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
          
            System.schedule('AddMembersToActiveNonProfitClientCamp Test', '0 00 05 ? * 2',  new AddMembersToActiveNonProfitClientCamp() );

            String addQuery = 'Select Id, (Select Id, Name, Service_Item_List__c, StageName From Opportunities Where Service_Item_List__c Like \'%A01218%\' OR Service_Item_List__c Like \'%A52211%\' OR Service_Item_List__c Like \'%A52210%\' OR Service_Item_List__c Like \'%A01467%\' OR Service_Item_List__c Like \'%A52209%\'), (Select Id, Account_Roles__c, AccountId from Contacts Where Account_Roles__c = \'Primary Contact\' Limit 1) From Account Where Id in (Select AccountId From Opportunity Where (Service_Item_List__c Like \'%A01218%\' OR Service_Item_List__c Like \'%A52211%\' OR Service_Item_List__c Like \'%A52210%\' OR Service_Item_List__c Like \'%A01467%\' OR Service_Item_List__c Like \'%A52209%\') AND StageName = \'Closed Won\')';
            Id addJob = Database.executeBatch(new AddMembersToActiveNonProfitClientCamp(addQuery),200);

            Campaign cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
            [Select Id, Name From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1] : 
            null;
            String query = 'Select Id, Name, Account__c From CampaignMember Where CampaignId = \'' + cmpT.Id+'\'';

            Opportunity opOld= [Select Id, Name, Service_Item_List__c From Opportunity Limit 1];
            opOld.Service_Item_List__c = '';
            Update opOld;
            Id deleteJob = Database.executeBatch(new DeleteMembersToActiveNonProfitClientCamp(query),200);
            
            Opportunity opNew= [Select Id, Name, Service_Item_List__c From Opportunity Where Id !=: opOld.Id  Limit 1];
            opNew.Service_Item_List__c = '';
            Update opNew;
            
            System.schedule('DeleteMembersToActiveNonProfitClientCamp Test', '0 00 05 ? * 2',  new DeleteMembersToActiveNonProfitClientCamp() );
          
        Test.stopTest();

        List<CronTrigger> ctAdd1 = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'AddMembersToActiveNonProfitClientCamp Test'];
        List<CronTrigger> ctDel1 = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'DeleteMembersToActiveNonProfitClientCamp Test'];

        System.assert( addJob != null, 'Delete batch did not run');
        System.assert( deleteJob != null, 'Delete batch did not run');
        System.assert( ctAdd1.size() > 0, 'Delete Job is not scheduled');
        System.assert( ctDel1.size() > 0, 'Delete Job is not scheduled');
    }
}