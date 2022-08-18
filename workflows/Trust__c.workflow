<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Land_Trust_Shipped_to_Client_Email</fullName>
        <description>Land Trust Shipped to Client Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>deedsandtrusts@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Trust_Emails/Land_Trust_Shipped_to_Client_Email</template>
    </alerts>
    <alerts>
        <fullName>Land_Trust_Shipping_Confirmation</fullName>
        <description>Land Trust Shipping Confirmation</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>deedsandtrusts@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Land_Trust_Shipping_Confirmation</template>
    </alerts>
    <alerts>
        <fullName>Reminder_after_5_Days</fullName>
        <description>Reminder after 5 Days</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>deedsandtrusts@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Reminder_after_5_days</template>
    </alerts>
    <alerts>
        <fullName>Reminder_to_Fund_Your_Trust</fullName>
        <description>Reminder to Fund Your Trust</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>deedsandtrusts@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Reminder_to_Fund_Your_Trust</template>
    </alerts>
    <alerts>
        <fullName>Reminder_to_Fund_Your_Trust_FInal</fullName>
        <description>Reminder to Fund Your Trust FInal</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>deedsandtrusts@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Reminder_to_Land_Your_Trust_Final</template>
    </alerts>
    <fieldUpdates>
        <fullName>Check_the_box</fullName>
        <field>Currently_Working_On__c</field>
        <literalValue>1</literalValue>
        <name>Check the box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fiscal_Year_End</fullName>
        <field>Fiscal_Year_End__c</field>
        <formula>DATE(YEAR(TODAY()), 12, 31)</formula>
        <name>Fiscal Year End</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box</fullName>
        <field>Personal_Property_Trust_Merge__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>PPT_Merge</fullName>
        <apiVersion>50.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Personal_Property_Trust_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>PPT Merge</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Conga Trigger PPT Docs</fullName>
        <actions>
            <name>PPT_Merge</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Trust__c.Personal_Property_Trust_Merge__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>LandTrustTaskCreation</fullName>
        <actions>
            <name>Land_Trust_Filing</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Trust__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Land Trust</value>
        </criteriaItems>
        <description>LandTrustTaskCreation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Living Trust in Progress Status %28Trusts%29</fullName>
        <actions>
            <name>Check_the_box</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Trust__c.Docs_Complete__c</field>
            <operation>greaterOrEqual</operation>
            <value>7/10/2018</value>
        </criteriaItems>
        <criteriaItems>
            <field>Trust__c.Documents_Complete__c</field>
            <operation>greaterOrEqual</operation>
            <value>7/10/2018</value>
        </criteriaItems>
        <description>Checks the &quot;currently&quot; working on box when the documents complete field is entered.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Fiscal Year</fullName>
        <actions>
            <name>Fiscal_Year_End</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Trust__c.Name</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <criteriaItems>
            <field>Trust__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>WY Statutory Trust</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Land_Trust_Filing</fullName>
        <assignedTo>boss@andersonadvisors.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>New Task creation for Land Trust.</description>
        <dueDateOffset>8</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Trust__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Land Trust Filing</subject>
    </tasks>
</Workflow>
