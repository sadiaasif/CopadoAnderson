({
	 doInit : function (component, event, helper){
          var AccountId = component.get("v.recordId");       
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "AccountId", type : "String", value:AccountId }            
         
        ];
            flow.startFlow("NP_IRS_Filing_Fee",inputVariables);
	},
   	handleStatusChange: function (component, event, helper){
       if(event.getParam("status") === "FINISHED") {
           var dismissActionPanel = $A.get("e.force:closeQuickAction");
           dismissActionPanel.fire();
       }
    }
}
)