public class LLcBinderOnEntity {
    //@InvocableMethod(label='LLcBinder' description='Update the Entity object')
    public static  Map<id,Entities__c> updateEntityLLcBinder(List<Entities__c> Entityids) {
        Map<id,Entities__c> EntityList=new  Map<id,Entities__c>();
        map<id,Entities__c>  topEntityIDMap=new map<id,Entities__c>();
        map<id,Entities__c>  MiddleMangerEntityIDMap=new map<id,Entities__c>();
        map<id,Entities__c>  MiddleMemberEntityIDMap=new map<id,Entities__c>();
        
        map<id,Entities__c>  MiddleMangerEntityLevel2IDMap=new map<id,Entities__c>();
        map<id,Entities__c>  MiddleMemberEntityLevel2IDMap=new map<id,Entities__c>();
        
        map<id,Entities__c>  MiddleMangerEntityLevel3IDMap=new map<id,Entities__c>();
        map<id,Entities__c>  MiddleMemberEntityLevel3IDMap=new map<id,Entities__c>();
        
        map<id,Entities__c>  baseMangerEntityIDMap=new map<id,Entities__c>();
        map<id,Entities__c>  baseMemberEntityIDMap=new map<id,Entities__c>();
        
        String topstructure;
        String topsignortitle;
        
        string Midlestructure;
        string MidlesignorofEntityManager;
        string MidlesignorofEntityManager2;
        string MidlesignorofEntityMember1;
        string MidlesignorofEntityMember2;
        string MidlesignorofEntityMember3;
        string MidlesignorofEntityMember4;
        
        string MiddleEntityName;
        string Midllelevel2structure;
        string Midlelevel2signorofEntityManager;
        string Midlelevel2signorofEntityManager2;
        string Midlelevel2signorofEntityMember1;
        string Midlelevel2signorofEntityMember2;
        string Midlelevel2signorofEntityMember3;
        string Midlelevel2signorofEntityMember4;
        
        String signortitleMangingEntitylevel;
        String signortitleMangingEntity2level;
        String signortitleMangingEntity3level;
        String signortitleMangingEntity4level;
        
        
        String signortitleMemberEntitylevel;
        String signortitleMemberEntity2level;
        String signortitleMemberEntity3level;
        String signortitleMemberEntity4level;
        
        
        String signortitleMangingEntitylevel2;
        String signortitleMangingEntity2level2;
        String signortitleMangingEntity3level2;
        String signortitleMangingEntity4level2;
        
        String signortitleMemberEntitylevel2;
        String signortitleMemberEntity2level2;
        String signortitleMemberEntity3level2;
        String signortitleMemberEntity4level2;
        
        String signortitleMangingEntitylevel3;
        String signortitleMangingEntity2level3;
        String signortitleMangingEntity3level3;
        String signortitleMangingEntity4level3;
        
        String signortitleMemberEntitylevel3;
        String signortitleMemberEntity2level3;
        String signortitleMemberEntity3level3;
        String signortitleMemberEntity4level3;
        
        
        
        string Middlelevel2EntityName;
        string Midllelevel3structure;
        string Midlelevel3signorofEntityManager;
        string Midlelevel3signorofEntityManager2;
        string Midlelevel3signorofEntityMember1;
        string Midlelevel3signorofEntityMember2;
        string Midlelevel3signorofEntityMember3;
        string Midlelevel3signorofEntityMember4;
        
        string Middlelevel3EntityName;
        string basestructure;
        string basesignorofEntityManager;
        string basesignorofEntityManager2;
        string basesignorofEntityMember1;
        string basesignorofEntityMember2;
        string basesignorofEntityMember3;
        string basesignorofEntityMember4;
        string basesignorofEntityMember5;
        
        string baseEntityName;
        
        String topEntityManging;
        String topEntityManging2;
        string topEntityMemeber1;
        string topEntityMemeber2;
        string topEntityMemeber3;
        string topEntityMemeber4;
        
        
        String middleMangingEntity1level1;
        String middleMangingEntity2level1;
        String middleMemberEntity1level1;
        String middleMemberEntity2level1;
        String middleMemberEntity3level1;
        String middleMemberEntity4level1;
        String middleManagingEntity3level2;
        String EntityNameMangingEntity3level2;
        String middleManagingEntity4level2;
        String EntityNameMangingEntity4level2;
        String EntityNameMemberEntity3level2;
        String EntityNameMemberEntity4level2;
        
        
        String middleManagingEntity1level2;
        string middleManagingEntity2level2;
        String middleMemberEntity1level2;
        String middleMemberEntity2level2;
        String middleMemberEntity3level2;
        String middleMemberEntity4level2;
        
        
        
        String middleManagingEntity1level3;
        string middleManagingEntity2level3;
        String middleMemberEntity1level3;
        String middleMemberEntity2level3;
        String middleMemberEntity3level3;
        String middleMemberEntity4level3;
        
        string EntityNameMangingEntitylevel;
        string EntityNameMemberEntitylevel;
        string EntityNameMangingEntitylevel2;
        string EntityNameMemberEntitylevel2;
        string EntityNameMangingEntitylevel3;
        string EntityNameMemberEntitylevel3;
        
        String EntityNameMangingEntity2level;
        String middleMangingEntity3level1;
        String EntityNameMangingEntity3level;
        String middleMangingEntity4level1;
        String EntityNameMangingEntity4level;
        String EntityNameMemberEntity2level;
        String EntityNameMemberEntity3level;
        String EntityNameMemberEntity4level;
        
        String EntityNameMemberEntity2level2;
        String EntityNameMangingEntity2level2;
        
        
        
        String EntityNameMangingEntity2level3;
        String EntityNameMemberEntity2level3;
        String middleManagingEntity3level3;
        String EntityNameMangingEntity3level3;
        String middleManagingEntity4level3;
        String EntityNameMangingEntity4level3;
        String EntityNameMemberEntity3level3;
        String EntityNameMemberEntity4level3;
        
        //organization State
        string organizationStateMangingEntity1;
        string organizationStateMangingEntity2;
        string organizationStateMangingEntity3;
        string organizationStateMangingEntity4;
        string organizationStateMemberEntity1;
        string organizationStateMemberEntity2;
        string organizationStateMemberEntity3;
        string organizationStateMemberEntity4;
        
        
        
        map<id,Entities__c>  baseMangerMangedEntityIDMap=new map<id,Entities__c>();
        for(Entities__c ens:[Select id,Name,Entity_Member_1__c,Entity_Member_2__c,Member_1__c,Manager_2__c,Signor_of_Entity_Member_1__c,Organization_State_EM2_del__c,Member_3__c,Signor_Title_4__c,Signor_Title_3__c,Manager_1__c,Member_2__c,Organization_State_3__c,Organization_State_4__c,Member_4__c,Entity_Member_3__c,Entity_Member_4__c,RecordTypeId,Managing_Entity_2__c,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id in :Entityids]){
            topEntityIDMap.put(ens.id,ens);
        }
        if(!topEntityIDMap.isEmpty()){
            for(Entities__c topEnity:topEntityIDMap.values()){
                
                topEntityManging=topEnity.Managing_Entity__c;
                topEntityManging2=topEnity.Managing_Entity_2__c;
                topEntityMemeber1=topEnity.Entity_Member_1__c;
                topEntityMemeber2=topEnity.Entity_Member_2__c;
                topEntityMemeber3=topEnity.Entity_Member_3__c;
                topEntityMemeber4=topEnity.Entity_Member_4__c;
                if(topEnity.Structure__c=='Manager-managed'){
                    topsignortitle='as its Manager';
                }else{
                    topsignortitle='as its Managing Member';
                }
                
                if((topEnity.Structure__c=='Manager-managed'||topEnity.Structure__c=='Member-managed') && topEnity.RecordTypeId=='012U0000000DE8m' ){
                    if( topEnity.Managing_Entity__c!=null || topEnity.Managing_Entity_2__c!=null || topEnity.Entity_Member_1__c!=null ||topEnity.Entity_Member_2__c!=null ||topEnity.Entity_Member_3__c!=null ||topEnity.Entity_Member_4__c!=null ){
                        for(Entities__c midleManagerEn:[Select id,Name,Entity_Member_1__c,Member_1__c,Signor_of_Entity_Member_1__c,Organization_State_EM2_del__c,Signor_Title_1__c,Ownership__c,Signor_Title_4__c,Signor_Title_3__c,Member_3__c,Member_4__c,Organization_State_3__c,Organization_State_4__c,Organization_State_1__c,Manager_1__c,Member_2__c,Manager_2__c,Entity_Member_2__c,Entity_Member_3__c,Entity_Member_4__c,RecordTypeId,Managing_Entity_2__c,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:topEnity.Managing_Entity__c  OR id=:topEnity.Managing_Entity_2__c]){
                            
                            MiddleMangerEntityIDMap.put(midleManagerEn.Id,midleManagerEn);
                        }
                        for(Entities__c midleManagerEn:[Select id,Name,Entity_Member_1__c,Member_1__c,Signor_of_Entity_Member_1__c,Organization_State_EM2_del__c,Signor_Title_1__c,Ownership__c,Signor_Title_4__c,Signor_Title_3__c,Member_3__c,Member_4__c,Organization_State_3__c,Organization_State_4__c,Organization_State_1__c,Manager_1__c,Member_2__c,Manager_2__c,Entity_Member_2__c,Entity_Member_3__c,Entity_Member_4__c,RecordTypeId,Managing_Entity_2__c,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id=:topEnity.Entity_Member_1__c  OR id=:topEnity.Entity_Member_2__c OR id=:topEnity.Entity_Member_3__c OR id=:topEnity.Entity_Member_4__c]){
                            
                            MiddleMemberEntityIDMap.put(midleManagerEn.Id,midleManagerEn);
                        }
                    }
                }
                
                
                
            }
            
            
        }
        
        //Level  manger Manged 1
        
        if(!MiddleMangerEntityIDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+MiddleMangerEntityIDMap.size());
            for(Entities__c middleMangerEnity:MiddleMangerEntityIDMap.values()){
                
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(middleMangerEnity.RecordTypeId=='012U0000000DE8m'){
                        
                        Midlestructure=middleMangerEnity.Structure__c;
                        if(middleMangerEnity.Structure__c=='Manager-managed'&&  middleMangerEnity.Managing_Entity__c==null ){
                            
                            
                            
                            if(middleMangerEnity.Managing_Entity__c==null  && middleMangerEnity.id==topEntityManging){
                                
                                System.debug('Level1 Middle1 is llc and Em1 is null and top structure is manager manged--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=middleMangerEnity.Manager_1__c;
                                // topEnityupdate.Signor_Title_EM1__c='Manager of '+middleMangerEnity.Name +', on behalf of '+topEnityupdate.Name+' as its Manager';
                                topEnityupdate.Signor_Title_EM1__c='Manager ';
                                topEnityupdate.Organization_State_EM1__c=middleMangerEnity.Organization_State__c;
                                EntityList.put(topEnityupdate.id,topEnityupdate); 
                                
                            }
                            if(middleMangerEnity.Managing_Entity__c==null  && middleMangerEnity.id==topEntityManging2){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=middleMangerEnity.Manager_1__c;
                                // topEnityupdate.Signor_Title_EM2__c='Manager of '+middleMangerEnity.Name +', on behalf of '+topEnityupdate.Name+' as its Manager';
                                topEnityupdate.Signor_Title_EM2__c='Manager';
                                topEnityupdate.Organization_State_EM2_del__c=middleMangerEnity.Organization_State__c;
                                
                            }
                            
                            
                        } 
                        else  if(middleMangerEnity.Structure__c=='Member-managed'&&  (middleMangerEnity.Entity_Member_1__c==null ) ){
                            System.debug('Reached memeber managed Mid Level1 id --'+ topEnityupdate.Entity_Member_1__c +','+  middleMangerEnity.id+','+ middleMangerEnity.Entity_Member_1__c);
                            
                            if(middleMangerEnity.Entity_Member_1__c==null && middleMangerEnity.id==topEntityManging){
                                
                                System.debug('Level1 Middle1 is llc and Emember1 is null and top structure is member manged--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=middleMangerEnity.Member_1__c;
                                //topEnityupdate.Signor_Title_EM1__c='Managing Member of '+middleMangerEnity.Name +', on behalf of '+topEnityupdate.Name+'as its Managing Member';
                                topEnityupdate.Signor_Title_EM1__c='Managing Member';
                                topEnityupdate.Organization_State_EM1__c=middleMangerEnity.Organization_State__c;
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(middleMangerEnity.Entity_Member_1__c==null && middleMangerEnity.id==topEntityManging2){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=middleMangerEnity.Member_1__c;
                                //topEnityupdate.Signor_Title_EM2__c='Managing Member '+middleMangerEnity.Name +', on behalf of '+topEnityupdate.Name+' as its Managing Member';
                                topEnityupdate.Signor_Title_EM2__c='Managing Member ';
                                topEnityupdate.Organization_State_EM2_del__c=middleMangerEnity.Organization_State__c;
                                
                                
                            } 
                            
                            
                        }
                        
                    }   
                    else{
                        if( middleMangerEnity.RecordTypeId=='012U0000000DE8S' && middleMangerEnity.id==topEntityManging){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_EM1__c=middleMangerEnity.Organization_State__c;
                            topEnityupdate.Signor_of_Entity_Manager_1__c=middleMangerEnity.President__c;
                            
                            topEnityupdate.Signor_Title_EM1__c='President ';
                            
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( middleMangerEnity.RecordTypeId=='012U0000000DE8S' && middleMangerEnity.id==topEntityManging2){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_EM2_del__c=middleMangerEnity.Organization_State__c;
                            topEnityupdate.Signor_of_Entity_Manager_2__c=middleMangerEnity.President__c;
                            
                            topEnityupdate.Signor_Title_EM2__c='President ';
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                    }
                    
                }
                
                if((middleMangerEnity.Structure__c=='Manager-managed'||middleMangerEnity.Structure__c=='Member-managed') && middleMangerEnity.RecordTypeId=='012U0000000DE8m' ){
                    if( middleMangerEnity.Managing_Entity__c!=null  ||middleMangerEnity.Entity_Member_1__c!=null ){
                        
                        System.debug('Processing next Level  -----'+middleMangerEnity.Structure__c);
                        if(middleMangerEnity.Structure__c=='Manager-managed'){
                            
                            
                            if(middleMangerEnity.id==topEntityManging){
                                middleMangingEntity1level1=middleMangerEnity.Managing_Entity__c;   
                                signortitleMangingEntitylevel=' Manager';
                                EntityNameMangingEntitylevel= middleMangerEnity.Name;
                                organizationStateMangingEntity1=middleMangerEnity.Organization_State__c;
                            }
                            if(middleMangerEnity.id==topEntityManging2){
                                middleMangingEntity2level1=middleMangerEnity.Managing_Entity__c;  
                                signortitleMangingEntity2level=' Manager ';
                                EntityNameMangingEntity2level= middleMangerEnity.Name;
                                organizationStateMangingEntity2=middleMangerEnity.Organization_State__c;
                            }
                            
                        }else {
                            if(middleMangerEnity.id==topEntityManging){
                                middleMemberEntity1level1=middleMangerEnity.Entity_Member_1__c; 
                                signortitleMemberEntitylevel=' Managing Member ';
                                EntityNameMemberEntitylevel= middleMangerEnity.Name;
                                organizationStateMemberEntity1=middleMangerEnity.Organization_State__c;
                            }
                            if(middleMangerEnity.id==topEntityManging2){
                                middleMemberEntity2level1=middleMangerEnity.Entity_Member_1__c; 
                                signortitleMemberEntity2level=' Managing Member ';
                                EntityNameMemberEntity2level= middleMangerEnity.Name;
                                organizationStateMemberEntity2=middleMangerEnity.Organization_State__c;
                            }
                            
                        }
                        
                        
                    }
                    MidlesignorofEntityManager= middleMangerEnity.Signor_of_Entity_Manager_1__c;
                    MidlesignorofEntityMember1=middleMangerEnity.Signor_of_Entity_Member_1__c;
                    
                    MiddleEntityName= middleMangerEnity.Name;
                    
                    
                    for(Entities__c mildleMangerlevel2En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Signor_of_Entity_Member_1__c,Entity_Member_2__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Member_3__c,Member_4__c,Member_2__c,Entity_Member_3__c,Entity_Member_4__c,Organization_State_1__c,Ownership__c,Member_1__c,Manager_2__c,Managing_Entity_2__c,Manager_1__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:middleMangerEnity.Managing_Entity__c OR id=:middleMangerEnity.Entity_Member_1__c ]){
                        
                        MiddleMangerEntityLevel2IDMap.put(mildleMangerlevel2En.id,mildleMangerlevel2En);
                    }
                    
                    
                }}
            
            
        }
        
        
        
        //Level Manger Manged 2
        
        if(!MiddleMangerEntityLevel2IDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+MiddleMangerEntityLevel2IDMap.size());
            for(Entities__c middleManagerlevel2Enity:MiddleMangerEntityLevel2IDMap.values()){
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(middleManagerlevel2Enity.RecordTypeId=='012U0000000DE8m'){
                        Midllelevel2structure=middleManagerlevel2Enity.Structure__c;
                        if(middleManagerlevel2Enity.Structure__c=='Manager-managed'&&  middleManagerlevel2Enity.Managing_Entity__c==null  ){
                            
                            
                            
                            if(middleManagerlevel2Enity.Managing_Entity__c==null  && (middleManagerlevel2Enity.id==middleMangingEntity1level1|| middleManagerlevel2Enity.id==middleMemberEntity1level1)){
                                
                                System.debug('Level2 Middle2 is llc  EM1 null Manager-managed and top structure is Manager-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=middleManagerlevel2Enity.Manager_1__c;
                                
                                topEnityupdate.Signor_Title_EM1__c='Manager of '+middleManagerlevel2Enity.Name +', on behalf of '+ (EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel) ;
                                topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                            }
                            if(middleManagerlevel2Enity.Managing_Entity__c==null && ( middleManagerlevel2Enity.id==middleMangingEntity2level1 ||middleManagerlevel2Enity.id==middleMemberEntity2level1) ){
                                
                                System.debug('Level2 Middle2 is llc  EM2 null Manager-managed and top structure is Manager-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=middleManagerlevel2Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_EM2__c='Manager of '+middleManagerlevel2Enity.Name +', on behalf of ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level);   
                                topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                            }  
                            
                        } 
                        else   if(middleManagerlevel2Enity.Structure__c=='Member-managed'&&  middleManagerlevel2Enity.Entity_Member_1__c==null  ){
                            if(middleManagerlevel2Enity.Entity_Member_1__c==null && (middleManagerlevel2Enity.id==middleMangingEntity1level1|| middleManagerlevel2Enity.id==middleMemberEntity1level1)){
                                
                                System.debug('Level2 Middle2 is llc  EMember1 null Manager-managed and top structure is Member-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=middleManagerlevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_EM1__c='Managing Member of '+middleManagerlevel2Enity.Name +', on behalf of '+ (EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel) ;
                                topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(middleManagerlevel2Enity.Entity_Member_1__c==null &&  ( middleManagerlevel2Enity.id==middleMangingEntity2level1 ||middleManagerlevel2Enity.id==middleMemberEntity2level1)){
                                
                                System.debug('Level2 Middle2 is llc  EMember2 null Manager-managed and top structure is Member-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=middleManagerlevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_EM2__c='Managing Member '+middleManagerlevel2Enity.Name +', on behalf of ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level);   
                                topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                EntityList.put(topEnityupdate.id,topEnityupdate);  
                                
                            }  
                            
                            
                        }
                        
                    }    else{
                        System.debug('Reached update Manager-managed corporation /Manager-managed Midlelevel 2   -----'+Midlestructure+','+ middleManagerlevel2Enity.RecordTypeId +','+ middleManagerlevel2Enity.id+','+middleMangingEntity1level1);
                        if(middleManagerlevel2Enity.RecordTypeId=='012U0000000DE8S' && (middleManagerlevel2Enity.id==middleMangingEntity1level1 || middleManagerlevel2Enity.id==middleMemberEntity1level1)){
                            System.debug('Level2 Middle2 is corporation  update Em1 and top structure is Manager-managed--');
                            topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                            topEnityupdate.Signor_of_Entity_Manager_1__c=middleManagerlevel2Enity.President__c;
                            topEnityupdate.Signor_Title_EM1__c='President of '+middleManagerlevel2Enity.Name+', on behalf of '+ (EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel) ;
                            
                            
                            
                            
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if(middleManagerlevel2Enity.RecordTypeId=='012U0000000DE8S' && (middleManagerlevel2Enity.id==middleMangingEntity2level1 || middleManagerlevel2Enity.id==middleMemberEntity2level1)){
                            System.debug('Level2 Middle2 is corporation  update Em2  and top structure is Manager-managed--');
                            topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                            topEnityupdate.Signor_of_Entity_Manager_2__c=middleManagerlevel2Enity.President__c;
                            topEnityupdate.Signor_Title_EM2__c='President of '+middleManagerlevel2Enity.Name+', on behalf of ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level);   
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                        
                    }
                    
                }
                if((middleManagerlevel2Enity.Structure__c=='Manager-managed'||middleManagerlevel2Enity.Structure__c=='Member-managed') && middleManagerlevel2Enity.RecordTypeId=='012U0000000DE8m' ){
                    if( middleManagerlevel2Enity.Managing_Entity__c!=null || middleManagerlevel2Enity.Managing_Entity_2__c!=null || middleManagerlevel2Enity.Entity_Member_1__c!=null ||middleManagerlevel2Enity.Entity_Member_2__c!=null ||middleManagerlevel2Enity.Entity_Member_3__c!=null ||middleManagerlevel2Enity.Entity_Member_4__c!=null ){
                        System.debug('Reached updateMember-managed/corporation Managing_Entity__c level3-----');
                        Midlelevel2signorofEntityManager= middleManagerlevel2Enity.Signor_of_Entity_Manager_1__c;
                        
                        Midlelevel2signorofEntityMember1=middleManagerlevel2Enity.Signor_of_Entity_Member_1__c;
                        if(middleManagerlevel2Enity.Structure__c=='Manager-managed'){
                            
                            
                            if(middleManagerlevel2Enity.id==middleMangingEntity1level1 || middleManagerlevel2Enity.id==middleMemberEntity1level1){
                                middleManagingEntity1level2=middleManagerlevel2Enity.Managing_Entity__c;  
                                signortitleMangingEntitylevel2=' Manager';
                                EntityNameMangingEntitylevel2= middleManagerlevel2Enity.Name;
                            }
                            if(middleManagerlevel2Enity.id==middleMangingEntity2level1 || middleManagerlevel2Enity.id==middleMemberEntity2level1){
                                middleManagingEntity2level2=middleManagerlevel2Enity.Managing_Entity__c;   
                                signortitleMangingEntity2level2=' Manager';
                                EntityNameMangingEntity2level2= middleManagerlevel2Enity.Name;
                            }
                            
                        }else {
                            if(middleManagerlevel2Enity.id==middleMangingEntity1level1 || middleManagerlevel2Enity.id==middleMemberEntity1level1){
                                middleMemberEntity1level2=middleManagerlevel2Enity.Entity_Member_1__c;  
                                signortitleMemberEntitylevel2='  Managing Member ';
                                EntityNameMemberEntitylevel2= middleManagerlevel2Enity.Name;
                            }
                            if(middleManagerlevel2Enity.id==middleMangingEntity2level1 || middleManagerlevel2Enity.id==middleMemberEntity2level1){
                                middleMemberEntity2level2=middleManagerlevel2Enity.Entity_Member_1__c;    
                                signortitleMemberEntity2level2='  Managing Member ';
                                EntityNameMemberEntity2level2= middleManagerlevel2Enity.Name;
                            }
                            
                        }
                        
                        for(Entities__c mildlelevel2En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Member_1__c,Signor_of_Entity_Member_1__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Entity_Member_2__c, Member_4__c,Member_2__c,Member_3__c,Entity_Member_4__c,Entity_Member_3__c,Organization_State_1__c,Ownership__c,Manager_2__c,Manager_1__c,Managing_Entity_2__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:middleManagerlevel2Enity.Managing_Entity__c OR id=:middleManagerlevel2Enity.Entity_Member_1__c ]){
                            
                            MiddleMangerEntityLevel3IDMap.put(mildlelevel2En.id,mildlelevel2En);
                        }
                        
                        
                    }}
                
            }
            
        }
        
        //Level  manager Managed 3
        
        if(!MiddleMangerEntityLevel3IDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+MiddleMangerEntityLevel3IDMap.size());
            for(Entities__c middleManagerlevel3Enity:MiddleMangerEntityLevel3IDMap.values()){
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(middleManagerlevel3Enity.RecordTypeId=='012U0000000DE8m'){
                        Midllelevel2structure=middleManagerlevel3Enity.Structure__c;
                        if(middleManagerlevel3Enity.Structure__c=='Manager-managed' &&  middleManagerlevel3Enity.Managing_Entity__c==null  ){
                            
                            
                            
                            if(middleManagerlevel3Enity.Managing_Entity__c==null  && (middleManagerlevel3Enity.id==middleManagingEntity1level2 || middleManagerlevel3Enity.id==middleMemberEntity1level2) ){
                                
                                System.debug('Level2 Middle2 is llc  EM1 null Manager-managed and top structure is Manager-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=middleManagerlevel3Enity.Manager_1__c;
                                
                                topEnityupdate.Signor_Title_EM1__c='Manager of '+middleManagerlevel3Enity.Name +', '+ (signortitleMangingEntitylevel2!=null?signortitleMangingEntitylevel2: signortitleMemberEntitylevel2)+' of '+ (EntityNameMangingEntitylevel2!=null?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+', on behalf of ' +(EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel) ;   
                                topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                            }
                            if(middleManagerlevel3Enity.Managing_Entity__c==null && (middleManagerlevel3Enity.id==middleManagingEntity2level2||middleManagerlevel3Enity.id==middleMemberEntity2level2) ){
                                
                                System.debug('Level2 Middle2 is llc  EM2 null Manager-managed and top structure is Manager-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=middleManagerlevel3Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_EM2__c='Manager of '+middleManagerlevel3Enity.Name +', '+ (signortitleMangingEntity2level2!=null?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+ (EntityNameMangingEntity2level2!=null?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+', on behalf of  ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                            }  
                            
                        } 
                        else   if(middleManagerlevel3Enity.Structure__c=='Member-managed'&&  middleManagerlevel3Enity.Entity_Member_1__c==null  ){
                            if(middleManagerlevel3Enity.Entity_Member_1__c==null && (middleManagerlevel3Enity.id==middleManagingEntity1level2 || middleManagerlevel3Enity.id==middleMemberEntity1level2)){
                                
                                System.debug('Level2 Middle2 is llc  EMember1 null Manager-managed and top structure is Member-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=middleManagerlevel3Enity.Member_1__c;
                                topEnityupdate.Signor_Title_EM1__c='Managing Member of '+middleManagerlevel3Enity.Name +', '+ (signortitleMangingEntitylevel2!=null?signortitleMangingEntitylevel2: signortitleMemberEntitylevel2)+' of '+ (EntityNameMangingEntitylevel2!=null?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+', on behalf of ' +(EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel) ;   
                                topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(middleManagerlevel3Enity.Entity_Member_1__c==null && (middleManagerlevel3Enity.id==middleManagingEntity2level2||middleManagerlevel3Enity.id==middleMemberEntity2level2)){
                                
                                System.debug('Level2 Middle2 is llc  EMember2 null Manager-managed and top structure is Member-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=middleManagerlevel3Enity.Member_1__c;
                                topEnityupdate.Signor_Title_EM2__c='Managing Member '+middleManagerlevel3Enity.Name +', '+ (signortitleMangingEntity2level2!=null?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+ (EntityNameMangingEntity2level2!=null?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+', on behalf of  ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                EntityList.put(topEnityupdate.id,topEnityupdate);  
                                
                            }  
                            
                        }
                        
                    }    else{
                        System.debug('Reached update Manager-managed corporation /Manager-managed Midlelevel 2   -----'+Midlestructure+','+ middleManagerlevel3Enity.RecordTypeId +','+ middleManagerlevel3Enity.id+','+middleManagingEntity1level2);
                        if(topEnityupdate.Structure__c=='Manager-managed' && middleManagerlevel3Enity.RecordTypeId=='012U0000000DE8S' && (middleManagerlevel3Enity.id==middleManagingEntity1level2 || middleManagerlevel3Enity.id == middleMemberEntity1level2)){
                            System.debug('Level2 Middle2 is corporation  update Em1 and top structure is Manager-managed--');
                            topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                            topEnityupdate.Signor_of_Entity_Manager_1__c=middleManagerlevel3Enity.President__c;
                            
                            topEnityupdate.Signor_Title_EM1__c='President of '+middleManagerlevel3Enity.Name+', '+ (signortitleMangingEntitylevel2!=null?signortitleMangingEntitylevel2: signortitleMemberEntitylevel2)+' of '+ (EntityNameMangingEntitylevel2!=null?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+', on behalf of ' +(EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel) ;   
                            
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if(topEnityupdate.Structure__c=='Manager-managed' && middleManagerlevel3Enity.RecordTypeId=='012U0000000DE8S' && (middleManagerlevel3Enity.id==middleMemberEntity2level2 || middleManagerlevel3Enity.id == middleManagingEntity2level2) ){
                            System.debug('Level2 Middle2 is corporation  update Em2  and top structure is Manager-managed--');
                            topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                            topEnityupdate.Signor_of_Entity_Manager_2__c=middleManagerlevel3Enity.President__c;
                            topEnityupdate.Signor_Title_EM2__c='President of '+middleManagerlevel3Enity.Name+', '+ (signortitleMangingEntity2level2!=null?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+ (EntityNameMangingEntity2level2!=null?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+', on behalf of  ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level);
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                        
                    }
                    
                }
                if((middleManagerlevel3Enity.Structure__c=='Manager-managed'||middleManagerlevel3Enity.Structure__c=='Member-managed') && middleManagerlevel3Enity.RecordTypeId=='012U0000000DE8m' ){
                    if( middleManagerlevel3Enity.Managing_Entity__c!=null || middleManagerlevel3Enity.Managing_Entity_2__c!=null || middleManagerlevel3Enity.Entity_Member_1__c!=null  ){
                        System.debug('Reached updateMember-managed/corporation Managing_Entity__c level3-----');
                        Midlelevel2signorofEntityManager= middleManagerlevel3Enity.Signor_of_Entity_Manager_1__c;
                        
                        Midlelevel2signorofEntityMember1=middleManagerlevel3Enity.Signor_of_Entity_Member_1__c;
                        if(middleManagerlevel3Enity.Structure__c=='Manager-managed'){
                            
                            
                            if(middleManagerlevel3Enity.id==middleManagingEntity1level2 ||middleManagerlevel3Enity.id==middleMemberEntity1level2){
                                middleManagingEntity1level3=middleManagerlevel3Enity.Managing_Entity__c;    
                                signortitleMangingEntitylevel3=' Manager';
                                EntityNameMangingEntitylevel3= middleManagerlevel3Enity.Name;
                            }
                            if(middleManagerlevel3Enity.id==middleManagingEntity2level2 || middleManagerlevel3Enity.id==middleMemberEntity2level2 ){
                                middleManagingEntity2level3=middleManagerlevel3Enity.Managing_Entity__c;  
                                signortitleMangingEntity2level3=' Manager';
                                EntityNameMangingEntity2level3= middleManagerlevel3Enity.Name;
                            }
                            
                        }else {
                            if(middleManagerlevel3Enity.id==middleManagingEntity1level2 ||middleManagerlevel3Enity.id==middleMemberEntity1level2){
                                middleMemberEntity1level3=middleManagerlevel3Enity.Entity_Member_1__c;   
                                signortitleMemberEntitylevel3=' Managing Member ';
                                EntityNameMemberEntitylevel3= middleManagerlevel3Enity.Name;
                            }
                            if(middleManagerlevel3Enity.id==middleManagingEntity2level2 || middleManagerlevel3Enity.id==middleMemberEntity2level2){
                                middleMemberEntity2level3=middleManagerlevel3Enity.Entity_Member_1__c;  
                                signortitleMemberEntity2level3=' Managing Member ';
                                EntityNameMemberEntity2level3= middleManagerlevel3Enity.Name;
                            }
                            
                        }
                        
                        for(Entities__c mildleMangerlevel3En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Member_1__c,Signor_of_Entity_Member_1__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Entity_Member_2__c, Member_4__c,Member_2__c,Member_3__c,Entity_Member_4__c,Entity_Member_3__c,Organization_State_1__c,Ownership__c,Manager_2__c,Manager_1__c,Managing_Entity_2__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:middleManagerlevel3Enity.Managing_Entity__c OR id=:middleManagerlevel3Enity.Entity_Member_1__c ]){
                            
                            baseMangerEntityIDMap.put(mildleMangerlevel3En.id,mildleMangerlevel3En);
                        }
                        
                        
                    }}
                
            }
            
        }
        
        
        //Base Level
        
        if(!baseMangerEntityIDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+baseMangerEntityIDMap.size());
            for(Entities__c baseManagerlevel2Enity:baseMangerEntityIDMap.values()){
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(baseManagerlevel2Enity.RecordTypeId=='012U0000000DE8m'){
                        Midllelevel2structure=baseManagerlevel2Enity.Structure__c;
                        if(baseManagerlevel2Enity.Structure__c=='Manager-managed'&&  baseManagerlevel2Enity.Managing_Entity__c==null  ){
                            
                            
                            
                            if(baseManagerlevel2Enity.Managing_Entity__c==null  && ( baseManagerlevel2Enity.id==middleManagingEntity1level3 || baseManagerlevel2Enity.id==middleMemberEntity1level3) ){
                                
                                System.debug('Level2 Middle2 is llc  EM1 null Manager-managed and top structure is Manager-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=baseManagerlevel2Enity.Manager_1__c;
                                
                                topEnityupdate.Signor_Title_EM1__c='Manager of '+baseManagerlevel2Enity.Name +', '+ (signortitleMangingEntitylevel3!=null?signortitleMangingEntitylevel3:signortitleMemberEntitylevel3)+' of '+ (EntityNameMangingEntitylevel3!=null?EntityNameMangingEntitylevel3:EntityNameMemberEntitylevel3)+', '+ (signortitleMangingEntitylevel2!=null?signortitleMangingEntitylevel2: signortitleMemberEntitylevel2)+' of '+ (EntityNameMangingEntitylevel2!=null?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+',  on behalf of ' +(EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                            }
                            if(baseManagerlevel2Enity.Managing_Entity__c==null && (baseManagerlevel2Enity.id==middleManagingEntity2level3 || baseManagerlevel2Enity.id==middleMemberEntity2level3) ){
                                
                                System.debug('Level2 Middle2 is llc  EM2 null Manager-managed and top structure is Manager-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=baseManagerlevel2Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_EM2__c='Manager of '+baseManagerlevel2Enity.Name +', '+ (signortitleMangingEntity2level3!=null?signortitleMangingEntity2level3:signortitleMemberEntity2level3)+' of '+ (EntityNameMangingEntity2level3!=null?EntityNameMangingEntity2level3:EntityNameMemberEntity2level3)+', '+ (signortitleMangingEntity2level2!=null?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+ (EntityNameMangingEntity2level2!=null?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+', on behalf of ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level) ;   
                                topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                            }  
                            
                        } 
                        else   if(baseManagerlevel2Enity.Structure__c=='Member-managed'&&  baseManagerlevel2Enity.Entity_Member_1__c==null  ){
                            if(baseManagerlevel2Enity.Entity_Member_1__c==null && ( baseManagerlevel2Enity.id==middleManagingEntity1level3 || baseManagerlevel2Enity.id==middleMemberEntity1level3)){
                                
                                System.debug('Level2 Middle2 is llc  EMember1 null Manager-managed and top structure is Member-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_1__c=baseManagerlevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_EM1__c='Managing Member of '+baseManagerlevel2Enity.Name +', '+ (signortitleMangingEntitylevel3!=null?signortitleMangingEntitylevel3:signortitleMemberEntitylevel3)+' of '+ (EntityNameMangingEntitylevel3!=null?EntityNameMangingEntitylevel3:EntityNameMemberEntitylevel3)+', '+ (signortitleMangingEntitylevel2!=null?signortitleMangingEntitylevel2: signortitleMemberEntitylevel2)+' of '+ (EntityNameMangingEntitylevel2!=null?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+',  on behalf of ' +(EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(baseManagerlevel2Enity.Entity_Member_1__c==null && (baseManagerlevel2Enity.id==middleManagingEntity2level3 || baseManagerlevel2Enity.id==middleMemberEntity2level3)){
                                
                                System.debug('Level2 Middle2 is llc  EMember2 null Manager-managed and top structure is Member-managed--');
                                topEnityupdate.Signor_of_Entity_Manager_2__c=baseManagerlevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_EM2__c='Managing Member '+baseManagerlevel2Enity.Name +', '+ (signortitleMangingEntity2level3!=null?signortitleMangingEntity2level3:signortitleMemberEntity2level3)+' of '+ (EntityNameMangingEntity2level3!=null?EntityNameMangingEntity2level3:EntityNameMemberEntity2level3)+', '+ (signortitleMangingEntity2level2!=null?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+ (EntityNameMangingEntity2level2!=null?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+', on behalf of ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level) ;   
                                topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                EntityList.put(topEnityupdate.id,topEnityupdate);  
                                
                            }  
                            
                        }
                        
                    }    else{
                        System.debug('Reached update Manager-managed corporation /Manager-managed Midlelevel 2   -----'+Midlestructure+','+ baseManagerlevel2Enity.RecordTypeId +','+ baseManagerlevel2Enity.id+','+middleMangingEntity1level1);
                        if(topEnityupdate.Structure__c=='Manager-managed' && baseManagerlevel2Enity.RecordTypeId=='012U0000000DE8S' && (baseManagerlevel2Enity.id==middleManagingEntity1level3 || baseManagerlevel2Enity.id==middleMemberEntity1level3)){
                            
                            System.debug('Level2 Middle2 is corporation  update Em1 and top structure is Manager-managed--');
                            topEnityupdate.Organization_State_EM1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                            topEnityupdate.Signor_of_Entity_Manager_1__c=baseManagerlevel2Enity.President__c;
                            topEnityupdate.Signor_Title_EM1__c='President of '+baseManagerlevel2Enity.Name+', '+ (signortitleMangingEntitylevel3!=null?signortitleMangingEntitylevel3:signortitleMemberEntitylevel3)+' of '+ (EntityNameMangingEntitylevel3!=null?EntityNameMangingEntitylevel3:EntityNameMemberEntitylevel3)+', '+ (signortitleMangingEntitylevel2!=null?signortitleMangingEntitylevel2: signortitleMemberEntitylevel2)+' of '+ (EntityNameMangingEntitylevel2!=null?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+',  on behalf of ' +(EntityNameMangingEntitylevel!=null?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if(topEnityupdate.Structure__c=='Manager-managed' && baseManagerlevel2Enity.RecordTypeId=='012U0000000DE8S' && (baseManagerlevel2Enity.id==middleManagingEntity2level3 || baseManagerlevel2Enity.id==middleMemberEntity2level3 )){
                            System.debug('Level2 Middle2 is corporation  update Em2  and top structure is Manager-managed--');
                            topEnityupdate.Organization_State_EM2_del__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                            topEnityupdate.Signor_of_Entity_Manager_2__c=baseManagerlevel2Enity.President__c;
                            topEnityupdate.Signor_Title_EM2__c='President of '+baseManagerlevel2Enity.Name+', '+ (signortitleMangingEntity2level3!=null?signortitleMangingEntity2level3:signortitleMemberEntity2level3)+' of '+ (EntityNameMangingEntity2level3!=null?EntityNameMangingEntity2level3:EntityNameMemberEntity2level3)+', '+ (signortitleMangingEntity2level2!=null?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+ (EntityNameMangingEntity2level2!=null?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+', on behalf of ' +(EntityNameMemberEntity2level!=null?EntityNameMemberEntity2level:EntityNameMangingEntity2level)+' as its '+(signortitleMangingEntity2level!=null?signortitleMangingEntity2level:signortitleMemberEntity2level) ;   
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                        
                    }
                    
                }
                /*  if((baseManagerlevel2Enity.Structure__c=='Manager-managed'||baseManagerlevel2Enity.Structure__c=='Member-managed') && baseManagerlevel2Enity.RecordTypeId=='012U0000000DE8m' ){
if( baseManagerlevel2Enity.Managing_Entity__c!=null || baseManagerlevel2Enity.Entity_Member_1__c!=null ){
System.debug('Reached updateMember-managed/corporation Managing_Entity__c level3-----');
Midlelevel2signorofEntityManager= baseManagerlevel2Enity.Signor_of_Entity_Manager_1__c;
Middlelevel2EntityName= baseManagerlevel2Enity.Name;
Midlelevel2signorofEntityMember1=baseManagerlevel2Enity.Signor_of_Entity_Member_1__c;
if(baseManagerlevel2Enity.Structure__c=='Manager-managed'){


if(baseManagerlevel2Enity.id==topEntityManging){
middleManagingEntity1level2=baseManagerlevel2Enity.Managing_Entity__c;         
}
if(baseManagerlevel2Enity.id==topEntityManging2){
middleManagingEntity2level2=baseManagerlevel2Enity.Managing_Entity__c;         
}

}else {
if(baseManagerlevel2Enity.id==topEntityManging){
middleManagingEntity1level2=baseManagerlevel2Enity.Entity_Member_1__c;         
}
if(baseManagerlevel2Enity.id==topEntityManging2){
middleManagingEntity2level2=baseManagerlevel2Enity.Entity_Member_1__c;         
}

}

for(Entities__c mildlelevel2En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Member_1__c,Signor_of_Entity_Member_1__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Entity_Member_2__c, Member_4__c,Member_2__c,Member_3__c,Entity_Member_4__c,Entity_Member_3__c,Organization_State_1__c,Ownership__c,Manager_2__c,Manager_1__c,Managing_Entity_2__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:baseManagerlevel2Enity.Managing_Entity__c OR id=:baseManagerlevel2Enity.Entity_Member_1__c ]){

MiddleMangerEntityLevel3IDMap.put(mildlelevel2En.id,mildlelevel2En);
}


}}*/
                
            }
            
        }
        else{
            signortitleMangingEntitylevel='';
            signortitleMemberEntitylevel='';
            signortitleMangingEntitylevel2='';
            signortitleMemberEntitylevel2='';
            signortitleMangingEntitylevel3='';
            signortitleMemberEntitylevel3='';
            
            
            
            EntityNameMangingEntity3level2='';
            EntityNameMangingEntity4level2='';
            EntityNameMemberEntity3level2='';
            EntityNameMemberEntity4level2='';
            
            
            
            EntityNameMangingEntitylevel='';
            EntityNameMemberEntitylevel='';
            EntityNameMangingEntitylevel2='';
            EntityNameMemberEntitylevel2='';
            EntityNameMangingEntitylevel3='';
            EntityNameMemberEntitylevel3='';
            
            EntityNameMangingEntity2level='';
            
            EntityNameMangingEntity3level='';
            
            EntityNameMangingEntity4level='';
            EntityNameMemberEntity2level='';
            EntityNameMemberEntity3level='';
            EntityNameMemberEntity4level='';
            
            EntityNameMemberEntity2level2='';
            EntityNameMangingEntity2level2='';
            
            
            
            EntityNameMangingEntity2level3='';
            EntityNameMemberEntity2level3='';
            
            EntityNameMangingEntity3level3='';
            
            EntityNameMangingEntity4level3='';
            EntityNameMemberEntity3level3='';
            EntityNameMemberEntity4level3='';
            
            middleMangingEntity1level1=null;
            middleMangingEntity2level1=null;
            middleMemberEntity1level1=null;
            middleMemberEntity2level1=null;
            middleManagingEntity1level2=null;
            middleManagingEntity2level2=null;
            middleMemberEntity1level2=null;
            middleMemberEntity2level2=null;
            middleManagingEntity1level3=null;
            middleManagingEntity2level3=null;
            middleMemberEntity1level3=null;
            middleMemberEntity2level3=null;
            
            
        }
        
        
        // Level 1 Member manged
        
        if(!MiddleMemberEntityIDMap.isEmpty()){
            
            
            System.debug('Size MiddleEntityIDMap---'+MiddleMemberEntityIDMap.size());
            for(Entities__c middleMemberEnity:MiddleMemberEntityIDMap.values()){
                
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(middleMemberEnity.RecordTypeId=='012U0000000DE8m'){
                        
                        Midlestructure=middleMemberEnity.Structure__c;
                        if(middleMemberEnity.Structure__c=='Manager-managed'&&  middleMemberEnity.Managing_Entity__c==null ){
                            
                            
                            
                            if(middleMemberEnity.Managing_Entity__c==null  && middleMemberEnity.id==topEntityMemeber1){
                                
                                System.debug('Level1 Middle1 is llc and Em1 is null and top structure is manager manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_1__c='Manager ';
                                topEnityupdate.Organization_State_1__c=middleMemberEnity.Organization_State__c;
                                EntityList.put(topEnityupdate.id,topEnityupdate); 
                                
                            }
                            if(middleMemberEnity.Managing_Entity__c==null  && middleMemberEnity.id==topEntityMemeber2){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_2__c='Manager  ';
                                topEnityupdate.Organization_State_2__c=middleMemberEnity.Organization_State__c;
                                
                            }
                            if(middleMemberEnity.Managing_Entity__c==null  && middleMemberEnity.id==topEntityMemeber3){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_3__c='Manager ';
                                topEnityupdate.Organization_State_3__c=middleMemberEnity.Organization_State__c;
                                
                            }
                            if(middleMemberEnity.Managing_Entity__c==null  && middleMemberEnity.id== topEntityMemeber4){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_4__c='Manager ';
                                topEnityupdate.Organization_State_4__c=middleMemberEnity.Organization_State__c;
                                
                            }
                            
                            
                        } 
                        else  if(middleMemberEnity.Structure__c=='Member-managed'&&  (middleMemberEnity.Entity_Member_1__c==null ) ){
                            System.debug('Reached memeber managed Mid Level1 id --'+ topEnityupdate.Entity_Member_1__c +','+  middleMemberEnity.id+','+ middleMemberEnity.Entity_Member_1__c);
                            
                            if(middleMemberEnity.Entity_Member_1__c==null && middleMemberEnity.id==topEntityMemeber1){
                                
                                System.debug('Level1 Middle1 is llc and Emember1 is null and top structure is member manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_1__c='Managing Member ';
                                topEnityupdate.Organization_State_1__c=middleMemberEnity.Organization_State__c;
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(middleMemberEnity.Entity_Member_1__c==null && middleMemberEnity.id==topEntityMemeber2){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_2__c='Managing Member ';
                                topEnityupdate.Organization_State_2__c=middleMemberEnity.Organization_State__c;
                                
                                
                            } 
                            
                            if(middleMemberEnity.Entity_Member_1__c==null && middleMemberEnity.id==topEntityMemeber3){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_3__c='Managing Member ';
                                topEnityupdate.Organization_State_3__c=middleMemberEnity.Organization_State__c;
                                
                                
                            } 
                            if(middleMemberEnity.Entity_Member_1__c==null && middleMemberEnity.id==topEntityMemeber4){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_4__c='Managing Member ';
                                topEnityupdate.Organization_State_4__c=middleMemberEnity.Organization_State__c;
                                
                                
                            } 
                            
                            
                        }
                        
                    }   
                    else{
                        if( middleMemberEnity.RecordTypeId=='012U0000000DE8S' && middleMemberEnity.id==topEntityMemeber1){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_1__c=middleMemberEnity.Organization_State__c;
                            topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_1__c='President  ';
                            
                            
                        }
                        if( middleMemberEnity.RecordTypeId=='012U0000000DE8S' && middleMemberEnity.id==topEntityMemeber2){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_2__c=middleMemberEnity.Organization_State__c;
                            topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_2__c='President ';
                            
                            
                        }
                        
                        if( middleMemberEnity.RecordTypeId=='012U0000000DE8S' && middleMemberEnity.id==topEntityMemeber3){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_3__c=middleMemberEnity.Organization_State__c;
                            topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_3__c='President ';
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( middleMemberEnity.RecordTypeId=='012U0000000DE8S' && middleMemberEnity.id==topEntityMemeber4){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_4__c=middleMemberEnity.Organization_State__c;
                            topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_4__c='President ';
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                    }
                    
                }
                
                if((middleMemberEnity.Structure__c=='Manager-managed'||middleMemberEnity.Structure__c=='Member-managed') && middleMemberEnity.RecordTypeId=='012U0000000DE8m' ){
                    if( middleMemberEnity.Managing_Entity__c!=null  ||middleMemberEnity.Entity_Member_1__c!=null ){
                        
                        System.debug('Processing next Level  -----'+middleMemberEnity.Structure__c);
                        if(middleMemberEnity.Structure__c=='Manager-managed'){
                            
                            
                            if(middleMemberEnity.id==topEntityMemeber1){
                                middleMangingEntity1level1=middleMemberEnity.Managing_Entity__c;   
                                signortitleMangingEntitylevel=' Manager';
                                EntityNameMangingEntitylevel= middleMemberEnity.Name;
                                organizationStateMangingEntity1=middleMemberEnity.Organization_State__c;
                                
                            }
                            if(middleMemberEnity.id==topEntityMemeber2){
                                middleMangingEntity2level1=middleMemberEnity.Managing_Entity__c;  
                                signortitleMangingEntity2level=' Manager ';
                                EntityNameMangingEntity2level= middleMemberEnity.Name;
                                organizationStateMangingEntity2=middleMemberEnity.Organization_State__c;
                            }
                            if(middleMemberEnity.id==topEntityMemeber3){
                                middleMangingEntity3level1=middleMemberEnity.Managing_Entity__c;   
                                signortitleMangingEntity3level=' Manager';
                                EntityNameMangingEntity3level= middleMemberEnity.Name;
                                organizationStateMangingEntity3=middleMemberEnity.Organization_State__c;
                            }
                            if(middleMemberEnity.id==topEntityMemeber4){
                                middleMangingEntity4level1=middleMemberEnity.Managing_Entity__c;  
                                signortitleMangingEntity4level=' Manager ';
                                EntityNameMangingEntity4level= middleMemberEnity.Name;
                                organizationStateMangingEntity4=middleMemberEnity.Organization_State__c;
                            }
                            
                        }else {
                            if(middleMemberEnity.id==topEntityMemeber1){
                                System.debug('Test------'+signortitleMemberEntitylevel+','+EntityNameMemberEntitylevel);
                                middleMemberEntity1level1=middleMemberEnity.Entity_Member_1__c; 
                                signortitleMemberEntitylevel=' Managing Member ';
                                EntityNameMemberEntitylevel= middleMemberEnity.Name;
                                organizationStateMemberEntity1=middleMemberEnity.Organization_State__c;
                            }
                            if(middleMemberEnity.id==topEntityMemeber2){
                                System.debug('Test------'+signortitleMemberEntitylevel+','+EntityNameMemberEntity2level);
                                middleMemberEntity2level1=middleMemberEnity.Entity_Member_1__c; 
                                signortitleMemberEntity2level=' Managing Member ';
                                EntityNameMemberEntity2level= middleMemberEnity.Name;
                                organizationStateMemberEntity2=middleMemberEnity.Organization_State__c;
                            }
                            if(middleMemberEnity.id==topEntityMemeber3){
                                System.debug('Test------'+signortitleMemberEntitylevel+','+EntityNameMemberEntity3level);
                                middleMemberEntity3level1=middleMemberEnity.Entity_Member_1__c; 
                                signortitleMemberEntity3level=' Managing Member ';
                                EntityNameMemberEntity3level= middleMemberEnity.Name;
                                organizationStateMemberEntity3=middleMemberEnity.Organization_State__c;
                            }
                            if(middleMemberEnity.id==topEntityMemeber4){
                                System.debug('Test------'+signortitleMemberEntitylevel+','+EntityNameMemberEntity4level);
                                middleMemberEntity4level1=middleMemberEnity.Entity_Member_1__c; 
                                signortitleMemberEntity4level=' Managing Member ';
                                EntityNameMemberEntity4level= middleMemberEnity.Name;
                                organizationStateMemberEntity4=middleMemberEnity.Organization_State__c;
                            }
                            
                        }
                        
                        
                    }
                    
                    
                    
                    for(Entities__c mildleMangerlevel2En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Signor_of_Entity_Member_1__c,Entity_Member_2__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Member_3__c,Member_4__c,Member_2__c,Entity_Member_3__c,Entity_Member_4__c,Organization_State_1__c,Ownership__c,Member_1__c,Manager_2__c,Managing_Entity_2__c,Manager_1__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:middleMemberEnity.Managing_Entity__c OR id=:middleMemberEnity.Entity_Member_1__c ]){
                        
                        MiddleMemberEntityLevel2IDMap.put(mildleMangerlevel2En.id,mildleMangerlevel2En);
                    }
                    
                    
                }}
            
        }
        
        //level 2 memeber Manged
        
        if(!MiddleMemberEntityLevel2IDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+MiddleMemberEntityLevel2IDMap.size());
            for(Entities__c middleMemberLevel2Enity:MiddleMemberEntityLevel2IDMap.values()){
                
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(middleMemberLevel2Enity.RecordTypeId=='012U0000000DE8m'){
                        
                        Midlestructure=middleMemberLevel2Enity.Structure__c;
                        if(middleMemberLevel2Enity.Structure__c=='Manager-managed'&& middleMemberLevel2Enity.Managing_Entity__c==null ){
                            
                            
                            
                            if(middleMemberLevel2Enity.Managing_Entity__c==null  && (middleMemberLevel2Enity.id==middleMangingEntity1level1 || middleMemberLevel2Enity.id==middleMemberEntity1level1)){
                                
                                System.debug('Level1 Middle1 is llc and Em1 is null and top structure is manager manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberLevel2Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_1__c='Manager of '+middleMemberLevel2Enity.Name +', on behalf of ' +(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!='' ?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel) +' as its '+(signortitleMangingEntitylevel!=null  && signortitleMangingEntitylevel!='' ?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                EntityList.put(topEnityupdate.id,topEnityupdate); 
                                
                            }
                            if(middleMemberLevel2Enity.Managing_Entity__c==null  && (middleMemberLevel2Enity.id==middleMangingEntity2level1|| middleMemberLevel2Enity.id==middleMemberEntity2level1)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberLevel2Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_2__c='Manager of '+middleMemberLevel2Enity.Name +', on behalf of '  +(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +' as its '+(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                            }
                            if(middleMemberLevel2Enity.Managing_Entity__c==null  && (middleMemberLevel2Enity.id==middleMangingEntity3level1 || middleMemberLevel2Enity.id==middleMemberEntity3level1)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberLevel2Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_3__c='Manager of '+middleMemberLevel2Enity.Name +', on behalf of '  +(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level)+' as its '+(signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level);
                                topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                                
                            }
                            if(middleMemberLevel2Enity.Managing_Entity__c==null  && (middleMemberLevel2Enity.id== middleMangingEntity4level1 || middleMemberLevel2Enity.id==middleMemberEntity4level1)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberLevel2Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_4__c='Manager of '+middleMemberLevel2Enity.Name +', on behalf of '  +(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +' as its '+(signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                                topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                                
                            }
                            
                            
                        } 
                        else  if(middleMemberLevel2Enity.Structure__c=='Member-managed'&&  (middleMemberLevel2Enity.Entity_Member_1__c==null ) ){
                            System.debug('Reached memeber managed Mid Level1 id --'+ topEnityupdate.Entity_Member_1__c +','+  middleMemberLevel2Enity.id+','+ middleMemberLevel2Enity.Entity_Member_1__c);
                            
                            if(middleMemberLevel2Enity.Entity_Member_1__c==null && (middleMemberLevel2Enity.id==middleMangingEntity1level1 || middleMemberLevel2Enity.id==middleMemberEntity1level1)){
                                
                                System.debug('Level1 Middle1 is llc and Emember1 is null and top structure is member manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberLevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_1__c='Managing Member of '+middleMemberLevel2Enity.Name +', on behalf of ' +(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!='' ?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel) +' as its '+(signortitleMangingEntitylevel!=null  && signortitleMangingEntitylevel!='' ?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(middleMemberLevel2Enity.Entity_Member_1__c==null && (middleMemberLevel2Enity.id==middleMangingEntity2level1|| middleMemberLevel2Enity.id==middleMemberEntity2level1)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberLevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_2__c='Managing Member '+middleMemberLevel2Enity.Name +', on behalf of '  +(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +' as its '+(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                                
                            } 
                            
                            if(middleMemberLevel2Enity.Entity_Member_1__c==null && (middleMemberLevel2Enity.id==middleMangingEntity3level1 || middleMemberLevel2Enity.id==middleMemberEntity3level1)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberLevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_3__c='Managing Member '+middleMemberLevel2Enity.Name +', on behalf of '  +(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level)+' as its '+(signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level);
                                topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                                
                                
                            } 
                            if(middleMemberLevel2Enity.Entity_Member_1__c==null && (middleMemberLevel2Enity.id== middleMangingEntity4level1 || middleMemberLevel2Enity.id==middleMemberEntity4level1)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberLevel2Enity.Member_1__c;
                                topEnityupdate.Signor_Title_4__c='Managing Member '+middleMemberLevel2Enity.Name +', on behalf of '  +(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +' as its '+(signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                                topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                                
                                
                            } 
                            
                            
                        }
                        
                    }   
                    else{
                        if( middleMemberLevel2Enity.RecordTypeId=='012U0000000DE8S' && ( middleMemberLevel2Enity.id==middleMangingEntity1level1 || middleMemberLevel2Enity.id==middleMemberEntity1level1 )){
                            
                            topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                            topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberLevel2Enity.President__c;
                            
                            topEnityupdate.Signor_Title_1__c='President of '+middleMemberLevel2Enity.Name+', on behalf of ' +(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!='' ?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel) +' as its '+(signortitleMangingEntitylevel!=null  && signortitleMangingEntitylevel!='' ?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                            
                            
                            
                            
                            
                        }
                        if( middleMemberLevel2Enity.RecordTypeId=='012U0000000DE8S' &&( middleMemberLevel2Enity.id==middleMangingEntity2level1 || middleMemberLevel2Enity.id==middleMemberEntity2level1 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                            topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberLevel2Enity.President__c;
                            
                            topEnityupdate.Signor_Title_2__c='President of '+middleMemberLevel2Enity.Name+', on behalf of '  +(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +' as its '+(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                        if( middleMemberLevel2Enity.RecordTypeId=='012U0000000DE8S' && ( middleMemberLevel2Enity.id==middleMangingEntity3level1 || middleMemberLevel2Enity.id==middleMemberEntity3level1 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                            topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberLevel2Enity.President__c;
                            
                            topEnityupdate.Signor_Title_3__c='President of '+middleMemberLevel2Enity.Name+', on behalf of '  +(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level)+' as its '+(signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( middleMemberLevel2Enity.RecordTypeId=='012U0000000DE8S' && ( middleMemberLevel2Enity.id==middleMangingEntity4level1 || middleMemberLevel2Enity.id==middleMemberEntity4level1 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                            topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberLevel2Enity.President__c;
                            
                            topEnityupdate.Signor_Title_4__c='President of '+middleMemberLevel2Enity.Name+', on behalf of '  +(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +' as its '+(signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                    }
                    
                }
                
                if((middleMemberLevel2Enity.Structure__c=='Manager-managed'||middleMemberLevel2Enity.Structure__c=='Member-managed') && middleMemberLevel2Enity.RecordTypeId=='012U0000000DE8m' ){
                    if( middleMemberLevel2Enity.Managing_Entity__c!=null  ||middleMemberLevel2Enity.Entity_Member_1__c!=null ){
                        
                        System.debug('Processing next Level  -----'+middleMemberLevel2Enity.Structure__c);
                        if(middleMemberLevel2Enity.Structure__c=='Manager-managed'){
                            
                            
                            if(middleMemberLevel2Enity.id==middleMangingEntity1level1 || middleMemberLevel2Enity.id==middleMemberEntity1level1){
                                middleManagingEntity1level2=middleMemberLevel2Enity.Managing_Entity__c;   
                                signortitleMangingEntitylevel2=' Manager';
                                EntityNameMangingEntitylevel2= middleMemberLevel2Enity.Name;
                            }
                            if(middleMemberLevel2Enity.id==middleMangingEntity2level1 || middleMemberLevel2Enity.id==middleMemberEntity2level1){
                                middleManagingEntity2level2=middleMemberLevel2Enity.Managing_Entity__c;  
                                signortitleMangingEntity2level2=' Manager ';
                                EntityNameMangingEntity2level2= middleMemberLevel2Enity.Name;
                            }
                            if(middleMemberLevel2Enity.id==middleMangingEntity3level1 || middleMemberLevel2Enity.id==middleMemberEntity3level1){
                                middleManagingEntity3level2=middleMemberLevel2Enity.Managing_Entity__c;   
                                signortitleMangingEntity3level2=' Manager';
                                EntityNameMangingEntity3level2= middleMemberLevel2Enity.Name;
                            }
                            if(middleMemberLevel2Enity.id==middleMangingEntity4level1 || middleMemberLevel2Enity.id==middleMemberEntity4level1){
                                middleManagingEntity4level2=middleMemberLevel2Enity.Managing_Entity__c;  
                                signortitleMangingEntity4level2=' Manager ';
                                EntityNameMangingEntity4level2= middleMemberLevel2Enity.Name;
                            }
                            
                        }else {
                            if(middleMemberLevel2Enity.id==middleMangingEntity1level1 || middleMemberLevel2Enity.id==middleMemberEntity1level1){
                                middleMemberEntity1level2=middleMemberLevel2Enity.Entity_Member_1__c; 
                                signortitleMemberEntitylevel2=' Managing Member ';
                                EntityNameMemberEntitylevel2= middleMemberLevel2Enity.Name;
                            }
                            if(middleMemberLevel2Enity.id==middleMangingEntity2level1 || middleMemberLevel2Enity.id==middleMemberEntity2level1){
                                middleMemberEntity2level2=middleMemberLevel2Enity.Entity_Member_1__c; 
                                signortitleMemberEntity2level2=' Managing Member ';
                                EntityNameMemberEntity2level2= middleMemberLevel2Enity.Name;
                            }
                            if(middleMemberLevel2Enity.id==middleMangingEntity3level1 || middleMemberLevel2Enity.id==middleMemberEntity3level1){
                                middleMemberEntity3level2=middleMemberLevel2Enity.Entity_Member_1__c; 
                                signortitleMemberEntity3level2=' Managing Member ';
                                EntityNameMemberEntity3level2= middleMemberLevel2Enity.Name;
                            }
                            if(middleMemberLevel2Enity.id==middleMangingEntity4level1 || middleMemberLevel2Enity.id==middleMemberEntity4level1){
                                middleMemberEntity4level2=middleMemberLevel2Enity.Entity_Member_1__c; 
                                signortitleMemberEntity4level2=' Managing Member ';
                                EntityNameMemberEntity4level2= middleMemberLevel2Enity.Name;
                            }
                            
                        }
                        
                        
                    }
                    
                    
                    
                    for(Entities__c mildleMangerlevel2En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Signor_of_Entity_Member_1__c,Entity_Member_2__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Member_3__c,Member_4__c,Member_2__c,Entity_Member_3__c,Entity_Member_4__c,Organization_State_1__c,Ownership__c,Member_1__c,Manager_2__c,Managing_Entity_2__c,Manager_1__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:middleMemberLevel2Enity.Managing_Entity__c OR id=:middleMemberLevel2Enity.Entity_Member_1__c ]){
                        
                        MiddleMemberEntityLevel3IDMap.put(mildleMangerlevel2En.id,mildleMangerlevel2En);
                    }
                    
                    
                }}
            
        }
        
        //Level 3 Member manged
        if(!MiddleMemberEntityLevel3IDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+MiddleMemberEntityLevel3IDMap.size());
            for(Entities__c middleMemberLevel3Enity:MiddleMemberEntityLevel3IDMap.values()){
                
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(middleMemberLevel3Enity.RecordTypeId=='012U0000000DE8m'){
                        
                        Midlestructure=middleMemberLevel3Enity.Structure__c;
                        if(middleMemberLevel3Enity.Structure__c=='Manager-managed'&&  middleMemberLevel3Enity.Managing_Entity__c==null ){
                            
                            
                            
                            if(middleMemberLevel3Enity.Managing_Entity__c==null  && (middleMemberLevel3Enity.id==middleManagingEntity1level2||middleMemberLevel3Enity.id==middleMemberEntity1level2)){
                                
                                System.debug('Level1 Middle1 is llc and Em1 is null and top structure is manager manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberLevel3Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_1__c='Manager of '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntitylevel2!=null && signortitleMangingEntitylevel2!=''?signortitleMangingEntitylevel2:signortitleMemberEntitylevel2)+' of '+(EntityNameMangingEntitylevel2!=null && EntityNameMangingEntitylevel2!=''?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+ ', on behalf of '+(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!=''?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null && signortitleMangingEntitylevel!=''?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                EntityList.put(topEnityupdate.id,topEnityupdate); 
                                
                            }
                            if(middleMemberLevel3Enity.Managing_Entity__c==null  && (middleMemberLevel3Enity.id==middleManagingEntity2level2||middleMemberLevel3Enity.id==middleMemberEntity2level2)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberLevel3Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_2__c='Manager of '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntity2level2!=null && signortitleMangingEntity2level2!=''?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+(EntityNameMangingEntity2level2!=null && EntityNameMangingEntity2level2!=''?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+ ', on behalf of '+(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +' as its '+(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                            }
                            if(middleMemberLevel3Enity.Managing_Entity__c==null  && (middleMemberLevel3Enity.id==middleManagingEntity3level2||middleMemberLevel3Enity.id==middleMemberEntity3level2)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberLevel3Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_3__c='Manager of '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntity3level2!=null && signortitleMangingEntity3level2!=''?signortitleMangingEntity3level2:signortitleMemberEntity3level2)+' of '+(EntityNameMangingEntity3level2!=null && EntityNameMangingEntity3level2!=''?EntityNameMangingEntity3level2:EntityNameMemberEntity3level2)+ ', on behalf of '+(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level) +' as its '+ (signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level);
                                topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                                
                            }
                            if(middleMemberLevel3Enity.Managing_Entity__c==null  && (middleMemberLevel3Enity.id== middleManagingEntity4level2 ||middleMemberLevel3Enity.id==middleMemberEntity4level2)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberLevel3Enity.Manager_1__c;
                                topEnityupdate.Signor_Title_4__c='Manager of '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntity4level2!=null && signortitleMangingEntity4level2!=''?signortitleMangingEntity4level2:signortitleMemberEntity4level2)+' of '+(EntityNameMangingEntity4level2!=null && EntityNameMangingEntity4level2!=''?EntityNameMangingEntity4level2:EntityNameMemberEntity4level2)+ ', on behalf of '+(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +' as its '+ (signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                                topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                                
                            }
                            
                            
                        } 
                        else  if(middleMemberLevel3Enity.Structure__c=='Member-managed'&&  (middleMemberLevel3Enity.Entity_Member_1__c==null ) ){
                            System.debug('Reached memeber managed Mid Level1 id --'+ topEnityupdate.Entity_Member_1__c +','+  middleMemberLevel3Enity.id+','+ middleMemberLevel3Enity.Entity_Member_1__c);
                            
                            if(middleMemberLevel3Enity.Entity_Member_1__c==null && (middleMemberLevel3Enity.id==middleManagingEntity1level2||middleMemberLevel3Enity.id==middleMemberEntity1level2)){
                                
                                System.debug('Level1 Middle1 is llc and Emember1 is null and top structure is member manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberLevel3Enity.Member_1__c;
                                topEnityupdate.Signor_Title_1__c='Managing Member of '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntitylevel2!=null && signortitleMangingEntitylevel2!=''?signortitleMangingEntitylevel2:signortitleMemberEntitylevel2)+' of '+(EntityNameMangingEntitylevel2!=null && EntityNameMangingEntitylevel2!=''?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+ ', on behalf of '+(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!=''?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null && signortitleMangingEntitylevel!=''?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(middleMemberLevel3Enity.Entity_Member_1__c==null && (middleMemberLevel3Enity.id==middleManagingEntity2level2||middleMemberLevel3Enity.id==middleMemberEntity2level2)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberLevel3Enity.Member_1__c;
                                topEnityupdate.Signor_Title_2__c='Managing Member '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntity2level2!=null && signortitleMangingEntity2level2!=''?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+(EntityNameMangingEntity2level2!=null && EntityNameMangingEntity2level2!=''?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+ ', on behalf of '+(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +' as its '+(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                                
                            } 
                            
                            if(middleMemberLevel3Enity.Entity_Member_1__c==null &&  (middleMemberLevel3Enity.id==middleManagingEntity3level2||middleMemberLevel3Enity.id==middleMemberEntity3level2)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberLevel3Enity.Member_1__c;
                                topEnityupdate.Signor_Title_3__c='Managing Member '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntity3level2!=null && signortitleMangingEntity3level2!=''?signortitleMangingEntity3level2:signortitleMemberEntity3level2)+' of '+(EntityNameMangingEntity3level2!=null && EntityNameMangingEntity3level2!=''?EntityNameMangingEntity3level2:EntityNameMemberEntity3level2)+ ', on behalf of '+(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level) +' as its '+ (signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level);
                                topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                                
                                
                            } 
                            if(middleMemberLevel3Enity.Entity_Member_1__c==null && (middleMemberLevel3Enity.id== middleManagingEntity4level2 ||middleMemberLevel3Enity.id==middleMemberEntity4level2)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberLevel3Enity.Member_1__c;
                                topEnityupdate.Signor_Title_4__c='Managing Member '+middleMemberLevel3Enity.Name +', '  +(signortitleMangingEntity4level2!=null && signortitleMangingEntity4level2!=''?signortitleMangingEntity4level2:signortitleMemberEntity4level2)+' of '+(EntityNameMangingEntity4level2!=null && EntityNameMangingEntity4level2!=''?EntityNameMangingEntity4level2:EntityNameMemberEntity4level2)+ ', on behalf of '+(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +' as its '+ (signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                                topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                                
                                
                            } 
                            
                            
                        }
                        
                    }   
                    else{
                        if( middleMemberLevel3Enity.RecordTypeId=='012U0000000DE8S' && ( middleMemberLevel3Enity.id==middleManagingEntity1level2 || middleMemberLevel3Enity.id==middleMemberEntity1level2 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                            topEnityupdate.Signor_of_Entity_Member_1__c=middleMemberLevel3Enity.President__c;
                            
                            topEnityupdate.Signor_Title_1__c='President of '+middleMemberLevel3Enity.Name+', '  +(signortitleMangingEntitylevel2!=null && signortitleMangingEntitylevel2!=''?signortitleMangingEntitylevel2:signortitleMemberEntitylevel2)+' of '+(EntityNameMangingEntitylevel2!=null && EntityNameMangingEntitylevel2!=''?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2)+ ', on behalf of '+(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!=''?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel)+' as its '+(signortitleMangingEntitylevel!=null && signortitleMangingEntitylevel!=''?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                            
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( middleMemberLevel3Enity.RecordTypeId=='012U0000000DE8S' &&( middleMemberLevel3Enity.id==middleManagingEntity2level2 || middleMemberLevel3Enity.id==middleMemberEntity2level2 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                            topEnityupdate.Signor_of_Entity_Member_2__c=middleMemberLevel3Enity.President__c;
                            
                            topEnityupdate.Signor_Title_2__c='President of '+middleMemberLevel3Enity.Name+', '  +(signortitleMangingEntity2level2!=null && signortitleMangingEntity2level2!=''?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+(EntityNameMangingEntity2level2!=null && EntityNameMangingEntity2level2!=''?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+ ', on behalf of '+(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +' as its '+(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                        if( middleMemberLevel3Enity.RecordTypeId=='012U0000000DE8S' && ( middleMemberLevel3Enity.id==middleManagingEntity3level2 || middleMemberLevel3Enity.id==middleMemberEntity3level2)){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                            topEnityupdate.Signor_of_Entity_Member_3__c=middleMemberLevel3Enity.President__c;
                            
                            topEnityupdate.Signor_Title_3__c='President of '+middleMemberLevel3Enity.Name+', '  +(signortitleMangingEntity3level2!=null && signortitleMangingEntity3level2!=''?signortitleMangingEntity3level2:signortitleMemberEntity3level2)+' of '+(EntityNameMangingEntity3level2!=null && EntityNameMangingEntity3level2!=''?EntityNameMangingEntity3level2:EntityNameMemberEntity3level2)+ ', on behalf of '+(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level) +' as its '+ (signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( middleMemberLevel3Enity.RecordTypeId=='012U0000000DE8S' && ( middleMemberLevel3Enity.id==middleManagingEntity4level2 || middleMemberLevel3Enity.id==middleMemberEntity4level2 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                            topEnityupdate.Signor_of_Entity_Member_4__c=middleMemberLevel3Enity.President__c;
                            
                            topEnityupdate.Signor_Title_4__c='President of '+middleMemberLevel3Enity.Name+', '  +(signortitleMangingEntity4level2!=null && signortitleMangingEntity4level2!=''?signortitleMangingEntity4level2:signortitleMemberEntity4level2)+' of '+(EntityNameMangingEntity4level2!=null && EntityNameMangingEntity4level2!=''?EntityNameMangingEntity4level2:EntityNameMemberEntity4level2)+ ', on behalf of '+(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +' as its '+ (signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                    }
                    
                }
                
                if((middleMemberLevel3Enity.Structure__c=='Manager-managed'||middleMemberLevel3Enity.Structure__c=='Member-managed') && middleMemberLevel3Enity.RecordTypeId=='012U0000000DE8m' ){
                    if( middleMemberLevel3Enity.Managing_Entity__c!=null  ||middleMemberLevel3Enity.Entity_Member_1__c!=null ){
                        
                        System.debug('Processing next Level  -----'+middleMemberLevel3Enity.Structure__c);
                        if(middleMemberLevel3Enity.Structure__c=='Manager-managed'){
                            
                            
                            if(middleMemberLevel3Enity.id==middleManagingEntity1level2 || middleMemberLevel3Enity.id==middleMemberEntity1level2){
                                middleManagingEntity1level3=middleMemberLevel3Enity.Managing_Entity__c;   
                                signortitleMangingEntitylevel3=' Manager';
                                EntityNameMangingEntitylevel3= middleMemberLevel3Enity.Name;
                            }
                            if(middleMemberLevel3Enity.id==middleManagingEntity2level2 || middleMemberLevel3Enity.id==middleMemberEntity2level2){
                                middleManagingEntity2level3=middleMemberLevel3Enity.Managing_Entity__c;  
                                signortitleMangingEntity2level3=' Manager ';
                                EntityNameMangingEntity2level3= middleMemberLevel3Enity.Name;
                            }
                            if(middleMemberLevel3Enity.id==middleManagingEntity3level2 || middleMemberLevel3Enity.id==middleMemberEntity3level2){
                                middleManagingEntity3level3=middleMemberLevel3Enity.Managing_Entity__c;   
                                signortitleMangingEntity3level3=' Manager';
                                EntityNameMangingEntity3level3= middleMemberLevel3Enity.Name;
                            }
                            if(middleMemberLevel3Enity.id==middleManagingEntity4level2 || middleMemberLevel3Enity.id==middleMemberEntity4level2){
                                middleManagingEntity4level3=middleMemberLevel3Enity.Managing_Entity__c;  
                                signortitleMangingEntity4level3=' Manager ';
                                EntityNameMangingEntity4level3= middleMemberLevel3Enity.Name;
                            }
                            
                        }else {
                            if(middleMemberLevel3Enity.id==middleManagingEntity1level2 || middleMemberLevel3Enity.id==middleMemberEntity1level2){
                                middleMemberEntity1level3=middleMemberLevel3Enity.Entity_Member_1__c; 
                                signortitleMemberEntitylevel3=' Managing Member ';
                                EntityNameMemberEntitylevel3= middleMemberLevel3Enity.Name;
                            }
                            if(middleMemberLevel3Enity.id==middleManagingEntity2level2 || middleMemberLevel3Enity.id==middleMemberEntity2level2){
                                middleMemberEntity2level3=middleMemberLevel3Enity.Entity_Member_1__c; 
                                signortitleMemberEntity2level3=' Managing Member ';
                                EntityNameMemberEntity2level3= middleMemberLevel3Enity.Name;
                            }
                            if(middleMemberLevel3Enity.id==middleManagingEntity3level2 || middleMemberLevel3Enity.id==middleMemberEntity3level2 ){
                                middleMemberEntity3level3=middleMemberLevel3Enity.Entity_Member_1__c; 
                                signortitleMemberEntity3level3=' Managing Member ';
                                EntityNameMemberEntity3level3= middleMemberLevel3Enity.Name;
                            }
                            if(middleMemberLevel3Enity.id==middleManagingEntity4level2 || middleMemberLevel3Enity.id==middleMemberEntity4level2){
                                middleMemberEntity4level3=middleMemberLevel3Enity.Entity_Member_1__c; 
                                signortitleMemberEntity4level3=' Managing Member ';
                                EntityNameMemberEntity4level3= middleMemberLevel3Enity.Name;
                            }
                            
                        }
                        
                        
                    }
                    
                    
                    
                    for(Entities__c mildleMangerlevel2En:[Select id,Name,Entity_Member_1__c,Signor_Title_1__c,Signor_of_Entity_Member_1__c,Entity_Member_2__c,Organization_State_EM2_del__c,Organization_State_3__c,Signor_Title_4__c,Signor_Title_3__c,Organization_State_4__c,Member_3__c,Member_4__c,Member_2__c,Entity_Member_3__c,Entity_Member_4__c,Organization_State_1__c,Ownership__c,Member_1__c,Manager_2__c,Managing_Entity_2__c,Manager_1__c,RecordTypeId,Structure__c,Organization_State_EM1__c,Organization_State__c,Signor_of_Entity_Manager_1__c,Managing_Entity__c,President__c,Signor_Title_EM1__c from Entities__c where id =:middleMemberLevel3Enity.Managing_Entity__c OR id=:middleMemberLevel3Enity.Entity_Member_1__c ]){
                        
                        baseMemberEntityIDMap.put(mildleMangerlevel2En.id,mildleMangerlevel2En);
                    }
                    
                    
                }}
            
        }
        //Base member Managed
        
        if(!baseMemberEntityIDMap.isEmpty()){
            System.debug('Size MiddleEntityIDMap---'+baseMemberEntityIDMap.size());
            for(Entities__c baseMemberEnity:baseMemberEntityIDMap.values()){
                
                
                for(Entities__c topEnityupdate:topEntityIDMap.values()){
                    if(baseMemberEnity.RecordTypeId=='012U0000000DE8m'){
                        
                        Midlestructure=baseMemberEnity.Structure__c;
                        if(baseMemberEnity.Structure__c=='Manager-managed'&&  baseMemberEnity.Managing_Entity__c==null ){
                            
                            
                            
                            if(baseMemberEnity.Managing_Entity__c==null  && (baseMemberEnity.id==middleManagingEntity1level3||baseMemberEnity.id==middleMemberEntity1level3)){
                                
                                System.debug('Level1 Middle1 is llc and Em1 is null and top structure is manager manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=baseMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_1__c='Manager of '+baseMemberEnity.Name +', '  +(signortitleMangingEntitylevel3!=null && signortitleMangingEntitylevel3!=''?signortitleMangingEntitylevel3:signortitleMemberEntitylevel3)+' of '+(EntityNameMangingEntitylevel3!=null && EntityNameMangingEntitylevel3!=''?EntityNameMangingEntitylevel3:EntityNameMemberEntitylevel3)+ ', ' +(signortitleMangingEntitylevel2!=null && signortitleMangingEntitylevel2!=''?signortitleMangingEntitylevel2:signortitleMemberEntitylevel2)+' of '+(EntityNameMangingEntitylevel2!=null && EntityNameMangingEntitylevel2!=''?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2) +', on behalf of '+(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!=''?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel) +'as its '+(signortitleMangingEntitylevel!=null && signortitleMangingEntitylevel!=''?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                EntityList.put(topEnityupdate.id,topEnityupdate); 
                                
                            }
                            if(baseMemberEnity.Managing_Entity__c==null  && (baseMemberEnity.id==middleManagingEntity2level3||baseMemberEnity.id==middleMemberEntity2level3)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=baseMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_2__c='Manager of '+baseMemberEnity.Name +', '  +(signortitleMangingEntity2level3!=null && signortitleMangingEntity2level3!=''?signortitleMangingEntity2level3:signortitleMemberEntity2level3)+' of '+(EntityNameMangingEntity2level3!=null && EntityNameMangingEntity2level3!=''?EntityNameMangingEntity2level3:EntityNameMemberEntity2level3)+ ', ' +(signortitleMangingEntity2level2!=null && signortitleMangingEntity2level2!=''?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+(EntityNameMangingEntity2level2!=null && EntityNameMangingEntity2level2!=''?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+ ', on behalf of '+(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +'as its ' +(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                            }
                            if(baseMemberEnity.Managing_Entity__c==null  && (baseMemberEnity.id==middleManagingEntity3level3 || baseMemberEnity.id==middleMemberEntity3level3)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=baseMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_3__c='Manager of '+baseMemberEnity.Name +', '  +(signortitleMangingEntity3level3!=null &&signortitleMangingEntity3level3!=''?signortitleMangingEntity3level3:signortitleMemberEntity3level3)+' of '+(EntityNameMangingEntity3level3!=null && EntityNameMangingEntity3level3!=''?EntityNameMangingEntity3level3:EntityNameMemberEntity3level3)+ ', ' +(signortitleMangingEntity3level2!=null && signortitleMangingEntity3level2!=''?signortitleMangingEntity3level2:signortitleMemberEntity3level2)+' of '+(EntityNameMangingEntity3level2!=null && EntityNameMangingEntity3level2!=''?EntityNameMangingEntity3level2:EntityNameMemberEntity3level2)+ ', on behalf of ' +(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level) +'as its ' +(signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level) ;
                                topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                                
                            }
                            if(baseMemberEnity.Managing_Entity__c==null  && (baseMemberEnity.id== middleManagingEntity4level3||baseMemberEnity.id==middleMemberEntity4level3)){
                                
                                System.debug('Level1 Middle1 is llc and Em2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=baseMemberEnity.Manager_1__c;
                                topEnityupdate.Signor_Title_4__c='Manager of '+baseMemberEnity.Name +', '  +(signortitleMangingEntity4level3!=null && signortitleMangingEntity4level3!=''?signortitleMangingEntity4level3:signortitleMemberEntity4level3)+' of '+(EntityNameMangingEntity4level3!=null && EntityNameMangingEntity4level3!=''?EntityNameMangingEntity4level3:EntityNameMemberEntity4level3)+ ', ' +(signortitleMangingEntity4level2!=null && signortitleMangingEntity4level2!=''?signortitleMangingEntity4level2:signortitleMemberEntity4level2)+' of '+(EntityNameMangingEntity4level2!=null && EntityNameMangingEntity4level2!=''?EntityNameMangingEntity4level2:EntityNameMemberEntity4level2)+ ', on behalf of ' +(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +'as its ' +(signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                                topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                                
                            }
                            
                            
                        } 
                        else  if(baseMemberEnity.Structure__c=='Member-managed'&&  (baseMemberEnity.Entity_Member_1__c==null ) ){
                            System.debug('Reached memeber managed Mid Level1 id --'+ topEnityupdate.Entity_Member_1__c +','+  baseMemberEnity.id+','+ baseMemberEnity.Entity_Member_1__c);
                            
                            if(baseMemberEnity.Entity_Member_1__c==null && (baseMemberEnity.id==middleManagingEntity1level3||baseMemberEnity.id==middleMemberEntity1level3)){
                                
                                System.debug('Level1 Middle1 is llc and Emember1 is null and top structure is member manged--');
                                topEnityupdate.Signor_of_Entity_Member_1__c=baseMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_1__c='Managing Member of '+baseMemberEnity.Name+', '  +(signortitleMangingEntitylevel3!=null && signortitleMangingEntitylevel3!=''?signortitleMangingEntitylevel3:signortitleMemberEntitylevel3)+' of '+(EntityNameMangingEntitylevel3!=null && EntityNameMangingEntitylevel3!=''?EntityNameMangingEntitylevel3:EntityNameMemberEntitylevel3)+ ', ' +(signortitleMangingEntitylevel2!=null && signortitleMangingEntitylevel2!=''?signortitleMangingEntitylevel2:signortitleMemberEntitylevel2)+' of '+(EntityNameMangingEntitylevel2!=null && EntityNameMangingEntitylevel2!=''?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2) +', on behalf of '+(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!=''?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel) +'as its '+(signortitleMangingEntitylevel!=null && signortitleMangingEntitylevel!=''?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                                topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                                
                                EntityList.put(topEnityupdate.id,topEnityupdate);   
                                
                            }
                            if(baseMemberEnity.Entity_Member_1__c==null && (baseMemberEnity.id==middleManagingEntity2level3||baseMemberEnity.id==middleMemberEntity2level3)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_2__c=baseMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_2__c='Managing Member '+baseMemberEnity.Name +', '  +(signortitleMangingEntity2level3!=null && signortitleMangingEntity2level3!=''?signortitleMangingEntity2level3:signortitleMemberEntity2level3)+' of '+(EntityNameMangingEntity2level3!=null && EntityNameMangingEntity2level3!=''?EntityNameMangingEntity2level3:EntityNameMemberEntity2level3)+ ', ' +(signortitleMangingEntity2level2!=null && signortitleMangingEntity2level2!=''?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+(EntityNameMangingEntity2level2!=null && EntityNameMangingEntity2level2!=''?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+ ', on behalf of '+(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +'as its ' +(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                                topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                                
                                
                            } 
                            
                            if(baseMemberEnity.Entity_Member_1__c==null && (baseMemberEnity.id==middleManagingEntity3level3 || baseMemberEnity.id==middleMemberEntity3level3)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_3__c=baseMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_3__c='Managing Member '+baseMemberEnity.Name +', '  +(signortitleMangingEntity3level3!=null &&signortitleMangingEntity3level3!=''?signortitleMangingEntity3level3:signortitleMemberEntity3level3)+' of '+(EntityNameMangingEntity3level3!=null && EntityNameMangingEntity3level3!=''?EntityNameMangingEntity3level3:EntityNameMemberEntity3level3)+ ', ' +(signortitleMangingEntity3level2!=null && signortitleMangingEntity3level2!=''?signortitleMangingEntity3level2:signortitleMemberEntity3level2)+' of '+(EntityNameMangingEntity3level2!=null && EntityNameMangingEntity3level2!=''?EntityNameMangingEntity3level2:EntityNameMemberEntity3level2)+ ', on behalf of ' +(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level) +'as its ' +(signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level) ;
                                topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                                
                                
                            } 
                            if(baseMemberEnity.Entity_Member_1__c==null && (baseMemberEnity.id== middleManagingEntity4level3||baseMemberEnity.id==middleMemberEntity4level3)){
                                
                                
                                System.debug('Level1 Middle1 is llc and Emember2 is null and top structure is manger manged--');
                                topEnityupdate.Signor_of_Entity_Member_4__c=baseMemberEnity.Member_1__c;
                                topEnityupdate.Signor_Title_4__c='Managing Member '+baseMemberEnity.Name +', '  +(signortitleMangingEntity4level3!=null && signortitleMangingEntity4level3!=''?signortitleMangingEntity4level3:signortitleMemberEntity4level3)+' of '+(EntityNameMangingEntity4level3!=null && EntityNameMangingEntity4level3!=''?EntityNameMangingEntity4level3:EntityNameMemberEntity4level3)+ ', ' +(signortitleMangingEntity4level2!=null && signortitleMangingEntity4level2!=''?signortitleMangingEntity4level2:signortitleMemberEntity4level2)+' of '+(EntityNameMangingEntity4level2!=null && EntityNameMangingEntity4level2!=''?EntityNameMangingEntity4level2:EntityNameMemberEntity4level2)+ ', on behalf of ' +(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +'as its ' +(signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                                topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                                
                                
                            } 
                            
                            
                        }
                        
                    }   
                    else{
                        if( baseMemberEnity.RecordTypeId=='012U0000000DE8S' && ( baseMemberEnity.id==middleManagingEntity1level3 || baseMemberEnity.id==middleMemberEntity1level3 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_1__c=(organizationStateMangingEntity1!=null?organizationStateMangingEntity1:organizationStateMemberEntity1);
                            topEnityupdate.Signor_of_Entity_Member_1__c=baseMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_1__c='President of '+baseMemberEnity.Name+', '  +(signortitleMangingEntitylevel3!=null && signortitleMangingEntitylevel3!=''?signortitleMangingEntitylevel3:signortitleMemberEntitylevel3)+' of '+(EntityNameMangingEntitylevel3!=null && EntityNameMangingEntitylevel3!=''?EntityNameMangingEntitylevel3:EntityNameMemberEntitylevel3)+ ', ' +(signortitleMangingEntitylevel2!=null && signortitleMangingEntitylevel2!=''?signortitleMangingEntitylevel2:signortitleMemberEntitylevel2)+' of '+(EntityNameMangingEntitylevel2!=null && EntityNameMangingEntitylevel2!=''?EntityNameMangingEntitylevel2:EntityNameMemberEntitylevel2) +', on behalf of '+(EntityNameMangingEntitylevel!=null && EntityNameMangingEntitylevel!=''?EntityNameMangingEntitylevel:EntityNameMemberEntitylevel) +'as its '+(signortitleMangingEntitylevel!=null && signortitleMangingEntitylevel!=''?signortitleMangingEntitylevel:signortitleMemberEntitylevel);
                            
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( baseMemberEnity.RecordTypeId=='012U0000000DE8S' &&( baseMemberEnity.id==middleManagingEntity2level3 || baseMemberEnity.id==middleMemberEntity2level3 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_2__c=(organizationStateMangingEntity2!=null?organizationStateMangingEntity2:organizationStateMemberEntity2);
                            topEnityupdate.Signor_of_Entity_Member_2__c=baseMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_2__c='President of '+baseMemberEnity.Name+', '  +(signortitleMangingEntity2level3!=null && signortitleMangingEntity2level3!=''?signortitleMangingEntity2level3:signortitleMemberEntity2level3)+' of '+(EntityNameMangingEntity2level3!=null && EntityNameMangingEntity2level3!=''?EntityNameMangingEntity2level3:EntityNameMemberEntity2level3)+ ', ' +(signortitleMangingEntity2level2!=null && signortitleMangingEntity2level2!=''?signortitleMangingEntity2level2:signortitleMemberEntity2level2)+' of '+(EntityNameMangingEntity2level2!=null && EntityNameMangingEntity2level2!=''?EntityNameMangingEntity2level2:EntityNameMemberEntity2level2)+ ', on behalf of '+(EntityNameMangingEntity2level!=null && EntityNameMangingEntity2level!=''?EntityNameMangingEntity2level:EntityNameMemberEntity2level) +'as its ' +(signortitleMangingEntity2level!=null && signortitleMangingEntity2level!=''?signortitleMangingEntity2level:signortitleMemberEntity2level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        
                        if( baseMemberEnity.RecordTypeId=='012U0000000DE8S' && ( baseMemberEnity.id==middleManagingEntity3level3 || baseMemberEnity.id==middleMemberEntity3level3)){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_3__c=(organizationStateMangingEntity3!=null?organizationStateMangingEntity3:organizationStateMemberEntity3);
                            topEnityupdate.Signor_of_Entity_Member_3__c=baseMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_3__c='President of '+baseMemberEnity.Name+', '  +(signortitleMangingEntity3level3!=null &&signortitleMangingEntity3level3!=''?signortitleMangingEntity3level3:signortitleMemberEntity3level3)+' of '+(EntityNameMangingEntity3level3!=null && EntityNameMangingEntity3level3!=''?EntityNameMangingEntity3level3:EntityNameMemberEntity3level3)+ ', ' +(signortitleMangingEntity3level2!=null && signortitleMangingEntity3level2!=''?signortitleMangingEntity3level2:signortitleMemberEntity3level2)+' of '+(EntityNameMangingEntity3level2!=null && EntityNameMangingEntity3level2!=''?EntityNameMangingEntity3level2:EntityNameMemberEntity3level2)+ ', on behalf of ' +(EntityNameMangingEntity3level!=null && EntityNameMangingEntity3level!=''?EntityNameMangingEntity3level:EntityNameMemberEntity3level) +'as its ' +(signortitleMangingEntity3level!=null && signortitleMangingEntity3level!=''?signortitleMangingEntity3level:signortitleMemberEntity3level) ;
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                        }
                        if( baseMemberEnity.RecordTypeId=='012U0000000DE8S' && ( baseMemberEnity.id==middleManagingEntity4level3 || baseMemberEnity.id==middleMemberEntity4level3 )){
                            System.debug('Level1 Middle1 is corporation  and top structure is Manager manged--');
                            topEnityupdate.Organization_State_4__c=(organizationStateMangingEntity4!=null?organizationStateMangingEntity4:organizationStateMemberEntity4);
                            topEnityupdate.Signor_of_Entity_Member_4__c=baseMemberEnity.President__c;
                            
                            topEnityupdate.Signor_Title_4__c='President of '+baseMemberEnity.Name+', '  +(signortitleMangingEntity4level3!=null && signortitleMangingEntity4level3!=''?signortitleMangingEntity4level3:signortitleMemberEntity4level3)+' of '+(EntityNameMangingEntity4level3!=null && EntityNameMangingEntity4level3!=''?EntityNameMangingEntity4level3:EntityNameMemberEntity4level3)+ ', ' +(signortitleMangingEntity4level2!=null && signortitleMangingEntity4level2!=''?signortitleMangingEntity4level2:signortitleMemberEntity4level2)+' of '+(EntityNameMangingEntity4level2!=null && EntityNameMangingEntity4level2!=''?EntityNameMangingEntity4level2:EntityNameMemberEntity4level2)+ ', on behalf of ' +(EntityNameMangingEntity4level!=null && EntityNameMangingEntity4level!=''?EntityNameMangingEntity4level:EntityNameMemberEntity4level) +'as its ' +(signortitleMangingEntity4level!=null && signortitleMangingEntity4level!=''?signortitleMangingEntity4level:signortitleMemberEntity4level);
                            
                            
                            EntityList.put(topEnityupdate.id,topEnityupdate); 
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            
            
        }
        
        /*  if(topEntityIDMap.size()>0){
update topEntityIDMap.values();    
} */
        system.debug('>>Entity class update>'+topEntityIDMap);
        return topEntityIDMap;
        
    }
    
}