@isTest
public class formatAccountPhonesTest {
    
    @testSetup
    public static void createTestData(){
    
        Account a = new Account();
        a.Name = 'Acc Name';
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Phone = '2078993456';
        insert a;
        
        
    }
    
    public static testMethod void insertTest(){
        
        Account a = new Account();
        a.Name = 'Acc Name';
        a.First_Name__c = 'Roy';
        a.Last_Name__c = 'Apples';
        a.Phone = '2078993456';
        a.Mobile_Number__c = null;
        a.Spouse_Mobile__c = '(702) 444-5555';
        a.Phone_1__c = '1207()!456---9999';
        a.Phone_2__c = '(1)207.4569.999';
        a.Phone_3__c = '+207@4567999';
        a.Phone_4__c = '';
        a.Phone_5__c = '1207()!456---999';
        a.Phone_6__c = '207()!@!.456---9999';
        insert a;
        
        Account acc = [SELECT Id, Phone, Mobile_Number__c, Spouse_Mobile__c, Phone_1__c, Phone_2__c, Phone_3__c, Phone_4__c, Phone_5__c, Phone_6__c FROM Account WHERE First_Name__c = 'Roy'];
        System.assertEquals('(207) 899-3456', acc.Phone);
        System.assertEquals(null, acc.Mobile_Number__c);
        System.assertEquals('(702) 444-5555', acc.Spouse_Mobile__c);
        System.assertEquals('(207) 456-9999', acc.Phone_1__c);
        System.assertEquals('(207) 456-9999', acc.Phone_2__c);
        System.assertEquals('(207) 456-7999', acc.Phone_3__c);
        System.assertEquals(null, acc.Phone_4__c);
        System.assertEquals('1207()!456---999', acc.Phone_5__c);
        System.assertEquals('(207) 456-9999', acc.Phone_6__c);
        
    }
    
    public static testMethod void updateTest(){
        
        Account a = [SELECT Id, Phone, Mobile_Number__c, Spouse_Mobile__c, Phone_1__c, Phone_2__c, Phone_3__c, Phone_4__c, Phone_5__c, Phone_6__c FROM Account WHERE First_Name__c = 'Bob'];
        
        a.Phone = '2078993456';
        a.Mobile_Number__c = null;
        a.Spouse_Mobile__c = '(702) 444-5555';
        a.Phone_1__c = '1207()!456---9999';
        a.Phone_2__c = '(1)207.4569.999';
        a.Phone_3__c = '+207@4567999';
        a.Phone_4__c = '';
        a.Phone_5__c = '1207()!456---999';
        a.Phone_6__c = '207()!@!.456---9999';
        
        update a;
        
        Account acc = [SELECT Id, Phone, Mobile_Number__c, Spouse_Mobile__c, Phone_1__c, Phone_2__c, Phone_3__c, Phone_4__c, Phone_5__c, Phone_6__c FROM Account WHERE First_Name__c = 'Bob'];
        System.assertEquals('(207) 899-3456', acc.Phone);
        System.assertEquals(null, acc.Mobile_Number__c);
        System.assertEquals('(702) 444-5555', acc.Spouse_Mobile__c);
        System.assertEquals('(207) 456-9999', acc.Phone_1__c);
        System.assertEquals('(207) 456-9999', acc.Phone_2__c);
        System.assertEquals('(207) 456-7999', acc.Phone_3__c);
        System.assertEquals(null, acc.Phone_4__c);
        System.assertEquals('1207()!456---999', acc.Phone_5__c);
        System.assertEquals('(207) 456-9999', acc.Phone_6__c);
        
    }

}