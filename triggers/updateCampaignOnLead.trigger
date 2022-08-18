trigger updateCampaignOnLead on Lead (before insert,before update) {

list<String> campaignSet=new list<String>();
set<ID> primarycampaignSet=new set<ID>();
list<Campaign> campaignList=new list<Campaign>();

        for(lead ll : Trigger.new){

              if(ll.Campaign__c!=null){

                            campaignSet.add(ll.Campaign__c);
             }
             if(ll.Primary_Campaign__c!=null){

                            primarycampaignSet.add(ll.Primary_Campaign__c);
             }
            System.debug('campaign set is'+ campaignSet);
            System.debug('primary campaign set is'+ primarycampaignSet);
            System.debug(campaignSet.isEmpty());
            System.debug(primarycampaignSet.isEmpty());
        }

        if(!campaignSet.isEmpty() && primarycampaignSet.isEmpty()){

            campaignList=[Select Id,Name from Campaign where Name=:campaignSet];
            System.debug('campaign list is'+campaignList);

        }

        if(!primarycampaignSet.isEmpty() && campaignSet.isEmpty()){

                campaignList=[Select Id,Name from Campaign where id=:primarycampaignSet];
                System.debug('campaign list is'+campaignList);

        }

        if(!campaignList.isEmpty()){

            for(lead ll: Trigger.new){

              for(Campaign cam : campaignList){


                            if(ll.Campaign__c!=null){

                                        if(cam.Name==ll.Campaign__c){

                                                    ll.Primary_Campaign__c=cam.id;

                                        }
                            }
                            else if (ll.Primary_Campaign__c!=null) {



                                        if(cam.id==ll.Primary_Campaign__c){

                                                    ll.Campaign__c=cam.Name;

                                        }


                            }

                    }
            }

        }


}