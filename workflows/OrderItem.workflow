<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Client_Bookkeeping_virtual_Email</fullName>
        <description>Client - Bookkeeping virtual Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ServiceTeamTemplates/Client_Bookkeeping_virtual_1633455553669</template>
    </alerts>
    <fieldUpdates>
        <fullName>Capture_Entity_Change</fullName>
        <field>Entity_Made_on__c</field>
        <formula>TODAY()</formula>
        <name>Capture Entity Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>If_Zero_then_Complete_It</fullName>
        <field>Service_Status__c</field>
        <literalValue>Completed</literalValue>
        <name>If Zero then Complete It</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments_Order_Item</fullName>
        <field>Comments__c</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos;, &apos; + $User.FirstName + &apos; - &apos; + Update_Comments__c + BR() +  Comments__c</formula>
        <name>Update Comments - Order Item</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Created with zero weight</fullName>
        <actions>
            <name>If_Zero_then_Complete_It</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OrderItem.Weight__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Comments - Order Item</fullName>
        <actions>
            <name>Update_Comments_Order_Item</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(

AND(ISNEW(), NOT(ISBLANK(Update_Comments__c))),

AND(ISCHANGED(Update_Comments__c), NOT(ISBLANK(Update_Comments__c)))

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Entity_Made_on%5F%5Fc</fullName>
        <actions>
            <name>Capture_Entity_Change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISCHANGED( Entity__c ) , ISBLANK(PRIORVALUE(Entity__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
