({
	 doInit : function (component, event, helper){
          var oppid = component.get("v.recordId");
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "oppId", type : "String", value:oppid }            
         
        ];
            flow.startFlow("Sale_Button_Send_DocuSign_Payment_Email",inputVariables);
	}
})