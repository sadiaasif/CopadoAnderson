/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class EditAll_Quote_TEST {

    static testMethod void myUnitTest() {
        Pricebook2[] PBs = [Select p.Name, p.Id From Pricebook2 p where Name = 'Standard Price Book'];
    	Opportunity o = new Opportunity();
    	o.Name = 'Test Oppy';
    	o.CloseDate = System.today();
    	o.StageName = 'Closed Won';
    	o.Pricebook2Id = PBs[0].Id;
    	insert o;
    	
    	//System.currentPageReference().getParameters().put('oppyID',o.Id);
        EditAll_Quote objEditAll_Quote = new EditAll_Quote();
        
        objEditAll_Quote.save();
        objEditAll_Quote.saveClose();
        objEditAll_Quote.cancel();
    }
}