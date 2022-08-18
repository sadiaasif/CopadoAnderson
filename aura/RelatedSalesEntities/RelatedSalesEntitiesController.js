({
    doInit : function(component, event, helper) {
	 component.set( 'v.SaleEntitiescolumns', [    
            {label: 'Sale Entity Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
            {label: 'Opportunity', fieldName: 'Opportunity', type: 'text'},    
            {label: 'Sale Type', fieldName: 'Sale_Type__c', type: 'text'}, 
            {label: 'Amount', fieldName: 'Amount__c', type: 'currency'}, 
            {label: 'Balance Due', fieldName: 'Balance_Due__c', type: 'currency'},
            {label: 'Contract Effective Date', fieldName: 'Contract_Effective_Date__c', type: 'date'},
              {label: 'Contract End Date', fieldName: 'Contract_End_Date__c', type: 'date'},     
 		{label: 'Renewal State', fieldName: 'Renewal_State__c', type: 'text'},    
 {label: 'Filing Fees Paid', fieldName: 'Filing_Fees_Paid__c', type: 'boolean'}   
          
        ]);
                    helper.fetchRecords(component);
    }
		
	
})