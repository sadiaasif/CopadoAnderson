public class BoxUploadsHelper {
    @AuraEnabled(cacheable=true)
    public static string fetchClientUploads(Id taskId){
        system.debug('invoked');
		task t = [select subject from task where id =: taskId limit 1];
        return t.subject;
    }

}