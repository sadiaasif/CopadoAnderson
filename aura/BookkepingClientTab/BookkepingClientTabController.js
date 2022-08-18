({
	doInit : function(component, event, helper) {
           var actiongetClientID = component.get("c.getClientId");
        var CaseID = component.get("v.recordId");
    
        actiongetClientID.setParams({
            "CaseID":CaseID
        });
		 actiongetClientID.setCallback(this, function(data) {
              var state = data.getState(); 
             if ( state === "SUCCESS" ) {
                 if(data.getReturnValue()!=null){
                    component.set("v.ClientId", data.getReturnValue()); 
                      component.set("v.ClientIDPresent", true); 
                 }else{
                     component.set("v.ClientIDPresent", false);  
                 }
          
             }
           
        });
           $A.enqueueAction(actiongetClientID);    
	},
     edit : function(component, event, helper) {
         var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.ClientId")
        });
        editRecordEvent.fire();
           
    },
    handleToastEvent : function(component, event, helper) {
    var toastMessageParams = event.getParams();
    var message = toastMessageParams.message;

    if (message.includes('was saved')) {
      
      var ClientID = component.get("v.ClientId");
        var container = component.find("ClientDetailcontainer");
        $A.createComponent("force:recordView",
                           {recordId: ClientID,type: "FULL"},
                           function(cmp) {
                               container.set("v.body", [cmp]);
                           });
           
      
        
    }
    },
    DocusignButton:function(component, event, helper) {
             var actiongetClientID = component.get("c.getClientId");
        var CaseID = component.get("v.recordId");
    
        actiongetClientID.setParams({
            "CaseID":CaseID
        });
		 actiongetClientID.setCallback(this, function(data) {
              var state = data.getState();
           
 
                  
             
             if ( state === "SUCCESS" ) {
               
                 if(data.getReturnValue()!=null){
                     component.set("v.ClientId", data.getReturnValue());    
                       var flow = component.find("flowData");
                        var inputVariables = [
					 { name : "AccountId", type : "SObject", value:component.get("v.ClientId")}
                  ];
           			flow.startFlow("Bookkeeping_Consultation_Mail", inputVariables );

                    

                 }else{
                     
                 }
          
             }
           
        });
           $A.enqueueAction(actiongetClientID);    
    }
})