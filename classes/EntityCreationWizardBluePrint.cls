//*******Created by Wakeel******* 6/16/2021
public class EntityCreationWizardBluePrint {
    
    @AuraEnabled
    public static string actid(id orderid)
    {
        try{
        order od= [select Accountid from order where id=:orderid];
        return od.AccountId;
        }
        catch(QueryException qe){return null;}
        
    }

}