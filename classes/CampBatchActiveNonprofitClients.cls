global class CampBatchActiveNonprofitClients implements Database.Batchable<sObject>, Database.Stateful {
    private string query;
    public List<Campaign> cmpid;
    public List<Contact> newMembers;
    global CampBatchActiveNonprofitClients(string query){
        this.query=query;
        this.cmpid = ( [Select Id, Name From Campaign Where Name = 'Active Nonprofit Clients' AND IsActive = true Limit 1].size() > 0 ) ?
        [Select Id From Campaign Where Name = 'Active Nonprofit Clients' AND IsActive = true Limit 1] : 
        null;
        newMembers = new List<Contact>();
    }
    
    global database.QueryLocator start(Database.BatchableContext BC){
        return database.getQueryLocator(query);
    }
    global void execute( Database.BatchableContext bc, List<Account> mainList ){
        
        list<Id> acids= new list<Id>(); 
        Set<Contact> lstcontact=new Set<Contact>();
        
        if( this.cmpid.size() > 0  ) {
            Map<Id, CampaignMember> oldMemMap = new Map<Id, CampaignMember>(); 
            for( CampaignMember oldMembers : [Select ContactId From CampaignMember Where CampaignId =: cmpid.get(0).Id ]) {
                oldMemMap.put( oldMembers.ContactId, oldMembers );
            }

            for( Account ietrator : mainList ) {
                Boolean addContact = false;
                for ( Entities__c entity : ietrator.Entities__r ) {
                    /**
                     * Verify that all entities lie under the same condition
                     */
                    if ( 
                        entity.Organizational_Date__c != null && 
                        entity.Organization_State__c != null && 
                        entity.Dissolution_Date__c == null && 
                        entity.RecordType.name == 'Non-Profit Entity' && 
                        entity.Status__c !='Inactive' && 
                        entity.Status__c !='Terminated' && 
                        entity.Status__c !='Future Planned' && 
                        entity.Status__c !='Missing Information' && 
                        entity.Status__c !='Expedited' && 
                        entity.Status__c !='Sent To Processing'
                    ){
                        addContact = true;
                        break;
                    }
                }
                
                if( ietrator.Contacts.size() > 0 && addContact == true ) {
                    if( !oldMemMap.containsKey( ietrator.Contacts.get(0).Id ) ) {
                        newMembers.add( ietrator.Contacts );
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
                if( acc.Contacts.size() > 0 ){
                    if( !oldMemMap.containsKey( acc.Contacts.get(0).Id ) ){
                        newMembers.add( acc.Contacts );
                    }
                }
            }
        }
    }

    global void finish(Database.BatchableContext BC){
        system.debug('Batch execution completed: ');
        if( newMembers.size() > 0 && cmpid.size() > 0 ) {
            List<CampaignMember> membersList = new List<CampaignMember>();
            for( Contact member : newMembers ) {
                CampaignMember campaignMem = new CampaignMember(
                    Account__c  = member.AccountId,
                    CampaignId  = cmpid.get(0).Id,
                    ContactId   = member.Id,
                    Status      = 'Sent'
                );
                membersList.add(campaignMem);
            }

            if( membersList.size() > 0 ) {
                System.debug('membersList.size: '+ membersList.size() );
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
        System.schedule('DeleteCampBatchActiveNonprofitClients One Time', nextFireTime,  new DeleteCampBatchActiveNonprofitClients() );
    }
    
}