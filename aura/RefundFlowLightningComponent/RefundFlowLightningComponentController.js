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
               
                 component.set("v.SaleIds",rowvalues[i].oppId );
               
                   component.set("v.AccountIds",rowvalues[i].Accid );
               
                   component.set("v.SaleTypes",rowvalues[i].oppRecordType );
                  
              
                 component.set("v.SaleNames",rowvalues[i].oppName );
             }
             var accountIdg=component.get("v.AccountIds");
           
              var SaleTypeg=component.get("v.SaleTypes");
             
              var SaleNameg=component.get("v.SaleNames");
              
              var SaleIdg=component.get("v.SaleIds");
            // Find the component whose aura:id is "flowData"
       
            // Set the account record (sObject) variable to the value of the component's 
            // account attribute.
            var inputVariables = [
            { name : "AccountId", type : "String", value:accountIdg }, 
            { name : "SaleType", type : "String", value:SaleTypeg },
            { name : "SaleId", type : "String", value: SaleIdg},
            { name : "SaleName", type : "String", value:SaleNameg},
         
        ];
            
         
            flow.startFlow("Refund_Request_Flow", inputVariables);
         }
         else {
            console.log("Failed to get account date.");
         }
      });

      
      $A.enqueueAction(action);
   
   }
})