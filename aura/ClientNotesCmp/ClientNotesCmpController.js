({
    init : function(component, event, helper) {
        component.set( 'v.Notescolumns', [{type: "button", typeAttributes: {label: 'View',name: 'View',title: 'View',
                                                                            disabled: false,value: 'View',
                                                                            iconPosition: 'Right',
                                                                            alternativeText:"View More"}},
                                          {label: 'Notes', fieldName: 'Notes__c',  initialWidth: 400,type: 'text',
                                           wrapText: true,editable: 'true'},
                                          {label: 'Created By', fieldName: 'CreatedBy', type: 'text'},
                                          {label: 'Created Date', fieldName: 'Created', type: 'datetime'},
                                         ]);
        helper.getTypePicklistValues(component, event, helper);
        helper.getClientNotes(component, event, helper);
    },
    closeNotesModel: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.isNotesModalOpen", false);
    },
    submitNotesDetails: function(component, event, helper) {
        // Set isModalOpen attribute to false
        //Add your code to call apex method or do some processing
        component.set("v.isNotesModalOpen", false);
        //helper.fetchAccounts(component);
    },
    OpenNotesDetail: function(component, event, helper) {
       
        var rowId = event.getParam('row').Id;
        debugger;
        component.set("v.NotesID", rowId);
        component.set("v.isNotesModalOpen", true);
        
    },
    UpdateNotes: function(component, event, helper) {
        helper.UpdateNotes(component, event, helper);      
    },
    onFilterNoteTypeChange: function(component, event, helper) {
        var selectedType = component.find("NotesFilterList").get("v.value");
        
        var accId = component.get("v.recordId");
        
        var actionNoteTypeFilter = component.get("c.getFilterdNotes");
        
        console.log(accId);
        actionNoteTypeFilter.setParams({
            "accId":accId,
            "NoteType":selectedType
        });
        actionNoteTypeFilter.setCallback(this, function(data) {
            var state = data.getState()
            if (component.isValid() && state === 'SUCCESS') {
                var rowvalues=   data.getReturnValue();
                
                for (var i = 0; i < rowvalues.length; i++) {
                    var rowvalue = rowvalues[i];
                    if(rowvalue.Notes__c){
                        var regex = /(<([^>]+)>)/ig;
                        var quotesdouble=/(&quot\;)/g;
                        var anpop=/(&amp\;)/g;
                        var quotesingle=/(&#39\;)/g;
                        var enteredNotes=rowvalue.Notes__c;
                        
                        var ModifiedNote=enteredNotes.replace(regex, ' ');
                        
                        var Notesquotes=ModifiedNote.replace(quotesdouble,'"');
                        var Notesandd=Notesquotes.replace(anpop,'&');
                        var Notessingle=Notesquotes.replace(quotesingle,'\'');
                        
                        rowvalue.Notes__c=Notessingle;
                        
                    }
                    
                    if(rowvalue.CreatedBy.Name){
                        rowvalue.CreatedBy=rowvalue.CreatedBy.Name;
                    }
                    if(rowvalue.CreatedDate){
                        var cDate=rowvalue.CreatedDate;
                        rowvalue.Created=$A.localizationService.formatDate(cDate, "MMMM dd yyyy, hh:mm:ss a")
                    }
                    
                    rowvalue.linkName = '/'+rowvalue.Id;
                    
                }
                component.set("v.NotesRecords",rowvalues );  
            }        
        });
        $A.enqueueAction( actionNoteTypeFilter ); 
        
    },
    onSelectNoteTypeChange: function(component, event, helper) {
        
        var selectedType = component.find("NotestypeList").get("v.value");
        
        if(selectedType!='None'){
            component.set("v.NotesTypeSelected", true);
        }else{
            component.set("v.NotesTypeSelected", false);
        }
        
        
    },
})