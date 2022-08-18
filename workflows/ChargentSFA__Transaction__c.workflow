<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ChargentSFA__Customer_Receipt</fullName>
        <description>Customer Receipt</description>
        <protected>false</protected>
        <recipients>
            <field>ChargentSFA__Billing_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ChargentSFA__Chargent_Templates/ChargentSFA__Customer_Receipt</template>
    </alerts>
    <alerts>
        <fullName>ChargentSFA__Recurring_Transaction_Failure_Email_Alert</fullName>
        <description>Recurring Transaction Failure Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>ChargentSFA__Billing_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ChargentSFA__Chargent_Templates/ChargentSFA__Payment_Issue_Alert</template>
    </alerts>
    <alerts>
        <fullName>New_Transaction_Done</fullName>
        <description>New Transaction Done</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Communities_Emails/Opportunity_Transaction_Email</template>
    </alerts>
    <alerts>
        <fullName>Payment_Information_Email_to_Justin</fullName>
        <ccEmails>jcampese@andersonadvisors.com</ccEmails>
        <description>Payment Information Email to Justin</description>
        <protected>false</protected>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ChargentSFA__Chargent_Templates/Payment_Information_to_Justin</template>
    </alerts>
    <alerts>
        <fullName>Unapproved_Transaction_Email</fullName>
        <description>Unapproved Transaction Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Unapproved_Transaction_Mail</template>
    </alerts>
    <fieldUpdates>
        <fullName>ChargentSFA__Invert_Refund</fullName>
        <description>No longer required so the amount will not change</description>
        <field>ChargentSFA__Amount__c</field>
        <formula>ChargentSFA__Amount__c</formula>
        <name>Invert Refund</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Payment_Status_to_Error</fullName>
        <description>Sets the Payment Status to Error.</description>
        <field>ChargentSFA__Payment_Status__c</field>
        <literalValue>Error</literalValue>
        <name>Opp Payment Status to Error</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>ChargentSFA__Opportunity__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Previous_Month_Transaction</fullName>
        <description>Update checkbox when formula field evaluates to true.</description>
        <field>Previous_Month_Transaction__c</field>
        <literalValue>1</literalValue>
        <name>Previous Month Transaction</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Previous_Month_Transaction_Uncheck</fullName>
        <description>Mirror of formula field to check-box.</description>
        <field>Previous_Month_Transaction__c</field>
        <literalValue>0</literalValue>
        <name>Previous Month Transaction Uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Generate_to_Payment</fullName>
        <description>Vertiba OnDemand, 8/29/2014, SR-00002164, Generate is set to &quot;Payment&quot;</description>
        <field>Generate__c</field>
        <literalValue>Payment</literalValue>
        <name>Set Generate to Payment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opp_Amount</fullName>
        <field>Amount</field>
        <formula>IF(ISBLANK(ChargentSFA__Opportunity__r.Amount), (0 - ChargentSFA__Amount__c),
(ChargentSFA__Opportunity__r.Amount -  ChargentSFA__Amount__c))</formula>
        <name>Update Opp Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>ChargentSFA__Opportunity__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>ChargentSFA__Customer Receipt</fullName>
        <actions>
            <name>ChargentSFA__Customer_Receipt</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.ChargentSFA__Type__c</field>
            <operation>equals</operation>
            <value>Charge</value>
        </criteriaItems>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.ChargentSFA__Response_Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <description>This rule fires on successful Chargent payment transactions.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Error with Recurring Payment</fullName>
        <actions>
            <name>ChargentSFA__Recurring_Transaction_Failure_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.ChargentSFA__Response_Status__c</field>
            <operation>equals</operation>
            <value>Declined,Error</value>
        </criteriaItems>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.ChargentSFA__Recurring__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>This workflow rule fires when a recurring transaction fails to be completed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Invert Refund</fullName>
        <active>true</active>
        <description>No longer used. A Refund will now create a NEW transaction with a negative amount.</description>
        <formula>1=2</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Client Referral Credit</fullName>
        <actions>
            <name>Update_Opp_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the amount on the Sale by a negative number equal to the credit on the Transaction.</description>
        <formula>AND(
ISPICKVAL( ChargentSFA__Type__c, &quot;Client Referral Credit&quot;),
ChargentSFA__Response_Status__c = &quot;Approved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Payment Information to Client</fullName>
        <actions>
            <name>Payment_Information_Email_to_Justin</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>contains</operation>
            <value>State Renewal,Standard Renewal,Pension Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Transaction is Declined</fullName>
        <actions>
            <name>Opp_Payment_Status_to_Error</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Changes the opportunity Payment Status to Error when a transaction is declined.</description>
        <formula>AND(
Sale_Type__c = &quot;Platinum Subscription&quot;,
ChargentSFA__Recurring__c = True,
OR(
ChargentSFA__Response_Status__c = &quot;Declined&quot;,
ChargentSFA__Response_Status__c = &quot;Error&quot;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Previous Month Transaction</fullName>
        <actions>
            <name>Previous_Month_Transaction</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.Previous_Month_Transaction_Mirror__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Mirror of formula field to check-box.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Previous Month Transaction Uncheck</fullName>
        <actions>
            <name>Previous_Month_Transaction_Uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.Previous_Month_Transaction_Mirror__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Mirror of formula field to check-box.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Transaction%3AGeneratePayment</fullName>
        <actions>
            <name>Set_Generate_to_Payment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Vertiba OnDemand, 8/29/2014, SR-00002164 - Generate field is set to &quot;Payment&quot; if Transaction created date is 9/1/2014 or later and Response Status is &quot;Approved&quot;</description>
        <formula>AND (NOT (ISCHANGED (  Generate__c  )),
     DATEVALUE(CreatedDate) &gt;= DATE (2014,9,1),
     ChargentSFA__Response_Status__c = &quot;Approved&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Unapproved Transaction Mail</fullName>
        <actions>
            <name>Unapproved_Transaction_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.ChargentSFA__Response_Status__c</field>
            <operation>notEqual</operation>
            <value>Approved</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Platinum Subscription</value>
        </criteriaItems>
        <criteriaItems>
            <field>ChargentSFA__Transaction__c.CreatedById</field>
            <operation>notEqual</operation>
            <value>Nick Frates</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
