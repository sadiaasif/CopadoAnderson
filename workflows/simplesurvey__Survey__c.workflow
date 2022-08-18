<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BBB_NPS_Alert</fullName>
        <description>BBB NPS Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_BBB</template>
    </alerts>
    <alerts>
        <fullName>Facebook_NPS_Alert</fullName>
        <description>Facebook NPS Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_Facebook</template>
    </alerts>
    <alerts>
        <fullName>Feedback_0_6</fullName>
        <description>Feedback 0-6</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_0_6</template>
    </alerts>
    <alerts>
        <fullName>Feedback_7_8</fullName>
        <description>Feedback 7-8</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_7_8</template>
    </alerts>
    <alerts>
        <fullName>G_NPS_Alert</fullName>
        <description>G+ NPS Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_Google</template>
    </alerts>
    <alerts>
        <fullName>NPS_High_Score_Follow_Up_Trust_Pilot</fullName>
        <description>Follow up email if Survey score is 9 or 10</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_Trust_Pilot</template>
    </alerts>
    <alerts>
        <fullName>Yelp_NPS_Alert</fullName>
        <description>Yelp NPS Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Follow_Up_Yelp</template>
    </alerts>
    <fieldUpdates>
        <fullName>BCP_Record_Type</fullName>
        <description>Changes the record type to Business Continuity Task Survey</description>
        <field>RecordTypeId</field>
        <lookupValue>Business_Continuity_Task_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>BCP Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Entity_Formation</fullName>
        <description>Changes the record type to Entity Formation</description>
        <field>RecordTypeId</field>
        <lookupValue>Sales</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Entity Formation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estate_Planning</fullName>
        <description>Changes record type to Living Trust Survey</description>
        <field>RecordTypeId</field>
        <lookupValue>Living_Trust_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Estate Planning</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Question</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Platinum_Question</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Platinum Question</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Record_Type</fullName>
        <description>Updates the record type of a survey to Platinum</description>
        <field>RecordTypeId</field>
        <lookupValue>Platinum_Sale</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Platinum Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewals_Record_Type</fullName>
        <description>Updates record type to renewals</description>
        <field>RecordTypeId</field>
        <lookupValue>Renewal_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Renewals Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Service_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Service</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Service Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Survey_BK_RecordType</fullName>
        <description>Updates the survey record type to bookkeeping</description>
        <field>RecordTypeId</field>
        <lookupValue>Bookkeeping_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Survey BK RecordType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Record_Type</fullName>
        <description>Updates the record type to Tax</description>
        <field>RecordTypeId</field>
        <lookupValue>Tax_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Tax Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Welcome_Call_Record_Type</fullName>
        <description>Changes the record type to Welcome Call Task Survey</description>
        <field>RecordTypeId</field>
        <lookupValue>Welcome_Call_Task_Survey</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Welcome Call Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>BCP</fullName>
        <actions>
            <name>BCP_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Business Continuity Task</value>
        </criteriaItems>
        <description>Changes record type to Business Continuity Task on creation if Source is BCP</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping</fullName>
        <actions>
            <name>Survey_BK_RecordType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Bookkeeping</value>
        </criteriaItems>
        <description>Changes record type to bookkeeping on creation if Source is Bookkeeping</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Entity Formation</fullName>
        <actions>
            <name>Entity_Formation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Entity Formation</value>
        </criteriaItems>
        <description>Changes record type to Entity Formation on creation if Source is Entity Formation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Estate Planning</fullName>
        <actions>
            <name>Estate_Planning</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Estate Planning</value>
        </criteriaItems>
        <description>Changes record type to Living Trust on creation if Source is Estate Planning</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Platinum</fullName>
        <actions>
            <name>Platinum_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Platinum</value>
        </criteriaItems>
        <description>Changes record type to Platinum on creation if Source is Platinum</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Question</fullName>
        <actions>
            <name>Platinum_Question</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Platinum Question</value>
        </criteriaItems>
        <description>Sets the record type to Platinum Question if the Source is Platinum Question</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Renewals</fullName>
        <actions>
            <name>Renewals_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Renewals</value>
        </criteriaItems>
        <description>Changes record type to renewals on creation if Source is renewals</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Service</fullName>
        <actions>
            <name>Service_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Service</value>
        </criteriaItems>
        <description>Changes the record type to service when a survey is created with the Service source.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Tax</fullName>
        <actions>
            <name>Tax_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Tax</value>
        </criteriaItems>
        <description>Changes record type to Tax on creation if Source is Tax</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Welcome Call Completed</fullName>
        <actions>
            <name>Welcome_Call_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>simplesurvey__Survey__c.Source__c</field>
            <operation>equals</operation>
            <value>Welcome Call Task</value>
        </criteriaItems>
        <description>Changes record type to Welcome Call Task on creation if Source is BCP</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
