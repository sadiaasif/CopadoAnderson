({
	fetchListOfRecordTypes: function(component, event, helper) {
      
      var action = component.get("c.fetchRecordTypeValues");
         var casId=component.get("V.recordId");
      action.setCallback(this, function(response) {
         component.set("v.lstOfRecordType", response.getReturnValue());
      });
      $A.enqueueAction(action);
          
      var action1 = component.get("c.getPrimaryClient");
         action1.setParams({
         "CaseId": casId
      });
      action1.setCallback(this, function(response) {
         component.set("v.PrimaryClient", response.getReturnValue());
      });
      $A.enqueueAction(action1);
        
       
   },
 
 
   createRecord: function(component, event, helper) {
  
 
      var action = component.get("c.getRecTypeId");
       var casId=component.get("V.recordId");
       var PrimaryClientId=component.get("V.PrimaryClient");
      
      var recordTypeLabel = component.find("selectid").get("v.value");
      action.setParams({
         "recordTypeLabel": recordTypeLabel
      });
      action.setCallback(this, function(response) {
         var state = response.getState();
         if (state === "SUCCESS") {
            var createRecordEvent = $A.get("e.force:createRecord");
            var RecTypeID  = response.getReturnValue();
            createRecordEvent.setParams({
               "entityApiName": 'Entities__c',
               "recordTypeId": RecTypeID,
                 'defaultFieldValues': {
                    'Case__c' : casId,
                     'Primary_Client__c':PrimaryClientId,
                }
            });
            createRecordEvent.fire();
             
         } else if (state == "INCOMPLETE") {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
               "title": "Oops!",
               "message": "No Internet Connection"
            });
            toastEvent.fire();
             
         } else if (state == "ERROR") {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
               "title": "Error!",
               "message": "Please contact your administrator"
            });
            toastEvent.fire();
         }
      });
      $A.enqueueAction(action);
   },
 
   closeModal: function(component, event, helper) {
   
      component.set("v.isOpen", false);
   },
 
   openModal: function(component, event, helper) {
     
      component.set("v.isOpen", true);
   },
})