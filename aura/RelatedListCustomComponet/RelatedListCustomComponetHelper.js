({
    
   getContactData: function(component, helper) {
        //this.showSpinner(component);
       
       var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'contact' });
        action.setCallback(this, function(response) {
           component.set("v.contacticonName",response.getReturnValue()); 
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
    getSalesData:function(component, helper) {
        //this.showSpinner(component);
        
        var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'opportunity' });
        action.setCallback(this, function(response) {
           var icon=response.getReturnValue();
            if(icon==="null"){
            component.set("v.SalesiconName", "standard:avatar");
                }
            else{
                component.set("v.SalesiconName", response.getReturnValue());
            }                
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
                        console.log('owner=='+rowvalue.Owner);
                      	rowvalue.OwnerId = rowvalue.Owner.Name;
                        rowvalue.Owner = rowvalue.Owner.Name;
                        console.log('rowvalue.OwnerId=='+rowvalue.OwnerId);
                    } 
                    
                    if(rowvalue.Sales_Rep__c!=null && rowvalue.Sales_Rep__c!=''){
                        rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name;  
                    }
                    if(rowvalue.Entity__c!=null && rowvalue.Entity__c!=''){
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
            var icon=response.getReturnValue();
            if(icon ==="null"){
            component.set("v.EntitiesiconName", "standard:avatar");
                }
            else{
                component.set("v.EntitiesiconName", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);    
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        
        var pageSize = component.get("v.pageSizeEntity").toString();
        var pageNumber = component.get("v.pageNumberEntity").toString();
        
        var actionEntityData = component.get("c.getEntityData");
        console.log('actionEntityData=='+actionEntityData);
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
                    console.log('#rowvalue#'+rowvalue.Disregarded_To__c);
                    if(rowvalue.Disregarded_To__c){
                        console.log('111')
                        rowvalue.Disregarded_To__c = rowvalue.Disregarded_To__r.Name;
                        console.log('2222');
                    }
                    
                    var Baseurl= rowvalue.Primary_Client__r.Base_Url__c ;     
                               rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;
                    console.log('baseUrl==='+Baseurl);
                    
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
            var icon=response.getReturnValue();
            if(icon ==="null"){
            component.set("v.caseiconName", "standard:avatar");
                }
            else{
                component.set("v.caseiconName", response.getReturnValue());
            } 
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
                    
                    if( rowvalue.RecordType){
                        console.log('rowvalue.RecordType.Name=='+rowvalue.RecordType.Name);
                        rowvalue.CaseType = rowvalue.RecordType.Name;
                        console.log('CaseType=='+rowvalue.CaseType);
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
            var icon=response.getReturnValue();
            if(icon ==="null"){
            component.set("v.TrusticonName", "standard:avatar");
                }
            else{
                component.set("v.TrusticonName", response.getReturnValue());
            } 
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
            var icon=response.getReturnValue();            
            if(icon ==="null"){
            component.set("v.RefundiconName", "standard:avatar");
                }
            else{
                component.set("v.RefundiconName", response.getReturnValue());
            }  
            
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
            var icon1=response.getReturnValue();
            if(icon1 == "null"){
            component.set("v.CCdetailiconName", "standard:avatar");
                }
            else{
                component.set("v.CCdetailiconName", response.getReturnValue());
            }  
            
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
                    if (state ==="SUCCESS") {
                        var result=response.getReturnValue();
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
                var result=response.getReturnValue();
                for (var i = 0; i < result.length; i++) {
                    var rowvalue = result[i];
                    var cardNumber= rowvalue.Card_Number__c;
                    if(cardNumber){
                        rowvalue.Card_Number__c =cardNumber.replace(/\d(?=\d{4})/g, "*");
                    }
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
            var icon=response.getReturnValue();            
            if(icon == null){
                component.set("v.ActivitiesiconName", "standard:avatar");
                }
            else{
                component.set("v.ActivitiesiconName", response.getReturnValue());
            } 
            
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        
        var pageSize = component.get("v.pageSizeBookkeeping").toString();
        var pageNumber = component.get("v.pageNumberBookkeeping").toString();
        
        var actionBKData = component.get("c.getActivityData");
        actionBKData.setParams({
            "objectType" :'Task',
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
            var icon=response.getReturnValue();
            if(icon == null){
            component.set("v.AssIntresticonName", "standard:avatar");
                }
            else{
                component.set("v.AssIntresticonName", response.getReturnValue());
            } 
            
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        
        var pageSize = component.get("v.pageSizeAssIntrest").toString();
        var pageNumber = component.get("v.pageNumberAssIntrest").toString();
        
        var actionassignmentInnData = component.get("c.getAssIntrestData");
        console.log('actionassignmentInnData=='+actionassignmentInnData);
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
            var icon=response.getReturnValue();            
            if(icon == null){
            component.set("v.MeetingMiniconName", "standard:avatar");
                }
            else{
                component.set("v.MeetingMiniconName", response.getReturnValue());
            }
            
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
                    var rowvalue = result[i];
                    
                    var Baseurl= rowvalue. Client__r.Base_Url__c;
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;
                    
                }
                console.log('meeting in result===='+result);
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
    getSetofBooksData: function(component, helper) {
        //this.showSpinner(component);
        var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Set_of_Books__c' });
        action.setCallback(this, function(response) {
            var icon=response.getReturnValue();
            if(icon === null){
            component.set("v.SetofBooksiconName", "standard:avatar");
                }
            else{
                component.set("v.SetofBooksiconName", response.getReturnValue());
            }
            
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        var pageSize = component.get("v.pageSizeSetofBooks").toString();
        console.log('pageSize=='+pageSize);
        var pageNumber = component.get("v.pageNumberSetofBooks").toString();
        var actionSetofBooksData = component.get("c.getSetofBooksData");
        console.log('actionSetofBooksData='+actionSetofBooksData);
        actionSetofBooksData.setParams({
            "objectType" :  'Set_of_Books__c',
            "pageSize":pageSize,
            "pageNumber":pageNumber,
            "ParentRecordID":parentRecordId
        });
        
        actionSetofBooksData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var actioncountSobData = component.get("c.getcountSetofBooksd");
                var lastpage= component.get("v.isLastPageSetofBooks").toString();
                var parentRecordId = component.get("v.recordId");
                
                actioncountSobData.setParams({
                    "ParentRecordID": parentRecordId  
                });
                actioncountSobData.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        var result=   response.getReturnValue();
                        component.set("v.SetofBooksTotal", result);
                        var ccDetail=component.get("v.SetofBooksTotal");
                        if(ccDetail==5){
                            component.set("v.isLastPageSetofBooks", true);
                        }
                        //  this.hideSpinner(component);
                    } else if (state === "ERROR") {
                        console.log('error...');
                        this.handleResponseError(response.getError());
                    }
                });
                
                $A.enqueueAction(actioncountSobData);
                var result= response.getReturnValue();
                for (var i = 0; i < result.length; i++) {
                    var rowvalue = result[i];
                    var rowvalue = result[i];
                    var Baseurl= rowvalue. Client__r.Base_Url__c;
                               rowvalue.linkName = Baseurl+'s/detail/'+rowvalue.Id;
                                        
                    
                }
                component.set("v.SetofBooksdata", result);
                
                if( result.length < component.get("v.pageSizeSetofBooks")){
                    component.set("v.isLastPageSetofBooks", true);
                } else{ 
                    
                    component.set("v.isLastPageSetofBooks", false);
                }
                component.set("v.dataSizeSetofBooks",  result.length);
                //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(actionSetofBooksData);
    },
    getProjectsData: function(component, helper) {
        //this.showSpinner(component);
        var action = component.get("c.getIconName");
        
        action.setParams({ "sObjectName" : 'H2S__HarvestProject__c' });
        action.setCallback(this, function(response) {
            var icon=response.getReturnValue();
            if(icon == null){
            component.set("v.ProjectsiconName", "standard:avatar");
                }
            else{
                component.set("v.ProjectsiconName", response.getReturnValue());
            }
           
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        var pageSize = component.get("v.pageSizeProjects").toString();
        var pageNumber = component.get("v.pageNumberProjects").toString();
        var actionProjectsData = component.get("c.getProjectsData");
        actionProjectsData.setParams({
            "objectType" :  'H2S__HarvestProject__c',
            "pageSize":pageSize,
            "pageNumber":pageNumber,
            "ParentRecordID":parentRecordId
        });
        
        actionProjectsData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var actioncountPrData = component.get("c.getcountProjects");
                var lastpage= component.get("v.isLastPageProjects").toString();
                var parentRecordId = component.get("v.recordId");
                
                actioncountPrData.setParams({
                    "ParentRecordID": parentRecordId  
                });
                actioncountPrData.setCallback(this, function(response) {
                    var state = response.getState();                    
                    if (state === "SUCCESS") {
                        var result=   response.getReturnValue();
                        component.set("v.ProjectsTotal", result);
                        var ccDetail=component.get("v.ProjectsTotal");
                        if(ccDetail==5){
                            component.set("v.isLastPageProjects", true);
                        }
                        //  this.hideSpinner(component);
                    } else if (state === "ERROR") {
                        this.handleResponseError(response.getError());
                    }
                });
                
                $A.enqueueAction(actioncountPrData);
                var result= response.getReturnValue();
                console.log('resultprojects='+result);
                for (var i = 0; i < result.length; i++) {
                    console.log('projects ssb='+result);
                    
                    var rowvalue = result[i];
                    var rowvalue = result[i];
                    console.log('projects rowvalue='+rowvalue.Name);
                    var Baseurl= rowvalue.H2S__Account__r.Base_Url__c;
                               rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;                    
                }
                component.set("v.Projectsdata", result);
                
                if( result.length < component.get("v.pageSizeProjects")){
                    component.set("v.isLastPageProjects", true);
                } else{ 
                    
                    component.set("v.isLastPageProjects", false);
                }
                component.set("v.dataSizeProjects",  result.length);
                //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(actionProjectsData);
    },
    //For StrategySessionQuestionnairesData
    getStrategySessionQuestionnairesData: function(component, helper) {
        //this.showSpinner(component);
        var action = component.get("c.getIconName");
        
        action.setParams({ "sObjectName" : 'Strategy_Session_Questionnaire__c' });
        action.setCallback(this, function(response) {
            var icon=response.getReturnValue();
            if(icon ==="null"){
            component.set("v.StrategySessionQuestionnairesiconName", "standard:avatar");
                }
            else{
                component.set("v.StrategySessionQuestionnairesiconName", response.getReturnValue());                
            }
           
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        var pageSize = component.get("v.pageSizeStrategySessionQuestionnaires").toString();
        var pageNumber = component.get("v.pageNumberStrategySessionQuestionnaires").toString();
        var actionStrategySessionQuestionnairesData = component.get("c.getStrategySessionQuestionnairesData");
        actionStrategySessionQuestionnairesData.setParams({
            "objectType" :'Strategy_Session_Questionnaire__c',
            "pageSize":pageSize,
            "pageNumber":pageNumber,
            "ParentRecordID":parentRecordId
        });
        
        actionStrategySessionQuestionnairesData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var actioncountStData = component.get("c.getcountStrategySessionQuestionnaires");
                var lastpage= component.get("v.isLastStrategySessionQuestionnaires").toString();
                var parentRecordId = component.get("v.recordId");
                
                actioncountStData.setParams({
                    "ParentRecordID": parentRecordId  
                });
                actioncountStData.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        var result=   response.getReturnValue();
                        component.set("v.StrategySessionQuestionnairesTotal", result);
                        var ccDetail=component.get("v.StrategySessionQuestionnairesTotal");
                        if(ccDetail==5){
                            component.set("v.isLastStrategySessionQuestionnaires", true);
                        }
                        //  this.hideSpinner(component);
                    } else if (state === "ERROR") {
                        console.log('error...');
                        this.handleResponseError(response.getError());
                    }
                });
                
                $A.enqueueAction(actioncountStData);
                var result= response.getReturnValue();
                console.log('resultprojects='+result);
                for (var i = 0; i < result.length; i++) {
                    
                    var rowvalue = result[i];
                    var rowvalue = result[i];
                    var Baseurl= rowvalue.Account_Lookup__r.Base_Url__c;
                               rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;                    
                }
                component.set("v.StrategySessionQuestionnairesData", result);
                
                if( result.length < component.get("v.pageSizeStrategySessionQuestionnaires")){
                    component.set("v.isLastPageStrategySessionQuestionnaires", true);
                } else{ 
                    
                    component.set("v.isLastPageStrategySessionQuestionnaires", false);
                }
                component.set("v.dataSizeStrategySessionQuestionnaires",  result.length);
                //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(actionStrategySessionQuestionnairesData);
    },     
    
   // Get Feedback Data 
     getFeedbackData: function(component, helper) {
        //this.showSpinner(component);
        var action = component.get("c.getIconName");
        
        action.setParams({ "sObjectName" : 'Feedback__c' });
        action.setCallback(this, function(response) {
            var icon=response.getReturnValue();
            if(icon == null){
            component.set("v.FeedbackiconName", "standard:avatar");
                }
            else{
                component.set("v.FeedbackiconName", response.getReturnValue());
            }
           
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        var pageSize = component.get("v.pageSizeFeedback").toString();
        var pageNumber = component.get("v.pageNumberFeedback").toString();
        var actionFeedbackData = component.get("c.getFeedbackData");
        actionFeedbackData.setParams({
            "objectType" :  'Feedback__c',
            "pageSize":pageSize,
            "pageNumber":pageNumber,
            "ParentRecordID":parentRecordId
        });
        
       actionFeedbackData.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var actioncountFbData = component.get("c.getcountFeedback");
                var lastpage= component.get("v.isLastPageFeedback").toString();
                var parentRecordId = component.get("v.recordId");
                
                actioncountFbData.setParams({
                    "ParentRecordID": parentRecordId  
                });
                actioncountFbData.setCallback(this, function(response) {
                    var state = response.getState();                    
                    if (state === "SUCCESS") {
                        var result=   response.getReturnValue();
                        component.set("v.FeedbackTotal", result);
                        var ccDetail=component.get("v.FeedbackTotal");
                        if(ccDetail==5){
                            component.set("v.isLastPageFeedback", true);
                        }
                        //  this.hideSpinner(component);
                    } else if (state === "ERROR") {
                        this.handleResponseError(response.getError());
                    }
                });
                
                $A.enqueueAction(actioncountFbData);
                var result= response.getReturnValue();
                console.log('resultprojects='+result);
                for (var i = 0; i < result.length; i++) {
                    console.log('feedback ssb='+result);                    
                    var rowvalue = result[i];
                    var rowvalue = result[i];
                    console.log('feedback rowvalue='+rowvalue.Name);
                   
                    var Baseurl= rowvalue.Client__r.Base_Url__c;                   
                    rowvalue.linkName =Baseurl+ 's/feedback/'+rowvalue.Id; 
                    if(rowvalue.Contact__r){
                     rowvalue.contactname = rowvalue.Contact__r.Name;
                    console.log('contact name'+ rowvalue.Contact__r.Name);
                    }
                    if(rowvalue.CreatedBy){
                    rowvalue.createdbyname = rowvalue.CreatedBy.Name; 
                    }
                }
                
                
                component.set("v.Feedbackdata", result);
                
                if( result.length < component.get("v.pageSizeFeedback")){
                    component.set("v.isLastPageFeedback", true);
                } else{ 
                    
                    component.set("v.isLastPageFeedback", false);
                }
                component.set("v.dataSizeFeedback",  result.length);
                //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(actionFeedbackData);
    },
     
    getDissolutionsData: function(component, helper) {
        //this.showSpinner(component);
        var action = component.get("c.getIconName");
        
        action.setParams({ "sObjectName" : 'Dissolution__c' });
        action.setCallback(this, function(response) {
            var icon=response.getReturnValue();
            if(icon == null){
            component.set("v.DissolutioniconName", "standard:avatar");
                }
            else{
                component.set("v.DissolutioniconName", response.getReturnValue());
            }
           
        });
        $A.enqueueAction(action); 
        var objectType = component.get("v.objectType");
        var parentRecordId = component.get("v.recordId");
        var pageSize = component.get("v.pageSizeDissolution").toString();
        var pageNumber = component.get("v.pageNumberDissolution").toString();
        var actionDissolutionData = component.get("c.getDissolutionData");
        actionDissolutionData.setParams({
            "objectType" :  'Dissolution__c',
            "pageSize":pageSize,
            "pageNumber":pageNumber,
            "ParentRecordID":parentRecordId
        });
        
       actionDissolutionData.setCallback(this, function(response) {
            var state = response.getState();
           if (state === "SUCCESS") {
               var lastpage= component.get("v.isLastPageDissolution").toString();
               var parentRecordId = component.get("v.recordId");
               
               var result=   response.getReturnValue();
               component.set("v.DissolutionsTotal", result.length);
               var ccDetail=component.get("v.DissolutionsTotal");
               if(ccDetail==5){
                   component.set("v.isLastPageDissolution", true);
               }
               //  this.hideSpinner(component);
               
               //var result= response.getReturnValue();
                for (var i = 0; i < result.length; i++) {
                    debugger;
                    var rowvalue = result[i];
                    var Baseurl= rowvalue.Client__r.Base_Url__c;                   
                    rowvalue.linkName =Baseurl+ 's/dissolution/'+rowvalue.Id; 
                    if(rowvalue.Contact__r){
                     rowvalue.contactname = rowvalue.Contact__r.Name;
                    console.log('contact name'+ rowvalue.Contact__r.Name);
                    }
                    if(rowvalue.CreatedBy){
                    rowvalue.createdbyname = rowvalue.CreatedBy.Name; 
                    }
                }
                
                console.log('Dissolutionsdata='+result);
                component.set("v.Dissolutionsdata", result);
                
                if( result.length < component.get("v.pageSizeDissolution")){
                    component.set("v.isLastPageDissolution", true);
                } else{ 
                    
                    component.set("v.isLastPageDissolution", false);
                }
                component.set("v.dataSizeDissolution",  result.length);
                //  this.hideSpinner(component);
            } else if (state === "ERROR") {
                this.handleResponseError(response.getError());
            }
        });
        $A.enqueueAction(actionDissolutionData);
    },

    getOrderData: function(component, helper) {
        //this.showSpinner(component);
        
        var action = component.get("c.getIconName");
        action.setParams({ "sObjectName" : 'Order' });
        action.setCallback(this, function(response) {
            var icon=response.getReturnValue();
            console.log('order icon=='+icon);
            if(icon == null){
            component.set("v.OrdericonName", "standard:avatar");
                }
            else{
                component.set("v.OrdericonName", response.getReturnValue());
            }
            
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
                
                    result.map((data)=>{
                      if(data.Opportunity!=null && data.Opportunity!=''){
                        data.Opportunity_Name = data.Opportunity.Name;
                  }
                
                })
                
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
    
    deleteCard: function (cmp, row) {
        var rows = cmp.get('v.data');
        var rowIndex = rows.indexOf(row);

        rows.splice(rowIndex, 1);
        cmp.set('v.data', rows);
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
    },
     deletecreditCard : function(component, event, row, helper) {
        var action = component.get("c.deleteRecord");
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                this.getccDetailData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteEntity : function(component, event, row, helper) {
        var action = component.get("c.deleteEntRecord");
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Entity response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Entity');
                this.getEntityData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteSale : function(component, event, row, helper) {
        var action = component.get("c.deleteSaleRecord");
        console.log('row srk Sale=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Sale response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Sale');
                this.getSalesData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteCase : function(component, event, row, helper) {
        var action = component.get("c.deleteCaseRecord");
        console.log('row srk Case=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Case response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Case');
                this.getCaseData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteRefunds : function(component, event, row, helper) {
        var action = component.get("c.deleteRefundRecord");
        console.log('row srk Refund=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Refunds response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Refunds');
                this.getRefundsData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteTrusts : function(component, event, row, helper) {
        var action = component.get("c.deleteTrustRecord");
        console.log('row srk Trust=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Trust response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Trust');
                this.getTrustData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteActivities:function(component, event, row, helper) {
        var action = component.get("c.deleteActivityRecord");
        console.log('row srk Acitivity=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Activity response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working activity');
                this.getBookRData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteAssignment:function(component, event, row, helper) {
        var action = component.get("c.deleteAssignRecord");
        console.log('row srk Assign=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Assign response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Assign');
                this.getassignmentInnData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteMeetingMin:function(component, event, row, helper) {
        var action = component.get("c.deleteMeetingMinRecord");
        console.log('row MeetingMinutes=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete MeetingMinutes response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working MeetingMinutes');
                this.getMeetingMinData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteSetofBooks:function(component, event, row, helper) {
        var action = component.get("c.deleteSetOfBooksRecord");
        console.log('row MeetingMinutes=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete MeetingMinutes response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working MeetingMinutes');
                this.getMeetingMinData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteOrders:function(component, event, row, helper) {
        var action = component.get("c.deleteOrderRecord");
        console.log('row Order=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Order response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Order');
                this.getOrderData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteProjects:function(component, event, row, helper) {
        var action = component.get("c.deleteProjetsRecord");
        console.log('row Projects=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Projects response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Projects');
                this.getProjectsData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteSSQs:function(component, event, row, helper) {
        var action = component.get("c.deleteSSQRecord");
        console.log('row SSQ=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete SSQ response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working SSQ');
                this.getStrategySessionQuestionnairesData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteContacts:function(component, event, row, helper) {
        var action = component.get("c.deleteContactRecord");
        console.log('row Contact=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Contact response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Contact');
                this.getContactData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    
    // Delete Feedback 
     deleteFeedback:function(component, event, row, helper) {
        var action = component.get("c.deleteFeedbackRecord");
        console.log('row Contact=='+row);
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            console.log('delete Contact response.getState()=='+response.getState());
            console.log('respose value=='+response.getReturnValue());
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                console.log('working Contact');
                this.getContactData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                //alert('Not delete');
                console.log('Érror Block');
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    deleteDissolutions:function(component, event, row, helper) {
        var action = component.get("c.deleteDissolutionRecord");
        action.setParams({row:row});
        action.setCallback(this, function(response) {
            if(response.getState()=='SUCCESS'&& response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type":"success",
                    "message": "The record has been deleted successfully."
                });
                toastEvent.fire();
                this.getDissolutionsData(component, helper);
            }
            else if(response.getState()=='SUCCESS'&& !response.getReturnValue()){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "type":"Error",
                    "mode":"sticky",
                    "message": "Dont have permission to delete."
                });
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
    },
    
     fetchListOfRecordTypes: function(component, event, helper) {
      var action = component.get("c.fetchRecordTypeValues");
      action.setCallback(this, function(response) {
         component.set("v.lstOfRecordType", response.getReturnValue());
      });
      $A.enqueueAction(action);
   },
       fetchListOfCaseRecordTypes: function(component, event, helper) {
      var action = component.get("c.fetchCaseRecordTypeValues");
      action.setCallback(this, function(response) {
         component.set("v.caselstOfRecordType", response.getReturnValue());
      });
      $A.enqueueAction(action);
   },
       fetchListOfSalesRecordTypes: function(component, event, helper) {
      var action = component.get("c.fetchSalesRecordTypeValues");
      action.setCallback(this, function(response) {
         component.set("v.salelstOfRecordType", response.getReturnValue());
      });
      $A.enqueueAction(action);
   },
       fetchListOfTrustRecordTypes: function(component, event, helper) {
      var action = component.get("c.fetchTrustRecordTypeValues");
      action.setCallback(this, function(response) {
         component.set("v.trutlstOfRecordType", response.getReturnValue());
      });
      $A.enqueueAction(action);
   },
    
     fetchListOfFeedbackRecordTypes: function(component, event, helper) {
      var action = component.get("c.fetchFeedbackRecordTypeValues");
      action.setCallback(this, function(response) {
         component.set("v.feedbacklstOfRecordType", response.getReturnValue());
      });
      $A.enqueueAction(action);
   },
 
})