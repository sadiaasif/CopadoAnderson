public class DebugInfo {

    public static void createDebugLog(Exception e) {
        
    String exceptionInfo = 'Exception occurred line ' + e.getLineNumber() + ' - ' + e.getMessage() 
                    + '\n' + 'Stack: ' + e.getStackTraceString() 
                    + '\n' + 'Exception Type: ' + e.getTypeName()
                    + '\n' + 'DML Statements Used: ' + limits.getDmlStatements() 
                    + '\n' + 'DML Rows Used: ' + limits.getDmlRows()
                    + '\n' + 'SOQL Queries Used: ' + limits.getSoslQueries()
                    + '\n' + 'CPU Time Used: ' + limits.getCpuTime();
                
        
        DebugInfo__c debugInfo = new DebugInfo__c(DebugData__c = exceptionInfo);
        insert debugInfo;
        
    }
    
}