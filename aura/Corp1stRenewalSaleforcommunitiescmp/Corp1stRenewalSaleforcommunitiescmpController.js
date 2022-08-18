({
	 doInit : function (component, event, helper){
          var Enid = component.get("v.recordId");
		var flow = component.find("flowData");
        
          var inputVariables = [
            { name : "EntityId", type : "String", value:Enid }            
         
        ];
            flow.startFlow("Renewal_Sale_Corp_Flow",inputVariables);
	}
})