({
	 fetchRecords: function( component ) { 
         	var actiongetRelatedContactrecord = component.get("c.getSaleEntities");
		  var TaskID = component.get("v.recordId");
      
         actiongetRelatedContactrecord.setParams({
             "TaskID" :TaskID
         });
         
                 actiongetRelatedContactrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                                if(rowvalue.Opportunity__c!=null && rowvalue.Opportunity__c!=''  ){
                                  rowvalue.Opportunity = rowvalue.Opportunity__r.Name;  
                              }
 						if(rowvalue.Filing_Fees_Paid__c){
                         
                            rowvalue.displayIconName = 'utility:check';  
                        }                          
                              rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.SaleEntitiesRecords",rowvalues );
            component.set("v.RelatedToSaleEntity",true );
        }else{
            component.set("v.RelatedToSaleEntity",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRelatedContactrecord);
	}
})