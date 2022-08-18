global class PlatinumOnboardingBatch implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
          private String query; 
        global boolean Lawsale;
        global boolean Taxsale;
        
         private String CampaignName; 
       
        global PlatinumOnboardingBatch(string query,String CampaignName){
            this.query = query;
            this.CampaignName=CampaignName;
        }
        global  List<CampaignMember> cmList= new List<CampaignMember>();
    global Database.QueryLocator start(Database.BatchableContext bc) { 
      String Team;
        String OnlyPlatinum;
        String OnlySale;
        Set<Id> NewoppIDlawsale=new Set<Id>();
          Set<Id> NewoppIDtaxsale=new Set<Id>();
         Set<Id> NewoppIDlawandtaxsale=new Set<Id>();
          Set<Id> ExistingppIDlawsalewelcomecall=new Set<Id>();
          Set<Id> ExistingppIDtaxsalewelcomecall=new Set<Id>();
         Set<Id> ExistingppIDlawandtaxpandwelcomecall=new Set<Id>();
     
      
        
       List<opportunity> NewoppLawSaleList=[Select id,AccountID from opportunity where  (Account.Teams__c!=null or Account.Teams__c!='') and ((Account.Total_Value_of_All_Sales__c>=1500 and Account.Total_Paid_Amount__c>=1500) or (Account.Total_Value_of_All_Sales__c<=1500 and Account.Total_Balance_Due__c=0)) and stageName = 'Closed Won' and CloseDate=TODAY and Account.CreatedDate = LAST_N_DAYS:60 and(Account.Total_Law_Sale__c>0 And Account.Total_Tax_Sale__c=0) and Account.Name like'%Apples%'];
        for(opportunity opp:NewoppLawSaleList){
          
            NewoppIDlawsale.add(opp.AccountID);
        }
        List<opportunity> NewoppTaxSaleList=[Select id,AccountID from opportunity where  (Account.Teams__c!=null or Account.Teams__c!='') and ((Account.Total_Value_of_All_Sales__c>=1500 and Account.Total_Paid_Amount__c>=1500) or (Account.Total_Value_of_All_Sales__c<=1500 and Account.Total_Balance_Due__c=0)) and stageName = 'Closed Won' and CloseDate=TODAY and Account.CreatedDate = LAST_N_DAYS:60 and(Account.Total_Law_Sale__c=0 And Account.Total_Tax_Sale__c>0) and Account.Name like'%Apples%'];
        for(opportunity opp:NewoppTaxSaleList){
           
            NewoppIDtaxsale.add(opp.AccountID);
        }
        List<opportunity> NewoppLawandTaxSaleList=[Select id,AccountID from opportunity where  (Account.Teams__c!=null or Account.Teams__c!='') and ((Account.Total_Value_of_All_Sales__c>=1500 and Account.Total_Paid_Amount__c>=1500) or (Account.Total_Value_of_All_Sales__c<=1500 and Account.Total_Balance_Due__c=0)) and stageName = 'Closed Won' and CloseDate=TODAY and Account.CreatedDate = LAST_N_DAYS:60 and(Account.Total_Law_Sale__c>0 And Account.Total_Tax_Sale__c>0) and Account.Name like'%Apples%'];
        for(opportunity opp:NewoppLawandTaxSaleList){
           
            NewoppIDlawandtaxsale.add(opp.AccountID);
        }
        
      /*  List<opportunity>  ExistingppIDlawsalewelcomecallList=[Select id,AccountID from opportunity where  (Account.Teams__c!=null or Account.Teams__c!='') and ((Account.Total_Value_of_All_Sales__c>=1500 and Account.Total_Paid_Amount__c>=1500) or (Account.Total_Value_of_All_Sales__c<=1500 and Account.Total_Balance_Due__c=0)) and stageName = 'Closed Won' and CloseDate=TODAY and Account.Test_Created_Date__c != LAST_N_DAYS:60 and(Account.Total_Law_Sale__c>0 or Account.Total_Tax_Sale__c>0) and Account.Name like'%Apples%' and Account.Total_Law_Sale_Welcome_Call__c>0 and Account.Total_Tax_Sale_Welcome_Call__c=0 ];
        for(opportunity opp:ExistingppIDlawsalewelcomecallList){
           
            ExistingppIDlawsalewelcomecall.add(opp.AccountID);
        }
         List<opportunity>  ExistingppIDtaxsalewelcomecallList=[Select id,AccountID from opportunity where  (Account.Teams__c!=null or Account.Teams__c!='') and ((Account.Total_Value_of_All_Sales__c>=1500 and Account.Total_Paid_Amount__c>=1500) or (Account.Total_Value_of_All_Sales__c<=1500 and Account.Total_Balance_Due__c=0)) and stageName = 'Closed Won' and CloseDate=TODAY and Account.Test_Created_Date__c != LAST_N_DAYS:60 and(Account.Total_Law_Sale__c>0 or Account.Total_Tax_Sale__c>0) and Account.Name like'%Apples%' and Account.Total_Law_Sale_Welcome_Call__c=0 and Account.Total_Tax_Sale_Welcome_Call__c>0 ];
        for(opportunity opp:ExistingppIDtaxsalewelcomecallList){
           
            ExistingppIDtaxsalewelcomecall.add(opp.AccountID);
        }
   List<opportunity>   ExistingppIDlawandtaxpandwelcomecallList=[Select id,AccountID from opportunity where  (Account.Teams__c!=null or Account.Teams__c!='') and ((Account.Total_Value_of_All_Sales__c>=1500 and Account.Total_Paid_Amount__c>=1500) or (Account.Total_Value_of_All_Sales__c<=1500 and Account.Total_Balance_Due__c=0)) and stageName = 'Closed Won' and CloseDate=TODAY and Account.Test_Created_Date__c != LAST_N_DAYS:60 and(Account.Total_Law_Sale__c>0 or Account.Total_Tax_Sale__c>0) and Account.Name like'%Apples%' and Account.Total_Law_Sale_Welcome_Call__c>0 and Account.Total_Tax_Sale_Welcome_Call__c>0 ];
        for(opportunity opp:ExistingppIDlawandtaxpandwelcomecallList){
           
            ExistingppIDlawandtaxpandwelcomecall.add(opp.AccountID);
        }*/
        return Database.getQueryLocator(this.query);
    }
    global void execute(Database.BatchableContext bc, List<contact> scope){
        // process each batch of records
       // List<CampaignMember> cmList=new List<CampaignMember>();
        List<CampaignMember>existingCampaign=new List<CampaignMember>();
        List<Id> cmpID=new List<ID>();
        List<CampaignMember> cmm=new List<CampaignMember>();
        ID CampaignId;
        Boolean PlatinumAndSale=false;
        Boolean Platinum=false;
        Boolean Sale=false;
        String CampaignName;
         String CampaigncontactID;
        String StoredCampaignName;
        String NewCampaignName;
    //  Map<ID,Campaign> cmMapList=new Map<id,Campaign>([Select (Select ContactId From CampaignMembers) From Campaign  WHERE Id = '7016C000000N9uQQAS']);
        
       if(this.CampaignName=='New Client Law and Tax Sale'){
            CampaignId=[select id from campaign where Name='New Client Law and Tax Sale'].Id;
            CampaignName=[select Name from campaign where Name='New Client Law and Tax Sale'].Name;
             cmm=[Select ContactId From CampaignMember where CampaignId=:CampaignId ];
        }
        if(this.CampaignName=='New Client Tax Sale'){
            CampaignId=[select id from campaign where Name='New Client Tax Sale'].Id;
            CampaignName=[select Name from campaign where Name='New Client Tax Sale'].Name;
             cmm=[Select ContactId From CampaignMember where CampaignId=:CampaignId ];
        }
        if(this.CampaignName=='New Client Law Sale'){
            CampaignId=[select id from campaign where Name='New Client Law Sale'].Id;
            CampaignName=[select Name from campaign where Name='New Client Law Sale'].Name;
             cmm=[Select ContactId From CampaignMember where CampaignId=:CampaignId ];
        }
     /*     if(this.CampaignName=='Existing Client Law Sale'){
            CampaignId=[select id from campaign where Name='Existing Client Law Sale'].Id;
              System.debug('Existing Client Law Sale--'+CampaignId);
            CampaignName=[select Name from campaign where Name='Existing Client Law Sale'].Name;
             cmm=[Select ContactId From CampaignMember where CampaignId=:CampaignId ];
        }
        if(this.CampaignName=='Existing Client Tax Sale'){
            CampaignId=[select id from campaign where Name='Existing Client Tax Sale'].Id;
             System.debug('Existing Client Tax Sale--'+CampaignId);
            CampaignName=[select Name from campaign where Name='Existing Client Tax Sale'].Name;
             cmm=[Select ContactId From CampaignMember where CampaignId=:CampaignId ];
        }
        if(this.CampaignName=='Existing Client Tax and Law Sale'){
            CampaignId=[select id from campaign where Name='Existing Client Tax and Law Sale'].Id;
                System.debug('Existing Client Tax and Law Sale--'+CampaignId);
            CampaignName=[select Name from campaign where Name='Existing Client Tax and Law Sale'].Name;
             cmm=[Select ContactId From CampaignMember where CampaignId=:CampaignId ];
        }
         */
      
        
        for(CampaignMember c:cmm){
            cmpID.add(c.ContactId);
        }
   
        
        List<Contact> contacts = new List<Contact>();
 CampaignMember cm;     
        System.debug('Scope--'+scope.size());
      
        for (contact Con : scope) {
            if(this.CampaignName=='New Client Law and Tax Sale'){
                If(con.CampaignID__c!=null){
                    IF(Con.CampaignID__c=='New Client Law Sale'  && String.isBlank (con.Campaign2ID__c)){
                         CampaignId=[select id from campaign where Name='New Client Tax Sale'].Id;
                        CampaignName=[select Name from campaign where Name='New Client Tax Sale'].Name;
                    existingCampaign=[Select ContactId From CampaignMember where CampaignId=:CampaignId and ContactId=:Con.Id limit 1];
                        if(existingCampaign.size()>0){
                            cmpID.add(existingCampaign[0].ContactId);
                        }
                        Con.Tax_Sale_code__c=true;
                        con.Campaign2ID__c=CampaignName;
                    }else{
                        if(Con.CampaignID__c=='New Client Tax Sale'  && String.isBlank (con.Campaign2ID__c)){
                             CampaignId=[select id from campaign where Name='New Client Law Sale'].Id;
            			CampaignName=[select Name from campaign where Name='New Client Law Sale'].Name;
                            existingCampaign=[Select ContactId From CampaignMember where CampaignId=:CampaignId and ContactId=:Con.Id limit 1];
                        if(existingCampaign.size()>0){
                            cmpID.add(existingCampaign[0].ContactId);
                        }
                          Con.Law_Sale_Code__c=true;
                         con.Campaign2ID__c=CampaignName;
                        }else{
                            Con.Law_Sale_Code__c=true;
                		Con.Tax_Sale_code__c=true;   
                    	con.CampaignID__c=CampaignName; 
                        }
                        
                    }
                }else{
                    
                Con.Law_Sale_Code__c=true;
                Con.Tax_Sale_code__c=true;   
                    con.CampaignID__c=CampaignName;
                }
                
                
            }
            if(this.CampaignName=='New Client Law Sale'){
                 Con.Law_Sale_Code__c=true;
                 Con.CampaignID__c=CampaignName;
                System.debug('New Client Law Sale Reached');
            }
            if(this.CampaignName=='New Client Tax Sale'){
                Con.Tax_Sale_code__c=true;
                 Con.CampaignID__c=CampaignName;
            }
            
        
				
            // Exixting Client
  
/*            if(this.CampaignName=='Existing Client Tax and Law Sale'){
                If(con.CampaignID__c!=null){
                    IF((Con.CampaignID__c=='Existing Client Law Sale' || Con.CampaignID__c=='New Client Law Sale') && !con.Campaign2ID__c.contains('Existing')  ){
                         CampaignId=[select id from campaign where Name='Existing Client Tax Sale'].Id;
                        CampaignName=[select Name from campaign where Name='Existing Client Tax Sale'].Name;
                    existingCampaign=[Select ContactId From CampaignMember where CampaignId=:CampaignId and ContactId=:Con.Id limit 1];
                        if(existingCampaign.size()>0){
                            cmpID.add(existingCampaign[0].ContactId);
                        }
                        Con.Tax_Sale_code__c=true;
                        con.Campaign2ID__c=CampaignName;
                    }else{
                        if((Con.CampaignID__c=='Existing Client Tax Sale'|| Con.CampaignID__c=='New Client Tax Sale' ) && !con.Campaign2ID__c.contains('Existing')  ){
                             CampaignId=[select id from campaign where Name='Existing Client Law Sale'].Id;
            			CampaignName=[select Name from campaign where Name='Existing Client Law Sale'].Name;
                            existingCampaign=[Select ContactId From CampaignMember where CampaignId=:CampaignId and ContactId=:Con.Id limit 1];
                        if(existingCampaign.size()>0){
                            cmpID.add(existingCampaign[0].ContactId);
                        }
                          Con.Law_Sale_Code__c=true;
                         con.Campaign2ID__c=CampaignName;
                        }else{
                            Con.Law_Sale_Code__c=true;
                		Con.Tax_Sale_code__c=true;   
                    	con.CampaignID__c=CampaignName;
                        }
                        
                    }
                }else{
                    
                Con.Law_Sale_Code__c=true;
                Con.Tax_Sale_code__c=true;   
                    con.CampaignID__c=CampaignName;
                }
                
                
            }
            if(this.CampaignName=='Existing Client Law Sale'){
                 Con.Law_Sale_Code__c=true;
                 Con.CampaignID__c=CampaignName;
                System.debug('Existing Client Law Sale Reached');
            }
            if(this.CampaignName=='Existing Client Tax Sale'){
                Con.Tax_Sale_code__c=true;
                 Con.CampaignID__c=CampaignName;
            }
            
           */
            
            contacts.add(Con);
           
            cm= New CampaignMember(CampaignId=CampaignId,ContactId=Con.Id,Status='Sent');
            if(!cmpID.contains(Con.id)){
            //     System.debug('Existing Client Law Sale Reached 2');
                recordsProcessed=recordsProcessed+1;
                cmList.add(cm);
            } 
         
        }
         try {
             If(cmList.size()>0){
               insert cmList;   
             }
             If(contacts.size()>0){
              update  contacts;  
             }
         
             
         } catch (Exception ex) { 
         	System.Debug('Insert failed ' + ex);
         } 
       
    }    
    global void finish(Database.BatchableContext bc){
       
        System.debug(recordsProcessed + ' records processed.');
           System.debug(cmlist.size() + ' records processed.');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         integer cpuTime = Limits.getCpuTime();
            integer Queries = Limits.getQueries();
            system.debug('CPU Time: '+cpuTime);
            system.debug('Queries: '+Queries);
        // call some utility to send email
     
    
}
    }