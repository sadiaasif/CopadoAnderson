public class Opportunity_BeforeUpdateHelper {
    private final static string AGREEMENT_SENT ='Agreement Sent';
    public static void updateDateOfNextFollowUp(List<Opportunity> lstNewOpps,Map<Id,Opportunity> mOldOpps){
        try{
            Date nextBusinessDay = getNextBusinessDay(Datetime.now());
            for(Opportunity opp:lstNewOpps){
                if(opp.StageName!=mOldOpps.get(opp.Id).StageName && AGREEMENT_SENT.equals(opp.StageName) ){
                    opp.Date_of_Next_Follow_Up__c = nextBusinessDay;
                }
            }
        }
        catch(Exception e){
            System.debug('Exception: '+e.getMessage()+' occured at Line '+e.getLineNumber());
        }
    }
    public static Date getNextBusinessDay(Datetime dSartDate){ 
        BusinessHours bHours = [Select Id from BusinessHours where isDefault=true LIMIT 1];
        dSartDate = dSartDate.addDays(1);           
        if (!BusinessHours.isWithin(bHours.Id, dSartDate)){                
            dSartDate = BusinessHours.nextStartDate(bHours.Id, dSartDate);
        }
        return dSartDate.date();
    }
}