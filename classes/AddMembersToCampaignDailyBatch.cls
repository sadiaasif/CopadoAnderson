/* 
* Author: Muhammad Awais Khan
* Date: 02/Feb/22
* Purpose: Add Members to "Active Tax Clients" Campaign on daily basis based on Related Time entries of the Projects of all Clients 
*/
global class AddMembersToCampaignDailyBatch implements Database.Batchable<sObject>, Database.Stateful, System.Schedulable {
    private String query;
    public List<Contact> campaignMembers;
    public Set<Id> accIds;
    global AddMembersToCampaignDailyBatch(String query, Set<Id> accIds) {
        this.query = query;
        this.accIds = accIds;
        campaignMembers = new List<Contact>();
    }
    global AddMembersToCampaignDailyBatch() {
        this.accIds = new Set<Id>();
        for(Opportunity ag : [Select AccountId From Opportunity Where Service_Item_List__c Like '%A00397%' OR Service_Item_List__c Like '%A11746%'] ){
            accIds.add(ag.AccountId);
        }

        for(H2S__HarvestProject__c project : [Select H2S__Account__c From H2S__HarvestProject__c Where Max_Time_Entry_Date__c != null]){
            accIds.add(project.H2S__Account__c);
        }
        this.query = 'Select Id, Name, (Select Id, Bookkeeper_Assigned__c, Bookkeeper_Time__c, Max_Time_Entry_Date__c From H2S__HarvestProjects__r ), (Select Id, Account_Roles__c, AccountId from Contacts Where Account_Roles__c = \'Primary Contact\'), (Select Id, Service_Item_List__c From Opportunities Where Service_Item_List__c Like \'%A00397%\' OR Service_Item_List__c Like \'%A11746%\') From Account Where Id in: accIds';
        campaignMembers = new List<Contact>();
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator( this.query );
    }
    global void execute(Database.BatchableContext BC, List<Account> mainList){
        Date today = date.today();
        for( Account ietrator : mainList ) {
            Boolean addContact = false;
            for ( H2S__HarvestProject__c project : ietrator.H2S__HarvestProjects__r ) {
                if( project.Max_Time_Entry_Date__c != null && project.Bookkeeper_Assigned__c == null && project.Bookkeeper_Time__c == 0 ) {
                    if( Date.isLeapYear( project.Max_Time_Entry_Date__c.Year() ) && project.Max_Time_Entry_Date__c.daysBetween(today) <= 366
                        || !( Date.isLeapYear( project.Max_Time_Entry_Date__c.Year() )  ) && project.Max_Time_Entry_Date__c.daysBetween(today) <= 365 ) {
                        /**
                         * is leap year and 366 days or less old
                         * not leap year and 365 days or less old
                         */
                        addContact = true;   
                        break;
                    }
                }
            }
            if( addContact != true ) {
                for ( Opportunity opp : ietrator.Opportunities ) {
                    if( opp != null ){
                        if( opp.Service_Item_List__c.contains('A00397') || opp.Service_Item_List__c.contains('A11746') ) {
                            /**
                             * If sale has Tax Advantage Program Service Item
                             */
                            addContact = true;   
                            break;
                        }
                    }
                }
            }
            if( addContact == true && ietrator.Contacts.size() > 0 ) {
                campaignMembers.add( ietrator.Contacts.get(0) );
            }
        }
    }
    global void finish(Database.BatchableContext BC){
        Campaign cmpT = ( [Select Id, Name From Campaign Where Name = 'Active Tax Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id, Name From Campaign Where Name = 'Active Tax Clients' AND IsActive = true Limit 1] : 
        null;
        List<CampaignMember> existingMembersList = [Select ContactId From CampaignMember Where CampaignId =: cmpT.Id ];
        List<CampaignMember> membersList = new List<CampaignMember>();
        
        List<Id> existingIds = new List<Id>();
        
        System.debug( 'campaignMembers.size(): ' + campaignMembers.size() );
        
        if(campaignMembers.size() > 0){
            for( CampaignMember existingMember : existingMembersList ){
                /**
                 * Extracting Ids from Campaign members
                 */
                existingIds.add( existingMember.ContactId );
            }
            
            Set<Id> existingMembersSet = new Set<Id>(existingIds);

            for( Contact member : campaignMembers ) {
                if( !existingMembersSet.contains( member.Id ) ) {
                    /**
                     * Add to insert list if they are not already present in the campaign
                     */
                    CampaignMember campaignMem = new CampaignMember(
                        Account__c  = member.AccountId,
                        CampaignId  = cmpT.Id,
                        ContactId   = member.Id,
                        Status      = 'Sent'
                    );
                    membersList.add(campaignMem);
                }
            }
            
            
            System.debug( 'membersList.size(): ' + membersList.size() );
            if( membersList.size() > 0 ) {
                try{
                	Insert membersList;    
                }
                catch(Exception e) {
                    System.debug('Exception occured: '+e);
                }
            }
        }

        /**
         * Scheduleing job for delete
         */
        String hour = String.valueOf(Datetime.now().hour() + 2);
        String min = String.valueOf(Datetime.now().minute()); 
        String ss = String.valueOf(Datetime.now().second());

        //parse to cron expression
        String nextFireTime = ss + ' ' + min + ' ' + hour + ' * * ?';
        System.schedule('DeleteMembersFromCampaignDailyBatch One Time', nextFireTime,  new DeleteMembersFromCampaignDailyBatch() );
    }
    global void execute(SchedulableContext SC) 
    {   
        database.executebatch(new AddMembersToCampaignDailyBatch(),200);
    }
}