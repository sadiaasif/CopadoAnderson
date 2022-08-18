global class DeactivateUser {
    
    public DeactivateUser() { 
    }
    
    @future 
    public static void UserInactiveMethod(set<Id> UserId)
    {
        List <User> updUsr = new List<User>();    
        for(User usr : [SELECT ID, IsActive FROM User WHERE Id IN : UserId]){
            usr.IsActive=false;
            updUsr.add(usr);
        }        
        update updUsr;
    }
    
    @future 
    public static void UserActiveMethod(set<Id> UserId)
    {        
        List <User> updUsr = new List<User>();    
        for(User usr : [SELECT ID, IsActive FROM User WHERE Id IN : UserId]){
            usr.IsActive=true;
            updUsr.add(usr);
        }        
        update updUsr;
    }
    
}