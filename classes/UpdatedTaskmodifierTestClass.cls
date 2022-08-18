@isTest(SeeAllData=false)
public class UpdatedTaskmodifierTestClass {
    
    public static testmethod void testBlueprintModifier()
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
        List<task> tskList=new List<task>();
        Task t=new Task();
        t.Subject='testing task subject and';
        t.Priority='Normal';
        t.Description='Testing description 111 MOdified by';
        insert t;
        
        Related_Parties__c rel=new Related_Parties__c();
        rel.Entities__c=et.id;
        rel.Blueprint_Modifier_Name__c='Test';
        insert rel;
        List<Blueprint__c> blp=new list<Blueprint__c>();
        for(Integer i = 0 ; i<5 ; i++){
            Blueprint__c bp = new Blueprint__c();
            bp.Name='Test Blueprint 1'+i;
            bp.AccountId__c=testAccount.id;
            bp.Task_Entities_ID__c=et.id;
            bp.Related_Parties_Entities_Id__c=rel.id;
            blp.add(bp);
        }
        if(blp != null){
             test.startTest();
            try{
                insert blp;
            }
            catch(Exception e)
            {}
            test.stopTest();
        }
        UpdateCommentTaskModiBp uct=new UpdateCommentTaskModiBp();
        uct.updateCommentTask(blp); 
       
    }
    
}