({
    fetchAccounts : function( component ) { 
     /*   var actiongetcon = component.get("c.getContacts");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetcon.setParams({
            "accId":accId
        });
        actiongetcon.setCallback(this, function(data) {
            component.set("v.contacts", data.getReturnValue());
        });*/
        
        
        var actiongetClientSales = component.get("c.getClientSales");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetClientSales.setParams({
            "accId":accId
        });
        actiongetClientSales.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                 component.set("v.Salesvalue",rowvalues );  
    }        
        });
           var actiongetClientTaxSalesValue = component.get("c.getTotalValueofTaxSales");
        var accId = component.get("v.recordId");
        var TotalTaxSalesvalueResult=0;
        console.log(accId);
        actiongetClientTaxSalesValue.setParams({
            "accId":accId
        });
        actiongetClientTaxSalesValue.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
          if(rowvalues!=null){
             TotalTaxSalesvalueResult= ' $'+rowvalues;
             component.set("v.TotalTaxSalesvalue",TotalTaxSalesvalueResult ); 
        }else{
             TotalTaxSalesvalueResult= ' $'+0;
             component.set("v.TotalTaxSalesvalue",TotalTaxSalesvalueResult );
        }
                
    }        
        });
         var actiongetClientBKSalesValue = component.get("c.getTotalValueofBKSales");
        var accId = component.get("v.recordId");
        var TotalBkSalesvalueResult=0;
        console.log(accId);
        actiongetClientBKSalesValue.setParams({
            "accId":accId
        });
        actiongetClientBKSalesValue.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
             TotalBkSalesvalueResult= ' $'+rowvalues;
             component.set("v.TotalBkSalesvalue",TotalBkSalesvalueResult ); 
        }else{
             TotalBkSalesvalueResult= ' $'+0;
             component.set("v.TotalBkSalesvalue",TotalBkSalesvalueResult );
        }
               
    }        
        });
         var actiongetClientSalesValue = component.get("c.getTotalValueofSales");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetClientSalesValue.setParams({
            "accId":accId
        });
        actiongetClientSalesValue.setCallback(this, function(data) {
              var state = data.getState()
              var TotalSalesvalueResult=0;
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
             TotalSalesvalueResult= ' $'+rowvalues;
             component.set("v.TotalSalesvalue",TotalSalesvalueResult ); 
        }else{
             TotalSalesvalueResult= ' $'+0;
             component.set("v.TotalSalesvalue",TotalSalesvalueResult );
        }
                 
    }        
        });
         
         var actiongetprimaryContactDetails = component.get("c.getPrimaryContact");
        var PrimarycontactNamev='';
        var PrimaryContactGenderv='';
         var PrimaryContactDOBv='';
         var PrimaryContactagev='';
         var PrimaryContactmaritalstausv='';
        
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetprimaryContactDetails.setParams({
            "accId":accId
        });
        actiongetprimaryContactDetails.setCallback(this, function(data) {
              var state = data.getState();
              var TotalSalesvalueResult=0;
    if (component.isValid() && state === 'SUCCESS') {
                    var rowvalues=   data.getReturnValue();
       
                                  for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              PrimarycontactNamev=rowvalue.Name;
                                  PrimaryContactGenderv=rowvalue.Gender__c;    
                                        PrimaryContactDOBv=rowvalue.Birthdate;
                                      PrimaryContactagev=rowvalue.Age__c;
                                      PrimaryContactmaritalstausv=rowvalue.Legal_Marital_Status__c;
                              
                   
            			}
                 component.set("v.PrimaryContactName",PrimarycontactNamev ); 
           component.set("v.PrimaryContactGender",PrimaryContactGenderv ); 
            component.set("v.PrimaryContactDOB",PrimaryContactDOBv ); 
           component.set("v.PrimaryContactage",PrimaryContactagev ); 
            component.set("v.PrimaryContactmaritalstaus",PrimaryContactmaritalstausv );     
    }        
        });
          var actiongetprimaryContactspouseDetails = component.get("c.getPrimaryContactspouse");
        var PrimaryContactSpouseNamev='';
        var PrimaryContactSpouseGenderv='';
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetprimaryContactspouseDetails.setParams({
            "accId":accId
        });
        actiongetprimaryContactspouseDetails.setCallback(this, function(data) {
              var state = data.getState();
             
    if (component.isValid() && state === 'SUCCESS') {
                    var rowvalues=   data.getReturnValue();
       
                                  for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              PrimaryContactSpouseNamev=rowvalue.Name;
                                    
                                  PrimaryContactSpouseGenderv=rowvalue.Gender__c;    
                               
                   
            			}
                 component.set("v.PrimaryContactSpouseName",PrimaryContactSpouseNamev ); 
           component.set("v.PrimaryContactSpouseGender",PrimaryContactSpouseGenderv ); 
                 
    }        
        });
                  var actiongetprojects = component.get("c.getProjectsNotArchived");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetprojects.setParams({
            "accId":accId
        });
        actiongetprojects.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                         
  var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.TaxProjectsRecords",rowvalues );  
    }
          
        });
              var actiongetTaxClosedSales = component.get("c.getTaxSalesRecord");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetTaxClosedSales.setParams({
            "accId":accId
        });
        actiongetTaxClosedSales.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                         
  var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.RecordType){
                               rowvalue.SaleType = rowvalue.RecordType.Name;   
                              }
                               if(rowvalue.Entity__c){
                                   rowvalue.EntiyName = rowvalue.Entity__r.Name; 
                              }
                             if(rowvalue.Sales_Rep__c){
                                   rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name; 
                              }
                              
                                     if(rowvalue.OwnerId){
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                             
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.TaxSalesRecords",rowvalues );  
    }
          
        });
             
          var actiongetRefund = component.get("c.getRefundRecord");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetRefund.setParams({
            "accId":accId
        });
        actiongetRefund.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.OwnerId){
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                                  if(rowvalue.Sale__c){
                               rowvalue.Sale = rowvalue.Sale__r.Name;   
                              }
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.RefundsRecords",rowvalues );  
    }        
        });
        
   
           
          var actiongetAdvisorCallTask = component.get("c.getAdvisorcalltasks");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetAdvisorCallTask.setParams({
            "accId":accId
        });
        actiongetAdvisorCallTask.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                               
                               rowvalue.linkName = '/'+rowvalue.Id;
                               if(rowvalue.OwnerId){
                               rowvalue.owner = rowvalue.Owner.Name;   
                              }
                   
            			}
                 component.set("v.AdvisorscallTaskRecords",rowvalues );  
    }        
        });
        
          var actiongetSeviceCallTask = component.get("c.getServicecalltasks");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetSeviceCallTask.setParams({
            "accId":accId
        });
        actiongetSeviceCallTask.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                            
                               
                               rowvalue.linkName = '/'+rowvalue.Id;
                               if(rowvalue.OwnerId){
                               rowvalue.owner = rowvalue.Owner.Name;
                              }
                   
            			}
                 component.set("v.ServicecallTaskRecords",rowvalues );  
    }        
        });
  
          var actiongetPlatinumSaleRecords = component.get("c.getsalePlatinumSalesRecord");

        
        console.log(accId);
        actiongetPlatinumSaleRecords.setParams({
            "accId":accId
        });
        actiongetPlatinumSaleRecords.setCallback(this, function(data) {
                           var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.RecordType){
                               rowvalue.SaleType = rowvalue.RecordType.Name;   
                              }
                              if(rowvalue.Entity__c){
                                   rowvalue.EntiyName = rowvalue.Entity__r.Name; 
                              }
                               
                             if(rowvalue.Sales_Rep__c){
                                   rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name; 
                              }
                            
                                       if(rowvalue.OwnerId){
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                            
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.PlatinumSaleRecords",rowvalues );  
    }        
        });
        
         var actiongetRenewalSaleRecords = component.get("c.getRenewalSalesRecord");

        
        console.log(accId);
        actiongetRenewalSaleRecords.setParams({
            "accId":accId
        });
        actiongetRenewalSaleRecords.setCallback(this, function(data) {
                           var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.RecordType){
                               rowvalue.SaleType = rowvalue.RecordType.Name;   
                              }
                               if(rowvalue.Entity__c){
                                   rowvalue.EntiyName = rowvalue.Entity__r.Name; 
                              }
                               
                            if(rowvalue.Sales_Rep__c){
                                   rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name; 
                              }
                             
                                      if(rowvalue.OwnerId){
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                             
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.SalesDueNext30DaysRecords",rowvalues );  
    }        
        });
                 var actiongetFillingFeeSaleRecords = component.get("c.getsaleFillingFeeSalesRecord");

        
        console.log(accId);
        actiongetFillingFeeSaleRecords.setParams({
            "accId":accId
        });
        actiongetFillingFeeSaleRecords.setCallback(this, function(data) {
                           var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.RecordType){
                               rowvalue.SaleType = rowvalue.RecordType.Name;   
                              }
                               if(rowvalue.Entity__c){
                                   rowvalue.EntiyName = rowvalue.Entity__r.Name; 
                              }
                               
                             if(rowvalue.Sales_Rep__c){
                                   rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name; 
                              }
                             
                                       if(rowvalue.OwnerId){
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                            
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.FillingFeesSaleRecords",rowvalues );  
    }        
        });
         var actiongetEfSaleRecords = component.get("c.getEFSalesRecord");

        
       
        actiongetEfSaleRecords.setParams({
            "accId":accId
        });
        actiongetEfSaleRecords.setCallback(this, function(data) {
                           var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.RecordType){
                               rowvalue.SaleType = rowvalue.RecordType.Name;   
                              }
                               if(rowvalue.Entity__c){
                                   rowvalue.EntiyName = rowvalue.Entity__r.Name; 
                              }
                               
                               if(rowvalue.Sales_Rep__c){
                                   rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name; 
                              }
                              
                                     if(rowvalue.OwnerId){
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                           
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.EntityFormationSalesRecords",rowvalues );  
    }        
        });
        var actiongettaxreturnEntities = component.get("c.getEntitieswithTaxreturn");
         actiongettaxreturnEntities.setParams({
            "accId":accId
        });
        actiongettaxreturnEntities.setCallback(this, function(data) {
                           var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.Disregarded_To_Personal__c){
                               rowvalue.client = rowvalue.Disregarded_To_Personal__r.Name;   
                              }
                               if(rowvalue.Disregarded_To__c){
                               rowvalue.Entity = rowvalue.Disregarded_To__r.Name;   
                              }
                              
                               rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
         component.set("v.EntityTaxRecords",rowvalues );  
        
     /* var pageSize = component.get("v.pageSize");
        actiongettaxreturnEntities.setParams({
            "accId":accId
        });
        actiongettaxreturnEntities.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                    var rowvalues=   data.getReturnValue();
        for (var i = 0; i < rowvalues.length; i++) {
            if(rowvalues[i]!=null){
            component.set("v.EntitiesTaxReturnList", rowvalues);        
            }
        	
        }
        
             

component.set("v.totalSize", component.get("v.EntitiesTaxReturnList").length);
        var totalsize=component.get("v.totalSize");
        
      

component.set("v.start",0);

component.set("v.end",pageSize-1);

var paginationList = [];

for(var i=0; i< pageSize; i++)

{
    if(rowvalues[i]!=null){
		paginationList.push(rowvalues[i]);        
    }


}
  component.set("v.EntitiesTaxReturnPagiList",paginationList ); */


                        
             
    }        
         
        });
          var actiongetsetofbooks = component.get("c.getsetofbooks");
        
      
        actiongetsetofbooks.setParams({
            "accId":accId
        });
        actiongetsetofbooks.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                            

                              
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.setofbooksRecords",rowvalues );  
    }        
         
        });
        var actiongetSSQ = component.get("c.getsetSSQ");
        
      
        actiongetSSQ.setParams({
            "accId":accId
        });
        actiongetSSQ.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                            

                          
                   
            			}
                 component.set("v.SSQTableRecords",rowvalues );  
    }        
         
        });
        var userlisencecheck= component.get("v.UserhasEventsLisence"); 
          var actioncheckforlisence = component.get("c.CheckEvetLisence");
        
       var userId = $A.get("$SObjectType.CurrentUser.Id");
       
        actioncheckforlisence.setParams({
         
            "currentUserId":userId
        });
        actioncheckforlisence.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
           
        	 component.set("v.UserhasEventsLisence",rowvalues ); 
             userlisencecheck= component.get("v.UserhasEventsLisence"); 
 
      
           
               
        }
                       
      
    }
    
         
        });
       
       
         $A.enqueueAction(actioncheckforlisence);  
       
      
            var actioncomplainCase = component.get("c.getfeedback");
        
      
        actioncomplainCase.setParams({
            "accId":accId
        });
        actioncomplainCase.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.NPS_Rating__c){
                                  rowvalue.NPSRating=rowvalue.NPS_Rating__c;
                              }
                                 if(rowvalue.Status__c){
                                  rowvalue.Status=rowvalue.Status__c;
                              }
                              
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.FeedbackRecords",rowvalues );  
    }        
         
        });
         var actionEntityNamePicklist = component.get("c.getEntitieswithTaxNamePicklict");
       // var inputEntity = component.find("EntityList");
         actionEntityNamePicklist.setParams({
            "accId":accId
        });
        actionEntityNamePicklist.setCallback(this, function(data) {
           
        var state = data.getState();
            if (state === "SUCCESS"){
                component.set("v.EnnameList", data.getReturnValue());
            }
           
             
        });
          var actionNoteTypePicklist = component.get("c.getNotesTypepicklist");
       // var inputEntity = component.find("EntityList");
     
        actionNoteTypePicklist.setCallback(this, function(data) {
           
        var state = data.getState();
            if (state === "SUCCESS"){
                 var result = data.getReturnValue();
               
                var NotesTypeMap = [];
                for(var key in result){
                    NotesTypeMap.push({key: key, value: result[key]});
                      
                }
                component.set("v.NotesTypeList", NotesTypeMap);
            }
           
             
        });
         var actiongetNotes = component.get("c.getNotes");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetNotes.setParams({
            "accId":accId
        });
        actiongetNotes.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                              if(rowvalue.Notes__c){
                                    var regex = /(<([^>]+)>)/ig;
                                 var quotesdouble=/(&quot\;)/g;
                                  var anpop=/(&amp\;)/g;
                                  var quotesingle=/(&#39\;)/g;
                                  var enteredNotes=rowvalue.Notes__c;
                                 
                                   var ModifiedNote=enteredNotes.replace(regex, ' ');
                                  
                                  var Notesquotes=ModifiedNote.replace(quotesdouble,'"');
                                   var Notesandd=Notesquotes.replace(anpop,'&');
                                  var Notessingle=Notesquotes.replace(quotesingle,'\'');
                             
                                   rowvalue.Notes__c=Notessingle;
                              }
                              if(rowvalue.CreatedDate){
                                  var cDate=rowvalue.CreatedDate;
                                  rowvalue.Created=$A.localizationService.formatDate(cDate, "MMMM dd yyyy, hh:mm:ss a")
                              }
                             
                              if(rowvalue.CreatedBy.Name){
                                    rowvalue.CreatedBy=rowvalue.CreatedBy.Name;
                              }
                                
                                  
                              
                            
                            
                   
            			}
                 component.set("v.NotesRecords",rowvalues );  
    }        
        });
        
    var actionbluprintimageurl = component.get('c.getLucidChartUrl');
        actionbluprintimageurl.setParams({
            "accId":accId
        });
  actionbluprintimageurl.setCallback(this, function (response) {
    var state = response.getState()
    if (component.isValid() && state === 'SUCCESS') {
      var result = response.getReturnValue()
      component.set('v.blueprintimageUrl', result)
     
    }
  });
    var actiongetcontactwithEvents = component.get("c.getEventsAttended");
        
      
        actiongetcontactwithEvents.setParams({
            "accId":accId
        });
        actiongetcontactwithEvents.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                            

                              
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.ContactwithEventRecords",rowvalues );  
    }        
         
        });
  
   
        $A.enqueueAction(actionEntityNamePicklist); 
   
        $A.enqueueAction(actiongetPlatinumSaleRecords);  
         $A.enqueueAction(actiongetFillingFeeSaleRecords);  
       
         $A.enqueueAction(actiongetprojects);  
         $A.enqueueAction(actiongetTaxClosedSales); 
        
       
        $A.enqueueAction(actiongetRenewalSaleRecords); 
         $A.enqueueAction(actiongetEfSaleRecords);
         $A.enqueueAction(actiongetRefund);
         $A.enqueueAction(actiongetClientSales);
          $A.enqueueAction(actiongetClientTaxSalesValue);
          $A.enqueueAction(actiongetprimaryContactDetails);
         $A.enqueueAction(actiongetprimaryContactspouseDetails);
         $A.enqueueAction(actiongetAdvisorCallTask);
         $A.enqueueAction(actiongetSeviceCallTask);
      $A.enqueueAction(actiongettaxreturnEntities);
        $A.enqueueAction(actiongetClientBKSalesValue);
       $A.enqueueAction(actiongetClientSalesValue); 
         $A.enqueueAction(actiongetsetofbooks);  
         $A.enqueueAction(actiongetSSQ);  
        
         $A.enqueueAction(actioncomplainCase); 
        $A.enqueueAction(actionNoteTypePicklist); 
          $A.enqueueAction(actiongetNotes); 
        $A.enqueueAction(actionbluprintimageurl);    
          $A.enqueueAction(actiongetcontactwithEvents);    
    
    },  
    toastMsg : function( strType, strMessage ) {  
        
        var showToast = $A.get( "e.force:showToast" );   
        showToast.setParams({   
            
            message : strMessage,  
            type : strType,  
            mode : 'sticky'  
            
        });   
        showToast.fire();   
        
    }  
})