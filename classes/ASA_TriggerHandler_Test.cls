/***********************************
* Author : Ifrahim Afzal
* Description : Test class for ASA_AfterUpdateHelper
							   ASA_BeforeInsertHelper
* Class : ASA_TriggerHandler_Test
***********************************/

@isTest
public class ASA_TriggerHandler_Test {

    public static Id call = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
    public static Id client = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
   
    
    public static Final String  FOLLOW_UP_YEAR= '1 Year Follow-up';
    public static Final String ASA_YEAR_FOLLOW = 'ASA Yearly Follow-up';
    
    @testSetup
    public static void testData(){
        
        Follow_up_task_owner__c followUp = new Follow_up_task_owner__c();
        followUp.Name = 'Follow Up';
        followUp.Year__c = 1;
        followUp.Subject__c = '1 Year Follow-up';
        followUp.Id__c = UserInfo.getUserId();
        insert followUp;
        
        ASA__c asa = new ASA__c();
        asa.Name = 'Test ASA Record';
        asa.ASA_Stage__c = 'Review Call Scheduled';
        asa.Yearly_Follow_up_Date__c = Date.today();
        insert asa;
        
        ASA__c asaUpdate = new ASA__c();
        asaUpdate.Name = 'ASA Update';
        asaUpdate.ASA_Stage__c = 'ASA Scheduled';
        asaUpdate.Yearly_Follow_up_Date__c = Date.today();
        insert asaUpdate;
        
        Task task = new Task();
        task.RecordTypeId = call;
        task.OwnerId = Follow_up_task_owner__c.getValues('Follow Up').Id__c;
        task.Date_Due__c =  Date.TODAY().addYears(1);
        task.WhatId = asaUpdate.Id;
        task.Subject = ASA_YEAR_FOLLOW;
        insert task;
        
        Account acc = new Account();
        acc.Name = 'test Name';
        
        acc.Financial_Analyst__c = 'Jason Kopp';
        acc.RecordTypeId = client;
        insert acc;
       
    }
    
    
    @isTest
    public static void taskGenerationTest(){
        try{
            Test.startTest();
            
            ASA__c asa = [Select Id,Name,ASA_Stage__c,Yearly_Follow_up_Date__c from ASA__c Where ASA_Stage__c = 'Review Call Scheduled' Limit 1];
            System.debug('asa'+asa);
            asa.ASA_Stage__c = '1 Year Follow-up';
            update asa;
            Test.stopTest();
        }catch(DMLException e){
            System.debug('e'+e.getMessage());
        }
    }
    
    @isTest
    public static void taskUpdationTest(){
        try{
            Test.startTest();
            ASA__c asa = [Select Id,Name,ASA_Stage__c,Yearly_Follow_up_Date__c from ASA__c Where ASA_Stage__c = 'ASA Scheduled'];
            asa.ASA_Stage__c = '1 Year Follow-up';
            asa.Yearly_Follow_up_Date__c = null;
            update asa;
            Test.stopTest();
        }catch(DMLException e){
            System.debug('e'+e.getMessage());
        }
    }
    
    @isTest
    public static void taskPopulateValue(){
        try{
            Test.startTest();
            Account acc = [Select Id from Account Limit 1]; 
            ASA__c asa = new ASA__c();
            asa.Name = 'Test ASA Record';
            asa.ASA_Stage__c = 'Review Call Scheduled';
            asa.Yearly_Follow_up_Date__c = Date.today();
            asa.Client_Name__c = acc.Id;
            insert asa;
            
            Test.stopTest();
        } catch(DMLException e){
            System.debug('e'+e.getMessage());
        }
    }
        
}