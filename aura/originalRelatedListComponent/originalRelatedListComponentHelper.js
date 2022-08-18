({
    
    getContactData: function(component, helper) {
        //this.showSpinner(component);
       
       var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'contact' });
        action.setCallback(this, function(response) {
           component.set("v.contacticonName", response.getReturnValue() );
        });
        $A.enqueueAction(action);
        
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   

        var actionContactData = component.get("c.getCOntactData");
         var pageSize = component.get("v.pageSizecontact").toString();
        var pageNumber = component.get("v.pageNumbercontact").toString();
        actionContactData.setParams({
            
        "objectType" :  'contact',
            "pageSize":pageSize,
                      "pageNumber":pageNumber,
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actionContactData.setCallback(this, function(response) {
             var lastpage= component.get("v.isLastPagecontact").toString();
            var state = response.getState();
            if (state === "SUCCESS") {
                           var actioncountcontactData = component.get("c.getcountcontact");
         var lastpage= component.get("v.isLastPagecontact").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountcontactData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountcontactData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
                       
               
                    component.set("v.contactTotal", result);
          var contacttotal=component.get("v.contactTotal");
                
             
                 if(contacttotal==5){
                       component.set("v.isLastPagecontact", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountcontactData);
               var result=   response.getReturnValue();
      
                          for (var i = 0; i <  result.length; i++) {
                			var rowvalue = result[i];
                                var Baseurl= rowvalue.Account.Base_Url__c;
                                 rowvalue.linkName =Baseurl+'s/contact/'+rowvalue.Id;
                          }
              
                    if( result.length < component.get("v.pageSizecontact")  ){
                    component.set("v.isLastPagecontact", true);
                } else{
                    component.set("v.isLastPagecontact", false);
              
  
                }
                              
               
                component.set("v.dataSizecontact",  result.length);
               
                component.set("v.Contactdata", result);
              
              
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(actionContactData);
    },
     getSalesData: function(component, helper) {
        //this.showSpinner(component);
      
            var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'opportunity' });
        action.setCallback(this, function(response) {
           component.set("v.SalesiconName", response.getReturnValue() );
        });
        $A.enqueueAction(action);
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   var salestotal=component.get("v.SalesTotal");
        var pageSizesale = component.get("v.pageSizeSale").toString();
        var pageNumbersale = component.get("v.pageNumberSale").toString();
    var lastpage= component.get("v.isLastPageSale");
        var actionSalesData = component.get("c.getSalesData");
        actionSalesData.setParams({
     
                        "objectType" :  'opportunity',
                         "pageSizeSale":pageSizesale,
                       "pageNumberSale":pageNumbersale,
  					  "ParentRecordID": parentRecordId
        });
        actionSalesData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                  var actioncountSaleData = component.get("c.getcountsale");
         var lastpage= component.get("v.isLastPageSale").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountSaleData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountSaleData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
                   
               
                    component.set("v.SalesTotal", result);
          var salestotal=component.get("v.SalesTotal");
                
           
                 if(salestotal==5){
                       component.set("v.isLastPageSale", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountSaleData);
               var result=   response.getReturnValue();
    
                
              for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                               rowvalue.RecordType = rowvalue.RecordType.Name; 
                  
                                     if(rowvalue.OwnerId){
                                        
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              } 
                          
               			 if(rowvalue.Sales_Rep__c!=null && rowvalue.Sales_Rep__c!=''){
                                  rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name;  
                              }
                 		if(rowvalue.Entity__c!=null && rowvalue.Entity__c!=''  ){
                                  rowvalue.Entity = rowvalue.Entity__r.Name;  
                              }
 						          var Baseurl= rowvalue.Account.Base_Url__c;            
                              rowvalue.linkName = Baseurl+'s/opportunity/'+rowvalue.Id;
                      
            			}
           
               
              
                       if( result.length < component.get("v.pageSizeSale")){
                    component.set("v.isLastPageSale", true);
                } else{
                    component.set("v.isLastPageSale", false);
                }  
                
                 
                
            
                 
                
                component.set("v.dataSizeSale",  result.length);
                   component.set("v.Salesdata", result);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        
    
        $A.enqueueAction(actionSalesData);
    },
    getEntityData: function(component, helper) {
        //this.showSpinner(component);
         var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Entities__c' });
        action.setCallback(this, function(response) {
           component.set("v.EntitiesiconName", response.getReturnValue() );
        });
        $A.enqueueAction(action);    
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
       var pageSize = component.get("v.pageSizeEntity").toString();
        var pageNumber = component.get("v.pageNumberEntity").toString();
  
        var actionEntityData = component.get("c.getEntityData");
        actionEntityData.setParams({
         
                        "objectType" :  'Entities__c',
                      "pageSize":pageSize,
                        "pageNumber":pageNumber,
 				   "ParentRecordID": parentRecordId
        
        });
        actionEntityData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                  var actioncountEnData = component.get("c.getcountEntity");
         var lastpage= component.get("v.isLastPageEntity").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountEnData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountEnData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.EnTotal", result);
          var EnTotal=component.get("v.EnTotal");
                
        
                 if(EnTotal==5){
                       component.set("v.isLastPageEntity", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountEnData);
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                             
                         
                                       if(rowvalue.DisregardedTo){
                                        
                               rowvalue.DisregardedTo = rowvalueDisregarded_To__r.Name;   
                              }
                                var Baseurl= rowvalue.Primary_Client__r.Base_Url__c ;     
                               rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;

            			}
                component.set("v.Entitiesdata", result);
                if( result.length < component.get("v.pageSizeEntity")){
                    component.set("v.isLastPageEntity", true);
                } else{
                    component.set("v.isLastPageEntity", false);
                }
               
                component.set("v.dataSizeEntity",  result.length);
               
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionEntityData);
    },
getCaseData: function(component, helper) {
        //this.showSpinner(component);

            var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Case' });
        action.setCallback(this, function(response) {
           component.set("v.caseiconName", response.getReturnValue() );
        });
        $A.enqueueAction(action);      
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizecase").toString();
        var pageNumber = component.get("v.pageNumbercase").toString();
  
        var actionCaseData = component.get("c.getCaseData");
        actionCaseData.setParams({
                                    "objectType" :  'Case',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
        actionCaseData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                        var actioncountcaseData = component.get("c.getcountcase");
         var lastpage= component.get("v.isLastPagecase").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountcaseData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountcaseData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.caseTotal", result);
          var caseTotal=component.get("v.caseTotal");
          
                 if(caseTotal==5){
                       component.set("v.isLastPagecase", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountcaseData);
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                                  
                              if( rowvalue.CaseType){
                              
                               rowvalue.CaseType = rowvalue.RecordType.Name;   
                              }
                             if(rowvalue.OwnerId){
                                        
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                              var Baseurl= rowvalue.Account.Base_Url__c;
                               rowvalue.linkName =Baseurl+ 's/case/'+rowvalue.Id;

            			}
                component.set("v.Casedata", result);
                
   if( result.length < component.get("v.pageSizecase")){
                    component.set("v.isLastPagecase", true);
                } else{
                    component.set("v.isLastPagecase", false);
                }
                   component.set("v.dataSizecase",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionCaseData);
    },
getTrustData: function(component, helper) {
        //this.showSpinner(component);
       var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Trust__c' });
        action.setCallback(this, function(response) {
            var icon= component.get("v.TrusticonName");
           
           component.set("v.TrusticonName", response.getReturnValue() );
        });
        $A.enqueueAction(action);  
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeTrust").toString();
        var pageNumber = component.get("v.pageNumberTrust").toString();
  
        var actionTrustData = component.get("c.getTrustDataResult");
        actionTrustData.setParams({
                                    "objectType" :  'Trust__c',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
        actionTrustData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountTrustData = component.get("c.getcountTrust");
         var lastpage= component.get("v.isLastPageTrust").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountTrustData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountTrustData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.TrustTotal", result);
          var TrustTotal=component.get("v.TrustTotal");
          
                 if(TrustTotal==5){
                       component.set("v.isLastPageTrust", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountTrustData);
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                                  
                                                      
                              var Baseurl= rowvalue.Primary_Client__r.Base_Url__c;
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;

            			}
                component.set("v.Trustdata", result);
                
   if( result.length < component.get("v.pageSizeTrust")){
                    component.set("v.isLastPageTrust", true);
                } else{
                    component.set("v.isLastPageTrust", false);
                }
                   component.set("v.dataSizeTrust",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionTrustData);
    },
    getRefundsData: function(component, helper) {
        //this.showSpinner(component);
       var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Refund__c' });
        action.setCallback(this, function(response) {
           component.set("v.RefundiconName", response.getReturnValue() );
        });
        $A.enqueueAction(action);  
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeREfunds").toString();
        var pageNumber = component.get("v.pageNumberREfunds").toString();
  
        var actionRefundData = component.get("c.getRefundData");
        actionRefundData.setParams({
                                    "objectType" :  'Refund__c',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
        actionRefundData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountRefundData = component.get("c.getcountRefund");
         var lastpage= component.get("v.isLastPageREfunds").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountRefundData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountRefundData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.REfundsTotal", result);
          var RefundTotal=component.get("v.REfundsTotal");
          
                 if(RefundTotal==5){
                       component.set("v.isLastPageREfunds", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountRefundData);
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                               
                			var rowvalue = result[i];
                                  
                              if( rowvalue.status){
                                  rowvalue.status=rowvalue.Status__c;
                              }  
                               if( rowvalue.SaleName){
                                  rowvalue.SaleName=rowvalue.Sale__r.Name;
                              }   
                                 if(rowvalue.OwnerId){
                                        
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                              var Baseurl= rowvalue.Client__r.Base_Url__c;
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;

            			}
                component.set("v.REfundsdata", result);
                
   if( result.length < component.get("v.pageSizeREfunds")){
                    component.set("v.isLastPageREfunds", true);
                } else{
                    component.set("v.isLastPageREfunds", false);
                }
                   component.set("v.dataSizeREfunds",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionRefundData);
    },
    
      getccDetailData: function(component, helper) {
        //this.showSpinner(component);
       var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Credit_Card_Detail__c' });
        action.setCallback(this, function(response) {
             var icon= component.get("v.CCdetailiconName");
           
           component.set("v.CCdetailiconName", response.getReturnValue() );
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeccDetail").toString();
        var pageNumber = component.get("v.pageNumberccDetail").toString();
  
        var actionccDetailData = component.get("c.getccDetailsData");
        actionccDetailData.setParams({
                                    "objectType" :  'Credit_Card_Detail__c',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
        actionccDetailData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountccDetailData = component.get("c.getcountCCd");
         var lastpage= component.get("v.isLastPageccDetail").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountccDetailData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountccDetailData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.ccDetailTotal", result);
          var ccDetail=component.get("v.ccDetailTotal");
          
                 if(ccDetail==5){
                       component.set("v.isLastPageccDetail", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountccDetailData);
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                               
                		 var cardNumber= rowvalue.Card_Number__c;
                    rowvalue.Card_Number__c =cardNumber.replace(/\d(?=\d{4})/g, "*");
                          
						var Baseurl= rowvalue.Account__r.Base_Url__c;
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;

            			}
                component.set("v.ccDetaildata", result);
                
   if( result.length < component.get("v.pageSizeccDetail")){
                    component.set("v.isLastPageccDetail", true);
                } else{
                    component.set("v.isLastPageccDetail", false);
                }
                   component.set("v.dataSizeccDetail",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionccDetailData);
    },
      getBookRData: function(component, helper) {
        //this.showSpinner(component);
             var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Task' });
        action.setCallback(this, function(response) {
           component.set("v.ActivitiesiconName", response.getReturnValue() );
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeBookkeeping").toString();
        var pageNumber = component.get("v.pageNumberBookkeeping").toString();
  
        var actionBKData = component.get("c.getActivityData");
        actionBKData.setParams({
                                    "objectType" :  'Task',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
        actionBKData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountBkData = component.get("c.getcounttaskd");
         var lastpage= component.get("v.isLastPageBookkeeping").toString();
         var parentRecordId = component.get("v.recordId");
        actioncountBkData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountBkData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.BookkeepingrecordsTotal", result);
          var ccDetail=component.get("v.BookkeepingrecordsTotal");
          
                 if(ccDetail==5){
                       component.set("v.isLastPageBookkeeping", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountBkData);
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                              
                			var rowvalue = result[i];
                               
                			var Baseurl= rowvalue.Client__r.Base_Url__c;
                    
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;

            			}
                component.set("v.Bookkeepingdata", result);
                
   if( result.length < component.get("v.pageSizeBookkeeping")){
                    component.set("v.isLastPageBookkeeping", true);
                } else{
                    component.set("v.isLastPageBookkeeping", false);
                }
                   component.set("v.dataSizeBookkeeping",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionBKData);
    },
      getassignmentInnData: function(component, helper) {
        //this.showSpinner(component);
             var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Assignment_of_Interest__c' });
        action.setCallback(this, function(response) {
           component.set("v.AssIntresticonName", response.getReturnValue() );
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeAssIntrest").toString();
        var pageNumber = component.get("v.pageNumberAssIntrest").toString();
  
        var actionassignmentInnData = component.get("c.getAssIntrestData");
        actionassignmentInnData.setParams({
                                    "objectType" :  'Assignment_of_Interest__c',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
         
        actionassignmentInnData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountAIData = component.get("c.getcountAssIntd");
         var lastpage= component.get("v.isLastPageAssIntrest").toString();
         var parentRecordId = component.get("v.recordId");
              
        actioncountAIData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountAIData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.AssIntrestTotal", result);
                
          var ccDetail=component.get("v.AssIntrestTotal");
          
                 if(ccDetail==5){
                       component.set("v.isLastPageAssIntrest", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountAIData);
               
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                             
                			var rowvalue = result[i];
                          var Baseurl= rowvalue.Account__r.Base_Url__c;
                               rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;

            			}
                component.set("v.AssIntrestdata", result);
                
   if( result.length < component.get("v.pageSizeAssIntrest")){
                    component.set("v.isLastPageAssIntrest", true);
                } else{ 
                    
                    component.set("v.isLastPageAssIntrest", false);
                }
                   component.set("v.dataSizeAssIntrest",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionassignmentInnData);
    },
     getMeetingMinData: function(component, helper) {
        //this.showSpinner(component);
             var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Meeting_Minutes__c' });
        action.setCallback(this, function(response) {
           component.set("v.MeetingMiniconName", response.getReturnValue() );
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeMeetingMin").toString();
        var pageNumber = component.get("v.pageNumberMeetingMin").toString();
  
        var actionMeetingMinData = component.get("c.getMeetingMinData");
        actionMeetingMinData.setParams({
                                    "objectType" :  'Meeting_Minutes__c',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
         
        actionMeetingMinData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountMmData = component.get("c.getcountMeetingMind");
         var lastpage= component.get("v.isLastPageMeetingMin").toString();
         var parentRecordId = component.get("v.recordId");
              
        actioncountMmData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
        actioncountMmData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.MeetingMinTotal", result);
                
          var ccDetail=component.get("v.MeetingMinTotal");
          
                 if(ccDetail==5){
                       component.set("v.isLastPageMeetingMin", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
       
        $A.enqueueAction(actioncountMmData);
               
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                            
                		
                         var Baseurl= rowvalue. Client__r.Base_Url__c;
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;

            			}
                component.set("v.MeetingMindata", result);
                
   if( result.length < component.get("v.pageSizeMeetingMin")){
                    component.set("v.isLastPageMeetingMin", true);
                } else{ 
                    
                    component.set("v.isLastPageMeetingMin", false);
                }
                   component.set("v.dataSizeMeetingMin",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionMeetingMinData);
    },
    getOrderData: function(component, helper) {
        //this.showSpinner(component);
       
             var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Order' });
        action.setCallback(this, function(response) {
           component.set("v.OrdericonName", response.getReturnValue() );
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
   
        var pageSize = component.get("v.pageSizeOrder").toString();
        var pageNumber = component.get("v.pageNumberOrder").toString();
   
        var actionOrderData = component.get("c.getorderData");
        actionOrderData.setParams({
                                    "objectType" :  'Order',
				   "pageSize":pageSize,
                        "pageNumber":pageNumber,
 
          	"ParentRecordID": parentRecordId
        });
         
        actionOrderData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            var actioncountOData = component.get("c.getcountorderd");
         var lastpage= component.get("v.isLastPageOrder").toString();
         var parentRecordId = component.get("v.recordId");
              
        actioncountOData.setParams({
            
      
                   "ParentRecordID": parentRecordId
                
                
           
        });
                
        actioncountOData.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
               var result=   response.getReturnValue();
      
               
                    component.set("v.OrderTotal", result);
                
          var ccDetail=component.get("v.OrderTotal");
        
                 if(ccDetail==5){
                       component.set("v.isLastPageOrder", true);
                }
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         
        $A.enqueueAction(actioncountOData);
               
               var result=   response.getReturnValue();
    
                          for (var i = 0; i < result.length; i++) {
                			var rowvalue = result[i];
                              
                			var rowvalue = result[i];
                          var Baseurl= rowvalue.Account.Base_Url__c;
                               rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;

            			}
                
                component.set("v.Orderdata", result);
                
   if( result.length < component.get("v.pageSizeOrder")){
                    component.set("v.isLastPageOrder", true);
                } else{ 
                    
                    component.set("v.isLastPageOrder", false);
                }
                   component.set("v.dataSizeOrder",  result.length);
              //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
         $A.enqueueAction(actionOrderData);
    },
    /*delete: function (component, page, recordId) {
       // this.showSpinner(component);
        var recordToDisplay = component.get("v.tableSize");
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        var parentField = component.get("v.parentFieldName");
        var action = component.get("c.deleteRecord");
        action.setParams({
            infoJSON : JSON.stringify({
                "pageNumber": page,
                "recordToDisplay": recordToDisplay,
                "objectType" : 'account',
                "parentRecordId": parentRecordId,
                "parentField": parentField,
                "recordId": recordId
            })
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.Contactdata", result.data);
                component.set("v.page", result.page);
                component.set("v.total", result.total);
                component.set("v.pages", Math.ceil(result.total / recordToDisplay));
              //  this.hideSpinner(component);
                this.showToast(component, 'success', 'Object was deleted.');
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(action);
    },*/

    sortData: function (component, fieldName, sortDirection) {
      //  this.showSpinner(component);
        var data = component.get("v.Contactdata");
        var reverse = sortDirection !== 'asc';
        data.sort(this.sortBy(fieldName, reverse));
        component.set("v.Contactdata", data);
     //   this.hideSpinner(component);
    },

    sortBy: function (field, reverse, primer) {
        var key = primer ?
            function(x) {return primer(x[field])} :
            function(x) {return x[field]};
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    },

    showSpinner: function (component) {
        var spinner = component.find("spinner");
        $A.util.removeClass(spinner, "slds-hide");
    },

    hideSpinner: function (component) {
        var spinner = component.find("spinner");
        $A.util.addClass(spinner, "slds-hide");
    },

    showToast : function(component, type, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Related List Message',
            message: message,
            duration:' 3000',
            key: 'info_alt',
            type: type,
            mode: 'pester'
        });
        toastEvent.fire();
    },

    handleResponseError: function (component,helper, errors) {
        if (errors) {
            if (errors[0] && errors[0].message) {
                this.showToast(component, 'error', "Error message: " +
                    errors[0].message);
            }
        } else {
            this.showToast(component, 'error', 'Unknown error.');
        }
      //  this.hideSpinner(component);
    }
})