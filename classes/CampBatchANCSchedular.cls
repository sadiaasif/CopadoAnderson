global class CampBatchANCSchedular implements Schedulable {
    global void execute(SchedulableContext sc) {
        String query = ' Select Id, '+
        '(SELECT Primary_Client__c, Organizational_Date__c, Organization_State__c, Dissolution_Date__c, RecordType.name, Status__c FROM Entities__r WHERE Organizational_Date__c != null AND Organization_State__c != null AND Dissolution_Date__c = null AND RecordType.name =\'Non-Profit Entity\' AND Status__c !=\'Inactive\' AND Status__c !=\'Terminated\' AND Status__c !=\'Future Planned\' AND Status__c !=\'Missing Information\' AND Status__c !=\'Expedited\' AND Status__c !=\'Sent To Processing\'), '+
        '(Select Id, Account_Roles__c, AccountId from Contacts Where Account_Roles__c = \'Primary Contact\' Order By LastModifiedDate ASC Limit 1) '+
        'From Account '+ 
        'Where Id in (SELECT Primary_Client__c FROM Entities__c WHERE Organizational_Date__c != null AND Organization_State__c != null AND Dissolution_Date__c = null AND RecordType.name =\'Non-Profit Entity\' AND Status__c !=\'Inactive\' AND Status__c !=\'Terminated\'AND Status__c !=\'Future Planned\' AND Status__c !=\'Missing Information\' AND Status__c !=\'Expedited\' AND Status__c !=\'Sent To Processing\') ';
        database.executebatch(new CampBatchActiveNonprofitClients( query ),200);
    }

}