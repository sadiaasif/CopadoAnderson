/*****************************************************************************************************************************
@ Class Name:    UserLogicHolder
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   This Class is used to assign Platinum SaleId,update user group and assign license based on 
                 the job role field in the user profile.    
*****************************************************************************************************************************/
public with sharing class UserLogicHolder {
    
   private static string recId='012U0000000g5s4';
   private static string licId='050U0000000084LIAQ';
   
    
    public static void userLicenseandGroupAssign(Set<Id> usersId){
        
        try{ 
            
            List<User> userlst = new List<User>();
            List<User> usersList = [Select Id, Name,Job_Role__c,Chargent_User__c, AccountId FROM User Where Id IN : usersId];
            List<Opportunity> Oppor  = [SELECT Id,AccountId,RecordTypeId FROM Opportunity Where RecordTypeId =: recId ];
            List<Group> groupList = [SELECT Id,Name, DeveloperName, (SELECT UserOrGroupId,GroupId FROM GroupMembers WHERE UserOrGroupId =:usersList[0].Id) FROM Group WHERE DeveloperName =:usersList[0].Job_Role__c];
            UserPackageLicense userlic= [SELECT Id,PackageLicenseId, UserId from UserPackageLicense Where PackageLicenseId=: licId And UserId =:usersList[0].Id ];
            GroupMember gm = [SELECT Id from GroupMember where UserOrGroupId =:usersList[0].Id  AND GroupId =:groupList[0].Id]; 
            
            for(User user : usersList){
                
                if(user.Update_PlatinumSaleId__c == true){
                    user.Platinum_Sale_Id__c= Oppor.get(0).Id;
                    user.Update_PlatinumSaleId__c= false;
                    user.Id = Oppor.get(0).AccountId;
                    userlst.add(user);
                    
                } 
                if(!userlst.isEmpty()){
                    update userlst;
                }
                
                if(user.Job_Role__c != '' && groupList[0].Name !=''){
                    
                    delete gm;
                    List<GroupMember> groupMember = new List<GroupMember>();
                    GroupMember grpMem= new GroupMember();
                    grpMem.UserOrGroupId = user.Id;
                    grpMem.GroupId= groupList.get(0).Id;
                    groupMember.add(grpMem);
                    if(groupMember.size()>0){
                        
                        insert groupMember;
                    }
                }
                
                if(user.Chargent_User__c == true && userlic== null ){
                    List<UserPackageLicense> userPackLic = new List<UserPackageLicense>();
                    UserPackageLicense usrPackLic = new UserPackageLicense();
                    usrPackLic.PackageLicenseId= licId;
                    usrPackLic.UserId= user.Id;
                    userPackLic.add(usrPackLic);
                    if(userPackLic.size()>0){
                        
                        insert userPackLic;
                    }
                }
                else{
                    delete userlic;
                }  
            } 
        } Catch(Exception ex){
            System.debug('ERROR:' + ex.getmessage());
        }
    }   
}