/** A Rest webservice class to get the opporutnity id for the payment.
* @author Sharukh khan
* @version 1.0 - may 6, 2020
*/
@RestResource(urlmapping='/CasePayment/*')
global class CasePaymentApi {
    public Static Boolean triggerExecution = false;
    @HttpPost
    global static String getCaseDetails(String usrAccId, String crdNo, String expYear, String expMonth, String cardHolderName, String cardSecurity)
    {  
        triggerExecution = true;
        try {
            Id RecordType = [SELECT Id, Name FROM RecordType WHERE  Name = :'Entity Formation' and SobjectType = 'Opportunity' LIMIT 1].Id;
            system.debug('RecordType=='+RecordType);
            Id gatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name = :'AuthorizeNetTestPayment' and ChargentBase__Active__c = true].Id;           
            Opportunity opp = new Opportunity();
            opp.AccountId = usrAccId;
            opp.RecordTypeId = RecordType;
            opp.Name = 'Case Opportunity';
            opp.CloseDate = Date.today();
            opp.StageName = 'Agreement Sent';            
            opp.ChargentSFA__Card_Month__c = expMonth;
            opp.ChargentSFA__Card_Name__c = cardHolderName;
            opp.ChargentSFA__Card_Number__c = crdNo;
            opp.ChargentSFA__Card_Year__c = expYear;
            opp.ChargentSFA__Gateway__c = gatewayId;
            opp.Amount = 250.00;            
            opp.ChargentSFA__Charge_Amount__c = 250.00;
            insert opp;   
            return opp.Id;
        }catch(exception e) {
            system.debug('exception === ' + e);
            return null;
        }
    }
}