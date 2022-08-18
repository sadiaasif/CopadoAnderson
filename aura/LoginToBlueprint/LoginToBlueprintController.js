({
    doInit : function(component, event, helper) {
	var action = component.get("c.getAccount");
        var accountId = component.get("v.recordId");
        action.setParams({
                    recordId: accountId
                });
        action.setCallback(this, function(response) {
            var state = response.getState();
            var storeResponse = response.getReturnValue(); 
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
               
               // set current user information on userInfo attribute
                component.set("v.AccountInfo", storeResponse);
                var accountInfo=component.get('v.AccountInfo');
                var LinkToblueprint='https://andersonblueprint.com/blueprintnew?accNo=' + accountInfo.Name + '&AccountNo='+accountInfo.Account_Number__c;
                 	var eUrl= $A.get("e.force:navigateToURL");
    eUrl.setParams({
      "url": LinkToblueprint
    });
    eUrl.fire();
              $A.get("e.force:closeQuickAction").fire();
            }
        });
        $A.enqueueAction(action);
    },
   /* handleOpenNewWindowWithRecordId : function(component, event, helper) {
        var recordId = component.get('v.recordId');
        var accountInfo=component.get('v.AccountInfo');
        //window.open('https://andersonblueprint.com/newblueprint_uat/?' + recordId,'_blank');
        window.open('https://andersonblueprint.com/blueprintnew?accNo=' + accountInfo.Name + '&AccountNo='+accountInfo.Account_Number__c, '_blank');
    }*/
    
})