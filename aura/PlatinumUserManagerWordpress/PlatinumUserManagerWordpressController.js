({
     doInit : function(component, event, helper) {
       
        
      var platinumwordpressid = component.get("v.contactRecord").Platinum_Wordpress_Id__c;
        var Accountroles = component.get("v.contactRecord").Account_Roles__c;
     
    
        if(Accountroles=='Primary Contact'){
           component.set("v.isContactPrimary", true); 
             if(platinumwordpressid =='' || platinumwordpressid ==null ){
         
            component.set("v.Updateuser", false); 
            
        }else{
              component.set("v.Updateuser", true); 
            
           
        }
        }else{
               component.set("v.isContactPrimary", false); 
        }
       
   
   
	},
    updateClick : function(component, event, helper) {
        
        component.set('v.spin', !component.get('v.spin'));
        
        var conId = component.get('v.recordId');
        var action = component.get('c.sendUpdate');
        action.setParams({ conId : conId });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "User Updated!",
                    "type":"success"
                });
                toastEvent.fire();
                component.set('v.spin', !component.get('v.spin'));
            }
        });
        $A.enqueueAction(action);
    },
    
    resetPasswordCmp : function(component, event, helper) {
        
             
        var conId = component.get('v.recordId');
       
        var action = component.get('c.resetPassword');
        action.setParams({ conId : conId });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
              
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "Password Updated!",
                    "type":"success"
                });
                toastEvent.fire();
               
                component.set("v.isModalOpen", false);
            }
        });
        $A.enqueueAction(action);
    },
   
    
    resetPasswordpopup : function(component, event, helper) {
        
       component.set("v.isModalOpen", true); 
            
    }, closeModel: function(component, event, helper) {
     
      component.set("v.isModalOpen", false);
   }
})