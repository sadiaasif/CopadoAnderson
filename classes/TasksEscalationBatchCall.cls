global class TasksEscalationBatchCall implements Schedulable {
     global void execute(SchedulableContext sc) {
          List <Report> reportList=new  List <Report>();
         if(TEst.isRunningTest()){
              reportList = [SELECT Id,DeveloperName FROM Report where DeveloperName = 'TestWCEscaltion'];
             
         }else{
             reportList = [SELECT Id,DeveloperName FROM Report where DeveloperName = 'Shobitha'];
         } 
String reportId = (String)reportList.get(0).get('Id');
String column;
Reports.ReportResults results = Reports.ReportManager.runReport(reportId);
String filter='';
String Casefilter='';
String operator='';
String Value='';
String objectname='';
string FieldName='';
String testvalue='';
String TaskFilter='';
Reports.ReportMetadata rm = results.getReportMetadata();
for(Reports.ReportFilter rf : rm.getreportFilters()){
    column='';
    operator='';
    Value='';     
         if(rf.getcolumn()=='Activity.ActivityDate'){
        column='ActivityDate';
    }else if(rf.getcolumn()=='Activity.Escalation__c.Name'){
          column='Escalation__r.Name';
    }else{
    column= rf.getcolumn().replaceAll( 'Activity.', '');    
    }
    
      If(column=='RecordType'){
        
        column='RecordType.Name';
    }
    if(rf.getOperator()=='equals'){
        
   
        List<String> splitstring = rf.getValue().split(',');
        for(string s:splitstring){
            value+='\''+s+'\',';
        }
        value=value.removeEnd(',');
    }else if(rf.getOperator()=='notEqual'){
         List<String> splitstring = rf.getValue().split(',');
        for(string s:splitstring){
            value+='\''+s+'\',';
        }
        value=value.removeEnd(',');
    }
  if(rf.getcolumn().contains('Case.')){
        List<string> objectandfieldname=rf.getcolumn().split('\\.');
          objectname=objectandfieldname[0];
              FieldName=objectandfieldname[1];
              SObjectType queryobject = ((SObject)(Type.forName('Schema.'+objectname).newInstance())).getSObjectType();
			DescribeSObjectResult objectdetails = queryobject.getDescribe();
              Schema.DisplayType fielddataType=objectdetails.fields.getMap().get(FieldName).getDescribe().getType();
              FieldName=objectandfieldname[1];
       
          if(rf.getOperator()=='equals'){
             
             if(fielddataType == Schema.DisplayType.BOOLEAN) {
					       operator='=';
                 Value=rf.getValue();
                 if(Casefilter==''){
            		Casefilter=column+' '+ operator+  Value; 
                   }else{
                       Casefilter+=' and '+column+' '+ operator+  Value;  
                 }
         
    }else{
        operator='IN';
         if(Casefilter==''){
           Casefilter=column+' '+ operator+'  (' + Value+')';
              
             }else{
         Casefilter+=' and '+ column+' '+ operator +'(' +Value+')'; 
             }
    }
         }
         else if(rf.getOperator()=='notEqual'){
              operator='NOT IN';
             if(Casefilter==''){
                Casefilter=column+' '+ operator+'  (' + Value +')';
             }else{
                  Casefilter+=' and '+column+' '+ operator +'  (' + +Value+')';
             }
           
         }else if(rf.getOperator()=='notContain'){
        	Value=rf.getValue().replaceAll( ',',  '%\') and ( Not '+column+' Like \'%' );
             if(Casefilter==''){
              Casefilter='('+'( Not '+column+' Like '+ '\'%' +Value+'%\'))';
             }else{
                   Casefilter+='and (  '+'( Not '+column+' Like'+ '\'%' +Value+'%\'))';
             }
  } 
    
  }else{
         if(rf.getOperator()=='equals'){
        operator='IN';
              if(filter==''){
         		filter=column+' '+ operator+'  (' + Value+')';
                  TaskFilter=column+' '+ operator+'  (' + Value+')';
              }else{
                    filter+=' and '+ column+' '+ operator +'(' +Value+')';
                   TaskFilter=' and '+ column+' '+ operator +'(' +Value+')';
              }
         }else if(rf.getOperator()=='notEqual'){
              operator='NOT IN';
                if(filter==''){
              filter=column+' '+ operator+'  (' + Value +')';
                }else{
                     filter+=' and '+column+' '+ operator +'  (' + +Value+')';
                     TaskFilter=' and '+column+' '+ operator +'  (' + +Value+')';
                }
         }else if(rf.getOperator()=='contains'){
             Value=rf.getValue().replaceAll( ',',  '%\') or (  '+column+' Like \'%' );
              if(filter==''){
              filter='('+'  '+column+' Like '+ '\'%' +Value+'%\')';
              }else{
                   filter+='and (  '+'( '+column+' Like '+ '\'%' +Value+'%\'))';
                   TaskFilter='and (  '+'( '+column+' Like '+ '\'%' +Value+'%\'))';
              }
         }
        else if(rf.getOperator()=='notContain'){
        	Value=rf.getValue().replaceAll( ',',  '%\') and ( Not '+column+' Like \'%' );
             if(filter==''){
              filter='('+'( Not '+column+' Like '+ '\'%' +Value+'%\'))';
             }else{
                   filter+='and (  '+'( Not '+column+' Like'+ '\'%' +Value+'%\'))';
                  TaskFilter='and (  '+'( Not '+column+' Like'+ '\'%' +Value+'%\'))';
             }
                }else if(rf.getOperator()=='lessThan'){
                       Value=rf.getValue().replaceAll( ',',  ' or '+column+' < ' );
                         System.debug('Datevv--'+Value);
                        operator='<';
                        if(filter==''){
                          filter='('+column+' '+ operator +Value+')';
                         }else{
                             filter+=' and ('+ column+' '+ operator +Value+')';
                              TaskFilter=' and ('+ column+' '+ operator +Value+')';
                        }
                }
        else if(rf.getOperator()=='greaterThan'){
                    operator='>';
        			Value=rf.getValue().replaceAll( ',',  ' or  '+column+' > ' );
             if(filter==''){
                      filter='('+column+' '+ operator +Value+')';
             }else{
                   filter+=' and ('+ column+' '+ operator +Value+')';
                  TaskFilter=' and ('+ column+' '+ operator +Value+')';
             }
                }
   }
}
System.debug('Casefilter--'+Casefilter);
         String taskQuery;
            Id batchJobId1;
         if(!Test.isRunningTest()){
             taskQuery='Select id,subject,WhatId,Client__c,OwnerId from task where '+filter +' and WhatID IN (Select id from Case where '+Casefilter +' and AccountID !=null) and WhoID!=null';
         }else{
              taskQuery='Select id,subject,WhatId,Client__c,OwnerId from task where '+filter +' and WhatID IN (Select id from Case where '+Casefilter +' and AccountID !=null)  and WhoID!=null LIMIT 10';
         }
           
      
         if(!Test.isRunningTest()){
          batchJobId1= Database.executeBatch(new TasksEscaltionClass(taskQuery), 5);    
         }else{
               batchJobId1= Database.executeBatch(new TasksEscaltionClass(taskQuery), 200);  
         }
         
         
System.debug('Batch1--'+batchJobId1);
    

    }

}