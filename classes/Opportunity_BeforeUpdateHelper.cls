public class Opportunity_BeforeUpdateHelper {
    private final static string AGREEMENT_SENT ='Agreement Sent';
    public static void updateDateOfNextFollowUp(List<Opportunity> lstNewOpps,Map<Id,Opportunity> mOldOpps){
        try{
            Date todayDate = Date.today();
            for(Opportunity opp:lstNewOpps){
                if(opp.StageName!=mOldOpps.get(opp.Id).StageName && AGREEMENT_SENT.equals(opp.StageName) ){
                    opp.Date_of_Next_Follow_Up__c = todayDate;
                }
            }
        }
        catch(Exception e){
            System.debug('Exception: '+e.getMessage()+' occured at Line '+e.getLineNumber());
        }
    }
    
}