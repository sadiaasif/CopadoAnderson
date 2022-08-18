({ 
    fetchPickListVal: function(component, fieldName, picklistOptsAttributeName) {
        var action = component.get("c.getselectOptions");
        action.setParams({
            "objObject": component.get("v.objInfoForPicklistValues"),
            "fld": fieldName
        });
        var opts = [];
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.set("v." + picklistOptsAttributeName, opts);
            }
        });
        $A.enqueueAction(action);
    },
    
    fetchDepPickListVal: function(component, picklistOptsAttributeName, typeName) {
        var action = component.get("c.getDependentPicklistValues");
        var opts = [];
        var newMap = new Map();
        var newList = [];
        action.setParams({
            "typeValue": typeName
        });
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValuesMap = response.getReturnValue();
                for(var key in allValuesMap){
                    newList = allValuesMap[key];
                    opts = [];
                    for(var i = 0; i < newList.length; i++){
                        opts.push({
                            class: "optionClass",
                            label: newList[i],
                            value: newList[i]
                        });
                    }
                    newMap[key] = opts;
                }
                component.set("v." + picklistOptsAttributeName, newMap);
                component.set("v.stageEditMode", true);
                var depPicklistOptionsMap = new Map(); 
                depPicklistOptionsMap = component.get("v.stagePicklistOpts");
                //alert(depPicklistOptionsMap);
                //alert("depMap: " + JSON.stringify(depPicklistOptionsMap));
                var typeName = component.get("v.singleRec.Type__c");
                //alert(depPicklistOptionsMap[typeName]);
                
                component.find("accRating").set("v.options" , depPicklistOptionsMap[typeName]);
                setTimeout(function(){ 
                    component.find("accRating").focus();
                }, 100);
            }
        });
        $A.enqueueAction(action);
    },
    
})