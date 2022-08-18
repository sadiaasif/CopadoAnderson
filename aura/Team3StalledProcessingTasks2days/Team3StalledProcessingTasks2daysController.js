({
    doInit:function(component, event, helper) {
          var today = new Date();
        component.set('v.Starttoday', today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());
         component.set('v.Endtoday', today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());
          var actions = [
            { label: 'Edit', name: 'edit' }
            
        ];
        
    component.set( 'v.Taskcolumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
             {label: 'Entity Name', fieldName: 'EntityName', type: 'text'}, 
         {label: 'Client Name', fieldName: 'ClientName', type: 'text'}, 
         	{label: 'Assigned To', fieldName: 'owner', type: 'text'},
         	{label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
         {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
       {label: 'Last Modified', fieldName: 'LastModifiedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            { type: 'action', typeAttributes: { rowActions: actions }}
              
        ]);   

      

            helper.fetchAccounts(component);
    },
        Search: function(component, event, helper) {
       
       
  helper.SearchHelper(component, event);
        
              
    },
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'edit':
                var editRecordEvent = $A.get("e.force:editRecord");
                editRecordEvent.fire({
                    "recordId":  row.Id
                });
                break;
            case 'delete':
                var page = component.get("v.page") || 1;
                helper.delete(component, page, row.Id);
                break;
        }
    }
});