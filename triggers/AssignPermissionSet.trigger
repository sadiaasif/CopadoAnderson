trigger AssignPermissionSet on User (after insert){
    public static String partnerUserProfileId = Label.PartnerUserProfileId;
    
    Set<ID> usersId = new Set<Id>();
    Set<Id> contactIdsSet = new Set<Id>();
    for (User usr :trigger.new) {
        if(usr.ProfileId == partnerUserProfileId){
            usersId.add(usr.Id);
        }
    }
    // Call handler class to update permission Set on user record
    if(!usersId.isEmpty()){
         AssignPermissionSetUser.AssignPermissionSetToUsers(usersId);
    }   
}