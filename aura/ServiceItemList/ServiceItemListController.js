({
initRecords: function(component, event, helper) {
   
         var action = component.get("c.getseviceItems");
    var caseID=component.get("v.recordId");
   
    action.setParams({
                    'CaseId': caseID
                  });
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
             
                  component.set("v.ServiceItemList", storeResponse);
            }
        });
        $A.enqueueAction(action);
    },
    
    Save: function(component, event, helper) {
     
         component.set("v.HideSpinner", true);
           
               var action = component.get("c.saveoplt");
                  action.setParams({
                    'lstoplt': component.get("v.ServiceItemList")
                  });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                   
                    var storeResponse = response.getReturnValue();
                   
                    component.set("v.ServiceItemList", storeResponse);
                   
                     component.set("v.HideSpinner", false);
                    component.set("v.showSaveCancelBtn",false);
                  
                }
            });
            $A.enqueueAction(action);
      
    },
    
   
})