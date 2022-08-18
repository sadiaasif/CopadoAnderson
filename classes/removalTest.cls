@isTest 
public class removalTest{
    public static testMethod void testRemoval() {
        RenewalQuotingHandler r = new RenewalQuotingHandler();
        InvoicePdfCtrl i = new  InvoicePdfCtrl();
        QuotePdfCtrl q = new    QuotePdfCtrl();
         String jobId = System.schedule('testBasicScheduledApex',
            '0 0 0 3 9 ? 2022', 
             new EncoreAutomation());
    }  

}