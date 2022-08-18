({
	 doInit : function (component, event, helper){
          var AccountId = component.get("v.recordId");       
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "AccountId", type : "String", value:AccountId }            
         
        ];
            flow.startFlow("Sale_Create_Filing_Fees_Sale",inputVariables);
	},
   handleStatusChange: function (component, event, helper){
    if(event.getParam("status") === "FINISHED") {
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
        }
}
}
)