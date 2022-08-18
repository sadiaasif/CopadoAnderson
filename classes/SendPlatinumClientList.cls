public class SendPlatinumClientList implements Schedulable, Database.AllowsCallouts{
    public void execute(SchedulableContext sc) {
        EmailPlatClientsList.EmailPlatClientsListToexternalUser(new List<String>{'New_PlatinumLast_week_hSD'}, 'Platinum');
       
}
}