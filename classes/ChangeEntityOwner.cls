public class ChangeEntityOwner {
	public static void CEOAfterUpdate(Map<id,Case> newMap) {

		List<Entities__c> EnList = [Select id,Case_Owner__c,Case__c from Entities__c where Case__c IN :newMap.KeySet()];
		List<Entities__c> EnUpdate = new List<Entities__c>();
		for(Entities__c e: EnList){
			Case c = newMap.get(e.Case__c); 
			if(c!=null){
				if(e.Case_Owner__c != c.OwnerId){
					e.Case_Owner__c = c.OwnerId;
					EnUpdate.add(e);
				}
			}
		}
		update EnUpdate;
	}
}