({
    doInit : function(component, event, helper) {
        
        var accid= component.get("v.recordId");
        var sobject = component.get('v.objName');
        var RedirectLink = 'https://lucid.app/sfdc/accountMap/'+accid +'?tag=entitymap';
        
        window.open(RedirectLink,'_blank');
        $A.get("e.force:closeQuickAction").fire();
        /*	var eUrl= $A.get("e.force:navigateToURL");
    eUrl.setParams({
      "url": ReportLink
    });
    eUrl.fire();*/
    }
})