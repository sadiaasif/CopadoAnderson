({
	doInit : function(component, event, helper) {
           var actiongetEntityID = component.get("c.getEntityId");
        var TaskID = component.get("v.recordId");
    
        actiongetEntityID.setParams({
            "TaskID":TaskID
        });
		 actiongetEntityID.setCallback(this, function(data) {
              var state = data.getState(); 
             if ( state === "SUCCESS" ) {
                 if(data.getReturnValue()!=null){
                    component.set("v.EntityID", data.getReturnValue()); 
                      component.set("v.RelatedToEntity", true); 
                 }else{
                     component.set("v.RelatedToEntity", false);  
                 }
          
             }
           
        });
           $A.enqueueAction(actiongetEntityID);    
	},
       
    edit : function(component, event, helper) {
         var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.EntityID")
        });
        editRecordEvent.fire();
           
    },
    handleToastEvent : function(component, event, helper) {
    var toastMessageParams = event.getParams();
    var message = toastMessageParams.message;

    if (message.includes('was saved')) {
      
      var EntityID = component.get("v.EntityID");
        var container = component.find("EntityDetailcontainer");
        $A.createComponent("force:recordView",
                           {recordId: EntityID,type: "FULL"},
                           function(cmp) {
                               container.set("v.body", [cmp]);
                           });
           
      
        
    }
    }
   
   
})