({
	 doInit : function (component, event, helper){
          var RefundIDinput = component.get("v.recordId");
		var flow = component.find("flowData");
        
        
          var inputVariables = [
            { name : "RefundID", type : "String", value:RefundIDinput }   
              
         
        ];
            flow.startFlow("Refund_Credit_Wizard",inputVariables);
	}
})