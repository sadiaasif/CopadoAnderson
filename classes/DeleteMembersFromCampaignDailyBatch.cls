/* 
* Author: Muhammad Awais Khan
* Date: 08/Feb/22
* Purpose: Delete Members from "Active Tax Clients" Campaign based on Related Time entries of the Projects of all Clients 
*/
global class DeleteMembersFromCampaignDailyBatch implements Database.Batchable<sObject>, Database.Stateful, System.Schedulable {
    private String query;
    public Set<CampaignMember> deleteMembers;
    global DeleteMembersFromCampaignDailyBatch(String query) {
        this.query = query;
        deleteMembers = new Set<CampaignMember>();
    }
    global DeleteMembersFromCampaignDailyBatch() {
        /**
         * User turnary operator here with active check
         */
        Campaign cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Tax Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id, Name From Campaign Where Name = 'Active Tax Clients' AND IsActive = true Limit 1] : 
        null;
        this.query = 'Select Id, Name, Account__c From CampaignMember Where CampaignId = \'' + cmpT.Id+'\'';
        deleteMembers = new Set<CampaignMember>();
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator( this.query );
    }
    global void execute(Database.BatchableContext BC, List<CampaignMember> mainList){
        Map<Id, CampaignMember> accWholeMap = new Map<Id, CampaignMember>();
        List<Id> accIds = new List<Id>();
        Date today = date.today();

        Map<Id, CampaignMember> allMembersMap = new Map<Id, CampaignMember>();
        Campaign cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Tax Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id, Name From Campaign Where Name = 'Active Tax Clients' AND IsActive = true Limit 1] : 
        null;
        for( CampaignMember allMembersList : [Select Id, Name, Account__c From CampaignMember Where CampaignId =: cmpT.Id] ) {
            allMembersMap.put( allMembersList.Account__c, allMembersList );
        }

        for( CampaignMember singMember : mainList ) {
            accIds.add( singMember.Account__c );    
            accWholeMap.put( singMember.Account__c, singMember );
        }
        
        for( Account accountSing : [Select Id, Name, (Select Id, Bookkeeper_Assigned__c, Bookkeeper_Time__c, Max_Time_Entry_Date__c From H2S__HarvestProjects__r ), (Select Id, Service_Item_List__c From Opportunities) From Account Where Id in: accIds ]) {
            Boolean delMember = false;
            for ( H2S__HarvestProject__c project : accountSing.H2S__HarvestProjects__r ) {
                if( project.Max_Time_Entry_Date__c == null || project.Bookkeeper_Assigned__c != null || project.Bookkeeper_Time__c != 0 ) {
                    delMember = true;
                }
                
                if( project.Max_Time_Entry_Date__c != null && Date.isLeapYear( project.Max_Time_Entry_Date__c.Year() ) && project.Max_Time_Entry_Date__c.daysBetween(today) <= 366
                || project.Max_Time_Entry_Date__c != null && !( Date.isLeapYear( project.Max_Time_Entry_Date__c.Year() )  ) && project.Max_Time_Entry_Date__c.daysBetween(today) <= 365 ) {
                    delMember = false;
                    break;
                }
                else {
                    delMember = true;
                }
            }
            
            if( delMember == true && allMembersMap.size() > 0 && allMembersMap.containsKey( accountSing.Id ) ) {
                for ( Opportunity opp : accountSing.Opportunities ) {
                    if( opp != null && !( String.isBlank(opp.Service_Item_List__c) ) ){
                        if( opp.Service_Item_List__c.contains('A00397') || opp.Service_Item_List__c.contains('A11746') ) {
                            delMember = false;
                            break;
                        }
                    }
                }
            }
            if ( delMember == true && accWholeMap.size() > 0 && allMembersMap.size() > 0 && allMembersMap.containsKey( accountSing.Id ) ) {
                deleteMembers.add( accWholeMap.get( accountSing.Id ) );
            }
        }
    }
    global void finish(Database.BatchableContext BC){
        System.debug( 'deleteMembers.size: ' + deleteMembers.size() );
        System.debug( 'deleteMembers: ' + deleteMembers );
        if( deleteMembers.size() > 0 ){
            List<CampaignMember> deleteMembersList = new List<CampaignMember>(deleteMembers);
            delete deleteMembersList;
        }

        List<CronTrigger> ct = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = 'DeleteMembersFromCampaignDailyBatch One Time'];
        if( ct.size() > 0 ) {
            System.abortJob(ct.get(0).Id);
        }
    }
    global void execute(SchedulableContext SC) 
    {   
        database.executebatch(new DeleteMembersFromCampaignDailyBatch(),200);
    }
}