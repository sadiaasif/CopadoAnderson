@isTest
public class getHelpDeskInfoTest {
    
    @testSetup static void setup() {
        
        Account a = new Account();
        a.Name = '123';
        insert a;
        
        Contact con = new Contact();
        con.LastName = 'Apples';
        con.AccountId = a.id;
        insert con;
        
        Case c = new Case();
        c.subject = 'Case 1';
        c.RecordTypeId = '0120B000000NAE1';
        c.Severity_Level__c = 'Level 2 - Urgent';
        c.Status = 'New';
        c.ContactId = con.Id;
        c.Type = 'Tax Package';
        c.AccountId = a.id;
        insert c;
        
        Case c2 = new Case();
        c2.subject = 'Case 2';
        c2.RecordTypeId = '0120B000000NAE1';
        c2.Severity_Level__c = 'Level 2 - Urgent';
        c2.Status = 'New';
        c2.ContactId = con.Id;
        c2.Type = 'Tax Package';
        c2.AccountId = a.id;
        insert c2;
        
        Case c3 = new Case();
        c3.subject = 'Case 3';
        c3.RecordTypeId = '0120B000000NAE1';
        c3.Severity_Level__c = 'Level 3 - High';
        c3.Status = 'New';
        c3.ContactId = con.Id;
        c3.Type = 'Tax Package';
        c3.AccountId = a.id;
        insert c3;
        
        Case c4 = new Case();
        c4.subject = 'Case 4';
        c4.RecordTypeId = '0120B000000NAE1';
        c4.Severity_Level__c = 'Level 4 - Medium';
        c4.Status = 'New';
        c4.ContactId = con.Id;
        c4.Type = 'Tax Package';
        c4.AccountId = a.id;
        insert c4;
        
        Case c5 = new Case();
        c5.subject = 'Case 5';
        c5.RecordTypeId = '0120B000000NAE1';
        c5.Severity_Level__c = 'Level 5 - New Idea';
        c5.Status = 'New';
        c5.ContactId = con.Id;
        c5.Type = 'Tax Package';
        c5.AccountId = a.id;
        insert c5;
        
    }
    
    @isTest
    public static void insertCase() {
        
        Account a = [SELECT Id From Account];
        
        Case c1 = new Case();
        c1.RecordTypeId = '0120B000000NAE1';
        c1.Subject = 'The one to test';
        c1.Severity_Level__c = 'Level 2 - Urgent';
        c1.Status = 'New';
        c1.AccountId = a.id;
        c1.Type = 'Tax Package';
        insert c1;
        
        Case c = [SELECT Id, Queue_Length__c, Critical_Cases__c, Urgent_Cases__c, High_Cases__c, Medium_Cases__c, New_Ideas__c,
                 Subject FROM Case WHERE Subject = 'The one to test'];
        
        system.assertEquals(c.Queue_Length__c, '6');
        system.assertEquals(c.Critical_Cases__c, 0);
        system.assertEquals(c.Urgent_Cases__c, 3);
        system.assertEquals(c.High_Cases__c, 1);
        system.assertEquals(c.Medium_Cases__c, 1);
        system.assertEquals(c.New_Ideas__c, 1);
        
    }

}