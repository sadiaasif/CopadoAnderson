({
		 fetchRecords: function( component ) { 
                     var action = component.get("c.insideCommunity");
        action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var res = response.getReturnValue();
                  console.log(JSON.stringify(res));
                  component.set("v.isCommunity", res);
            }
        });
        $A.enqueueAction(action);
  
         	var actiongetRelatedEnrecord = component.get("c.getEntity");
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
                
                                rowvalue.RecordTypeEn = rowvalue.RecordType.Name;  
                if(rowvalue.Disregarded_To__c!=null &&rowvalue.Disregarded_To__c!='' ){
                    rowvalue.Disregarded=rowvalue.Disregarded_To__r.Name;
                }
                
              
                         var inCommunity = component.get("v.isCommunity");
         
        if(inCommunity){
          rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ 's/detail/'+ rowvalue.Id;
        }
        else{
             rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ '/'+ rowvalue.Id;
           
        }  
                      
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
                   
                   var state = data.getState();
                              
    if (component.isValid() && state === 'SUCCESS') {
        
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                               
                                  rowvalue.RecordType = rowvalue.RecordType.Name;  
                 
                 if( rowvalue.Case__c!=null &&  rowvalue.Case__c!=''){
                     rowvalue.CaseNumber = rowvalue.Case__r.CaseNumber;  
                 }
              
                              
                             
               			 if(rowvalue.Assigned_Paralegal__c!=null && rowvalue.Assigned_Paralegal__c!=''){
                                  rowvalue.AssignedP = rowvalue.Assigned_Paralegal__r.Name;  
                              }
                 	
                                  rowvalue.LivingTrustAttorney = rowvalue.LivingTrustAttorney__c;  
                var inCommunity = component.get("v.isCommunity");
          
        if(inCommunity){
          rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ 's/detail/'+ rowvalue.Id;
        }
        else{
             rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ '/'+ rowvalue.Id;
           
        }  
                        
            			}
            
              
              component.set("v.TrusoLivingTrustRecords",rowvalues );
            component.set("v.hasrelatedLivingTrustonTrustobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonTrustobj",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRelatedTrustrecord);
		
	},
    SearchEntityHelper: function(component,event) {  
        var searchKey = component.get("v.searchKeyEntityword");
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var ClientId = component.get("v.recordId");
        var taskList = component.get("v.EntityLivingTrustRecords");
        var action = component.get("c.findByEntityName");
        action.setParams({
            "searchKey": searchKey,
            
            "ClientId":ClientId
        }); 
        action.setCallback(this, function(data) {
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = data.getState()
            if (component.isValid() && state === 'SUCCESS') {
                    var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                
                                rowvalue.RecordTypeEn = rowvalue.RecordType.Name;  
                if(rowvalue.Disregarded_To__c!=null &&rowvalue.Disregarded_To__c!='' ){
                    rowvalue.Disregarded=rowvalue.Disregarded_To__r.Name;
                }
                
              
                         var inCommunity = component.get("v.isCommunity");
         
        if(inCommunity){
          rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ 's/detail/'+ rowvalue.Id;
        }
        else{
             rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ '/'+ rowvalue.Id;
           
        }  
                      
            			}
              component.set("v.EntityLivingTrustRecords",rowvalues );
            component.set("v.hasrelatedLivingTrustonEntityobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonEntityobj",false );
        }
                         
            }
        });
        $A.enqueueAction(action);  
    },
    SearchTrustHelper: function(component,event) {  
        var searchKey = component.get("v.searchKeyTrustword");
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var ClientId = component.get("v.recordId");
        var taskList = component.get("v.TrusoLivingTrustRecords");
        var action = component.get("c.findByTrustName");
        action.setParams({
            "searchKey": searchKey,
            
            "ClientId":ClientId
        }); 
        action.setCallback(this, function(data) {
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = data.getState()
            if (component.isValid() && state === 'SUCCESS') {
               
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                               
                                  rowvalue.RecordType = rowvalue.RecordType.Name;  
                 
                 if( rowvalue.Case__c!=null &&  rowvalue.Case__c!=''){
                     rowvalue.CaseNumber = rowvalue.Case__r.CaseNumber;  
                 }
              
                              
                             
               			 if(rowvalue.Assigned_Paralegal__c!=null && rowvalue.Assigned_Paralegal__c!=''){
                                  rowvalue.AssignedP = rowvalue.Assigned_Paralegal__r.Name;  
                              }
                 	
                                  rowvalue.LivingTrustAttorney = rowvalue.LivingTrustAttorney__c;  
                var inCommunity = component.get("v.isCommunity");
          
        if(inCommunity){
          rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ 's/detail/'+ rowvalue.Id;
        }
        else{
             rowvalue.linkName =rowvalue.Primary_Client__r.Base_Url__c+ '/'+ rowvalue.Id;
           
        }  
                        
            			}
            
              
              component.set("v.TrusoLivingTrustRecords",rowvalues );
            component.set("v.hasrelatedLivingTrustonTrustobj",true );
        }else{
            component.set("v.hasrelatedLivingTrustonTrustobj",false );
        }
                         
                         
            }
        });
        $A.enqueueAction(action);  
    }
})