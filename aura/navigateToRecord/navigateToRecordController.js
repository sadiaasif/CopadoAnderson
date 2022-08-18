({    invoke : function(component, event, helper) {
   // Get the record ID attribute
   var record = component.get("v.recordId");
   var address = '/s/detail/' + record;
   
   // Get the Lightning event that opens a record in a new tab
   var redirect = $A.get("e.force:navigateToURL");
   
   // Pass the record ID to the event
   redirect.setParams({
      "url":address,
      "recordId": record
   });
        
   // Open the record
   redirect.fire();
}})