({
    doInit : function(component, event, helper) {
	 component.set( 'v.SetofBookscolumns', [    
            {label: 'Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
            {label: 'Bookkeeper Name', fieldName: 'Bookkeeper__c', type: 'text'},    
         {label: 'Bookkeeper Reviewer Name', fieldName: 'Bookkeeping_Reviewer__c', type: 'text'},
           {label: 'Fiscal Year End', fieldName: 'Fiscal_Year_End__c', type: 'text'}
            
          
        ]);
      
                    helper.fetchRecords(component);
    },
        Search: function(component, event, helper) {
         var searchField = component.find('searchField');
       
            helper.SearchHelper(component, event);
        }
		
	
})