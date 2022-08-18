@RestResource(urlmapping='/SubmitCase/*')
global class CaseSubmitQuestion {
    @HttpPost
    global static ID createCase()
    {
        Case cse = new Case();
        try {        
            //get the json from the request
            RestRequest req1=RestContext.request;           
            String jsonInput= req1.requestBody.toString();
            System.debug('jsonInput=='+jsonInput);
            Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(jsonInput); 
            String subj = String.valueOf(jsonMap.get('subj'));
            system.debug('subject='+subj);
            String descr = String.valueOf(jsonMap.get('descr'));
            system.debug('descr='+descr);
            id usrAccId = String.valueOf(jsonMap.get('usrAccId'));
            system.debug('usrAccId='+usrAccId);
            id usrRecId = String.valueOf(jsonMap.get('usrRecId'));
            system.debug('usrRecId='+usrRecId);
            cse.Subject = subj;
            cse.Description = descr;
            cse.AccountId = usrAccId;
            cse.RecordTypeId = usrRecId;
            cse.Origin = 'Partner Community';
            insert cse;
        }
        catch(Exception e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return cse.id;
    }
}