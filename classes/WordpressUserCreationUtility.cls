/**********************************************************
    Class Name:  WordpressUserCreationUtility
    Author: Usama Ashraf
    Description: Sending callout for creating service and platinum User
    ***********************************************************/
public class WordpressUserCreationUtility {
    public static final String PLATINUM='platinum';
    public static final String SERVICE='services';
    public static final String ENDPOINT='callout:Platinum_Portal';
    public static final String POSTSETMETHOD='POST';
    public static final String ACCOUNTROLE ='Primary Contact';
    public static final String CONTENTTYPE='Content-Type';
    public static final String JSONTYPE='application/json;charset=UTF-8';
    
    /***********************************************
    Method Name:  createPlatinumUser
    Author: Usama Ashraf
    Description: Creating Platinum User wordpress ID
    ************************************************/
    public static void createPlatinumUser(Opportunity opp){
        try{
            contact c = getPrimaryOrOldestContact(opp.AccountId);
            /*
    * Update the Existing 
    * User Role of User in WordPress
    */ //if(c.Platinum_Wordpress_Id__c != NULL && !c.Wordpress_User_Roles__c.contains(PLATINUM))
            if(c.Platinum_Wordpress_Id__c != NULL && (c.Wordpress_User_Roles__c==NULL || !c.Wordpress_User_Roles__c.contains(PLATINUM) )) {
                WordpressUserCalloutRequestWrapp usercalloutwrapinst = new WordpressUserCalloutRequestWrapp(opp,PLATINUM,c.Id);
                String bodydata = JSON.serialize(usercalloutwrapinst);
                performCallout(bodydata,c.Platinum_Wordpress_Id__c,c.Id);     
            }
            /*
    * Create a New WordPress User
    * Update the Role
    */
            if(c.Platinum_Wordpress_Id__c == NULL) {
                WordpressUserCalloutRequestWrapp usercalloutwrapinst = new WordpressUserCalloutRequestWrapp(opp,PLATINUM,c.Id);
                String bodydata = JSON.serialize(usercalloutwrapinst);
                      performCallout(bodydata,null,c.Id);
            }
        }
        catch(Exception e){
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
        }
    }
    /***********************************************
    Method Name:  createServiceUser
    Author: Usama Ashraf
    Description: Creating Service User wordpress ID
    ************************************************/
    public static void createServiceUser(Opportunity opp){
        try{
            contact c = getPrimaryOrOldestContact(opp.AccountId);
            if(c.Platinum_Wordpress_Id__c == null) {
                WordpressUserCalloutRequestWrapp usercalloutwrapinst = new WordpressUserCalloutRequestWrapp(opp,SERVICE,c.Id);
                String bodydata = JSON.serialize(usercalloutwrapinst);
                performCallout(bodydata,null,c.Id);
            }
        }catch(Exception e){
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
        } 
    }
    /***********************************************
    Method Name:  createServiceUser
    Author: Usama Ashraf
    Description: Creating Service User wordpress ID
    ************************************************/
    public static void createServiceUser(Opportunity opp,List<Infinity_Subscription_Product__mdt> infinityList, List<Digital_Course__mdt> digitalList){
        try{
            contact c = getPrimaryOrOldestContact(opp.AccountId);
            // call the flow method
            updateContactServiceItemList(opp.Service_Item_List__c, opp.AccountId, c.Id, infinityList, digitalList, c.Service_Item_List__c);
            if(c.Platinum_Wordpress_Id__c == NULL) {
                WordpressUserCalloutRequestWrapp usercalloutwrapinst = new WordpressUserCalloutRequestWrapp(opp,SERVICE,c.Id);
                String bodydata = JSON.serialize(usercalloutwrapinst);
                system.debug(bodydata);
                performCallout(bodydata,NULL,c.Id);
            }
        }catch(Exception e){
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
        }
    }
    /************************************************************
    Method Name:  performCallout
    Author: Usama Ashraf
    Description: perfoming callout for service and platinum user
    *************************************************************/
    @future(callout=true)
    public static void performCallout( String bodydata, String wordpressId, String primaryContactId){
        try{
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            if(String.isNotBlank(wordpressId)){
                request.setEndpoint(ENDPOINT+'/'+wordpressId);
            }
            else{
                request.setEndpoint(ENDPOINT);
            }
            request.setMethod(POSTSETMETHOD);
            request.setHeader(CONTENTTYPE, JSONTYPE);
            request.setBody(bodydata);
            HttpResponse response = http.send(request);
            system.debug(response.getBody());
            PlatinumUser.newUser brandNewUser = (PlatinumUser.newUser)JSON.deserialize(response.getBody(), PlatinumUser.newUser.class);
            
            // String mockResponse = '{"id":"15555",  "username" : "test",   "email" : "test","password" : "test", "first_name" : "test", "last_name" : "test", "roles" : "service"}';
            // PlatinumUser.newUser brandNewUser = (PlatinumUser.newUser)JSON.deserialize(mockResponse, PlatinumUser.newUser.class);
            updateContact(brandNewUser,primaryContactId);
        }catch(Exception e){
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
        }
    }
    /********************************************
    Method Name:  updateContact
    Author: Usama Ashraf
    Description: update wordpress data on contact
    **********************************************/ 
    public static void updateContact(PlatinumUser.newUser brandNewUser, string contactID){
        try{
            List<Contact> primaryContact=[select Id, Email, Account_Roles__c, Platinum_Email__c, Platinum_Wordpress_Id__c,Wordpress_User_Roles__c FROM Contact WHERE id=:contactID limit 1 ];
            if(!primaryContact.isEmpty()){
                Contact c = primaryContact[0];
                c.Platinum_Wordpress_Id__c = brandNewUser.id;
                if(brandNewUser.roles!=NULL){
                    c.Wordpress_User_Roles__c = String.join(brandNewUser.roles, ';');
                }
                if(c.Platinum_Email__c == null) c.Platinum_Email__c = c.Email; 
                
                update c;
            }
        }catch(Exception e){
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
        }
    }
    /********************************************
    Method Name:  getPrimaryOrOldestContact
    Author: Usama Ashraf
    Description: Get primary contact 
    **********************************************/
    private static Contact getPrimaryOrOldestContact(Id accountId) {
        List<Contact> conList = new List<Contact>();
        for (Contact con : [SELECT Id, Account_Roles__c, Platinum_Wordpress_Id__c,Wordpress_User_Roles__c,Service_Item_List__c FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC LIMIT 5000]) {
            if (con.Account_Roles__c == ACCOUNTROLE) {
                conList.add(con);
            } 
            if (conList.size() == 0) {
                conList.add(con);
            }
        }
        return !conList.isEmpty()?conList[0]:new Contact();
    }
      /********************************************
    Method Name:  updateContactServiceItemList
    Author: Usama Ashraf
    Description: update Contact Service Item List 
			     flow call
    **********************************************/
    public static void updateContactServiceItemList(String incServiceItems, Id accId, Id conId, List<Infinity_Subscription_Product__mdt> infinityProds, List<Digital_Course__mdt> digitalProds, String existingSI){
        try{
            Map<String, Object> inputs = new Map<String, Object>();
            if(accId != Null && incServiceItems != Null && conId != Null && infinityProds.size() > 0 && digitalProds.size() > 0){
                inputs.put('AccountId', accId);
                inputs.put('ServiceItemList', incServiceItems);
                inputs.put('ExistingServiceItems',existingSI);
                inputs.put('InfinityProds', infinityProds);
                inputs.put('DigitalProds', digitalProds);
                inputs.put('ConId', ConId);
                Flow.Interview.Sale_Platinum_Courses_Update_Contact_Service_Item_List myFlow = new Flow.Interview.Sale_Platinum_Courses_Update_Contact_Service_Item_List(inputs);
                myFlow.start();
            }
        }catch(Exception e){
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
        }
    }
}