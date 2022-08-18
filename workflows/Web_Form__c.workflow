<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Web_Form_Owner_Change_Alert</fullName>
        <description>Web Form Owner Change Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All/Web_Form_Owner_Change</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Comments_Field</fullName>
        <field>Comments__c</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + Update_Comments__c + BR() + Comments__c</formula>
        <name>Update Comments Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update Comments</fullName>
        <actions>
            <name>Update_Comments_Field</name>
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
        <fullName>Web Form Owner is Changed</fullName>
        <actions>
            <name>Web_Form_Owner_Change_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
