({
    initRecords: function(component, event, helper) {
         var action = component.get("c.fetchOrderItems");
         action.setParams({ odrId : component.get("v.recordId") });
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
                  component.set("v.ItemsList", storeResponse);
                  component.set("v.showSaveCancelBtn",false);
            }
        });
        $A.enqueueAction(action);
    },
    
    Save: function(component, event, helper) { 
               var action = component.get("c.saveServiceItems");
                  action.setParams({
                    'serviceItems': component.get("v.ItemsList")
                  });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    component.set("v.ItemsList", storeResponse); 
                    component.set("v.showSaveCancelBtn",false);
                    $A.get('e.force:refreshView').fire();
                }
            });
            $A.enqueueAction(action); 
    },
    
    cancel : function(component,event,helper){ 
        window.location.reload() 
    },
    createNewOSI : function(component,event,helper){ 
        alert("New OSI");
        var pageRef = {
            type: "standard__objectPage",
            attributes: {
                objectApiName: "OrderItem",
                actionName: "new"
            },
            state: {
            }
        };
        var navService = component.find("navService");
        event.preventDefault();
        navService.navigate(pageRef);
    },
    
})