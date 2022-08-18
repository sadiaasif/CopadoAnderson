@isTest(SeeAllData = true)
public class Change_task_field_on_case_questionTest {
    
    private static testMethod void ChangeTaskField(){
         Task t = new Task();
         t.OwnerId = UserInfo.getUserId();
         t.Subject='Email: Anderson Platinum Question';
         t.Status='Not Started';
         t.Priority='Normal';
         t.TaskSubtype='Email';
        insert t;    
    }

}