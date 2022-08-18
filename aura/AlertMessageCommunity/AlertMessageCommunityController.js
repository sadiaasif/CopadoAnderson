({
	getAlertMessage : function(component, event, helper) {
		 var accId = component.get("v.recordId");
        var action = component.get("c.findAlertMessage");
        
        action.setParams({ accountId : accId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.alertmessage", response.getReturnValue());
                  
                var message=component.get( "v.alertmessage" );
              
           helper.toastMsg( 'info', message );  
                
            }
        });
        $A.enqueueAction(action);
	}
})