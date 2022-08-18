({
    doInit : function(component, event, helper) {
	 component.set( 'v.RelatedContactcolumns', [    
            {label: 'Contact Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
            {label: 'Account Roles', fieldName: 'Account_Roles__c', type: 'text'},    
            {label: 'Email', fieldName: 'Email', type: 'text'}, 
            {label: 'Phone', fieldName: 'Phone', type: 'number'}, 
            {label: 'Mobile', fieldName: 'MobilePhone', type: 'currency'},
            {label: 'Nickname', fieldName: 'Nickname__c', type: 'text'},
              {label: '2 Free Platinum Tickets Used', fieldName: 'X2_Free_Platinum_Tickets_Used__c', type: 'boolean'},     
 	 
        ]);
                    helper.fetchRecords(component);
    }
		
	
})