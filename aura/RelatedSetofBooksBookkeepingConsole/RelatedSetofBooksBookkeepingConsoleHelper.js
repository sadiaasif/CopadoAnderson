({
	 fetchRecords: function( component ) { 
         	var actiongetRelatedsetofbook = component.get("c.getSetofbooks");
		  var CaseID = component.get("v.recordId");
         var userId = $A.get("$SObjectType.CurrentUser.Id");
          
      
         actiongetRelatedsetofbook.setParams({
             "CaseID" :CaseID,
             "userId":userId
         });
         
                 actiongetRelatedsetofbook.setCallback(this, function(data) {
                   
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                                            
                              rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.SetofBooksRecords",rowvalues );
            component.set("v.RelatedToSetofBooks",true );
        }else{
            component.set("v.RelatedToSetofBooks",false );
        }
        }
                   
	       
});
          $A.enqueueAction(actiongetRelatedsetofbook);
	},   
    SearchHelper: function(component,event) {  
    var searchKey = component.get("v.searchKeyword");
        component.find("Id_spinner").set("v.class" , 'slds-show');
          var CaseID = component.get("v.recordId");
     var userId = $A.get("$SObjectType.CurrentUser.Id");
    var setofBooksList = component.get("v.SetofBooksRecords");
    var action = component.get("c.findByNameSetofBooks");
    action.setParams({
      "searchKey": searchKey,
    "userId":userId,
        "CaseID":CaseID
    }); 
    action.setCallback(this, function(data) {
         component.find("Id_spinner").set("v.class" , 'slds-hide');
                        var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                 var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                                            
                              rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.SetofBooksRecords",rowvalues );
            
        }
        }
    });
    $A.enqueueAction(action);  
    }
})