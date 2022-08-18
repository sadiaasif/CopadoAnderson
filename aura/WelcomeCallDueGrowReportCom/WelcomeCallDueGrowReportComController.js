({
	doInit : function(component, event, helper) {
        
        var Cid= component.get("v.recordId");
        var sobject = component.get('v.objName');
        var ReportLink = "https://app.gogrow.com/dashboard/share/81136c142284118f1b86611fe8b0912b";
        
        window.open(ReportLink,'_blank');
       
    }
})