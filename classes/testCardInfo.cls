@isTest
public class testCardInfo {

  
    static testMethod void testOpp() {
        
        Opportunity opp=new opportunity();
        opp.name = 'Test Name';
        opp.StageName = 'Qualification';
        opp.CloseDate = system.today();
        opp.ChargentSFA__Card_Number__c = '4147000011112222';
        opp.ChargentSFA__Card_Month__c = '02';
        opp.ChargentSFA__Card_Year__c = '2028';
            
        insert opp;    
        update opp;   
    }
    
    
}