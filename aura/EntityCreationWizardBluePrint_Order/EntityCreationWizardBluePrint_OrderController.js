({
	 doInit : function (component, event, helper){
          var accid = component.get("v.recordId");
          var action= component.get("c.actid");
         action.setParams(
             {
                 "orderid" : accid
             }
         );
         
         action.setCallback(this, function(response){
             let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accountId", response.getReturnValue());
                var actid=component.get("v.accountId");
                var flow = component.find("flowData");
                var inputVariables = [
              { name : "AccountId", type : "String", value:actid }            
         
        ];
            flow.startFlow("Blueprint_Entity_Creation_Wizard",inputVariables);
                
            }
                             
        });
        $A.enqueueAction(action);    
         
	}
})