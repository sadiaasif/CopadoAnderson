({
	 fetchRecords: function( component ) { 
         	var actiongetRelatedSalesrecord = component.get("c.getRelatedSales");
		  var TaskID = component.get("v.recordId");
      
         actiongetRelatedSalesrecord.setParams({
             "TaskID" :TaskID
         });
         
                 actiongetRelatedSalesrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                               
                                  rowvalue.RecordType = rowvalue.RecordType.Name;  
                              
                                  rowvalue.Owner = rowvalue.Owner.Name;  
                          
               			 if(rowvalue.Sales_Rep__c!=null && rowvalue.Sales_Rep__c!=''){
                                  rowvalue.SalesRep = rowvalue.Sales_Rep__r.Name;  
                              }
                 		if(rowvalue.Entity__c!=null && rowvalue.Entity__c!=''  ){
                                  rowvalue.Entity = rowvalue.Entity__r.Name;  
                              }
 						                      
                              rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.SaleRecords",rowvalues );
            component.set("v.RelatedToSale",true );
        }else{
            component.set("v.RelatedToSale",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRelatedSalesrecord);
	}
})