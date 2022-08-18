/***************************************************
* Author : Usama Ashraf
* Class Name : WordpressUserCalloutRequestWrapp
* Description : Wrapper class for wordpress callout
******************************************************/

public class WordpressUserCalloutRequestWrapp {
    
    public class Meta {
        public String Sf_ClientAccountId;
        public String Sf_PlatinumSaleId;
        public String Sf_PrimaryContactId;
    }
    
    public String username{get;set;}
    public String email{get;set;}
    public String password{get;set;}
    public String first_name{get;set;}
    public String last_name{get;set;}
    public String roles{get;set;}
    public Meta meta{get;set;}
    
    /********************************************************
* Author : Usama Ashraf
* Method Name : WordpressUserCalloutRequestWrapp 
* Description : Constructor Method
*************************************************************/
    public WordpressUserCalloutRequestWrapp(){}
    
    /**********************************************************
* Author : Usama Ashraf
* Method Name : WordpressUserCalloutRequestWrapp Constructor
* Description : Constructor Method
***************************************************************/
    public WordpressUserCalloutRequestWrapp(Opportunity opp,String roles,String conId){
        
        this.username = opp.Email__c;
        this.email=opp.Email__c;
        this.first_name=opp.Account_First_Name__c;
        this.last_name=opp.Account_Last_Name__c;
        this.roles=roles;
        this.password='NULL';
        WordpressUserCalloutRequestWrapp.Meta metawrapper= new  WordpressUserCalloutRequestWrapp.Meta();
        metawrapper.Sf_ClientAccountId = opp.AccountId;
        metawrapper.Sf_PlatinumSaleId=opp.Id;
        metawrapper.Sf_PrimaryContactId=conId;
        meta=metawrapper;
    } 
    
/*****************************************************
* Author : Usama Ashraf
* Method Name : WordpressUserCalloutRequestWrapp parse
* Description : deserilized Json into Apex
******************************************************/
    public static WordpressUserCalloutRequestWrapp parse(String json) {
        return (WordpressUserCalloutRequestWrapp) System.JSON.deserialize(json, WordpressUserCalloutRequestWrapp.class);
    }
}