public class TrustBinder {
    
    public static void updateTrustMember(List<Entities__c>  listOfEnty,Map<id,Entities__c> listOfoldEntymap) {
              list<Entities__c> LlcInput = new list<Entities__c> ();
        Map <Id,Entities__c> LlcBinderMap;
   
        For(Entities__c Ent :[Select id,Name,Trust_Member_1__c ,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c,Signor_Update__c ,Trust_Member_1__r.First_Trustee_Name__c,Trust_Member_2__r.First_Trustee_Name__c,Trust_Member_3__r.First_Trustee_Name__c,Trust_Member_4__r.First_Trustee_Name__c,Trust_Member_2__c,Trust_Member_3__c,Trust_Member_4__c,
                              Signor_of_Entity_Member_1__c , Signor_of_Entity_Member_2__c,Signor_of_Entity_Member_3__c,Signor_of_Entity_Member_4__c,
                              Signor_Title_1__c,Signor_Title_2__c,Signor_Title_3__c,Signor_Title_4__c from Entities__c where Id IN :listOfEnty ]){  
   
                                  if(Ent.Signor_Update__c !=listOfoldEntymap.get(Ent.id).Signor_Update__c && Ent.Signor_Update__c == true  ){ 
                                      system.debug('Ent.Signor_Update__c'+ Ent.Signor_Update__c);
                                      system.debug('listOfoldEntymap.get(Ent.id).Signor_Update__c'+ listOfoldEntymap.get(Ent.id).Signor_Update__c);
                                  LlcInput.add(Ent); }
                                    
                                  if (LlcInput.size()>0){
                                      
                                      
        LlcBinderMap = LLcBinderOnEntity.updateEntityLLcBinder(LlcInput);
                                       system.debug('>>>LlcBinderMap'+LlcBinderMap);
                                    Entities__c Enttemp;                                                                                                 
                                  if(!LlcBinderMap.Isempty() && LlcBinderMap.containskey(Ent.id) )
                                  {
                                      system.debug('>>>1st if for LlcBinderMap');
                                   Enttemp =LlcBinderMap.get(Ent.id);
                                  }
                                  else   Enttemp =new Entities__c(id=Ent.id);
                                  
                                      if(Ent.Trust_Member_1__c != listOfoldEntymap.get(Ent.id).Trust_Member_1__c &&  Ent.Trust_Member_1__c != null  ){
                                      Enttemp.Signor_of_Entity_Member_1__c= Ent.Trust_Member_1__r.First_Trustee_Name__c;
                                      Enttemp.Signor_Title_1__c = 'Trustee';
                                             If(Ent.Organization_State_1__c!=null){
                                        
                                              Enttemp.Organization_State_1__c = '';
                                          }
                      
                         }     
                                  
                                  if(Ent.Trust_Member_2__c != listOfoldEntymap.get(Ent.id).Trust_Member_2__c && Ent.Trust_Member_2__c != null ){
                                      Enttemp.Signor_of_Entity_Member_2__c= Ent.Trust_Member_2__r.First_Trustee_Name__c;
                                      Enttemp.Signor_Title_2__c = 'Trustee'; 
                                        If(Ent.Organization_State_2__c!=null){
                                              
                                              Enttemp.Organization_State_2__c = '';
                                          }

                                                                      }  
                                  
                                  if(Ent.Trust_Member_3__c != listOfoldEntymap.get(Ent.id).Trust_Member_3__c && Ent.Trust_Member_3__c != null ){
                                      Enttemp.Signor_of_Entity_Member_3__c= Ent.Trust_Member_3__r.First_Trustee_Name__c;
                                      Enttemp.Signor_Title_3__c = 'Trustee';
                                       If(Ent.Organization_State_3__c!=null){
                                             
                                              Enttemp.Organization_State_3__c = '';
                                          }
                                         
                                  }  
                                  
                                  if(Ent.Trust_Member_4__c != listOfoldEntymap.get(Ent.id).Trust_Member_4__c  && Ent.Trust_Member_4__c != null ){
                                      
                                      Enttemp.Signor_of_Entity_Member_4__c= Ent.Trust_Member_4__r.First_Trustee_Name__c;
                                      Enttemp.Signor_Title_4__c = 'Trustee';
                                       If(Ent.Organization_State_4__c!=null){
                                              
                                              Enttemp.Organization_State_4__c = '';
                                          }
                                       }  
                            
                              LlcBinderMap.put(Ent.id,Enttemp);
                                      system.debug('>>>>LlcBinderMap at last'+LlcBinderMap);
                                                                 
  }
                          
                                  
}
         if(!LlcBinderMap.Isempty()){
           
update LlcBinderMap.values();
            } 
}
}