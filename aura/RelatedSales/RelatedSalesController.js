({
    doInit : function(component, event, helper) {
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
 {label: 'Sales Rep', fieldName: 'SalesRep', type: 'text'}   
          
        ]);
                    helper.fetchRecords(component);
    }
		
	
})