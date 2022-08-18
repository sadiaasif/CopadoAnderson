@isTest
public class testContactTrigger {
    
    
    static testMethod void itShould()
    {
        
        Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
        
        list<contact> conList=new list<contact>();
        
        Contact con=new Contact();
        con.firstname='test contact name';
        con.LastName='test last name';
        con.AccountId=acc.id;
        con.phone='4448887789';
        
        conList.add(con);
               
        Contact con1=new Contact();
        con1.firstname='test contact name1';
        con1.LastName='test last name1';
        con1.AccountId=acc.id;
        con1.phone='4448887723';
        conList.add(con1);
        
        Contact con2=new Contact();
        con2.firstname='test contact name2';
        con2.LastName='test last name2';
        con2.AccountId=acc.id;
        con2.phone='4448887731';
        conList.add(con2);
        
        Contact con3=new Contact();
        con3.firstname='test contact name3';
        con3.LastName='test last name3';
        con3.AccountId=acc.id;
        con3.phone='4448887711';
        conList.add(con3);
        
        Contact con4=new Contact();
        con4.firstname='test contact name3';
        con4.LastName='test last name3';
        con4.AccountId=acc.id;
        con4.phone='4448887722';
        conList.add(con4);
        
        Contact con5=new Contact();
        con5.firstname='test contact name3';
        con5.LastName='test last name3';
        con5.AccountId=acc.id;
        con5.phone='4448887766';
        conList.add(con5);
        
        Contact con6=new Contact();
        con6.firstname='test contact name3';
        con6.LastName='test last name3';
        con6.AccountId=acc.id;
        con6.phone='4448887744';
        conList.add(con6);

        system.debug(ConList.size());
        insert conList;
 
        con.phone='4448887799';
        update con;
        con2.phone='4448887779';
        update con2;
        
        Contact c = [SELECT Id,Phone FROM Contact WHERE Phone = '4448887711' LIMIT 1 ];
        c.Phone = '2073292304';
        update c;
        

    }
       static testMethod void Testmethod2()
    {
        
        boolean run2 = true;
        
        Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
        
        list<contact> conList=new list<contact>();
        
        Contact con=new Contact();
        con.firstname='test contact name';
        con.LastName='test last name';
        con.AccountId=acc.id;
        con.phone='4448887778';
		insert con;

        con.phone='4448887777';
        con.MobilePhone = '4448887555';
       
        conList.add(con);
        run2 = true;
        update conList;
        
        Contact c = [SELECT Id, MobilePhone FROM Contact WHERE MobilePhone = '4448887555'];
        c.MobilePhone = '5183543428';
         run2 = true;
        update c;
        
    }
    
           static testMethod void Testmethod3()
    {   
        
        Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;

        list<contact> conList=new list<contact>();
        
        Contact con=new Contact();
        con.firstname='test contact name';
        con.LastName='test last name';
        con.AccountId=acc.id;
        con.phone='4448887778';
        conList.add(con);

        Contact con2=new Contact();
        con2.firstname='test contact name';
        con2.LastName='test last name';
        con2.AccountId=acc.id;
        con2.phone='4448887770';
        conList.add(con2);
        insert conList;
        delete conList;
        
    }
}