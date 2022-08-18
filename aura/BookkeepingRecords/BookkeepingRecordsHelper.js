({
	 fetchRecords: function( component ) { 
         	var actiongetRelatedBookkeepingecords = component.get("c.getbookkeepingRecords");
		  var CaseID = component.get("v.recordId");
         var userId = $A.get("$SObjectType.CurrentUser.Id");
          
      
         actiongetRelatedBookkeepingecords.setParams({
             "CaseID" :CaseID,
             "userId":userId
         });
         
                 actiongetRelatedBookkeepingecords.setCallback(this, function(data) {
                   
                   
                   var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                 if(rowvalue.Set_of_Books__c!=null && rowvalue.Set_of_Books__c!=''  ){
                                  rowvalue.setofBooks = rowvalue.Set_of_Books__r.Name;  
                              }
                       if(rowvalue.Entity__c!=null && rowvalue.Entity__c!=''  ){
                                  rowvalue.Entities = rowvalue.Entity__r.Name;  
                              }
                rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.BookkeepingRecords",rowvalues );
            component.set("v.RelatedToBookkeeping",true );
        }else{
            component.set("v.RelatedToBookkeeping",false );
        }
        }
                   
	       
});
          $A.enqueueAction(actiongetRelatedBookkeepingecords);
	},   
    SearchHelper: function(component,event) {  
    var searchKey = component.get("v.searchKeyword");
        component.find("Id_spinner").set("v.class" , 'slds-show');
          var CaseID = component.get("v.recordId");
     var userId = $A.get("$SObjectType.CurrentUser.Id");
    var BookkeepingRecordList = component.get("v.BookkeepingRecords");
    var action = component.get("c.findByNameBookkeepingRecords");
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
                 if(rowvalue.Set_of_Books__c!=null && rowvalue.Set_of_Books__c!=''  ){
                                  rowvalue.setofBooks = rowvalue.Set_of_Books__r.Name;  
                              }
                       if(rowvalue.Entity__c!=null && rowvalue.Entity__c!=''  ){
                                  rowvalue.Entities = rowvalue.Entity__r.Name;  
                              }
                rowvalue.linkName = '/'+rowvalue.Id;
                      
            			}
              component.set("v.BookkeepingRecords",rowvalues );
           
        }
        }
    });
    $A.enqueueAction(action);  
    }
})