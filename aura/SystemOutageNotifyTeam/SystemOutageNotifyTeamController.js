({
   doinit : function(component, event, helper) {
     var flow = component.find("Quick Account");
     flow.startFlow("Salesforce_Team_System_Outage_Notify_Team");
   }
})