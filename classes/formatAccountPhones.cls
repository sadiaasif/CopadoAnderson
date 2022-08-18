// Test Class: formatAccountPhonesTest

public class formatAccountPhones {
    
    public static boolean insertRun = false;
    public static boolean updateRun = false;
    
    public void evaluateAndCleanPhoneNumbers(List<Account> accList, String operation){
        
        if(operation == 'Before Insert'){
            if(insertRun == true) return;
            insertRun = true;
        }
        
        if(operation == 'Before Update'){
            if(updateRun == true) return;
            updateRun = true;
        }        
        
        for(Account acc : accList){
            
            acc.Phone      = setPhoneNumber(acc.Phone);
            acc.Mobile_Number__c = setPhoneNumber(acc.Mobile_Number__c);
            acc.Spouse_Mobile__c = setPhoneNumber(acc.Spouse_Mobile__c);
            acc.Phone_1__c = setPhoneNumber(acc.Phone_1__c);
            acc.Phone_2__c = setPhoneNumber(acc.Phone_2__c);
            acc.Phone_3__c = setPhoneNumber(acc.Phone_3__c);
            acc.Phone_4__c = setPhoneNumber(acc.Phone_4__c);
            acc.Phone_5__c = setPhoneNumber(acc.Phone_5__c);
            acc.Phone_6__c = setPhoneNumber(acc.Phone_6__c);
            
        }
        
    }
    
    public string setPhoneNumber(String phone){ 
        
        if(phone == null){
            String empty = '';
            return empty;
        }
        
        // If unformatted
        if(phone != properPhoneFormat(cleanPhoneNumber(Phone))) {
            
            // If 10 digits, format
            if(cleanPhoneNumber(phone).length() == 10 && (!cleanPhoneNumber(phone).startsWith('1'))) {
                phone = properPhoneFormat(cleanPhoneNumber(phone));
            }
            
            // If 11 digits and USA number, format            
            if(cleanPhoneNumber(phone).length() == 11 && cleanPhoneNumber(phone).startsWith('1')){
                phone = properPhoneFormat(cleanPhoneNumber(phone).right(10));
                
            }
        }

        return phone;
        
    }
    
    // Remove all characters from phone input
    public string cleanPhoneNumber(String currentPhone){
        String cleanPhone = currentPhone.replace(' ', '').replace('(', '').replace(')', '').replace('-', '').replace('.','').replace('@','').replace('*','').replace('+','').replace('!','').replace('#','');
        return cleanPhone;
    }
    
    // Return (702) 555-4444 format
    public string properPhoneFormat(String currentPhone){
        String formattedPhone = currentPhone.replaceFirst('(\\d{3})(\\d{3})(\\d+)', '($1) $2-$3');
        return formattedPhone;
    }
    
}