public with sharing class ctrEntity 
{
 
    public Entities__c ent{get; set;}
    public Account acc{get; set;}
    public string EntId {get; set;}
    public string dt {get; set;}
    public string eMonth {get; set;}
    
   public ctrEntity(ApexPages.StandardController controller) 
   	{
        
        EntId = Apexpages.currentpage().getParameters().get('EntId');
        
        if(EntId != null)
        {
            
            ent = [select id,Name, Secretary__c,Treasurer__c ,President__c,Director_1__c,Director_2__c,Director_3__c,Director_4__c,Organizational_Date__c,List_Filed_with_State__c, General_Partner__c,Primary_Client__c from Entities__c where id =:EntId];
            acc = [select id, Name, First_Name__c, Last_Name__c, BillingCity, BillingStreet, BillingState, BillingPostalCode from Account where id =: ent.Primary_Client__c];
            if(ent.Organizational_Date__c != null)
            	eMonth = mth(ent.Organizational_Date__c);
            else
            	eMonth = 'Year';
            Datetime myDT = Datetime.now();
            string mth = mth(myDT);
            
            dt = mth + ' ' + String.valueOf(myDT.day()) + ', ' + String.valueOf(myDT.year());
   		}
           
    }
    
    static string mth(Datetime myDT)
    {
    	string month = '';
    	if(myDT.month()==1)
            	month = 'January';
            	if(myDT.month()==2)
            	month = 'February';
            	if(myDT.month()==3)
            	month = 'March';
            	if(myDT.month()==4)
            	month = 'April';
            	if(myDT.month()==5)
            	month = 'May';
            	if(myDT.month()==6)
            	month = 'June';
            	if(myDT.month()==7)
            	month = 'July';
            	if(myDT.month()==8)
            	month = 'August';
            	if(myDT.month()==9)
            	month = 'September';
            	if(myDT.month()==10)
            	month = 'October';
            	if(myDT.month()==11)
            	month = 'November';
            	if(myDT.month()==12)
            	month = 'December';
            	return month;
    }
}