/**
* @author            :Chetu India Developer Team
* @Created date      :30/07/2018
* @Last Modified By  :Chetu India Team
* @Last Modified Date:02/08/2018 
* @Description       :This trigger is used to copy the record of HarvestProject into Tax and Bookkeeping objects.
**/
trigger UpdateInformationOnTaxAndBookkeeping on H2S__HarvestProject__c (after Insert,after update) {
    Set<id> accountId = new Set<id>(); 
    Set<id> Projectid  =  new set<id>();
    List<Tax__c>listToUpdate = new List<Tax__c>();
    Map<id,Tax__c>mapToUpdate=new Map<id,Tax__c>();
    List<Bookkeeping__c> updateBookkeepingRecords = new List<Bookkeeping__c>();
     checkRecursive.run5=false;
    System.debug('_______run5  ____________'+checkRecursive.run5  );
    if(trigger.isinsert){
        for(H2S__HarvestProject__c  pro : trigger.new){
            //all the Harvest project associated account id is getting inserted into set.   
            accountId.add(pro.H2S__Account__c);   
        }      
    system.debug('---->'+accountId);
    List<Tax__c>listOfTax = new List<Tax__c>();
    List<Bookkeeping__c>listOfBookkeeping= new List<Bookkeeping__c>();
    
    listOfTax  =[select id,Name,Client_Name__c,Budget__c  from  Tax__c where Client_Name__c = : accountId];
    listOfBookkeeping =[select id,Name,Client_Name__c from  Bookkeeping__c where Client_Name__c = : accountId];
   
    System.debug('_______listOfTax  ____________'+listOfTax  );
    //Harvest project record is being copied into Tax object...
        for(H2S__HarvestProject__c hp: trigger.new){
            for(Tax__c  objTax :listOfTax   ){
                //if Harvest account is matched with Tax client then record inserted 
                if(objTax.Client_Name__c == hp.H2S__Account__c ){
                    objTax.Budget__c = hp.H2S__Budget__c;
                    objTax.Name__c  = hp.Name;
                    objTax.ProjectNotes__c = hp.H2S__ProjectNotes__c;
                    objTax.ProjectCode__c = hp.H2S__ProjectCode__c;
                    objTax.HarvestProjectID__c= hp.H2S__HarvestProjectID__c;
                    objTax.InvoiceMethod__c = hp.H2S__InvoiceMethod__c;
                    objTax.ProjectInvoicedBy__c = hp.H2S__ProjectInvoicedBy__c;
                    objTax.PercentOfBudgetAlert__c=  hp.H2S__PercentOfBudgetAlert__c;
                    objTax.TotalProjectFees__c  = hp.H2S__TotalProjectFees__c;
                    objTax.TotalProjectHours__c = hp.H2S__TotalProjectHours__c;
                    objTax.Package_Hours_Used__c= hp.Package_Hours_Used__c;
                    objTax.ProjectHourlyRate__c= hp.H2S__ProjectHourlyRate__c;
                    objTax.InvoicedTime__c = hp.H2S__InvoicedTime__c;
                    objTax.UninvoicedTime__c = hp.H2S__UninvoicedTime__c;
                    objTax.TotalTime__c= hp.H2S__TotalTime__c;
                    objTax.Bookkeeper_Time__c= hp.Bookkeeper_Time__c;
                    objTax.NoOfEntries__c=  hp.H2S__NoOfEntries__c;     
                    objTax.Budget_Rollup_Bookkeeper__c = hp.Budget_Rollup_Bookkeeper__c;
                    objTax.Budget_Rollup_CPA__c= hp.Budget_Rollup_CPA__c;
                    objTax.Budget_Rollup_Tax_Preparer__c= hp.Budget_Rollup_Tax_Preparer__c;
                    objTax.Budget_Rollup_EA__c = hp.Budget_Rollup_EA__c;
                    objTax.Budget_Rollup_Attorney__c = hp.Budget_Rollup_Attorney__c;
                    objTax.EarliestTimeLogged__c= hp.H2S__EarliestTimeLogged__c;
                    objTax.LastTimeLogged__c= hp.H2S__LastTimeLogged__c;
                    listToUpdate.add(objTax);
                    mapToUpdate.put(objTax.Id,objTax);
                }
            }
            //Harvest project record is being  copied into Bookkeeping object...
            
            for(Bookkeeping__c  objBookk : listOfBookkeeping  ){
                
                //if Harvest account is matched with bookkeeping client then record inserted 
                if(objBookk.Client_Name__c == hp.H2S__Account__c ){
                    objBookk.Budget__c = hp.H2S__Budget__c;   
                    objBookk.Name__c = hp.Name;
                    objBookk.ProjectNotes__c = hp.H2S__ProjectNotes__c;
                    objBookk.InvoiceMethod__c = hp.H2S__InvoiceMethod__c;
                    objBookk.ProjectInvoicedBy__c = hp.H2S__ProjectInvoicedBy__c;
                    objBookk.PercentOfBudgetAlert__c=  hp.H2S__PercentOfBudgetAlert__c;
                    objBookk.TotalProjectFees__c  = hp.H2S__TotalProjectFees__c;
                    objBookk.TotalProjectHours__c = hp.H2S__TotalProjectHours__c;
                    objBookk.Package_Hours_Used__c= hp.Package_Hours_Used__c;
                    objBookk.ProjectHourlyRate__c= hp.H2S__ProjectHourlyRate__c;
                    objBookk.ProjectCode__c = hp.H2S__ProjectCode__c;
                    objBookk.HarvestProjectID__c = hp.H2S__HarvestProjectID__c;
                    objBookk.InvoicedTime__c = hp.H2S__InvoicedTime__c;
                    objBookk.UninvoicedTime__c = hp.H2S__UninvoicedTime__c;
                    objBookk.TotalTime__c = hp.H2S__TotalTime__c;
                    objBookk.Bookkeeper_Time__c = hp.Bookkeeper_Time__c;
                    objBookk.EarliestTimeLogged__c = hp.H2S__EarliestTimeLogged__c;
                    objBookk.NoOfEntries__c =  hp.H2S__NoOfEntries__c;
                    objBookk.Budget_Rollup_Bookkeeper__c = hp.Budget_Rollup_Bookkeeper__c;
                    objBookk.Budget_Rollup_CPA__c= hp.Budget_Rollup_CPA__c;
                    objBookk.Budget_Rollup_Tax_Preparer__c= hp.Budget_Rollup_Tax_Preparer__c;
                    objBookk.Budget_Rollup_EA__c = hp.Budget_Rollup_EA__c;
                    objBookk.Budget_Rollup_Attorney__c = hp.Budget_Rollup_Attorney__c;
                    objBookk.EarliestTimeLogged__c= hp.H2S__EarliestTimeLogged__c;
                    objBookk.LastTimeLogged__c = hp.H2S__LastTimeLogged__c;    
                    updateBookkeepingRecords.add(objBookk);
                }
            }
            
            System.debug('_______updateBookkeepingRecords____________'+updateBookkeepingRecords);
            try{
                if(!updateBookkeepingRecords.isEmpty())
                {
                    bookkeepingSetOFBooks.alreadyProcessed=true;
                 update updateBookkeepingRecords;
                }
            }catch(System.DmlException e){
                e.getMessage();
            }
        }
        System.debug('_______listToUpdate____________'+listToUpdate);
        try{
            if(!mapToUpdate.isEmpty()) update mapToUpdate.values();
        }catch(System.DmlException e){
            e.getMessage();
        }
    }//is insert
    
    // for trigger .update  ....
    
    if(trigger.isupdate){
        for(H2S__HarvestProject__c  Hpro : trigger.new){ 
            //all the Harvest project associated account id is getting inserted into set.   
            accountId.add(Hpro.H2S__Account__c); 
            Projectid.add(Hpro.id);
            
        }   
        set<id> listofproject = new set<id> ();        
        List<Tax__c>listOfTax2 = new List<Tax__c>();
        List<Bookkeeping__c>listOfBookkeeping2= new List<Bookkeeping__c>();        
        listOfTax2  =[select id,Name,Client_Name__c,Budget__c  from  Tax__c where Client_Name__c = : accountId];
        system.debug('---listOfTax2 ----'+ listOfTax2);
        listOfBookkeeping2 =[select id,Name,Client_Name__c from  Bookkeeping__c where Client_Name__c = : accountId];
        list<Account> listOfAccoutData =[select id ,Name, (select id, Name,H2S__Account__c,H2S__ProjectCode__c, CreatedDate from H2S__HarvestProjects__r order by CreatedDate desc limit 1) FROM Account where id =: accountId];
        for(Account objAcc : listOfAccoutData){
            for(H2S__HarvestProject__c harvestObj : objAcc.H2S__HarvestProjects__r ){                
                System.debug('======>'+harvestObj.id);
                if(Projectid.contains(harvestObj.id)){
                    listofproject.add(harvestObj.id);            
                }
                // System.debug(accountObj.Name);
                // System.debug(accountObj.id);
                // listNewlyId.add(harvestObj.H2S__Account__c);
            }
        }
        list<H2S__HarvestProject__c> lastCreatedProject =[select id,name,H2S__Budget__c,Budget_Rollup_EA__c,H2S__Account__c,H2S__ProjectCode__c,H2S__ProjectNotes__c,H2S__HarvestProjectID__c,H2S__InvoiceMethod__c,H2S__ProjectInvoicedBy__c,H2S__PercentOfBudgetAlert__c, H2S__TotalProjectFees__c,H2S__TotalProjectHours__c,Package_Hours_Used__c,H2S__ProjectHourlyRate__c,H2S__InvoicedTime__c,H2S__UninvoicedTime__c,H2S__TotalTime__c,Bookkeeper_Time__c,H2S__NoOfEntries__c,Budget_Rollup_Bookkeeper__c ,Budget_Rollup_CPA__c,Budget_Rollup_Tax_Preparer__c ,Budget_Rollup_Attorney__c,H2S__EarliestTimeLogged__c ,H2S__LastTimeLogged__c from H2S__HarvestProject__c where id =: listofproject ] ;
        system.debug('---lastCreatedProject--'+lastCreatedProject);
        
        for(H2S__HarvestProject__c hp: lastCreatedProject){
            for(Tax__c  objTax :listOfTax2   ){
                //if Harvest account is matched with Tax client then record inserted 
                if(objTax.Client_Name__c == hp.H2S__Account__c ){
                    objTax.Budget__c = hp.H2S__Budget__c;
                    objTax.Name__c  = hp.Name;
                    // system.debug('-----name----'+ hp.Name);
                    objTax.ProjectNotes__c = hp.H2S__ProjectNotes__c;
                    objTax.ProjectCode__c = hp.H2S__ProjectCode__c;
                    objTax.HarvestProjectID__c= hp.H2S__HarvestProjectID__c;
                    objTax.InvoiceMethod__c = hp.H2S__InvoiceMethod__c;
                    objTax.ProjectInvoicedBy__c = hp.H2S__ProjectInvoicedBy__c;
                    objTax.PercentOfBudgetAlert__c=  hp.H2S__PercentOfBudgetAlert__c;
                    objTax.TotalProjectFees__c  = hp.H2S__TotalProjectFees__c;
                    objTax.TotalProjectHours__c = hp.H2S__TotalProjectHours__c;
                    objTax.Package_Hours_Used__c= hp.Package_Hours_Used__c;
                    objTax.ProjectHourlyRate__c= hp.H2S__ProjectHourlyRate__c;
                    objTax.InvoicedTime__c = hp.H2S__InvoicedTime__c;
                    objTax.UninvoicedTime__c = hp.H2S__UninvoicedTime__c;
                    objTax.TotalTime__c= hp.H2S__TotalTime__c;
                    objTax.Bookkeeper_Time__c= hp.Bookkeeper_Time__c;
                    objTax.NoOfEntries__c=  hp.H2S__NoOfEntries__c;     
                    objTax.Budget_Rollup_Bookkeeper__c = hp.Budget_Rollup_Bookkeeper__c;
                    objTax.Budget_Rollup_CPA__c= hp.Budget_Rollup_CPA__c;
                    objTax.Budget_Rollup_Tax_Preparer__c= hp.Budget_Rollup_Tax_Preparer__c;
                    objTax.Budget_Rollup_EA__c = hp.Budget_Rollup_EA__c;
                    objTax.Budget_Rollup_Attorney__c = hp.Budget_Rollup_Attorney__c;
                    objTax.EarliestTimeLogged__c= hp.H2S__EarliestTimeLogged__c;
                    objTax.LastTimeLogged__c= hp.H2S__LastTimeLogged__c;
                    mapToUpdate.put(objTax.id,objTax);
                    listToUpdate.add(objTax);
                }
            }
            //Harvest project record is being  copied into Bookkeeping object...
            
            for(Bookkeeping__c  objBookk : listOfBookkeeping2  ){
                //if Harvest account is matched with bookkeeping client then record inserted 
                if(objBookk.Client_Name__c == hp.H2S__Account__c ){
                    objBookk.Budget__c = hp.H2S__Budget__c;   
                    objBookk.Name__c = hp.Name;
                    objBookk.ProjectNotes__c = hp.H2S__ProjectNotes__c;
                    objBookk.InvoiceMethod__c = hp.H2S__InvoiceMethod__c;
                    objBookk.ProjectInvoicedBy__c = hp.H2S__ProjectInvoicedBy__c;
                    objBookk.PercentOfBudgetAlert__c=  hp.H2S__PercentOfBudgetAlert__c;
                    objBookk.TotalProjectFees__c  = hp.H2S__TotalProjectFees__c;
                    objBookk.TotalProjectHours__c = hp.H2S__TotalProjectHours__c;
                    objBookk.Package_Hours_Used__c= hp.Package_Hours_Used__c;
                    objBookk.ProjectHourlyRate__c= hp.H2S__ProjectHourlyRate__c;
                    objBookk.ProjectCode__c = hp.H2S__ProjectCode__c;
                    objBookk.HarvestProjectID__c = hp.H2S__HarvestProjectID__c;
                    objBookk.InvoicedTime__c = hp.H2S__InvoicedTime__c;
                    objBookk.UninvoicedTime__c = hp.H2S__UninvoicedTime__c;
                    objBookk.TotalTime__c = hp.H2S__TotalTime__c;
                    objBookk.Bookkeeper_Time__c = hp.Bookkeeper_Time__c;
                    objBookk.EarliestTimeLogged__c = hp.H2S__EarliestTimeLogged__c;
                    objBookk.NoOfEntries__c =  hp.H2S__NoOfEntries__c;
                    objBookk.Budget_Rollup_Bookkeeper__c = hp.Budget_Rollup_Bookkeeper__c;
                    objBookk.Budget_Rollup_CPA__c= hp.Budget_Rollup_CPA__c;
                    objBookk.Budget_Rollup_Tax_Preparer__c= hp.Budget_Rollup_Tax_Preparer__c;
                    objBookk.Budget_Rollup_EA__c = hp.Budget_Rollup_EA__c;
                    objBookk.Budget_Rollup_Attorney__c = hp.Budget_Rollup_Attorney__c;
                    objBookk.EarliestTimeLogged__c= hp.H2S__EarliestTimeLogged__c;
                    objBookk.LastTimeLogged__c = hp.H2S__LastTimeLogged__c;    
                    updateBookkeepingRecords.add(objBookk);
                }
            }
            System.debug('_______updateBookkeepingRecords____________'+updateBookkeepingRecords);
            try{
                if(!updateBookkeepingRecords.isEmpty())
                {
                     bookkeepingSetOFBooks.alreadyProcessed=true;
                    update updateBookkeepingRecords;
                }
            }catch(System.DmlException e){
                e.getMessage();
            }
        }
        System.debug('_______listToUpdate____________'+listToUpdate);
        try{
            if(!mapToUpdate.isEmpty()) update mapToUpdate.values();     
        }catch(System.DmlException e){
            e.getMessage();
        }
    }
}