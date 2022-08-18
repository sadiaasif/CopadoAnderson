({
	 doInit : function (component, event, helper){
          var accid = component.get("v.recordId");
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "AccountId", type : "String", value:accid }            
         
        ];
            flow.startFlow("Create_KMS_Notes",inputVariables);
	}
})