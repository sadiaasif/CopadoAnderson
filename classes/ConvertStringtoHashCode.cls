public class ConvertStringtoHashCode {

     private Inputs input;
   public class Inputs {
        @InvocableVariable(description='Client Email List' )
        public string email;
    
        @InvocableVariable(description='Client phone List' )
        public String phone;

        @InvocableVariable(description='Client first name')
        public String firstname;

        @InvocableVariable(description='Client Last name')
        public String lastname;
    
        @InvocableVariable(description='Client City')
        public String City;

        @InvocableVariable(description=' Client States')
        public String States;

        @InvocableVariable(description='Client Zipcodes')
        public String Zipcodes;

        @InvocableVariable(description='Client Country')
        public String Country;

    }
     public class outputs {
        @InvocableVariable(description='Client Email hashed' )
        public string emailhashed;
    
        @InvocableVariable(description='Client phone hashed' )
        public String phonehashed;

        @InvocableVariable(description='Client first name hashed')
        public String firstnamehashed;

        @InvocableVariable(description='Client Last name hashed')
        public String lastnamehashed;
    
        @InvocableVariable(description='Client City hashed')
        public String Cityhashed;

        @InvocableVariable(description=' Client States hashed')
        public String Stateshashed;

        @InvocableVariable(description='Client Zipcodes hashed')
        public String Zipcodeshashed;

        @InvocableVariable(description='Client Country hashed')
        public String Countryhashed;

    }
    Public ConvertStringtoHashCode(Inputs input) {
        this.input = input;
    }
      @InvocableMethod(label='Convert Records to strings to Hashcode' description='Convert Records to strings to Hashcode')
    Public static  List<ConvertStringtoHashCode.outputs> fetgetstrings(List<ConvertStringtoHashCode.Inputs> ClientDetails){
         string hashfirstname='';
         string hashlastname='';
         string hashcity='';
        string hashstate= '';
         string hashcountry= '';
         string hashZip='';
          List<ConvertStringtoHashCode.outputs> hashedoutputs = new List<ConvertStringtoHashCode.outputs>{};
                ConvertStringtoHashCode.Outputs returnVal = new ConvertStringtoHashCode.Outputs();
        String HashedClientEmail='';
         String HashedClientPhone='';
        List<string> convertEmail=new List<String>();
          List<string> convertphone=new List<String>();
         List<string> HashedClientEmaillist=new List<String>();
        for (Inputs input: ClientDetails) {
                List<String> EmailList= input.email.split(',');
            for(String e:EmailList){
                 string hashemail= ConvertStringtoHashCode.stringtohash(e);
                convertEmail.add(hashemail);
            }
            for(string hasemail:convertEmail){
                HashedClientEmail+= hasemail+',';
                System.debug('HashedEmail=='+HashedClientEmail);
                
            }
               List<String> PhoneList= input.phone.split(',');
            for(String p:PhoneList){
                string formattedPhone = ConvertStringtoHashCode.formatPhone(p);
                string hashphone = '';
                if(formattedPhone != Null && formattedPhone != ''){
                	hashphone= ConvertStringtoHashCode.stringtohash(formattedPhone);
                }
                else{
                    hashphone= ConvertStringtoHashCode.stringtohash(p);
                }
                convertphone.add(hashphone);
            }
            for(string hasemail:convertphone){
                HashedClientPhone+= hasemail+',';
                System.debug('HashedEmail=='+HashedClientPhone);
                
            }
            if(input.firstname!=''){
				  hashfirstname = ConvertStringtoHashCode.stringtohash(input.firstname);             
            }
            if(input.lastname!=''){
                hashlastname= ConvertStringtoHashCode.stringtohash(input.lastname);
            }
              if(input.City!=''){
                   hashcity= ConvertStringtoHashCode.stringtohash(input.City);
              }           
            if(input.States!=''){
                 hashstate= ConvertStringtoHashCode.stringtohash(input.States);
            }
            if(input.Country!=''){
                if(input.Country == 'USA' || input.Country == 'United States'){
                    hashcountry= ConvertStringtoHashCode.stringtohash('US');
                }
                else{
                    hashcountry= ConvertStringtoHashCode.stringtohash(input.Country);
                } 
            }
            if(input.Zipcodes!=''){
                 hashZip= ConvertStringtoHashCode.stringtohash(input.Zipcodes); 
            }
            
            
            
            
          returnVal.emailhashed= HashedClientEmail;
             returnVal.phonehashed= HashedClientPhone;
                returnVal.lastnamehashed= hashlastname;
             returnVal.firstnamehashed= hashfirstname;
                returnVal.Cityhashed= hashcity;
             returnVal.Stateshashed= hashstate;
            returnVal.Countryhashed= hashcountry;
            returnVal.Zipcodeshashed= hashZip;
        }
        hashedoutputs.add(returnVal);
 
           
       return hashedoutputs;
    
        
    }
    Public static string stringtohash( string strinput){
        string hashBase64SHA1='';
          Blob targetBlob = Blob.valueOf(strinput);
				Blob hashSHA1 = Crypto.generateDigest('SHA-256', targetBlob);
				 hashBase64SHA1 = EncodingUtil.convertToHex(hashSHA1) ;
				System.debug ('Hascode==='+hashBase64SHA1);
        return hashBase64SHA1;
        
        
    }
    public static string formatPhone(String phone){
        String newPhone = '';
        for(integer i = 0 ; i < phone.length(); i++){
            if((phone.substring(i, i+1)).isNumeric()){
                newPhone += phone.substring(i, i+1);
            }
        }
        system.debug('PP: ' + newPhone);
        if(newPhone.isNumeric()){
            if(newPhone.length() == 10){
                return '1-(' + newPhone.left(3) + ')' + '-' + newPhone.substring(3, 6) + '-' + newPhone.right(4);
            }
        }
        return null;
    }
    
}