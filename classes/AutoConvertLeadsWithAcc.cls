Public class AutoConvertLeadsWithAcc
{
   
    @InvocableMethod
    public static void LeadAssign(List<List<Id>> LeadIds)
    {
            Database.LeadConvert Leadconvert = new Database.LeadConvert();
            Leadconvert.setLeadId(LeadIds[0][0]);
            LeadStatus Leads= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
            Leadconvert.setConvertedStatus(Leads.MasterLabel);
            if (LeadIds[0].size() > 1 && LeadIds[0][1] !=null)
            {
                if (LeadIds[0].size() > 2)
                {    
                    If(LeadIds[0][2]!=null)
                    {
                        Leadconvert.setContactId(LeadIds[0][2]);
                        Leadconvert.setAccountId(LeadIds[0][1]);
                    }
                 }
                Else
                 Leadconvert.setAccountId(LeadIds[0][1]);
                
                
            }
            Leadconvert.setDoNotCreateOpportunity(FALSE); //Remove this line if you want to   create an opportunity from Lead Conversion 
            Database.LeadConvertResult Leadconverts = Database.convertLead(Leadconvert);
            System.assert(Leadconverts.isSuccess());   
   }
 
}