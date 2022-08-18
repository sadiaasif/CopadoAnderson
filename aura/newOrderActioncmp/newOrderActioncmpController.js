({
	 doInit : function (component, event, helper){
          var saleId = component.get("v.recordId");
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "varSaleId", type : "String", value:saleId }            
         
        ];
            flow.startFlow("Fulfillment_Sale_Create_Order",inputVariables);
	}
})