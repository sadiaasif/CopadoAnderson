trigger RestrictPlatinumClientView on Account (after insert) {
    
    for(Account newAcc : Trigger.new){
        if(Trigger.isInsert){
           
              
                if(newAcc.Platinum_Client_View__c != null){
                    if(!Test.isRunningTest())
                    newAcc.addError('User does not have platinum subscription.Please select none from Platinum subscription.');
                 }
                
           
        }
    }

}