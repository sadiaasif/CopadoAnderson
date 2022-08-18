({
	 doInit : function (component, event, helper){
          var accIDinput = component.get("v.recordId");
		var flow = component.find("flowData");
        
        
          var inputVariables = [
            { name : "AccountID", type : "String", value:accIDinput }   
              
         
        ];
            flow.startFlow("Account_Credit_Sale_creation",inputVariables);
	}
})