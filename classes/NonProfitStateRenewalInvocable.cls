global class NonProfitStateRenewalInvocable {
    
    @InvocableMethod(label = 'Get State Services and Threshold Date')
    public static List<FlowOutputs> getServiceItems(List<FlowInputs> inputs) {
        
        list<string> idList = new list<string>();
        list<string> priceList = new list<string>();
        Integer ThresholdDate;
        Integer ThresholdMonth;
        Integer ThresholdYear;
        date FinalDate;
        date SaleCloseDate;
        date RenewalEffectiveDate;
        date RenewalEndDate;
        string organizationState = inputs[0].organizationState;
        date organizationDate = inputs[0].organizationDate;
        list<ServiceDetails> servicesList = new list<ServiceDetails>();
        list<Non_Profit_State_renewals__mdt> StateDetails =  new list<Non_Profit_State_renewals__mdt>();
        StateDetails = [select State_Name__c,Threshold_Date__c,ServiceItem_UnitPrice__c from Non_Profit_State_renewals__mdt where State_Name__c = :organizationState Limit 1];
        if(StateDetails.size()>0)
        {
            list<string> ServiceID_PriceList = StateDetails[0].ServiceItem_UnitPrice__c.split(';');
        for(string Inst : ServiceID_PriceList )
        {
            system.debug('instance ' + Inst );
            String[] splitIdPrice = Inst.split(',');
            system.debug('splitIdPrice' + splitIdPrice);
            ServiceDetails service =  new ServiceDetails();
            service.ServiceIds = splitIdPrice[0];
            system.debug('integar ' + splitIdPrice[1]);
            system.debug('integar1 ' + Integer.ValueOf(splitIdPrice[1]));
            service.UnitPrice = Integer.ValueOf(splitIdPrice[1]);
            servicesList.add(service);
            idList.add( splitIdPrice[0]);
            priceList.add(splitIdPrice[1]);            
        }
            system.debug('service list ' +  servicesList);
            if(StateDetails[0].Threshold_Date__c != null)
            { 
				list<string> ThresHold = StateDetails[0].Threshold_Date__c.split('/');
				ThresholdMonth =  Integer.ValueOf(ThresHold[0]);
				ThresholdMonth =  Integer.ValueOf(ThresHold[0]);
        		ThresholdDate = Integer.ValueOf(ThresHold[1]);
        		Date today = Date.today();
        		thresholdYear = today.year();
        		FinalDate = date.newInstance(thresholdYear, ThresholdMonth, ThresholdDate);                
            }      
        if(organizationState == 'Alabama')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        
        else if(organizationState == 'Alaska')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Arkansas')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'California')
        {
            SaleCloseDate = organizationDate.addDays(30);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
            
        }
        else if(organizationState == 'Colorado')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Florida')
        {
            
            SaleCloseDate = organizationDate.addYears(1);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);   
        }
        else if (organizationState == 'Georgia')
        {
            SaleCloseDate = organizationDate.addYears(1);           
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
        }
        else if(organizationState == 'Hawaii')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
            
        }
        else if(organizationState == 'Illinois')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Indiana')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Kansas')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Kentucky')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1); 
        }
            
            else if(organizationState == 'Louisiana')
            { 
                if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
                
                
            }
        else if(organizationState == 'Maine1')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Maine2')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate;
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Massachusetts')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
            
        }
        else if(organizationState == 'Michigan')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Minnesota')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'Mississippi')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);   
        }
        else if(organizationState == 'Missouri')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'Nevada')
        {
            
            SaleCloseDate = organizationDate.addYears(1);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
        }
        else if(organizationState == 'New Hampshire')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'New Jersey')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'New Mexico')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if(organizationState == 'New York')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'North Carolina')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'North Dakota')
        {
            
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'Ohio')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'Oklahoma')
        {
            
            SaleCloseDate = organizationDate.addYears(1);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
        }
        else if (organizationState == 'Oregon')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);   
        }
        else if(organizationState == 'Pennsylvania')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'Rhode Island')
        {
            
            
            SaleCloseDate = organizationDate.addYears(1);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
        }
        else if(organizationState == 'South Carolina')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'Tennessee')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        else if (organizationState == 'Utah')
        {
            
            SaleCloseDate = organizationDate.addYears(1);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
        }
        else if (organizationState == 'Washington')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(2);
            }
            else
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1); 
        }
        else if(organizationState == 'West Virginia')
        {
            
            SaleCloseDate = organizationDate.addYears(1);
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = organizationDate.addYears(2);
        }
        else if(organizationState == 'Wisconsin')
        {
            if(organizationDate >= Finaldate)
            {
                SaleCloseDate = Finaldate.addYears(1);
            }
            else
            {
                SaleCloseDate = Finaldate;
            }
            
            RenewalEffectiveDate = SaleCloseDate.addDays(1);
            RenewalEndDate = SaleCloseDate.addYears(1);
        }
        	FlowOutputs output = new FlowOutputs();
            output.ThresholdDate = SaleCloseDate;
            output.RenewalEffectiveDate = RenewalEffectiveDate;
            output.ServiceDetails = servicesList;
            output.RenewalEndDate = RenewalEndDate;
            system.debug('results ' + output.ThresholdDate );
            system.debug('results '+ output.RenewalEffectiveDate);
            system.debug('results '+ output.ServiceDetails);
            return new List<FlowOutputs>{output};
             
        }
        return null;
    }
    public class FlowInputs{
        
        @InvocableVariable
        public date organizationDate;
        
        @InvocableVariable
        public string organizationState;
        
    }
    
    public class FlowOutputs{
        
        @InvocableVariable
        public date ThresholdDate;
        
        @InvocableVariable
        public date RenewalEffectiveDate;
        
        @InvocableVariable
        public date RenewalEndDate;
        
        @InvocableVariable
        public list<ServiceDetails> ServiceDetails;
           
    }    
    
}