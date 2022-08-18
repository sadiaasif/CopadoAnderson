<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>evt__Send_Attendee_Passes_on_payment_completed</fullName>
        <ccEmails>ron@linvio.com</ccEmails>
        <description>Send Attendee Passes on payment completed</description>
        <protected>false</protected>
        <recipients>
            <field>pymt__Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>evt__Linvio_Events/evt__Event_Passes_Payment</template>
    </alerts>
    <alerts>
        <fullName>pymt__Send_Payment_Request_Email</fullName>
        <description>Send Payment Request Email</description>
        <protected>false</protected>
        <recipients>
            <field>pymt__Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>pymt__PaymentConnect/pymt__PaymentConnect_Payment_Request</template>
    </alerts>
    <fieldUpdates>
        <fullName>pymt__Uncheck_Trigger_Payment_Request</fullName>
        <description>Unchecks the Trigger Payment Request checkbox.</description>
        <field>pymt__Trigger_Payment_Request__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Trigger Payment Request</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>true</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>evt__Email Attendee Passes</fullName>
        <actions>
            <name>evt__Send_Attendee_Passes_on_payment_completed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>pymt__PaymentX__c.pymt__OnPaymentCompleted_Trigger__c</field>
            <operation>includes</operation>
            <value>evt__EmailPasses</value>
        </criteriaItems>
        <criteriaItems>
            <field>pymt__PaymentX__c.pymt__Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Sends an email with event attendee passes when the payment OPC tags include evt__EmailPasses</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>pymt__Sample Send Payment Request on Trigger</fullName>
        <actions>
            <name>pymt__Send_Payment_Request_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>pymt__Uncheck_Trigger_Payment_Request</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>pymt__PaymentX__c.pymt__Amount__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>pymt__PaymentX__c.pymt__Status__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>pymt__PaymentX__c.pymt__Trigger_Payment_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sends a payment request email when the Trigger Payment Request checkbox is ticked (e.g. by batch payment processing scripts).</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
