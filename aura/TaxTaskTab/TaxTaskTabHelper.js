({
	 fetchRecords: function( component ) { 
         	var actiongetTaxtaskrecord = component.get("c.getTaxtasks");
		   var ClientId = component.get("v.recordId");
      
         actiongetTaxtaskrecord.setParams({
             "ClientId" :ClientId
         });
         
                 actiongetTaxtaskrecord.setCallback(this, function(data) {
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                              if(rowvalue.Client__c!=null && rowvalue.Client__c!=''  ){
                                  rowvalue.ClientName = rowvalue.Client__r.Name;  
                              }
                              if(rowvalue.WhatId!=null && rowvalue.WhatId!=''  ){
                                   rowvalue.RealtedName = rowvalue.What.Name;
                              } 
                              if(rowvalue.OwnerId!=null && rowvalue.OwnerId!=''  ){
                                  rowvalue.OwnerName = rowvalue.Owner.Name;
                              }
                          
                              
                               
                              
                              rowvalue.linkName = '/'+rowvalue.Id;
                             
                             
                                
                             
            			}
                 component.set("v.TaxTaskRecords",rowvalues );
                     }
	       
});
          $A.enqueueAction(actiongetTaxtaskrecord);
	},
     toastMsg : function( strType, strMessage ) {  
          
        var showToast = $A.get( "e.force:showToast" );   
        showToast.setParams({   
              
            message : strMessage,  
            type : strType,  
            mode : 'sticky'  
              
        });   
        showToast.fire();   

    },
    SearchHelper: function(component,event) {  
    var searchKey = component.get("v.searchKeyword");
        component.find("Id_spinner").set("v.class" , 'slds-show');
          var ClientId = component.get("v.recordId");
    var taskList = component.get("v.TaxTaskRecords");
    var action = component.get("c.findByName");
    action.setParams({
      "searchKey": searchKey,
   
        "ClientId":ClientId
    }); 
    action.setCallback(this, function(data) {
         component.find("Id_spinner").set("v.class" , 'slds-hide');
                        var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                                if(rowvalue.Client__c!=null && rowvalue.Client__c!=''  ){
                                  rowvalue.ClientName = rowvalue.Client__r.Name;  
                              }
                              if(rowvalue.WhatId!=null && rowvalue.WhatId!=''  ){
                                   rowvalue.RealtedName = rowvalue.What.Name;
                              } 
                              if(rowvalue.OwnerId!=null && rowvalue.OwnerId!=''  ){
                                  rowvalue.OwnerName = rowvalue.Owner.Name;
                              }
                                
                                rowvalue.linkName = '/'+rowvalue.Id;
            			}
                 component.set("v.TaxTaskRecords",rowvalues );
                     }
    });
    $A.enqueueAction(action);  
    }
})