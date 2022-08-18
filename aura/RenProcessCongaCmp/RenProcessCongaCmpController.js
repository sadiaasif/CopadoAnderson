({
	handleInit : function(component, event, helper) {
       
        var entityId = component.get("v.recordId");
        var action = component.get("c.prepareRenProcConga");
        
        console.log(entityId);
        
        action.setParams({ entityId : entityId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.congaObject", response.getReturnValue());
                //The attribute that you are iterating has to be set here
                
            }
        });
        $A.enqueueAction(action);
    }
})