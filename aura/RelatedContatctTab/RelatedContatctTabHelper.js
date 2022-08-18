({
	 fetchRecords: function( component ) { 
         	var actiongetRElatedrecord = component.get("c.getRelatedContact");
		  var TaskID = component.get("v.recordId");
      
         actiongetRElatedrecord.setParams({
             "TaskID" :TaskID
         });
         
                 actiongetRElatedrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                              
 						if(rowvalue.X2_Free_Platinum_Tickets_Used__c){
                         
                            rowvalue.displayIconName = 'utility:check';  
                        }                          
                              rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.RelatedContactRecords",rowvalues );
            component.set("v.RelatedToContact",true );
        }else{
            component.set("v.RelatedToContact",false );
        }
                         
               
                     }
	       
});
          $A.enqueueAction(actiongetRElatedrecord);
	}
})