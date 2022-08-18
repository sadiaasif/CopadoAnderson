({
	handleInit : function(component, event, helper) {
       
        var saleId = component.get("v.recordId");
        var action = component.get("c.prepareSalesConga");
        
        console.log(saleId);
        
        action.setParams({ saleId : saleId });
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