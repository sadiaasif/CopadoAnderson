public class SendPlatinumwithoutAdress implements Schedulable,Database.AllowsCallouts{
    public void execute(SchedulableContext sc) {
        
        PlatinumClientsWithoutAddress.PlatinumClientsWithoutAddressSendEmail();
}
}