global class AssignPermissionSetUser {
 public static String partnerUserPermissionSetId = Label.PartnerUserPermissionSetId;
    
    @future 
    public static void AssignPermissionSetToUsers (Set<Id> usersId) {
        // Perform long-running code
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        for (User u : [Select Id, Name FROM User Where Id IN : usersId]){ 
            // Add fields as per your requirement...
            PermissionSetAssignment psa = new PermissionSetAssignment(PermissionSetId = partnerUserPermissionSetId, AssigneeId = u.Id);
            permissionSetList.add(psa);
        }
        upsert permissionSetList;
    }
}