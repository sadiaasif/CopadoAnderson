({
	doInit : function(component, event, helper) {
        
        var Cid= component.get("v.recordId");
      var sobject = component.get('v.objName');
var ReportLink = component.get("v.accountRecord").Sales_Printable_URL__c;

        window.open(ReportLink,'_blank');
 $A.get("e.force:closeQuickAction").fire();
	/*	var eUrl= $A.get("e.force:navigateToURL");
    eUrl.setParams({
      "url": ReportLink
    });
    eUrl.fire();*/
	}
})