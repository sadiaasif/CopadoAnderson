/* 
* Author: Muhammad Awais Khan
* Date: 22/Feb/22
* Purpose: Add Members to "Active Non-Profit Clients" Campaign daily
*/
global class AddMembersToActiveNonProfitClientCamp implements Database.Batchable<sObject>, Database.Stateful, System.Schedulable {
    private String query;
    public List<Campaign> cmpid;
    public List<Contact> campaignMembers;
    
    global AddMembersToActiveNonProfitClientCamp() {
        /**
         * For auto query, which is used in daily schedueling
         */
        this.query = 'Select Id, (Select Id, Name, Service_Item_List__c, StageName From Opportunities Where Service_Item_List__c Like \'%A01218%\' OR Service_Item_List__c Like \'%A52211%\' OR Service_Item_List__c Like \'%A52210%\' OR Service_Item_List__c Like \'%A01467%\' OR Service_Item_List__c Like \'%A52209%\'), (Select Id, Account_Roles__c, AccountId from Contacts Where Account_Roles__c = \'Primary Contact\' Limit 1) From Account Where Id in (Select AccountId From Opportunity Where (Service_Item_List__c Like \'%A01218%\' OR Service_Item_List__c Like \'%A52211%\' OR Service_Item_List__c Like \'%A52210%\' OR Service_Item_List__c Like \'%A01467%\' OR Service_Item_List__c Like \'%A52209%\') AND StageName = \'Closed Won\' AND (CreatedDate = TODAY OR LastModifiedDate = TODAY))';
        this.cmpid = ( [Select Id, Name From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1] : 
        null;
        campaignMembers = new List<Contact>();
    }

    global AddMembersToActiveNonProfitClientCamp(String query) {
        /**
         * For manual query, to run all Sale records once
         */
        this.query = query;
        this.cmpid = ( [Select Id, Name From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id From Campaign Where Name = 'Active Non-Profit Clients' AND IsActive = true Limit 1] : 
        null;
        campaignMembers = new List<Contact>();
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator( this.query );
    }

    global void execute(Database.BatchableContext BC, List<Account> mainList){
        List<Id> acids= new List<Id>();
        System.debug('mainList: '+mainList.size());

        if( this.cmpid.size() > 0 && mainList.size() > 0  ) {
            Map<Id, CampaignMember> oldMemMap = new Map<Id, CampaignMember>(); 
            for( CampaignMember oldMembers : [Select ContactId From CampaignMember Where CampaignId =: cmpid.get(0).Id ]) {
                oldMemMap.put( oldMembers.ContactId, oldMembers );
            }

            for( Account ietrator : mainList ) {
                Boolean addContact = false;
                
                for( Opportunity op : ietrator.Opportunities ) {
                    if( ( op.Service_Item_List__c.contains('A01218') || op.Service_Item_List__c.contains('A52211') || op.Service_Item_List__c.contains('A52210') || op.Service_Item_List__c.contains('A01467') || op.Service_Item_List__c.contains('A52209') )
                        && op.StageName == 'Closed Won') {
                        addContact = true;
                        break;
                    }
                }
                
                if( ietrator.Contacts.size() > 0 && addContact == true ) {
                    if( !oldMemMap.containsKey( ietrator.Contacts.get(0).Id ) ) {
                        campaignMembers.add( ietrator.Contacts );
                    }
                }
                else if( ietrator.Contacts.size() == 0 && addContact == true ) {
                    /**
                     * Get list of contact Ids to fetch non primary contacts
                     */
                    acids.add(ietrator.Id);
                }
            }
    
            for( Account acc : [ Select Id, ( Select id, Accountid from Contacts Order By LastModifiedDate ASC Limit 1  ) From Account Where Id in: acids  ] ){
                if( acc.Contacts.size() > 0 ) {
                    if( !oldMemMap.containsKey( acc.Contacts.get(0).Id ) ){
                        campaignMembers.add(acc.Contacts);
                    }
                }
            }
        }
        
    }

    global void finish(Database.BatchableContext BC){
        System.debug('campaignMembers: '+campaignMembers.size());
        
        if( campaignMembers.size() > 0 && cmpid.size() > 0 ) {
            List<CampaignMember> membersList = new List<CampaignMember>();
            for( Contact member : campaignMembers ) {
                CampaignMember campaignMem = new CampaignMember(
                    Account__c  = member.AccountId,
                    CampaignId  = cmpid.get(0).Id,
                    ContactId   = member.Id,
                    Status      = 'Sent'
                );
                membersList.add(campaignMem);
            }

            if( membersList.size() > 0 ) {
                insert membersList;
            }
        }

        /**
         * Scheduleing job for delete
         */
        String hour = String.valueOf(Datetime.now().hour() + 2 );
        String min = String.valueOf(Datetime.now().minute()); 
        String ss = String.valueOf(Datetime.now().second());

        String nextFireTime = ss + ' ' + min + ' ' + hour + ' * * ?';
        System.schedule('DeleteMembersToActiveNonProfitClientCamp One Time', nextFireTime,  new DeleteMembersToActiveNonProfitClientCamp() );
    }

    global void execute(SchedulableContext SC) 
    {   
        database.executebatch(new AddMembersToActiveNonProfitClientCamp(),200);
    }
}