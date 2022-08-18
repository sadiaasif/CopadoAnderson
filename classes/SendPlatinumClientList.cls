public class SendPlatinumClientList implements Schedulable, Database.AllowsCallouts{
    public void execute(SchedulableContext sc) {
        EmailPlatClientsList.EmailPlatClientsListToexternalUser();
       
}
}