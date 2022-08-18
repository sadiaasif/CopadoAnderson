/** A Rest webservice class is used to get the opportunity for payment.
* @author Sharukh khan
* @version 1.0 - apr 23, 2020
*/

@RestResource(urlmapping='/CustomPayment/*')
global class CustomPaymentApi {
    
    @HttpPost
    global static String getOppId(String opportunityid,String creditId)
    {
        String myString=opportunityid;
        String creditCardId=creditId;
        Id cardId = Id.valueOf(creditCardId);
        system.debug(cardId);
        Credit_Card_Detail__c cardDetails = [SELECT Id, Name, Card_Month__c, Card_Year__c, Card_Number__c, Card_Security__c, Card_Type__c, Account__c, Credit_Card_Notes__c FROM Credit_Card_Detail__c where Id = :cardId LIMIT 1];
        system.debug('cardDetails::'+cardDetails);
        String allOppId = '';
        //Id gatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name = :'AuthorizeNetTestPayment' and ChargentBase__Active__c = true].Id; //For Sandbox
        Id websitegatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Platinum_Website_Gateway__c = 'Yes' and ChargentBase__Active__c = true Limit 1]?.Id; //For Production
        Id platinumgatewayId = [SELECT Id, Name FROM ChargentBase__Gateway__c WHERE Name=:'Platinum' and ChargentBase__Active__c = true Limit 1]?.Id;
		Id gatewayId = String.isBlank(String.valueOf(websitegatewayId)) ? platinumgatewayId : websitegatewayId;
        
        if(myString.contains(',')){ 
            String[] commaSeperatedOppId = New String[]{};
                List<String> myArray = myString.split(',');
            for (String o : myArray) {
                Id oppId = Id.valueOf(o);  
                Opportunity op = new Opportunity(Id = oppId);
                op.ChargentSFA__Card_Type__c = cardDetails.Card_Type__c;
                op.ChargentSFA__Card_Year__c = cardDetails.Card_Year__c;
                op.ChargentSFA__Card_Month__c = cardDetails.Card_Month__c;
                op.ChargentSFA__Card_Name__c = cardDetails.Name;
                op.ChargentSFA__Card_Number__c = cardDetails.Card_Number__c;
                op.ChargentSFA__Gateway__c = gatewayId;
                try{
                    update op;
                    commaSeperatedOppId.add(oppId);
                }catch(exception e) {
                    system.debug('Chargent Exception === ' + e);
                }
            }
            allOppId = string.join(commaSeperatedOppId,',');
        } else {
            Id myArray = Id.valueOf(myString);
            Opportunity op = new Opportunity(Id = myArray);
            op.ChargentSFA__Card_Month__c = cardDetails.Card_Month__c;
            op.ChargentSFA__Card_Name__c = cardDetails.Name;
            op.ChargentSFA__Card_Number__c = cardDetails.Card_Number__c;
            op.ChargentSFA__Card_Type__c = cardDetails.Card_Type__c;
            op.ChargentSFA__Card_Year__c = cardDetails.Card_Year__c;
            op.ChargentSFA__Gateway__c = gatewayId;
            try{
                update op;
            }catch(exception e) {
                system.debug('Chargent Exception === ' + e);
            }
            allOppId = myArray;
        }
        return allOppId;
       /* //String oId=PlatinumInvoiceController.MyOpportunities(myString,creditCardId);
        String response=PlatinumInvoiceController.Charge(allOppId);
        system.debug('response=='+response);
        //PlatinumInvoiceController.MyOpportunities(oppotunityId,creditCardId);
        return response; */
    }
    
}