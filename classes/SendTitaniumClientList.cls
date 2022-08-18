public class SendTitaniumClientList implements Schedulable, Database.AllowsCallouts{
    public void execute(SchedulableContext sc) {
        EmailPlatClientsList.EmailPlatClientsListToexternalUser(new List<String>{'Titanium_Gift_Boxes_fpe','Test_Copy_WdW'}, 'Titanium');
       
}
}