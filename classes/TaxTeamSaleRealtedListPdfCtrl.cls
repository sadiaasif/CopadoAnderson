public class TaxTeamSaleRealtedListPdfCtrl {

       
   
    public List<Opportunity> lstopp {get; set;}
    public string accId {get; set;}
     public List<oppwrapper> lstoppinwrapper{get;set;}
    Public Integer oppListSize{get;set;}
   
    
   public TaxTeamSaleRealtedListPdfCtrl(ApexPages.StandardController controller) {
        lstopp = new List<Opportunity>();
        accId = Apexpages.currentpage().getParameters().get('id');
       if(accId!=null){
           oppwrapper objwrapperforopp;
           lstoppinwrapper=new List<oppwrapper>();

           lstopp=[select id,name,RecordType.Name,Status__c,StageName,Amount,ChargentSFA__Balance_Due__c,CloseDate,Owner.name,Entity__r.Name,Sales_Rep__r.Name from Opportunity where accountId=:accId  ORDER BY CloseDate DESC  ];
           
           if(lstopp.size()>0){
               oppListSize=lstopp.size();
                for (integer i = 0; i < lstopp.size(); i++) {
             
            objwrapperforopp = new oppwrapper();
            objwrapperforopp.OppListwrapper = lstopp[i];
           
             objwrapperforopp.flag = (Math.mod(i, 2) == 0?TRUE:FALSE);
           
            lstoppinwrapper.add(objwrapperforopp);
        
          }
           }
                    
       }
       
    }
  public class oppwrapper{
        public  Opportunity OppListwrapper{get;set;}
      
      
        
          public boolean flag {get;set;}
}  
}