public with sharing class HomeToDos 
{
	
	private String sortDirection = 'ASC';
   	private String sortExp = 'name';
	 public String sortExpression
   {
	get
     {
        return sortExp;
     }
     set
     {
       //if the column is clicked on then switch between Ascending and Descending modes
       if (value == sortExp)
         sortDirection = (sortDirection == 'ASC')? 'DESC' : 'ASC';
       else
         sortDirection = 'ASC';
       sortExp = value;
     }
   }
public HomeToDos()
{
	for(Sales_Rep__c s : [select id from Sales_Rep__c])
	{
		TObject.Sales_Rep__c = s.id;
	}
	
}
 public String getSortDirection()
 {
    //if not column is selected 
    if (sortExpression == null || sortExpression == '')
      return 'ASC';
    else
     return sortDirection;
 }

 public void setSortDirection(String value)
 {  
   sortDirection = value;
 }
	public List<SelectOption> getCompleted()
	{
		List<SelectOption> OptionList = new List<SelectOption>();
		OptionList.add(new Selectoption('No','No'));
		OptionList.add(new Selectoption('Yes','Yes'));
		
		
		return OptionList;
	}
	
	public String OptionSelected{get;set;}
	
	public To_Do__c TObject = new To_Do__c();
	
	public To_Do__c getTodo()
	{
		return TObject;
	}
	boolean b = true;
	public void setTodo(String str)
	{
		TObject.Sales_Rep__c = str;
	}
	
	List<To_Do__c> ToDoList = new List<To_Do__c>();
	public List<To_Do__c> getTodoList()
	{
		ViewData();
		return ToDoList;
		
	}
	
	
	 public PageReference ViewData() {
	 	
	 	if(OptionSelected=='Yes')
		{
			b = true;
		}
		else
		b=false;
		
       //build the full sort expression
       string sortFullExp = sortExpression  + ' ' + sortDirection;
       String Query = '';
       if(TObject.Sales_Rep__c!=null)
       {
       		Query = 'select id, name, Date__c,Lead__r.Name,Lead__r.id,Sales_Rep__r.id, Entity__r.Name,Entity__r.id, Completed__c, Sales__r.Name,Sales__r.id, Sales_Rep__r.Name,Client__r.Name, Client__r.id from To_Do__c where Completed__c = '+ b+' and Sales_Rep__c =\''+TObject.Sales_Rep__c+'\'  order by ' + sortFullExp;
       }
       else
       {
       	Query = 'select id, name, Date__c,Lead__r.Name,Lead__r.id,Sales_Rep__r.id, Entity__r.Name,Entity__r.id, Completed__c, Sales__r.Name,Sales__r.id, Sales_Rep__r.Name,Client__r.Name, Client__r.id from To_Do__c where Completed__c = '+ b+' and Sales_Rep__c =null  order by ' + sortFullExp;
       }
     //[select id, name, Date__c,Lead__r.Name,Lead__r.id,Sales_Rep__r.id, Entity__r.Name,Entity__r.id, Completed__c, Sales__r.Name,Sales__r.id, Sales_Rep__r.Name,Client__r.Name, Client__r.id from To_Do__c where Completed__c =: b and Sales_Rep__c =: TObject.Sales_Rep__c];LIKE\'%'+fname+'%\'
       //query the database based on the sort expression
       System.debug('***********************'+sortFullExp);
       ToDoList = Database.query(Query);
     /*  for(To_Do__c t : Database.query(Query))
       {
       		if(t.Completed__c == b && t.Sales_Rep__c==TObject.Sales_Rep__c)
       		{
       			ToDoList.add(t);
       		}
       }
      */
       return null;
   }
   
   
   
}