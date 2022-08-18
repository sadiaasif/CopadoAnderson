({
	DeleteCase : function(component, event, helper) {
		  var accid = component.get("v.recordId");
      
         component.set("v.isModalOpen", true);
		var flow = component.find("flowData");
          var inputVariables = [
            { name : "ObjectRecorId", type : "String", value:accid }            
         
        ];
         
            flow.startFlow("Delete_Sale_TEst",inputVariables);
	},
    handleStatusChange : function (component, event) {
        
      
   if(event.getParam("status") === "FINISHED_SCREEN") {
 
     
       var outputVariables = event.getParam("outputVariables");
     
       for(var i = 0; i < outputVariables.length; i++) {
            var outputVar;
           
             console.log(outputVariables) ;
                outputVar = outputVariables[i];
        
          
                if(outputVar.value === "Deleted") {
                    alert("Record deleted Successfully.");
                   	var eUrl= $A.get("e.force:navigateToURL");
    eUrl.setParams({
      "url": "https://platinum.force.com/aba/s/account/Account/00B4P000007mZF6UAM"
    });
    eUrl.fire();
                }else{
                    alert('You do not have the permission to delete the record!');
                    component.set("v.isModalOpen", false);
                }
       }
 
   }
}, closeModel: function(component, event, helper) {
     
      component.set("v.isModalOpen", false);
   }
})