public class OpportunityPipelineFollowUpUtility {
    /********************************************************************
     * Method Name: getNextBusinessDay
     * Description: Get the next business date from the passed datetime, 
     *               excludes weekends and holidays
     * Author: Moiz Ahmad
     *********************************************************************/
    public static Date getNextBusinessDay(Datetime dStartDate){ 
        Datetime returnDateTime = dStartDate;
        try{
            BusinessHours bHours = [Select Id from BusinessHours where isDefault=true LIMIT 1];
            Boolean NextBusinessDayCalculated = false;
            if (!BusinessHours.isWithin(bHours.Id, returnDateTime)){                
                returnDateTime = BusinessHours.nextStartDate(bHours.Id, returnDateTime);
                NextBusinessDayCalculated =  dStartDate.dateGMT() != returnDateTime.dateGMT();
            }
            
            if(!NextBusinessDayCalculated)
            {
                returnDateTime = returnDateTime.addDays(1);    
                if (!BusinessHours.isWithin(bHours.Id, returnDateTime)){                
                    returnDateTime = BusinessHours.nextStartDate(bHours.Id, returnDateTime);
                }
            }
        }catch(Exception e){
            System.debug('Error occured at '+e.getLineNumber()+' : '+e.getMessage());
        }
        return returnDateTime.date();
    }
    
    /********************************************************************
     * Method Name: getNextBusinessDay
     * Description: An invocable method to get the next business date ,excludes
     *              weekends and holidays
     * Author:      Moiz Ahmad
     *********************************************************************/
    @InvocableMethod(label='Get Next Business')
    public static List<Date> getNextBusinessDay(List<Date> currentDate)
    { 
        List<Date> lstNextBusinessDate = new List<Date>();
        if(!currentDate.isEmpty()){
            for(Date dt:currentDate){
                lstNextBusinessDate.add(getNextBusinessDay(dt));
            }
        }
        return lstNextBusinessDate;
    }
}