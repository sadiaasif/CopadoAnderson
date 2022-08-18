trigger copyCampaign on lead (before insert,before update) {

        public  list<string> primarycamp=new list<string>();
        public list<Campaign> campList=new list<Campaign>();
        public list<Campaign> campListGoogle=new list<Campaign>();
        public  list<string> googleanal=new list<string>();


        if(trigger.isInsert){

                            for(lead ll: trigger.new){

                                        //primarycamp=ll.Primary_Campaign_Dummy__c;
                                        primarycamp.add(ll.Primary_Campaign_Dummy__c);
                                        googleanal.add(ll.pi__utm_campaign__c);

                            }



                            if(!primarycamp.isEmpty()){

                                              campList=[Select id, Name from Campaign  where name=:primarycamp limit 1];

                            }

                            if(!googleanal.isEmpty()){

                                              campListGoogle=[Select id, Name from Campaign  where name=:googleanal limit 1];

                            }


                            if(!campList.isEmpty()){

                                        for(lead ll:trigger.new){
                                            ll.Primary_Campaign__c=campList[0].id;
                                        }

                            }

                              if(!campListGoogle.isEmpty()){

                                        for(lead ll:trigger.new){
                                            ll.Primary_Campaign__c=campListGoogle[0].id;
                                        }

                            }


        }
        else if (trigger.isUpdate) {


                          for(lead ll: trigger.new){

                                //primarycamp=ll.Primary_Campaign_Dummy__c;
                                system.debug(ll.pi__utm_campaign__c);
                                googleanal.add(ll.pi__utm_campaign__c);

                            }

                            if(!googleanal.isEmpty()){

                                              campListGoogle=[Select id, Name from Campaign  where name=:googleanal limit 1];

                            }

                             if(!campListGoogle.isEmpty()){

                                        for(lead ll:trigger.new){
                                            ll.Primary_Campaign__c=campListGoogle[0].id;
                                        }

                            }


        }


}