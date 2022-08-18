({
	doInit : function(component, event, helper) {
		 var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Entities__c",
    "defaultFieldValues": {
        'Phone' : '415-240-6590',
        'Account' : '001xxxxxxxxxxxxxxx'
    }
        });
        createRecordEvent.fire();
	}
})