<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Remove_Check_7</fullName>
        <field>Pension_Tax_Mailer_PSP_Merge__c</field>
        <literalValue>0</literalValue>
        <name>Remove Check 7</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Box_1</fullName>
        <field>Conga_Receipt__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Box 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>remove_check</fullName>
        <field>Platinum_Receipt__c</field>
        <literalValue>0</literalValue>
        <name>remove check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>remove_check_6</fullName>
        <field>Pension_Tax_Mailer_401k_Merge__c</field>
        <literalValue>0</literalValue>
        <name>remove check 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box_10</fullName>
        <field>State_Renewal_Quote__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box 10</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box_2</fullName>
        <field>Filing_Fee_Receipt__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box_3</fullName>
        <field>Quote_Texas_Corp__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box_5</fullName>
        <field>Quote_Texas_No_franchise_Tax__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box 5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box_6</fullName>
        <field>Quote_Texas_LLC__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box 6</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box_8</fullName>
        <field>Standard_Renewal_Quote__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box 8</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheckbox2</fullName>
        <field>Filing_Fee_Invoice__c</field>
        <literalValue>0</literalValue>
        <name>uncheckbox2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheckbox_7</fullName>
        <field>RA_Resignation_Notice_Non_Payment__c</field>
        <literalValue>0</literalValue>
        <name>uncheckbox 7</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Conga_Receipt_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Conga_Receipt_Trigger__c</fields>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Conga Receipt Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Filing_Fee_Invoice_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Filing_Fee_Invoice_Trigger__c</fields>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Filing Fee Invoice Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Filing_Fee_Receipt_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Filing_Fee_Receipt_Trigger__c</fields>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Filing Fee Receipt Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Merge_401</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Conga_401k_Merge_Trigger__c</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Merge 401</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Merge_PSP</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Pension_PSP_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Merge PSP</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Platinum_Receipt_Merge</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Conga_Platinum_Receipt_Trigger__c</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Platinum Receipt Merge</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Quote_Texas_Corp_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <fields>Quote_Texas_Corp_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Quote Texas Corp Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Quote_Texas_LLC_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <fields>Quote_Texas_LLC_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Quote Texas LLC Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>RA_Resignation_Non_Payment_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <fields>RA_Resignation_Notice_Non_Payment_Trig__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>RA Resignation - Non Payment - Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Standard_Renewal_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <fields>Standard_Renewal_Quote_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Standard Renewal Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>State_Renewal_Quote_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <fields>State_Renewal_Quote_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>State Renewal Quote Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>uncheck_box4</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>Opportunity_Invoice__c</fields>
        <fields>Quote_Texas_No_franchise_Tax_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>uncheck box4</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>401k Merge</fullName>
        <actions>
            <name>Merge_401</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Pension_Tax_Mailer_401k_Merge__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>remove_check_6</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Conga PSP Merge</fullName>
        <actions>
            <name>Merge_PSP</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Pension_Tax_Mailer_PSP_Merge__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Remove_Check_7</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Conga Receipt Merge</fullName>
        <actions>
            <name>Conga_Receipt_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Conga_Receipt__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Uncheck_Box_1</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Filing Fee Invoice  Merge</fullName>
        <actions>
            <name>Filing_Fee_Invoice_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Filing_Fee_Invoice__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheckbox2</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Filing Fee Receipt Merge</fullName>
        <actions>
            <name>Filing_Fee_Receipt_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Filing_Fee_Receipt__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box_2</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Platinum Receipt</fullName>
        <actions>
            <name>Platinum_Receipt_Merge</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Platinum_Receipt__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>remove_check</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Quote - Texas - Corp Merge</fullName>
        <actions>
            <name>Quote_Texas_Corp_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Quote_Texas_Corp__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box_3</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Quote Texas LLC Merge</fullName>
        <actions>
            <name>Quote_Texas_LLC_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Quote_Texas_LLC__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box_6</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Quote Texas No Franchise Tax Merge</fullName>
        <actions>
            <name>uncheck_box4</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Quote_Texas_No_franchise_Tax__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box_5</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>RA Resignation - Non Payment Merge</fullName>
        <actions>
            <name>RA_Resignation_Non_Payment_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.RA_Resignation_Notice_Non_Payment__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheckbox_7</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Standard Renewal Merge</fullName>
        <actions>
            <name>Standard_Renewal_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.Standard_Renewal_Quote__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box_8</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>State Renewal Quote Merge</fullName>
        <actions>
            <name>State_Renewal_Quote_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Conga_Merge__c.State_Renewal_Quote__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box_10</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
