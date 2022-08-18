({
	showToast : function(component, event, helper) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Alert Message:",
        "message": component.get("v.alertmessage")
    });
    toastEvent.fire();
},
    
    getAlertMessage : function(component, event, helper) {
        var accId = component.get("v.recordId");
        var action = component.get("c.findAlertMessage");
        
        action.setParams({ accountId : accId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.alertmessage", response.getReturnValue());
                //The attribute that you are iterating has to be set here
                
            }
        });
        $A.enqueueAction(action);
    }
    
})