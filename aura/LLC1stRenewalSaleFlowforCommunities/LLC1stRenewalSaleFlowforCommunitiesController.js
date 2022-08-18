({
	 doInit : function (component, event, helper){
          var Enid = component.get("v.recordId");
		var flow = component.find("flowData");
        
          var inputVariables = [
            { name : "EntityId", type : "String", value:Enid }            
         
        ];
            flow.startFlow("Entity_State_Renewal_Sale",inputVariables);
	}
})