({
    getLoggedCalls : function(component, event, helper) {
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
        
        $A.enqueueAction(actiongetAdvisorCallTask);
        $A.enqueueAction(actiongetSeviceCallTask);
    }
})