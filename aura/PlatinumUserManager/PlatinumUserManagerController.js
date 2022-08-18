({
    getRelatedUser : function(component, event, helper) {
        var conId = component.get("v.recordId");
        var action = component.get("c.getPlatinumUser");
        
        console.log(conId);
        
        action.setParams({ contactId : conId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.PlatinumUser", response.getReturnValue());
                //The attribute that you are iterating has to be set here
                
            }
        });
        $A.enqueueAction(action);
    }
})