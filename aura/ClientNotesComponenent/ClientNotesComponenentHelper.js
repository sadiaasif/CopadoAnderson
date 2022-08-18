({
	fetchNotes :  function( component ) {
		   var actiongetstructureNotes = component.get("c.getstructureNotes");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetstructureNotes.setParams({
            "accId":accId
        });
        actiongetstructureNotes.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                              if(rowvalue.Notes__c){
                                  var regex = /(<([^>]+)>)/ig;
                                  var enteredNotes=rowvalue.Notes__c;
                                 
                                   var ModifiedNote=enteredNotes.replace(regex, ' ');
                                   rowvalue.Notes__c=ModifiedNote;
                                  
                              }
                              if(rowvalue.CreatedDate){
                                  var cDate=rowvalue.CreatedDate;
                                  rowvalue.Created=$A.localizationService.formatDate(cDate, "MMMM dd yyyy, hh:mm:ss a")
                              }
                             
                              if(rowvalue.CreatedBy.Name){
                                    rowvalue.CreatedBy=rowvalue.CreatedBy.Name;
                              }
                                
                                  
                              
                            
                            
                   
            			}
                 component.set("v.StructureNotesRecords",rowvalues );  
    }        
        });
        
          var actiongetTaxNotes = component.get("c.getTaxNotes");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetTaxNotes.setParams({
            "accId":accId
        });
        actiongetTaxNotes.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                              if(rowvalue.Notes__c){
                                  var regex = /(<([^>]+)>)/ig;
                                  var enteredNotes=rowvalue.Notes__c;
                                 
                                   var ModifiedNote=enteredNotes.replace(regex, ' ');
                                   rowvalue.Notes__c=ModifiedNote;
                                  
                              }
                              if(rowvalue.CreatedDate){
                                  var cDate=rowvalue.CreatedDate;
                                  rowvalue.Created=$A.localizationService.formatDate(cDate, "MMMM dd yyyy, hh:mm:ss a")
                              }
                             
                              if(rowvalue.CreatedBy.Name){
                                    rowvalue.CreatedBy=rowvalue.CreatedBy.Name;
                              }
                                
                                  
                              
                            
                            
                   
            			}
                 component.set("v.TaxNotesRecords",rowvalues );  
    }        
        });
          var actionNoteTypePicklist = component.get("c.getNotesTypepicklist");
       // var inputEntity = component.find("EntityList");
     
        actionNoteTypePicklist.setCallback(this, function(data) {
           
        var state = data.getState();
            if (state === "SUCCESS"){
                 var result = data.getReturnValue();
               
                var NotesTypeMap = [];
                for(var key in result){
                    NotesTypeMap.push({key: key, value: result[key]});
                      
                }
                component.set("v.NotesTypeList", NotesTypeMap);
            }
           
             
        });
        
         $A.enqueueAction(actiongetTaxNotes);
         $A.enqueueAction(actiongetstructureNotes); 
           $A.enqueueAction(actionNoteTypePicklist);
	},  
    toastMsg : function( strType, strMessage ) {  
        
        var showToast = $A.get( "e.force:showToast" );   
        showToast.setParams({   
            
            message : strMessage,  
            type : strType,  
            mode : 'sticky'  
            
        });   
        showToast.fire();   
        
    }  
})