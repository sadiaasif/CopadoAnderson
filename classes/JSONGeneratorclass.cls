public class JSONGeneratorclass {
     
    public class clientbasicDetails { 
       String phone;
         String email;
       
        
        
        public clientbasicDetails(String cp, String ce) { 
           phone=cp;
			email=ce;
            
                
        }
        
    }
    public class clientDetails { 
        List<String> phone=new  List<String>();
         List<String> email=new  List<String>();
         String fn;
        string ln;
        string ct;
        string st;
        string zip;
        string country;
        public clientDetails(List<String> p, List<String> e, string f, string l,string c, string s, string z, string con) { 
            for(string ph: p){
                phone.add(ph);
            }
			for(string em: e){
                email.add(em);
            }
            fn=f;
            ln=l;
            ct=c;
            st=s;
            zip=z;
            country=con;
        }
        
    }
       public class clientcontents { 
       String id;
         String quantity;
        
        public clientcontents(String i, String q) { 
           id=i;
            quantity=q;
        }
        
    }
 
   /*public static void generateJSONContent(String emailinput) {
        // Create a JSONGenerator object.
        // Pass true to the constructor for pretty print formatting.
       blob hashedstring;
        
        JSONGenerator gen = JSON.createGenerator(true);
        
        // Create a list of integers to write to the JSON string.
        List<integer> intlist = new List<integer>();
        intlist.add(1);
        intlist.add(2);
        intlist.add(3);
        
        // Create an object to write to the JSON string.
        List<string> Phonelist= new List<string>();
        Phonelist.add('5770aaf5f9cc7f899098651bcb928c7dd52264b47090dd51938aff0a27918412');
        
        List<string> emaillist= new List<string>();
        emaillist.add('f51d1a9d189c433829006879dc2ab4d7fd16ca39f6abf510c8213a30fddc4907');
      //  clientDetails cd = new clientDetails(Phonelist,emaillist);
          clientcontents cc = new clientcontents('A','1');

        // Write data to the JSON string.
        gen.writeStartObject();
          gen.writeFieldName('match_keys');
        
        gen.writeObject(cd);
        gen.writeStringField('currency', 'USD');
        gen.writeNumberField('value', 16);
        gen.writeStringField('event_name', 'Purchase');
         gen.writeStringField('event_time', '1456870902');
      gen.writeFieldName('contents');
 gen.writeStartArray();
         gen.writeObject(cc);
       gen.writeEndArray();
        gen.writeFieldName('custom_data');
       
         gen.writeStartObject();
      

        gen.writeObjectField('event_source', 'in_store');
        
        gen.writeEndObject();
        
      
        
        gen.writeEndObject();
        
        // Get the JSON string.
        String pretty = gen.getAsString();
        System.debug('pretty--'+pretty);
      
    }*/
     
     public static string generateJSONContentforfacebook(List<FacebookoBject__c> fbdatalist) {
    //  List<FacebookoBject__c>  fbdatalist=[Select id, Email__c, Phone__c,FirstName__c,LastName__c, CreatedDate from FacebookoBject__c where DateCreated__c=Today]; 
       
           
        JSONGenerator gen = JSON.createGenerator(true);
        // Create a JSONGenerator object.
        // Pass true to the constructor for pretty print formatting.
     gen.writeStartArray();
         for(FacebookoBject__c fb:fbdatalist){
            // Datetime dt = DateTime.newInstance(2021, 1, 16, 7, 8, 16);
  			//Datetime dt =fb.Event_Time__c;
             //Long l = dt.getTime();
             Integer timestamp= Integer.valueOf(fb.Event_Time_Unix_Timestamp__c);
           String eventtime=string.valueOf(timestamp);
              List<string> emaillist= new List<string>();
             List<string> Phonelist= new List<string>();
             if(fb.Email__c!='' && fb.Email__c!=null ){
               List<String> EmailListhash= fb.Email__c.split(',');
              for(String e:EmailListhash){
                  emaillist.add(e);
            }   
             }
             if(fb.Phone__c!='' && fb.Phone__c!=null){
                   List<String> PhoneListhash= fb.Phone__c.split(',');
              for(String p:PhoneListhash){
                    Phonelist.add(p);
            } 
             }
              
             
               gen.writeStartObject();
             
     
            
      
        clientDetails cd = new clientDetails(Phonelist,emaillist,fb.FirstName__c,fb.LastName__c,fb.City__c,fb.State__c,fb.ZIPcode__c,fb.Country__c);
         
        
             List<clientcontents> cclist = new List<clientcontents>();
               clientcontents cc;
        // Create an object to write to the JSON string.
             if(fb.Service_Items_Name__c!=null && fb.Service_Items_Name__c!=''){
                   List<String> serviceitemsList= fb.Service_Items_Name__c.split(';');
                 List<String> serviceitemsquantityList= fb.Service_Item_Quantity__c.split(';');
            Map<List<string>,List<String>> Servicemap= new Map<List<string>,List<String>>();
             Servicemap.put(serviceitemsList,serviceitemsquantityList);
         
             for(integer i=0; i<serviceitemsList.size();i++){
                 cc = new clientcontents(serviceitemsList[i],serviceitemsquantityList[i]);
                 cclist.add(cc);
             }
            
             }
      

        // Write data to the JSON string.
       
          gen.writeFieldName('match_keys');
        
        gen.writeObject(cd);
        gen.writeStringField('currency', 'USD');
        gen.writeNumberField('value', fb.Amount__c);
        gen.writeStringField('event_name', 'Purchase');
       gen.writeStringField('event_time', eventtime);
             
      gen.writeFieldName('contents');
 
         gen.writeObject(cclist);

             gen.writeFieldName('custom_data');
         gen.writeStartObject();
      

        gen.writeObjectField('event_source', 'in_store');
        
        gen.writeEndObject();
        
         gen.writeEndObject();     
      
}
  gen.writeEndArray();
        
        // Create a list of integers to write to the JSON string.
       
        
        // Get the JSON string.
        String pretty = gen.getAsString();
        System.debug('pretty--'+pretty);
return pretty;
      
    }
    
}