@isTest(SeeAllData=false)
public class UpdateTaskTestClass {
    
    public static testmethod void testCreateRelatedListMethod()
    {
        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.phone='123456782';
        insert testAccount;
        Entities__c et = new Entities__c();
        et.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType WHERE Name = 'Limited Liability Company (LLC)' and SobjectType = 'Entities__c'].Id; 
        et.Name ='Test Dec Entity';
        et.Origin__c = 'Anderson';
        et.Primary_Client__c =testAccount.id;
        et.Organization_State__c = 'Wyoming';
        et.Status__c = 'Sent To Processing';
        insert et;
        Task t=new Task();
        t.Subject='testing task subject and';       
        t.Priority='Normal';
        t.Description='Testing description 111';
        insert t;
        test.startTest();
        List<Related_Parties__c> relatedPartyList = new List<Related_Parties__c>();
        for(Integer i = 0 ; i<10 ; i++){
            Related_Parties__c related = new Related_Parties__c();
            related.Name='Testing Related'+i;
            related.Entities__c=et.id;
            related.Other_Entity_Member_1__c=true;
            related.Other_Entity_Member_2__c=true;
            related.Other_Entity_Member_4__c=true;
            related.Other_Entity_Member_3__c=true;
            related.Other_1st_Member_Name__c='Testing 1';
            related.Other_2nd_Member_Name__c='Testing 2';
            insert related;
            relatedPartyList.add(related);
        }
        if(relatedPartyList != null){
            try{
                insert relatedPartyList;
            }
            catch(Exception e)
            {}
        }
        
        UpdateTaskforRelatedParties utr=new UpdateTaskforRelatedParties();
        utr.updateTaskCommentByRelOninsert(relatedPartyList); 
        utr.updateTaskCommentByRelOnUpdate(relatedPartyList,'update'); 
        test.stopTest();
        
        Related_Parties__c rel1=[select id,name,Other_Entity_Member_1__c,Other_1st_Member_Name__c from Related_Parties__c where id=:relatedPartyList[0].id];
        rel1.Name='Test 2';
        try{
            update rel1;
        }catch(Exception e)
        {}
    }
}