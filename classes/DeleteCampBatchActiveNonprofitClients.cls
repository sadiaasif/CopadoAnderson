/* 
* Author: Muhammad Awais Khan
* Date: 11/Feb/22
* Purpose: Delete Members from "Active Nonprofit Clients" Campaign based on criteria specified in the report "Active Non Profit Entities" 
*/
global class DeleteCampBatchActiveNonprofitClients implements Database.Batchable<sObject>, Database.Stateful, System.Schedulable {
    private String query;
    private Campaign cmpT;
    public Set<CampaignMember> deleteMembers;
    public List<Entities__c> allEntities;

    global DeleteCampBatchActiveNonprofitClients() {
        this.cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Nonprofit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id From Campaign Where Name = 'Active Nonprofit Clients' AND IsActive = true Limit 1] : 
        null;
        this.query = 'Select Id, Name, Account__c From CampaignMember Where CampaignId = \'' + cmpT.Id+'\'';
        deleteMembers = new Set<CampaignMember>(); 
    }

    global DeleteCampBatchActiveNonprofitClients(String query) {
        this.query = query;
        deleteMembers = new Set<CampaignMember>(); 
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        this.allEntities = [ SELECT Primary_Client__c FROM Entities__c WHERE Organizational_Date__c != null AND Organization_State__c != null AND Dissolution_Date__c = null AND RecordType.name ='Non-Profit Entity' AND Status__c !='Inactive' AND Status__c !='Terminated' AND Status__c !='Future Planned' AND Status__c !='Missing Information' AND Status__c !='Expedited' AND Status__c !='Sent To Processing' ];
        return Database.getQueryLocator( this.query );
    }
    
    global void execute(Database.BatchableContext BC, List<CampaignMember> mainList){
        Map<Id, Entities__c> allEntitiesMap = new Map<Id, Entities__c>();
        for( Entities__c  ents : this.allEntities ) {
            allEntitiesMap.put( ents.Primary_Client__c, ents ); 
        }

        if( mainList.size() > 0 ) {
            for( CampaignMember allExistingMembersList : mainList ) {
                /**
                 * If condition is not met for any of current query, delete this record
                 */
                if( !( allEntitiesMap.containsKey( allExistingMembersList.Account__c ) ) ) {
                    deleteMembers.add( allExistingMembersList );
                }
            }
        }
    }

    global void finish(Database.BatchableContext BC){
        System.debug('deleteMembers size: ' + deleteMembers.size() );
        if( deleteMembers.size() > 0 ) {
            List<CampaignMember> deleteMembersList = new List<CampaignMember>(deleteMembers); 
            delete deleteMembersList;
        }

        List<CronTrigger> ct = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'DeleteCampBatchActiveNonprofitClients One Time'];
        if( ct.size() > 0 ) {
            System.abortJob(ct.get(0).Id);
        }
    }

    global void execute(SchedulableContext SC) {
        database.executebatch(new DeleteCampBatchActiveNonprofitClients(),200);
    }
}