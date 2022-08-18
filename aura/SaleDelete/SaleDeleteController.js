({
	 doInit : function (component, event, helper){
          var accid = component.get("v.recordId");
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "RecordIDdelete", type : "String", value:accid }            
         
        ];
            flow.startFlow("Delete_Sale_TEst",inputVariables);
	}
})