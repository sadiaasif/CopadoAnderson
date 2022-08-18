<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>enxootr__Notify_about_test_run_error</fullName>
        <description>Notify about test run error</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>enxootr__Enxoo_TestRunner_templates/enxootr__TestRunErrorNotification</template>
    </alerts>
    <rules>
        <fullName>enxootr__Notify about error test run</fullName>
        <actions>
            <name>enxootr__Notify_about_test_run_error</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>enxootr__Test_Run__c.enxootr__Status__c</field>
            <operation>equals</operation>
            <value>Error</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
