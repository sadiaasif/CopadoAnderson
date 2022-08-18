({
 doInit : function(component, event, helper) {
      /*  var caseId = component.get("v.recordId");
     alert("CaseID=="+caseId);
        var action = component.get("c.changeOwnerMethod");
        action.setParams({
            caseId : caseId
        });
        action.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                alert("Success===");
                console.log("Case Owner Changed To Current login User");
             var rec = response.getReturnValue();
             console.log(rec.OwnerId);
            }
        });
        $A.enqueueAction(action);
        $A.get('e.force:refreshView').fire();*/
 },
    ChangeOwner: function(component, event, helper) {
          var userId ='';
        if(component.get("v.selectedLookUpRecord").Id != undefined){
          userId = component.get("v.selectedLookUpRecord").Id;
        }
         var caseId = component.get("v.recordId");
        var objectname=component.get("v.sObjectName");
    
        var action = component.get("c.changeOwnerMethod");
        action.setParams({
            caseId : caseId,
            userId: userId,
            sobjectname:objectname
        });
        action.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
          
                console.log("Successfully Changed the Owner!");
           
            }
        });
        $A.enqueueAction(action);
        $A.get("e.force:closeQuickAction").fire();
        $A.get('e.force:refreshView').fire();
    }
})