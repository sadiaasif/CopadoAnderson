<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Campaign_ABA_or_Affiliate_Event_was_Created_or_Changed</fullName>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign - ABA or Affiliate Event was Created or Changed</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Updates/Campaign_ABA_Event_Affiliate_Created_or_Edited</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - Start</description>
        <protected>false</protected>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_Start_Date</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates_End</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - End</description>
        <protected>false</protected>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_End_Date</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates_EventStatus</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - Event Status</description>
        <protected>false</protected>
        <recipients>
            <recipient>vvance@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_Event_Status</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates_Name</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - Name</description>
        <protected>false</protected>
        <recipients>
            <recipient>slee@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vvance@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_Name</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates_Speakers</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - Speakers</description>
        <protected>false</protected>
        <recipients>
            <recipient>vvance@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_Speakers</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates_Staff</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - Staff</description>
        <protected>false</protected>
        <recipients>
            <recipient>vvance@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_Staff</template>
    </alerts>
    <alerts>
        <fullName>Campaign_Updates_Venue</fullName>
        <ccEmails>jprice@andersonadvisors.com</ccEmails>
        <ccEmails>jguanlao@andersonadvisors.com</ccEmails>
        <description>Campaign Updates - Venue Address</description>
        <protected>false</protected>
        <recipients>
            <recipient>vvance@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Campaign_Updates/Campaign_Update_Venue_Address</template>
    </alerts>
</Workflow>
