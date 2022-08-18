({
    doInit : function(component, event, helper) {
          var actions = [
            { label: 'Edit', name: 'edit' }
            
        ];
	 component.set( 'v.Entitycolumns', [    
            {label: 'Entity Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},
          {label: 'Type', fieldName: 'RecordType', type: 'text'}, 
            {label: 'Case', fieldName: 'CaseNumber', type: 'text'},    
            {label: 'Consult Scheduled', fieldName: 'Consult_Scheduled__c', type: 'Date'},
         {label: '	Assigned Paralegal', fieldName: 'AssignedP', type: 'text'},
           {label: 'LivingTrustAttorney', fieldName: 'LivingTrustAttorney', type: 'text'},
            {label: 'Documents Complete', fieldName: 'Documents_Complete__c', type: 'Date'},
           {label: 'Date Shipped', fieldName: 'Date_Shipped__c', type: 'Date'},
          { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
          component.set( 'v.trustcolumns', [    
            {label: 'Entity Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},
          {label: 'Type', fieldName: 'RecordType', type: 'text'}, 
            {label: 'Case', fieldName: 'CaseNumber', type: 'text'},    
            {label: 'Consult Scheduled', fieldName: 'Consult_Scheduled__c', type: 'Date'},
         {label: '	Assigned Paralegal', fieldName: 'AssignedP', type: 'text'},
           {label: 'LivingTrustAttorney', fieldName: 'LivingTrustAttorney', type: 'text'},
            {label: 'Documents Complete', fieldName: 'Documents_Complete__c', type: 'Date'},
           {label: 'Date Shipped', fieldName: 'Date_Shipped__c', type: 'Date'},
          { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
         component.set( 'v.Salecolumns', [    
            {label: 'Sale Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
            {label: 'Stage', fieldName: 'StageName', type: 'text'},    
            {label: 'Sale Type', fieldName: 'RecordType', type: 'text'}, 
            {label: 'Amount', fieldName: 'Amount', type: 'currency'}, 
            {label: 'Balance Due', fieldName: 'ChargentSFA__Balance_Due__c', type: 'currency'},
            {label: 'Close Date', fieldName: 'CloseDate', type: 'date'},
              {label: 'Owner Full Name', fieldName: 'Owner', type: 'text'},     
 		{label: 'Entity', fieldName: 'Entity', type: 'text'},    
 {label: 'Sales Rep', fieldName: 'SalesRep', type: 'text'},   
          { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
      component.set('v.Casecolumns', [
            {label: 'Case', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_self'}}, 
         {label: 'Case RecordType', fieldName: 'CaseType', type: 'text'},    
            
             {label: 'Subject', fieldName: 'Subject', type: 'text'},  
             {label: 'Status', fieldName: 'Status', type: 'text'},  
               
          
            {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            {label: 'Date Opened', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
 {label: 'Last Modified', fieldName: 'ClosedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
                 component.set( 'v.Taskcolumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
          {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
            
         {label: 'Assigned To', fieldName: 'owner', type: 'text'},
        	{label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
       {label: 'Stage', fieldName: 'LVStage', type: 'Date'}, 
         {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'Date'},
       { type: 'action', typeAttributes: { rowActions: actions }}
              
        ]);   
                    helper.fetchRecords(component);
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
           
        }
    },
		
	
})