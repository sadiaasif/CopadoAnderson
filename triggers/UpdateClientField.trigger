trigger UpdateClientField on Blueprint__c (after insert) {
    
    List<Blueprint__c> lstBlueprint=new list<Blueprint__c>();
    List<account> lstacct=new list<account>();
    list<account> acclst=new list<account>();
    DateTime createdDt;
    set<id> accid=new set<id>();   
    for(Blueprint__c b:trigger.new)
    {
        system.debug('1111');
        //system.debug('createdDate===='+b.CreatedById);
        system.debug('cccc date time=='+b.CreatedDate);
        system.debug('accountid in blueprint===='+b.AccountId__c);
        accid.add(b.AccountId__c);
        createdDt=b.CreatedDate;
        system.debug('accountid===='+b.AccountId__c);
    }
      lstacct=[SELECT Id, Name, LastName, FirstName, Most_Recent_Upload__c FROM Account where id=:accid];
      system.debug('lstacct===='+lstacct);
      for(account acc:lstacct)
      {
          system.debug('2222');
          acc.Most_Recent_Upload__c =createdDt;
          acclst.add(acc);
          system.debug('acclst===='+acclst);
      }
    if(acclst.size()>0)
    {
     update acclst;
    }
}