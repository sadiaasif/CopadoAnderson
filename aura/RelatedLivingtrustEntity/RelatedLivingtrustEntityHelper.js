({
	 fetchRecords: function( component ) { 
         	var actiongetRelatedEnrecord = component.get("c.getEntityObjectLivingTrust");
		  var ClientID = component.get("v.recordId");
      
         actiongetRelatedEnrecord.setParams({
             "clientid" :ClientID
         });
         
                 actiongetRelatedEnrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                               
                                  rowvalue.RecordType = rowvalue.RecordType.Name;  
                                  rowvalue.CaseNumber = rowvalue.Case__r.CaseNumber;  
                             
               			 if(rowvalue.Assigned_Paralegal__c!=null && rowvalue.Assigned_Paralegal__c!=''){
                                  rowvalue.AssignedP = rowvalue.Assigned_Paralegal__r.Name;  
                              }
                 		
                                  rowvalue.LivingTrustAttorney = rowvalue.LivingTrustAttorney__c;  
                            
 						                      
                              rowvalue.linkName = rowvalue.Primary_Client__r.Base_Url__c+ '/'+rowvalue.Id;
                      
            			}
              component.set("v.EntityLivingTrustRecords",rowvalues );
            component.set("v.hasrelatedLivingTrustonEntityobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonEntityobj",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRelatedEnrecord);
         
         	var actiongetRelatedTrustrecord = component.get("c.getTrust");
		  var ClientID = component.get("v.recordId");
      
         actiongetRelatedTrustrecord.setParams({
             "clientid" :ClientID
         });
         
                 actiongetRelatedTrustrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                               
                                  rowvalue.RecordType = rowvalue.RecordType.Name;  
                 rowvalue.CaseNumber = rowvalue.Case__r.CaseNumber;  
                              
                             
               			 if(rowvalue.Assigned_Paralegal__c!=null && rowvalue.Assigned_Paralegal__c!=''){
                                  rowvalue.AssignedP = rowvalue.Assigned_Paralegal__r.Name;  
                              }
                 		
                                  rowvalue.LivingTrustAttorney = rowvalue.LivingTrustAttorney__c;  
                            
 						                      
                              rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ '/'+rowvalue.Id;
                      
            			}
              component.set("v.TrusoLivingTrustRecords",rowvalues );
            component.set("v.hasrelatedLivingTrustonTrustobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonTrustobj",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRelatedTrustrecord);
                  	var actiongetRelatedSalesrecord = component.get("c.getSalesRecord");
		  var accId = component.get("v.recordId");
      
         actiongetRelatedSalesrecord.setParams({
             "accId" :accId
         });
         
                 actiongetRelatedSalesrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                               
                                  rowvalue.RecordType = rowvalue.RecordType.Name;  
                              
                                  rowvalue.Owner = rowvalue.Owner.Name;  
                          
               			 if(rowvalue.Sales_Rep__c!=null && rowvalue.Sales_Rep__c!=''){
                                  rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name;  
                              }
                 		if(rowvalue.Entity__c!=null && rowvalue.Entity__c!=''  ){
                                  rowvalue.Entity = rowvalue.Entity__r.Name;  
                              }
 						                      
                              rowvalue.linkName = rowvalue.Account.Base_Url__c+ '/'+rowvalue.Id;
                      
            			}
              component.set("v.SaleLivingTrustRecords",rowvalues );
            component.set("v.hasrelatedLivingTrustonSaleobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonSaleobj",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRelatedSalesrecord);
           
           
          var actiongetLvTask = component.get("c.getlvtasks");
        var accId = component.get("v.recordId");
   
        actiongetLvTask.setParams({
            "accId":accId
        });
        actiongetLvTask.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
               if(rowvalues!=null){
                  
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                               
                           
                               if(rowvalue.OwnerId){
                               rowvalue.owner = rowvalue.Owner.Name;   
                              }
                             rowvalue.LVStage = rowvalue.Living_Trust_Stages__c;   
                   rowvalue.linkName =  'https://andersonadvisors--gorilla.lightning.force.com/'+rowvalue.Id;
            			}
                 component.set("v.TaskLivingTrustRecords",rowvalues );  
                 component.set("v.hasrelatedLivingTrustonTaskobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonTaskobj",false );
        }
    }        
        });
          $A.enqueueAction(actiongetLvTask);
               
          var actiongetCase = component.get("c.getlvcase");
        var accId = component.get("v.recordId");
      
        actiongetCase.setParams({
            "accId":accId
        });
        actiongetCase.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
               if(rowvalues!=null){
                      for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                                    
                            if( rowvalue.RecordTypeId){
                              
                               rowvalue.CaseType = rowvalue.RecordType.Name;   
                               
                              }
                             if(rowvalue.OwnerId){
                                        
                               rowvalue.OwnerId = rowvalue.Owner.Name;   
                              }
                              var Baseurl= rowvalue.Account.Base_Url__c;
                               rowvalue.linkName =Baseurl+ '/'+rowvalue.Id;

            			}
                 component.set("v.CaseLivingTrustRecords",rowvalues );  
                 component.set("v.hasrelatedLivingTrustonCaseobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonCaseobj",false );
        }
    }        
        });
          $A.enqueueAction(actiongetCase);
	}
    
})