<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>fpro__FieldPro_Job_Alert</fullName>
        <description>FieldPro Job Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>fpro__FieldPro_Basic/fpro__FieldPro_Job_Alert</template>
    </alerts>
    <rules>
        <fullName>fpro__FieldPro Job Alert</fullName>
        <active>true</active>
        <criteriaItems>
            <field>fpro__FieldPro_Jobs__c.fpro__Object_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>fpro__FieldPro_Jobs__c.fpro__Service_Name__c</field>
            <operation>equals</operation>
            <value>FieldProUsageService</value>
        </criteriaItems>
        <criteriaItems>
            <field>fpro__FieldPro_Jobs__c.fpro__Apex_Job_Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Notify user when FieldPro job is completed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
