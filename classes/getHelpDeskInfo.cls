public class getHelpDeskInfo {
          
    public static boolean alreadyProcessed;
    
    public static void insertQueueLength(List<Case> newList) {
        
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        Integer criticalCases = 0;
        Integer urgentCases = 0;
        Integer highCases = 0;
        Integer mediumCases = 0;
        Integer newIdeas = 0;
        
        List<Case> helpDeskCases = [SELECT Id, Status, Severity_Level__c  From Case Where Status != 'Closed'
                                   AND RecordTypeId = '0120B000000NAE1'
                                   AND OwnerId != '005U0000003rcF8'];

        Integer totalCases = helpDeskCases.size() + 1;
                
        for (Case c : helpDeskCases)
        {
            Switch on c.Severity_Level__c {
                when 'Level 1 - Critical' {
                    criticalCases += 1;
                }
                when 'Level 2 - Urgent' {
                    urgentCases += 1;
                }
                when 'Level 3 - High' {
                    highCases += 1;
                }
                when 'Level 4 - Medium' {
                    mediumCases += 1;
                }
                when 'Level 5 - New Idea' {
                    newIdeas += 1;
                }
            }
            
        }
               
        for(Case c : newList) {
            
            if(c.RecordTypeId == '0120B000000NAE1') {
              
                Switch on c.Severity_Level__c {
                when 'Level 1 - Critical' {
                    criticalCases += 1;
                }
                when 'Level 2 - Urgent' {
                    urgentCases += 1;
                }
                when 'Level 3 - High' {
                    highCases += 1;
                }
                when 'Level 4 - Medium' {
                    mediumCases += 1;
                }
                when 'Level 5 - New Idea' {
                    newIdeas += 1;
                }
            }
                                
              c.Queue_Length__c = string.valueOf(totalCases);
              c.Critical_Cases__c = criticalCases;
              c.Urgent_Cases__c = urgentCases;
              c.High_Cases__c = highCases;
              c.Medium_Cases__c = mediumCases;
              c.New_Ideas__c = newIdeas;
                
            } 
        }
                
    }

}