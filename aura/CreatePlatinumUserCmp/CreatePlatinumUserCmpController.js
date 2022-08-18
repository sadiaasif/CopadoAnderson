({
    doInit : function(component, event, helper) {
       
        
      var platinumwordpressid = component.get("v.contactRecord").Platinum_Wordpress_Id__c;
        var Accountroles = component.get("v.contactRecord").Account_Roles__c;
     
    
        if(Accountroles=='Primary Contact'){
           component.set("v.isContactPrimary", true); 
             if(platinumwordpressid=='' || platinumwordpressid==null ){
          
            component.set("v.createuser", true); 
            
        }else{
              component.set("v.createuser", false); 
            
           
        }
        }else{
               component.set("v.isContactPrimary", false); 
        }
       
   
   
	},
    createUser : function(component, event, helper) {
        
        component.set('v.spin', !component.get('v.spin'));
        var conId = component.get('v.recordId');
        var action = component.get('c.createPlatinumUser');
        action.setParams({ conIds : conId });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "User Created!",
                    "type":"success"
                });
                toastEvent.fire();
                component.set('v.spin', !component.get('v.spin'));
            }
            
            if (state === "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops! That username is already in use.",
                    "message": 'Please double-check if a Platinum login already exists for this client and try resetting the password. If the error persist please submit a help desk case.',
                    "type":"error"
                });
                toastEvent.fire();
                component.set('v.spin', !component.get('v.spin'));
            }
            
            
        });
        $A.enqueueAction(action);
    }
})