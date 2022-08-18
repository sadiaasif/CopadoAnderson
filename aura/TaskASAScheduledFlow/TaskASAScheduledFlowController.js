({
	 doInit : function (component, event, helper){
          var AccountId = component.get("v.recordId");       
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "AccountID", type : "String", value:AccountId }            
         
        ];
            flow.startFlow("ASA_Task_to_Jaime",inputVariables);
	},
   handleStatusChange: function (component, event, helper){
    if(event.getParam("status") === "FINISHED") {
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
        }
}
}
)