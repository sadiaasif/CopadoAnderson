({
    doInit : function(component, event, helper) {
        component.set( 'v.AdvisorscallTaskcolumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
            
            {label: 'Assigned To', fieldName: 'owner', type: 'text'},
            {label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
            
            {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
        ]);   
        component.set( 'v.ServicecallTaskcolumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
            
         	{label: 'Assigned To', fieldName: 'owner', type: 'text'},
         	{label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
     
         {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }}, 
        ]);    
        helper.getLoggedCalls(component, event, helper);
     }
 })