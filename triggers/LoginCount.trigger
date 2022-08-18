trigger LoginCount on User (before update) {
    
    Integer daysLoggedIn = 0;
    DateTime lastLogin;
    
    Id systemAdmin = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].id;
    
    if(userInfo.getProfileId() == systemAdmin) {
        
        for (User u : Trigger.new) {
            
            if(u.UpdateLoginCount__c != Trigger.oldMap.get(u.id).UpdateLoginCount__c) {
                
                for (LoginHistory l : [SELECT LoginTime FROM LoginHistory WHERE UserId = :u.id AND LoginTime >= Last_N_Months:6]) {
                    
                    if(lastLogin == null) {
                        lastLogin = l.LoginTime;
                        daysLoggedIn += 1;
                    }
                    
                    if(!l.LoginTime.isSameDay(LastLogin)) {
                        lastLogin = l.LoginTime;
                        daysLoggedIn += 1;
                    }
                    
                    u.LoginHistoryCount__c = daysLoggedIn;
                    u.updateLoginCount__c = false;
                }
            }
        }
    }
}