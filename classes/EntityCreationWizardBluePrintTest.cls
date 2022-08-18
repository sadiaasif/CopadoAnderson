//*******Created by Wakeel***** --- 6/16/2021
@istest(SeeAllData=false)
public class EntityCreationWizardBluePrintTest {

    @testsetup  public static void testdata()
    {
        Account a=new account();
        a.name='testaccount';
        insert a;
        order o=new order();
        o.AccountId=a.Id;
        o.EffectiveDate=date.valueOf('2021-06-16');
        o.Status='Draft';
        insert o;
    }
    @istest
    public static void test(){
        order od=[select id from order limit 1];
        EntityCreationWizardBluePrint.actid(od.Id);
    }
}