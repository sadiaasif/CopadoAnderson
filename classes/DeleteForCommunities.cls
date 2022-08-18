public  without sharing class DeleteForCommunities {
    @InvocableMethod(label='Delete' description='Delete the record based on id')
  public static  List<String> DeleteForCommunitiesMethod(List<String> objrecordIds) {
      List<String> Candelete=new List<string>();
   Boolean hasCustomPermissionen = FeatureManagement.checkPermission('Allowdeleteentities');
       Boolean hasCustomPermissionopp = FeatureManagement.checkPermission('Allowdeleteopportunities');
       Boolean hasCustomPermissionclient = FeatureManagement.checkPermission('Allowdeleteclients');
       Boolean hasCustomPermissionSE = FeatureManagement.checkPermission('AllowdeleteSaleentities');
      Boolean hasCustomPermissionCC = FeatureManagement.checkPermission('Allowdeletecreditcard');
      Boolean hasCustomPermissionTasks = FeatureManagement.checkPermission('Allowdeletetasks');
      Boolean hasCustomPermissionleads = FeatureManagement.checkPermission('Allowdeleteleads');
      Boolean hasCustomPermissionCase = FeatureManagement.checkPermission('AllowDeleteCases');
      Boolean hasCustomPermissionsetofBooks = FeatureManagement.checkPermission('AllowDeleteSetOfBooks');
       Boolean hasCustomPermissionorder = FeatureManagement.checkPermission('AllowDeleteOrder');
      System.debug('Custom permission=='+hasCustomPermissionen);
               List<SObject> deleterecord=new List<SObject>();
// Put the Id's and associated name values in the map
      for(String  objrecordId:objrecordIds){
          System.debug('id=='+objrecordId);
          Id objId=objrecordId;
          Schema.SObjectType sobjectType = objId.getSObjectType();
String sobjectName = sobjectType.getDescribe().getName();
          if( sobjectName=='Entities__c'){
              if(hasCustomPermissionen ){
              String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          } 
          }else if( sobjectName=='account'){
                  if(hasCustomPermissionclient ){
              String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }else if(sobjectName=='opportunity'){
                  if(hasCustomPermissionopp ){
              String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }else if (sobjectName=='SaleEntity__c'){
                  if(hasCustomPermissionSE ){
              String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }else if(sobjectName=='task'){
                  if(hasCustomPermissionTasks ){
              String query='Select Id From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }else if(sobjectName=='Credit_Card_Detail__c'){
                  if(hasCustomPermissionCC ){
              String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }  else if(sobjectName=='Lead'){
                  if(hasCustomPermissionleads ){
              String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          } else if(sobjectName=='Case'){
                  if(hasCustomPermissionCase ){
              String query='Select Id From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }
          else if(sobjectName=='Set_of_Books__c'){
                  if(hasCustomPermissionsetofBooks ){
              String query='Select Id From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }
          else if(sobjectName=='Order'){
                  if(hasCustomPermissionorder ){
              String query='Select Id From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }
          }
          else{
               String query='Select Id, Name From ' + sobjectName + ' Where Id =\''+objrecordId+'\'';
    System.debug('Query=='+query);
SObject record = Database.query(query);
          deleterecord.add(record);
          }        

      }
 
      if(deleterecord.size()>0){
           delete deleterecord;
          Candelete.add('Deleted');
         
      }else{
           Candelete.add('Not Deleted');
            
      }
       return Candelete;
                               
    }
}