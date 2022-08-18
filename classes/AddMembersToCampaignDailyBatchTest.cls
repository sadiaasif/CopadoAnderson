@isTest
public class AddMembersToCampaignDailyBatchTest {
    @testSetup
    static void setup()
    { 
        try{
            Account firstAcc = null;
            List<Account> accList = new List<Account>();
            for( Integer i = 1; i <=5; i++  ) {
                firstAcc = new Account();
                firstAcc.Name = 'Test Campaign Account - ' + i;
                accList.add(firstAcc);
            }
            insert accList;
            
            List<Contact> oldContacts = new List<Contact>();
            List<H2S__HarvestProject__c> projList = new List<H2S__HarvestProject__c>();
            List<Opportunity> oppList = new List<Opportunity>();
            Integer i = 0;
            for( Account acc : accList  ) {
                /**
* Add contacts to newly created accounts
*/
                Contact con = new Contact( 
                    FirstName = 'Test Campaign', 
                    LastName = 'Contact' + i , 
                    Account_Roles__c = 'Primary Contact', 
                    AccountId = acc.Id 
                );
                oldContacts.add( con );
                
                /**
* Also add projects to those accounts
*/
                H2S__HarvestProject__c project = new H2S__HarvestProject__c(
                    Name = 'Test project' + i,
                    H2S__Account__c = acc.Id,
                    H2S__Budget__c = 'No budget',
                    H2S__InvoiceMethod__c = 'This project is not billable'
                );
                projList.add( project );
                
                /**
* Also add opportunities to those opps
*/
                Opportunity op = new Opportunity(
                    Name = 'Test opp' + i,
                    AccountId = acc.Id,
                    Service_Item_List__c = 'A00397;A11746;',
                    StageName = 'Qualification',
                    CloseDate = date.today()
                    
                );
                oppList.add(op);
                
                i++;
            }
            insert oldContacts;
            insert projList;
            insert oppList;
            System.debug('oldContacts: '+oldContacts);
            System.debug('projList: '+projList);
            System.debug('oppList: '+oppList);
            
            /**
* For all those projects, add time enteries
*/
            List<H2S__HarvestTimeEntry__c> timeEntriesList = new List<H2S__HarvestTimeEntry__c>(); 
            for( H2S__HarvestProject__c projs : projList ) {
                H2S__HarvestTimeEntry__c timeEntry = new H2S__HarvestTimeEntry__c(
                    H2S__Date__c = date.parse('1/1/2022'),
                    H2S__HarvestProject__c = projs.Id,
                    H2S__StartTime__c = date.parse('1/1/2022'),
                    H2S__EndTime__c = date.parse('1/1/2022')
                );
                timeEntriesList.add(timeEntry);
            }
            
            insert timeEntriesList;
            
            Campaign cmp = new Campaign( Name = 'Active Tax Clients', IsActive = true );
            insert cmp;
            
            /**
* Insert campaign members in the above created campaign
*/
            
            List<CampaignMember> cmpMemberList = new List<CampaignMember>();
            for( Integer j = 0; j < 2; j++  ) {
                CampaignMember cmpMember = new CampaignMember(
                    Account__c  = accList.get(j).Id,
                    CampaignId  = cmp.Id,
                    ContactId   = oldContacts.get(j).Id,
                    Status      = 'Sent'
                );
                cmpMemberList.add(cmpMember);
            }
            insert cmpMemberList;
            
            Account forDeletion = new Account( Name = 'For Deletion Account' );
            insert forDeletion;
            
            H2S__HarvestProject__c delProj = new H2S__HarvestProject__c( Name = 'Delete Project', H2S__Account__c = forDeletion.Id, H2S__Budget__c = 'No budget', H2S__InvoiceMethod__c = 'This project is not billable'  );
            insert delProj;
            
            Contact delContact = new Contact( FirstName = 'For Deletion', LastName = 'Contact', AccountId = forDeletion.Id );
            insert delContact;
            
            Opportunity delOpp = new Opportunity( Name = 'Delete Opp', Service_Item_List__c = '', AccountId = forDeletion.Id, StageName = 'Qualification', CloseDate = date.today() );
            insert delOpp;
            
            CampaignMember cmpMember = new CampaignMember(Account__c  = forDeletion.Id, CampaignId  = cmp.Id, ContactId = delContact.Id, Status = 'Sent' );
            insert cmpMember;
            
        }
        catch(Exception ex)
        {
            system.debug('getLineNumber>>'+ ex.getLineNumber());
            system.debug('getCause>>'+ ex.getCause());
            system.debug('getMessage>>'+ ex.getMessage());
        }
    }
    
    static testMethod void testCampaignBatch(){
        try{
            
            Set<Id> accIds = new Set<Id>();
            for(Opportunity ag : [Select AccountId From Opportunity Where Service_Item_List__c Like '%A00397%' OR Service_Item_List__c Like '%A11746%'] ){
                accIds.add(ag.AccountId);
            }
            
            for(H2S__HarvestProject__c project : [Select H2S__Account__c From H2S__HarvestProject__c Where Max_Time_Entry_Date__c != null]){
                accIds.add(project.H2S__Account__c);
            }
            String query = 'Select Id, Name, (Select Id, Bookkeeper_Assigned__c, Bookkeeper_Time__c, Max_Time_Entry_Date__c From H2S__HarvestProjects__r ), (Select Id, Account_Roles__c, AccountId from Contacts Where Account_Roles__c = \'Primary Contact\'), (Select Id, Service_Item_List__c From Opportunities Where Service_Item_List__c Like \'%A00397%\' OR Service_Item_List__c Like \'%A11746%\') From Account Where Id in: accIds';
            
            System.debug('Query Chk: '+database.query( query ));
            
            List<Campaign> cmp = [Select Id, Name From Campaign Where Name = 'Active Tax Clients' Limit 1];
            String deleteQuery = 'Select Id, Name, Account__c From CampaignMember Where CampaignId = \'' + cmp.get(0).Id+'\'';
            
            // Test.startTest();
            Id batchJobId1 = Database.executeBatch(new AddMembersToCampaignDailyBatch(query, accIds),200);
            
            Opportunity opDel1 = [Select Id, Service_Item_List__c From Opportunity Limit 1];
            opDel1.Service_Item_List__c = '';
            update opDel1;
            
            Id deleteBatchJobId1 = Database.executeBatch(new DeleteMembersFromCampaignDailyBatch(deleteQuery),200);
            Test.startTest();
            System.schedule('AddMembersToCampaignDailyBatch Test', '0 00 05 ? * 2',  new AddMembersToCampaignDailyBatch() );
            
            Opportunity opDel2 = [Select Id, Service_Item_List__c From Opportunity Where Id !=: opDel1.Id Limit 1];
            opDel2.Service_Item_List__c = '';
            update opDel2;
            
            System.schedule('DeleteMembersFromCampaignDailyBatch Test', '0 00 05 ? * 2',  new DeleteMembersFromCampaignDailyBatch() );
            
            
            List<CronTrigger> ctAdd = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'AddMembersToCampaignDailyBatch Test'];
            List<CronTrigger> ctDel = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'DeleteMembersFromCampaignDailyBatch Test'];
            Test.stopTest();
            System.debug('ctAdd: '+ctAdd);
            System.debug('ctDel: '+ctDel);
        }
        catch(Exception ex)
        {
            system.debug('getLineNumber>>'+ ex.getLineNumber());
            system.debug('getCause>>'+ ex.getCause());
            system.debug('getMessage>>'+ ex.getMessage());
        }
        
        // System.assert( batchJobId1 != null, 'Add batch did not run');
        // System.assert( deleteBatchJobId1 != null, 'Delete batch did not run');
        // System.assert( ctAdd.size() > 0, 'Add Job is not scheduled');
        // System.assert( ctDel.size() > 0, 'Delete Job is not scheduled');
        // Test.stopTest();
    }
}