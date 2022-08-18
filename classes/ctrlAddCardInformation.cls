Public Class ctrlAddCardInformation{

    Public String Selectedid{get;set;}
    Public String Selectcard{get;set;}
    public list<SelectOption> option{get;set;}
    public list<Credit_Card_Detail__c> lstcardDetail{get;set;}
    public list<Opportunity> getopprtunityid{get;set;}
 
    public string opperunityid{get;set;}
   
    public ctrlAddCardInformation(ApexPages.StandardController controller){
       opperunityid= apexpages.currentpage().getparameters().get('id');
       lstcardDetail=new list<Credit_Card_Detail__c>();
       getopprtunityid=new list<Opportunity>();
       cardinformation();
    }
    public List<SelectOption> cardinformation()
    {
        string getaccountid;
        option=new list<Selectoption>();
        getopprtunityid=new list<Opportunity>();
        getopprtunityid=[Select id,AccountId from Opportunity where id=:opperunityid];
        getaccountid= getopprtunityid[0].AccountId ;
      
        lstcardDetail=[Select id,Name,Card_Type__c,Card_Number__c from Credit_Card_Detail__c where Account__c=:getaccountid ];
        for(Credit_Card_Detail__c ccd:lstcardDetail){
          if(ccd.Card_Number__c!=null && ccd.Card_Number__c!='' ){
          
            integer result = ccd.Card_Number__c.length();
            ccd.Card_Number__c= ccd.Card_Number__c.SubString(result -4,result); 
            Selectcard=ccd.Name +'-'+ccd.Card_Number__c;
            Selectedid=ccd.id;
          
            option.add(new SelectOption(Selectedid,Selectcard));
            }
            else
            {
            Selectcard=ccd.Name; 
            Selectedid=ccd.id;
            option.add(new SelectOption(Selectedid,Selectcard));
            }
           }
        return option;
    } 
    
    public Pagereference informationcard(){
    
        list<Opportunity> lstoppertunity=new list<Opportunity>();
        lstcardDetail=[Select id,Name,Card_Type__c,Card_Month__c,Card_Year__c,Card_Number__c,Card_Security__c,Billing_Zip_Postal__c from Credit_Card_Detail__c where id=:Selectedid ];
        lstoppertunity=[Select id,ChargentSFA__Card_Name__c,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Billing_Zip__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c from Opportunity where id=:opperunityid];
       if(lstcardDetail.size()>0){
                lstoppertunity[0].ChargentSFA__Card_Type__c=lstcardDetail[0].Card_Type__c;
                lstoppertunity[0].ChargentSFA__Card_Month__c=lstcardDetail[0].Card_Month__c;    
                lstoppertunity[0].ChargentSFA__Card_Year__c=lstcardDetail[0].Card_Year__c;    
                lstoppertunity[0].ChargentSFA__Card_Number__c=lstcardDetail[0].Card_Number__c;
                lstoppertunity[0].ChargentSFA__Card_Name__c=lstcardDetail[0].Name;  
           		If(lstcardDetail[0].Billing_Zip_Postal__c !=Null && lstcardDetail[0].Billing_Zip_Postal__c!='') {
                 lstoppertunity[0].ChargentSFA__Billing_Zip__c=lstcardDetail[0].Billing_Zip_Postal__c;
           		}
              
          update lstoppertunity; 
        }
       return null;
    }

}