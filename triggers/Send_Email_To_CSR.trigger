/**
* Trigger Send_Email_To_CSR executed on After Insert and after update.
* Description: Send Email templates to CSR and also Create task releated to client when Creadit card insert or updated
* @author Prateeks
* @version 3.0 
*/
trigger Send_Email_To_CSR on Credit_Card_Detail__c (after insert, after update) {
    
   SendEmailToCSRTriggerHandler.getProcess(Trigger.New); 
}