<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Tax_Package_Budget_Alert</fullName>
        <description>Tax Package Budget Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>chill+lex@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kmiller+lex@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tspears+lex@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Tax_Package_Budget_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Date_Completed_Blank</fullName>
        <description>Sets the date completed field to blank.</description>
        <field>H2S__DateCompleted__c</field>
        <name>Date Completed Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_Completed</fullName>
        <description>Sets date completed to true.</description>
        <field>H2S__DateCompleted__c</field>
        <formula>TODAY()</formula>
        <name>Update Date Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Archived Date</fullName>
        <actions>
            <name>Update_Date_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>H2S__HarvestProject__c.H2S__Archived__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets Date Completed when a project is archived</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Package Budget Alert</fullName>
        <actions>
            <name>Tax_Package_Budget_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>H2S__HarvestProject__c.Package_Burnpercent__c</field>
            <operation>greaterOrEqual</operation>
            <value>80</value>
        </criteriaItems>
        <criteriaItems>
            <field>H2S__HarvestProject__c.H2S__Budget__c</field>
            <operation>equals</operation>
            <value>Total project fees</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Project Archived False</fullName>
        <actions>
            <name>Date_Completed_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>H2S__HarvestProject__c.H2S__Archived__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>When the archived checkbox is set to false on a project, makes the date completed field blank.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
