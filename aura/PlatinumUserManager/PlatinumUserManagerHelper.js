({
    sendRecordId : function(component, actionName, val) {
        var action = component.get(actionName);
        action.setParams({ contactId : val });
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})