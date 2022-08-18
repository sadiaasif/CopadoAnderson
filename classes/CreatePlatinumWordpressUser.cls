public class CreatePlatinumWordpressUser {
    
    @AuraEnabled
    public static void createPlatinumUser(List<Id> conIds) {
        
        List<Contact> conList = [SELECT Id,AccountId,Platinum_Username__c,Platinum_Email__c,FirstName,LastName FROM Contact Where Id IN :conIds LIMIT 1];
        
        String username = conList[0].Platinum_Email__c;
        String email = conList[0].Platinum_Email__c;
        String firstName = conList[0].FirstName;
        String lastName = conList[0].LastName;
        String password;
        String accId = conList[0].accountId;
        Id oppId = [SELECT Id FROM Opportunity WHERE RecordTypeId = '012U0000000g5s4' AND AccountId = :accId LIMIT 1].Id;
        String platinumSaleId = String.valueOf(oppId);
        String conId = conList[0].Id;
        
        system.debug('entering platinum callout');
        system.debug(username + '' + email + '' + password + '' + accId + '' + platinumSaleId + '' + conId + '' + firstName + '' + lastName);
        
        if(!Test.isRunningTest()) {
            createPlatinumUserFromCmpCallout.makePostCallout(username, email, password, accId, platinumSaleId, conId, firstName, lastName);
        }
    }
    
    
    
}