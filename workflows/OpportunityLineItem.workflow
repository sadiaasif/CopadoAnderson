<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_FL_Renewal_Sale_Price</fullName>
        <field>UnitPrice</field>
        <formula>138.75</formula>
        <name>Change FL Renewal Sale Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_for_Opps</fullName>
        <field>ServiceDate</field>
        <formula>TODAY()</formula>
        <name>Date for Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Affiliate_Payment_Amount</fullName>
        <field>Affiliate_Payment_Amount__c</field>
        <formula>Affiliate_Payment_Amount_Formula__c</formula>
        <name>Update Affiliate Payment Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Line_Discription</fullName>
        <field>Description</field>
        <formula>LEFT(Product2.Description, 255)</formula>
        <name>Update Line Discription</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quantity</fullName>
        <field>Quantity</field>
        <formula>if  (   PricebookID__c  = &quot;01uU000000dThsg&quot;, Quantity + 1, Quantity)</formula>
        <name>Update Quantity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>New Product</fullName>
        <actions>
            <name>Date_for_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Line_Discription</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Affiliate Amount</fullName>
        <actions>
            <name>Update_Affiliate_Payment_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISBLANK(Affiliate_Payment_Amount__c),
Affiliate_Payment_Amount_Formula__c !=  Affiliate_Payment_Amount__c
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
