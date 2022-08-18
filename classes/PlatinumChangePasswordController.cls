/**
* A controller class used to fetch and change password.
* 
* @author ranjitk
* @version 1.0 - Aar 07, 2018
*/ 
public with sharing class PlatinumChangePasswordController {
    
    public PlatinumChangePasswordController(ApexPages.StandardController controller){
        
    }
    
    @RemoteAction
    public static PageReference saveChangePassword(String oldpassword,String newPassword, String verifyNewPassword){
        
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);  
        
    }

}