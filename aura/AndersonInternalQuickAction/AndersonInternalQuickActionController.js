({
	doInit : function(component, event, helper) {
        window.setTimeout(
        $A.getCallback(function() {
            $A.get("e.force:closeQuickAction").fire();
			}),100
        );
        window.open("https://internal.andersonadvisors.com/");  
	}
})