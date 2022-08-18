({
	doInit : function(component, event, helper) {
           var actiongetContactID = component.get("c.getcontactId");
        var CaseID = component.get("v.recordId");
    
        actiongetContactID.setParams({
            "CaseID":CaseID
        });
		 actiongetContactID.setCallback(this, function(data) {
              var state = data.getState(); 
             if ( state === "SUCCESS" ) {
                 if(data.getReturnValue()!=null){
                    component.set("v.ContactId", data.getReturnValue()); 
                      component.set("v.ContactIdPresent", true); 
                 }else{
                     component.set("v.ContactIdPresent", false);  
                 }
          
             }
           
        });
           $A.enqueueAction(actiongetContactID);    
	},
     edit : function(component, event, helper) {
         var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.ContactId")
        });
        editRecordEvent.fire();
           
    },
    handleToastEvent : function(component, event, helper) {
    var toastMessageParams = event.getParams();
    var message = toastMessageParams.message;

    if (message.includes('was saved')) {
      
      var ContactID = component.get("v.ContactId");
        var container = component.find("ContactDetailcontainer");
        $A.createComponent("force:recordView",
                           {recordId: ContactID,type: "FULL"},
                           function(cmp) {
                               container.set("v.body", [cmp]);
                           });
           
      
        
    }
    }
})