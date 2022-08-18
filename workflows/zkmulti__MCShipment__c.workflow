<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>zkmulti__SendShipmentLabel</fullName>
        <description>SendShipmentLabel</description>
        <protected>false</protected>
        <recipients>
            <recipient>boss@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>zkmulti__ZenKraft_MultiCarrier/zkmulti__Empty_Template</template>
    </alerts>
    <rules>
        <fullName>zkmulti__SendShipmentEmail</fullName>
        <active>false</active>
        <criteriaItems>
            <field>zkmulti__MCShipment__c.zkmulti__Label_Image_Type__c</field>
            <operation>contains</operation>
            <value>PNG</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
