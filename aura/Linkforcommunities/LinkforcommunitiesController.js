({
	doInit : function(component, event, helper) {
         var recordid=component.get("v.recordId");
   var   Link="https://platinum.force.com/aba/s/detail/"+recordid;
		              component.set("v.Link", Link);
        var lightningandclassicLink="https://andersonadvisors.my.salesforce.com/"+recordid;
           component.set("v.LightningandclssicLink", lightningandclassicLink);
	},  
    onDepChange:function(component, event, helper) {
       var Link="";
        var selectedType = component.find("DepList").get("v.value");
       var recordid=component.get("v.recordId");
     
        var SobjectType=component.get("v.sobjecttype");
      
        if(selectedType!='None'){
             component.set("v.DepSelected", true);
             if(SobjectType=='Account'){
                    SobjectType="account";
             }else if(SobjectType=='Entities__c'){
                 SobjectType="entities";
             }else if(SobjectType=='Opportunity'){
                 SobjectType="opportunity";
             }
            else if(SobjectType=='Case'){
                 SobjectType="case";
             }
            if(selectedType=='Renewal'){
               
              Link="https://platinum.force.com/Renewals/s/"+ SobjectType +'/'+recordid;
               
            }else if(selectedType=='Processing'){
                 Link="https://platinum.force.com/processing/s/"+ SobjectType +'/'+recordid;
                 
            }
            else if(selectedType=='Service'){
                 Link="https://platinum.force.com/service/s/"+ SobjectType +'/'+recordid;
                 
            } else if(selectedType=='Tax'){
                    Link="https://platinum.force.com/tax/s/"+ SobjectType +'/'+recordid;
            }
            else if(selectedType=='Accounting Coordinators'){
                    Link="https://platinum.force.com/ac/s/"+ SobjectType +'/'+recordid;
            }else if(selectedType=='Advisor Admins'){
                    Link="	https://platinum.force.com/advisoradmins/s/"+ SobjectType +'/'+recordid;
            }else if(selectedType=='Advisors'){
                    Link="https://platinum.force.com/advisors/s/"+ SobjectType +'/'+recordid;
            }else if(selectedType=='Bookkeeping'){
                    Link="https://platinum.force.com/bookkeeping/s/"+ SobjectType +'/'+recordid;
            }else if(selectedType=='Estate Planning'){
                    Link="https://platinum.force.com/estateplanning/s/"+ SobjectType +'/'+recordid;
            }else if(selectedType=='Professional Advisors'){
                    Link="https://platinum.force.com/proadvisors/s/"+ SobjectType +'/'+recordid;
            }else if(selectedType=='Renewal Advisors'){
                    Link="https://platinum.force.com/renewaladvisors2/s/"+ SobjectType +'/'+recordid;
            }
          
              component.set("v.Link", Link);
        }else{
            component.set("v.DepSelected", false);
        }
        
        
    }
})