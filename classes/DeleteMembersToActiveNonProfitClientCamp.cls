/* 
* Author: Muhammad Awais Khan
* Date: 22/Feb/22
* Purpose: Delete Members from "Active Non-Profit Clients" Campaign daily, which doesn't fulfil the criteria
*/
global class DeleteMembersToActiveNonProfitClientCamp implements Database.Batchable<sObject>, Database.Stateful, System.Schedulable {
    private String query;
    private Campaign cmpT;
    public Set<CampaignMember> deleteMembers;
    public Map<Id, Account> allAccounts;

    global DeleteMembersToActiveNonProfitClientCamp() {
        this.cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1] : 
        null;
        this.query = 'Select Id, Name, Account__c From CampaignMember Where CampaignId = \'' + cmpT.Id+'\'';
        deleteMembers = new Set<CampaignMember>(); 
    }

    global DeleteMembersToActiveNonProfitClientCamp(String query) {
        this.query = query;
        deleteMembers = new Set<CampaignMember>(); 
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        List<Account> ac = [ Select Id, (Select Id, Name, Service_Item_List__c, StageName From Opportunities Where Service_Item_List__c Like '%A01218%' OR Service_Item_List__c Like '%A52211%' OR Service_Item_List__c Like '%A52210%' OR Service_Item_List__c Like '%A01467%' OR Service_Item_List__c Like '%A52209%'), (Select Id, Account_Roles__c, AccountId from Contacts Where Account_Roles__c = 'Primary Contact' Limit 1) From Account Where Id in (Select AccountId From Opportunity Where (Service_Item_List__c Like '%A01218%' OR Service_Item_List__c Like '%A52211%' OR Service_Item_List__c Like '%A52210%' OR Service_Item_List__c Like '%A01467%' OR Service_Item_List__c Like '%A52209%') AND StageName = 'Closed Won') ];
        allAccounts = new Map<Id, Account>(ac);
        return Database.getQueryLocator( this.query );
    }

    global void execute(Database.BatchableContext BC, List<CampaignMember> mainList){
        if( mainList.size() > 0 ) {
            for( CampaignMember allExistingMembersList : mainList ) {
                /**
                 * If record is present in campaign but not in all query, delete that record
                 */
                if( !( allAccounts.containsKey( allExistingMembersList.Account__c ) ) ) {
                    deleteMembers.add( allExistingMembersList );
                }
            }
        }
    }

    global void finish(Database.BatchableContext BC){
        System.debug( 'deleteMembers.size: '+ deleteMembers.size() );
        System.debug( 'allAccounts.size: '+ allAccounts.size() );

        if( deleteMembers.size() > 0 ) {
            List<CampaignMember> deleteMembersList = new List<CampaignMember>(deleteMembers); 
            delete deleteMembersList;
        }

        List<CronTrigger> ct = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'DeleteMembersToActiveNonProfitClientCamp One Time'];
        if( ct.size() > 0 ) {
            System.abortJob(ct.get(0).Id);
        }
    }

    global void execute(SchedulableContext SC) {
        database.executebatch(new DeleteMembersToActiveNonProfitClientCamp(),200);
    }
}