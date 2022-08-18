public class RenewalController
{
    
    public  List<Entities__c> myents {get; set;}
    
    public ApexPages.StandardController stdCtrl{get; set;} 

    public String selectedAccount { get; set; }  
    
    public String contIdChosen {get; set;}

    public RenewalController(ApexPages.StandardController std)
    {
        stdCtrl=std;
        getMyList();
    }

    private void getMyList() 
    {
        date dt;
       
            dt = date.Today();
        
        integer mo = dt.month();
        if(contIdChosen != null)
        mo =integer.valueof(contIdChosen);//dt.month();
 
        myents = [select id,Packet_Sent__c,Stamped_List_Received_from_State__c,Renewal_Emailed__c ,List_Filed_with_State__c,Received_Payment_For_Renewal__c,Renewal_Received_From_State__c ,State_Renewal__c,Renewal_Printed__c, Primary_Client__c,RecordTypeId, Name from Entities__c where (CALENDAR_MONTH(State_Renewal__c) =: mo) ORDER BY RecordTypeId,Name ASC];
      
    }
    public PageReference resetdate() 
    {
        getMyList();
        return null;
    }

    public PageReference cancel() {
        return null;
    }


    public PageReference save() 
    {
    /*
        controller.save();        
        PageReference pageRef = new PageReference(Page.Renewals.getURL());
        pageRef.getParameters().put('id',controller.getid());
        pageRef.setRedirect(true);
        return pageRef;
        */
        
        PageReference p = new PageReference('/apex/Renewals');
        p.setRedirect(true);
        update myents;
        return p;
    }
    
    public PageReference autofill() 
    {
        PageReference p = new PageReference('/apex/Renewals');
        p.setRedirect(true);
   
          
        List<Entities__c> myents2 = new List<Entities__c>();
        for(Entities__c en : myents)
        {
        if(en.Renewal_Received_From_State__c == null)
        {
            en.Renewal_Received_From_State__c =date.today();
            myents2.add(en);
        }
        }
        update myents2;
        
        return p;
    }
  
 }