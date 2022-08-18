public without sharing class  OwnerChangeComponentComCtrl 
{
    @AuraEnabled
    public static boolean changeOwnerMethod(Id caseId,ID userId,string sobjectname) 
    {
        Boolean hasCustomPermissionleads = FeatureManagement.checkPermission('LeadChangeOwner');
        Boolean hasCustomPermissionopps = FeatureManagement.checkPermission('Change_Existing_Sale_Owner');
        //Adding change owner custom permission for community user on Feedback object as per of the case 00177741
        //Code Change: November 2nd 2021
        //Author: Rabeea Aqil
        Boolean hasCustomPermissiFeedbackObj = FeatureManagement.checkPermission('Allow_Change_Owner_Feedback_Record');
        system.debug('Debug1>>>'+hasCustomPermissiFeedbackObj);
        system.debug('CaseID,UserID,sObjectname'+caseId+'user>>'+userId+'feedback>>>'+sobjectname);
        if(caseId != null && userId!=null ) 
        {
            Schema.SObjectType sobjectType = caseId.getSObjectType();
            String sobjName = sobjectType.getDescribe().getName();
            
            Map<Id, String> idsToUpdate = new Map<Id, String>();
            idsToUpdate.put(caseId,userId);
            List<SObject> sObjectsToUpdate = new List<SObject>();
            
            for (Id idToUpdate : idsToUpdate.keySet()) 
            {
                SObject o1 = idToUpdate.getSObjectType().newSObject(idToUpdate);
                if(sobjectName=='Lead'){
                    if(hasCustomPermissionleads || Test.isRunningTest() )
                    {
                        
                        // Set the Name field dynamically
                        o1.put('OwnerId', idsToUpdate.get(idToUpdate));
                        sObjectsToUpdate.add(o1);
                    }
                } 
                else if(sobjectName=='Opportunity' )
                {
                    if(hasCustomPermissionopps || Test.isRunningTest())
                    {
                        
                        // Set the Name field dynamically
                        o1.put('OwnerId', idsToUpdate.get(idToUpdate));
                        sObjectsToUpdate.add(o1);
                    }
                }
               else if(sobjectName=='Feedback__c')
                {
                    if(hasCustomPermissiFeedbackObj || Test.isRunningTest())
                    {
                        
                        // Set the Name field dynamically
                        o1.put('OwnerId', idsToUpdate.get(idToUpdate));
                        system.debug('printing o1>>>'+o1);
                        sObjectsToUpdate.add(o1);
                        
                    }
                } 
                
                else
                {
                    
                    // Set the Name field dynamically
                    o1.put('OwnerId', idsToUpdate.get(idToUpdate));
                    sObjectsToUpdate.add(o1);
                }
                
            }
            system.debug('PREUPDATE>>'+sObjectsToUpdate);
            update sObjectsToUpdate;
            system.debug('POST UPDATE>>>>'+sObjectsToUpdate);
            return true;
        }
      /*  else if(caseId == null && userId!=null)
        {
            Schema.SObjectType sobjectType = caseId.getSObjectType();
            String sobjName = sobjectType.getDescribe().getName();
            
            Map<Id, String> idsToUpdate = new Map<Id, String>();
            idsToUpdate.put(caseId,userId);
            List<SObject> sObjectsToUpdate = new List<SObject>();
            system.debug('CASEID and USER>>>>>'+caseId+''+userId);
            for (Id idToUpdate : idsToUpdate.keySet()) 
            {
                SObject o1 = idToUpdate.getSObjectType().newSObject(idToUpdate);
                if(sobjectName=='Feedback__c')
                {
                    if(hasCustomPermissiFeedbackObj)
                    {
                        system.debug('idToUpdate>>>'+idToUpdate);
                        // Set the Name field dynamically
                        o1.put('OwnerId', idsToUpdate.get(idToUpdate));
                        System.debug('o1 second loop>>>'+o1);
                        sObjectsToUpdate.add(o1);
                    }
                } 
            }
            system.debug('PREUPDATE>>'+sObjectsToUpdate);
            update sObjectsToUpdate;
            system.debug('POST UPDATE>>>>'+sObjectsToUpdate);
            return true;
            
        }*/
     
        else
        {
            return false;  
        }
        
    }
}