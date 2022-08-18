({
doInit : function (component, event, helper) {
         var oppId = component.get("v.recordId");
     
        var action = component.get("c.getSale");
   
      var flow = component.find("flowData");
       
       
       console.log(oppId);
       action.setParams({
           "oppId":oppId
       });
                action.setCallback(this, function(response) {
          var state = response.getState();
           
        if (state === "SUCCESS") {
           
       
    var rowvalues=   response.getReturnValue();
       
     
       
   
           for (var i = 0; i < rowvalues.length; i++) {
             
                var rowvalue = rowvalues[i];
             
                component.set("v.Invoiceid",rowvalues[i].InvoiceId );             
                              }
            var Invoice=component.get("v.Invoiceid");
         
             
           // Find the component whose aura:id is "flowData"
     
           // Set the account record (sObject) variable to the value of the component's
           // account attribute.
           var inputVariables = [
           { name : "InvoiceNumber", type : "String", value:Invoice}
           
       
       ];
           
       
           flow.startFlow("Update_Entity_Button", inputVariables);
        }
        else {
           console.log("Failed to get Invoice Number.");
        }
     });

     
     $A.enqueueAction(action);
 
  }
})