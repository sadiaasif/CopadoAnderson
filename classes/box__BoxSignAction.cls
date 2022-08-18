/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BoxSignAction {
    global BoxSignAction() {

    }
    @InvocableMethod(label='Send Box Sign')
    global static List<String> SendBoxSign(List<box.BoxSignAction.Payload> payload) {
        return null;
    }
global class Payload {
    @InvocableVariable(label='Object type of the parent Object' description='Type of the parent sObject; eg. Opportunity or Customobject__c' required=true)
    global String basic_01_parent_type;
    @InvocableVariable(label='Id of the parent Object' description='Id of the parent sObject' required=true)
    global Id basic_0_parentId;
    @InvocableVariable(label='Text Message Verification Locked' required=false)
    global Boolean basic_10_Text_message_verification_locked;
    @InvocableVariable(label='Who' description='m: only me, mo: me and others, o: only others' required=false)
    global String basic_11_who;
    @InvocableVariable(label='Is being prepared' description='Have the sender of a Box Sign prepare the document before sending the request out' required=true)
    global Boolean basic_12_is_being_prepared;
    @InvocableVariable(label='Box Source File ID if request is coming from a file already in Box' required=false)
    global String basic_13_box_source_file_id;
    @InvocableVariable(label='subject' description='Inserts the accounts specified and returns the IDs of the new accounts.' required=false)
    global String basic_1_2_subject;
    @InvocableVariable(label='Message' description='Inserts the accounts specified and returns the IDs of the new accounts.' required=false)
    global String basic_1_msg;
    @InvocableVariable(label='Send Reminders' required=false)
    global Boolean basic_2_reminders;
    @InvocableVariable(label='Salesforce Document Type (File or Attachment)' required=false)
    global String basic_3_1_file_type;
    @InvocableVariable(label='Salesforce Document Id (sObject Id of the SalesForce File or Attachment)' required=false)
    global String basic_3_file_id;
    @InvocableVariable(label='Box Sign Template Id (full URL to the Box Sign Template' required=false)
    global String basic_4_template_id;
    @InvocableVariable(label='From email' required=false)
    global String basic_6_email;
    @InvocableVariable(label='Box Sign API Token' required=false)
    global String basic_7_token;
    @InvocableVariable(label='Auto Delete Days' required=false)
    global Integer basic_8_auto_delete_days;
    @InvocableVariable(label='Auto expire days' required=false)
    global Integer basic_9_auto_expire_days;
    @InvocableVariable(label='Signer 10 - email' required=false)
    global String signer_10_email_10;
    @InvocableVariable(label='Signer 10 - level (default=signature)' required=false)
    global String signer_10_level_10;
    @InvocableVariable(label='Signer 10 - order (default=0)' required=false)
    global Integer signer_10_order_10;
    @InvocableVariable(label='Signer 10 - password' required=false)
    global String signer_10_password_10;
    @InvocableVariable(label='Signer 10 - redirect Url' required=false)
    global String signer_10_redirect_url_10;
    @InvocableVariable(label='Signer 10 - redirect Url Declined' required=false)
    global String signer_10_redirect_url_declined_10;
    @InvocableVariable(label='Signer 10 - verify phone number' required=false)
    global String signer_10_verify_phone_number_10;
    @InvocableVariable(label='Signer 1 - email' required=true)
    global String signer_1_email_1;
    @InvocableVariable(label='Signer 1 - level (default=signature)' required=false)
    global String signer_1_level_1;
    @InvocableVariable(label='Signer 1 - order (default=0)' required=false)
    global Integer signer_1_order_1;
    @InvocableVariable(label='Signer 1 - password' required=false)
    global String signer_1_password_1;
    @InvocableVariable(label='Signer 1 - redirect Url' required=false)
    global String signer_1_redirect_url_1;
    @InvocableVariable(label='Signer 1 - redirect Url Declined' required=false)
    global String signer_1_redirect_url_declined_1;
    @InvocableVariable(label='Signer 1 - verify phone number' required=false)
    global String signer_1_verify_phone_number_1;
    @InvocableVariable(label='Signer 2 - email' required=false)
    global String signer_2_email_2;
    @InvocableVariable(label='Signer 2 - level (default=signature)' required=false)
    global String signer_2_level_2;
    @InvocableVariable(label='Signer 2 - order (default=0)' required=false)
    global Integer signer_2_order_2;
    @InvocableVariable(label='Signer 2 - password' required=false)
    global String signer_2_password_2;
    @InvocableVariable(label='Signer 2 - redirect Url' required=false)
    global String signer_2_redirect_url_2;
    @InvocableVariable(label='Signer 2 - redirect Url Declined' required=false)
    global String signer_2_redirect_url_declined_2;
    @InvocableVariable(label='Signer 2 - verify phone number' required=false)
    global String signer_2_verify_phone_number_2;
    @InvocableVariable(label='Signer 3 - email' required=false)
    global String signer_3_email_3;
    @InvocableVariable(label='Signer 3 - level (default=signature)' required=false)
    global String signer_3_level_3;
    @InvocableVariable(label='Signer 3 - order (default=0)' required=false)
    global Integer signer_3_order_3;
    @InvocableVariable(label='Signer 3 - password' required=false)
    global String signer_3_password_3;
    @InvocableVariable(label='Signer 3 - redirect Url' required=false)
    global String signer_3_redirect_url_3;
    @InvocableVariable(label='Signer 3 - redirect Url Declined' required=false)
    global String signer_3_redirect_url_declined_3;
    @InvocableVariable(label='Signer 3 - verify phone number' required=false)
    global String signer_3_verify_phone_number_3;
    @InvocableVariable(label='Signer 4 - email' required=false)
    global String signer_4_email_4;
    @InvocableVariable(label='Signer 4 - level (default=signature)' required=false)
    global String signer_4_level_4;
    @InvocableVariable(label='Signer 4 - order (default=0)' required=false)
    global Integer signer_4_order_4;
    @InvocableVariable(label='Signer 4 - password' required=false)
    global String signer_4_password_4;
    @InvocableVariable(label='Signer 4 - redirect Url' required=false)
    global String signer_4_redirect_url_4;
    @InvocableVariable(label='Signer 4 - redirect Url Declined' required=false)
    global String signer_4_redirect_url_declined_4;
    @InvocableVariable(label='Signer 4 - verify phone number' required=false)
    global String signer_4_verify_phone_number_4;
    @InvocableVariable(label='Signer 5 - email' required=false)
    global String signer_5_email_5;
    @InvocableVariable(label='Signer 5 - level (default=signature)' required=false)
    global String signer_5_level_5;
    @InvocableVariable(label='Signer 5 - order (default=0)' required=false)
    global Integer signer_5_order_5;
    @InvocableVariable(label='Signer 5 - password' required=false)
    global String signer_5_password_5;
    @InvocableVariable(label='Signer 5 - redirect Url' required=false)
    global String signer_5_redirect_url_5;
    @InvocableVariable(label='Signer 5 - redirect Url Declined' required=false)
    global String signer_5_redirect_url_declined_5;
    @InvocableVariable(label='Signer 5 - verify phone number' required=false)
    global String signer_5_verify_phone_number_5;
    @InvocableVariable(label='Signer 6 - email' required=false)
    global String signer_6_email_6;
    @InvocableVariable(label='Signer 6 - level (default=signature)' required=false)
    global String signer_6_level_6;
    @InvocableVariable(label='Signer 6 - order (default=0)' required=false)
    global Integer signer_6_order_6;
    @InvocableVariable(label='Signer 6 - password' required=false)
    global String signer_6_password_6;
    @InvocableVariable(label='Signer 6 - redirect Url' required=false)
    global String signer_6_redirect_url_6;
    @InvocableVariable(label='Signer 6 - redirect Url Declined' required=false)
    global String signer_6_redirect_url_declined_6;
    @InvocableVariable(label='Signer 6 - verify phone number' required=false)
    global String signer_6_verify_phone_number_6;
    @InvocableVariable(label='Signer 7 - email' required=false)
    global String signer_7_email_7;
    @InvocableVariable(label='Signer 7 - level (default=signature)' required=false)
    global String signer_7_level_7;
    @InvocableVariable(label='Signer 7 - order (default=0)' required=false)
    global Integer signer_7_order_7;
    @InvocableVariable(label='Signer 7 - password' required=false)
    global String signer_7_password_7;
    @InvocableVariable(label='Signer 7 - redirect Url' required=false)
    global String signer_7_redirect_url_7;
    @InvocableVariable(label='Signer 7 - redirect Url Declined' required=false)
    global String signer_7_redirect_url_declined_7;
    @InvocableVariable(label='Signer 7 - verify phone number' required=false)
    global String signer_7_verify_phone_number_7;
    @InvocableVariable(label='Signer 8 - email' required=false)
    global String signer_8_email_8;
    @InvocableVariable(label='Signer 8 - level (default=signature)' required=false)
    global String signer_8_level_8;
    @InvocableVariable(label='Signer 8 - order (default=0)' required=false)
    global Integer signer_8_order_8;
    @InvocableVariable(label='Signer 8 - password' required=false)
    global String signer_8_password_8;
    @InvocableVariable(label='Signer 8 - redirect Url' required=false)
    global String signer_8_redirect_url_8;
    @InvocableVariable(label='Signer 8 - redirect Url Declined' required=false)
    global String signer_8_redirect_url_declined_8;
    @InvocableVariable(label='Signer 8 - verify phone number' required=false)
    global String signer_8_verify_phone_number_8;
    @InvocableVariable(label='Signer 9 - email' required=false)
    global String signer_9_email_9;
    @InvocableVariable(label='Signer 9 - level (default=signature)' required=false)
    global String signer_9_level_9;
    @InvocableVariable(label='Signer 9 - order (default=0)' required=false)
    global Integer signer_9_order_9;
    @InvocableVariable(label='Signer 9 - password' required=false)
    global String signer_9_password_9;
    @InvocableVariable(label='Signer 9 - redirect Url' required=false)
    global String signer_9_redirect_url_9;
    @InvocableVariable(label='Signer 9 - redirect Url Declined' required=false)
    global String signer_9_redirect_url_declined_9;
    @InvocableVariable(label='Signer 9 - verify phone number' required=false)
    global String signer_9_verify_phone_number_9;
    @InvocableVariable(label='Prefill Tag 10  External Id' required=false)
    global String tag_10_1_id;
    @InvocableVariable(label='Prefill Tag 10 Text' required=false)
    global String tag_10_2_text;
    @InvocableVariable(label='Prefill Tag 10 Checkbox' required=false)
    global Boolean tag_10_3_bool;
    @InvocableVariable(label='Prefill Tag 10 Date' required=false)
    global Date tag_10_4_date;
    @InvocableVariable(label='Prefill Tag 11  External Id' required=false)
    global String tag_11_1_id;
    @InvocableVariable(label='Prefill Tag 11 Text' required=false)
    global String tag_11_2_text;
    @InvocableVariable(label='Prefill Tag 11 Checkbox' required=false)
    global Boolean tag_11_3_bool;
    @InvocableVariable(label='Prefill Tag 11 Date' required=false)
    global Date tag_11_4_date;
    @InvocableVariable(label='Prefill Tag 12  External Id' required=false)
    global String tag_12_1_id;
    @InvocableVariable(label='Prefill Tag 12 Text' required=false)
    global String tag_12_2_text;
    @InvocableVariable(label='Prefill Tag 12 Checkbox' required=false)
    global Boolean tag_12_3_bool;
    @InvocableVariable(label='Prefill Tag 12 Date' required=false)
    global Date tag_12_4_date;
    @InvocableVariable(label='Prefill Tag 13 External Id' required=false)
    global String tag_13_1_id;
    @InvocableVariable(label='Prefill Tag 13 Text' required=false)
    global String tag_13_2_text;
    @InvocableVariable(label='Prefill Tag 13 Checkbox' required=false)
    global Boolean tag_13_3_bool;
    @InvocableVariable(label='Prefill Tag 13 Date' required=false)
    global Date tag_13_4_date;
    @InvocableVariable(label='Prefill Tag 14  External Id' required=false)
    global String tag_14_1_id;
    @InvocableVariable(label='Prefill Tag 14 Text' required=false)
    global String tag_14_2_text;
    @InvocableVariable(label='Prefill Tag 14 Checkbox' required=false)
    global Boolean tag_14_3_bool;
    @InvocableVariable(label='Prefill Tag 14 Date' required=false)
    global Date tag_14_4_date;
    @InvocableVariable(label='Prefill Tag 15  External Id' required=false)
    global String tag_15_1_id;
    @InvocableVariable(label='Prefill Tag 15 Text' required=false)
    global String tag_15_2_text;
    @InvocableVariable(label='Prefill Tag 15 Checkbox' required=false)
    global Boolean tag_15_3_bool;
    @InvocableVariable(label='Prefill Tag 15 Date' required=false)
    global Date tag_15_4_date;
    @InvocableVariable(label='Prefill Tag 16  External Id' required=false)
    global String tag_16_1_id;
    @InvocableVariable(label='Prefill Tag 16 Text' required=false)
    global String tag_16_2_text;
    @InvocableVariable(label='Prefill Tag 16 Checkbox' required=false)
    global Boolean tag_16_3_bool;
    @InvocableVariable(label='Prefill Tag 16 Date' required=false)
    global Date tag_16_4_date;
    @InvocableVariable(label='Prefill Tag 17  External Id' required=false)
    global String tag_17_1_id;
    @InvocableVariable(label='Prefill Tag 17 Text' required=false)
    global String tag_17_2_text;
    @InvocableVariable(label='Prefill Tag 17 Checkbox' required=false)
    global Boolean tag_17_3_bool;
    @InvocableVariable(label='Prefill Tag 17 Date' required=false)
    global Date tag_17_4_date;
    @InvocableVariable(label='Prefill Tag 18  External Id' required=false)
    global String tag_18_1_id;
    @InvocableVariable(label='Prefill Tag 18 Text' required=false)
    global String tag_18_2_text;
    @InvocableVariable(label='Prefill Tag 18 Checkbox' required=false)
    global Boolean tag_18_3_bool;
    @InvocableVariable(label='Prefill Tag 18 Date' required=false)
    global Date tag_18_4_date;
    @InvocableVariable(label='Prefill Tag 19  External Id' required=false)
    global String tag_19_1_id;
    @InvocableVariable(label='Prefill Tag 19 Text' required=false)
    global String tag_19_2_text;
    @InvocableVariable(label='Prefill Tag 19 Checkbox' required=false)
    global Boolean tag_19_3_bool;
    @InvocableVariable(label='Prefill Tag 19 Date' required=false)
    global Date tag_19_4_date;
    @InvocableVariable(label='Prefill Tag 1 External Id' required=false)
    global String tag_1_1_id;
    @InvocableVariable(label='Prefill Tag 1 Text' required=false)
    global String tag_1_2_text;
    @InvocableVariable(label='Prefill Tag 1 Checkbox' required=false)
    global Boolean tag_1_3_bool;
    @InvocableVariable(label='Prefill Tag 1 Date' required=false)
    global Date tag_1_4_date;
    @InvocableVariable(label='Prefill Tag 20  External Id' required=false)
    global String tag_20_1_id;
    @InvocableVariable(label='Prefill Tag 20 Text' required=false)
    global String tag_20_2_text;
    @InvocableVariable(label='Prefill Tag 20 Checkbox' required=false)
    global Boolean tag_20_3_bool;
    @InvocableVariable(label='Prefill Tag 20 Date' required=false)
    global Date tag_20_4_date;
    @InvocableVariable(label='Prefill Tag 21  External Id' required=false)
    global String tag_21_1_id;
    @InvocableVariable(label='Prefill Tag 21 Text' required=false)
    global String tag_21_2_text;
    @InvocableVariable(label='Prefill Tag 21 Checkbox' required=false)
    global Boolean tag_21_3_bool;
    @InvocableVariable(label='Prefill Tag 21 Date' required=false)
    global Date tag_21_4_date;
    @InvocableVariable(label='Prefill Tag 22  External Id' required=false)
    global String tag_22_1_id;
    @InvocableVariable(label='Prefill Tag 22 Text' required=false)
    global String tag_22_2_text;
    @InvocableVariable(label='Prefill Tag 22 Checkbox' required=false)
    global Boolean tag_22_3_bool;
    @InvocableVariable(label='Prefill Tag 22 Date' required=false)
    global Date tag_22_4_date;
    @InvocableVariable(label='Prefill Tag 23  External Id' required=false)
    global String tag_23_1_id;
    @InvocableVariable(label='Prefill Tag 23 Text' required=false)
    global String tag_23_2_text;
    @InvocableVariable(label='Prefill Tag 23 Checkbox' required=false)
    global Boolean tag_23_3_bool;
    @InvocableVariable(label='Prefill Tag 23 Date' required=false)
    global Date tag_23_4_date;
    @InvocableVariable(label='Prefill Tag 24  External Id' required=false)
    global String tag_24_1_id;
    @InvocableVariable(label='Prefill Tag 24 Text' required=false)
    global String tag_24_2_text;
    @InvocableVariable(label='Prefill Tag 24 Checkbox' required=false)
    global Boolean tag_24_3_bool;
    @InvocableVariable(label='Prefill Tag 24 Date' required=false)
    global Date tag_24_4_date;
    @InvocableVariable(label='Prefill Tag 25 External Id' required=false)
    global String tag_25_1_id;
    @InvocableVariable(label='Prefill Tag 25 Text' required=false)
    global String tag_25_2_text;
    @InvocableVariable(label='Prefill Tag 25 Checkbox' required=false)
    global Boolean tag_25_3_bool;
    @InvocableVariable(label='Prefill Tag 25 Date' required=false)
    global Date tag_25_4_date;
    @InvocableVariable(label='Prefill Tag 26  External Id' required=false)
    global String tag_26_1_id;
    @InvocableVariable(label='Prefill Tag 26 Text' required=false)
    global String tag_26_2_text;
    @InvocableVariable(label='Prefill Tag 26 Checkbox' required=false)
    global Boolean tag_26_3_bool;
    @InvocableVariable(label='Prefill Tag 26 Date' required=false)
    global Date tag_26_4_date;
    @InvocableVariable(label='Prefill Tag 27  External Id' required=false)
    global String tag_27_1_id;
    @InvocableVariable(label='Prefill Tag 27 Text' required=false)
    global String tag_27_2_text;
    @InvocableVariable(label='Prefill Tag 27 Checkbox' required=false)
    global Boolean tag_27_3_bool;
    @InvocableVariable(label='Prefill Tag 27 Date' required=false)
    global Date tag_27_4_date;
    @InvocableVariable(label='Prefill Tag 28  External Id' required=false)
    global String tag_28_1_id;
    @InvocableVariable(label='Prefill Tag 28 Text' required=false)
    global String tag_28_2_text;
    @InvocableVariable(label='Prefill Tag 28 Checkbox' required=false)
    global Boolean tag_28_3_bool;
    @InvocableVariable(label='Prefill Tag 28 Date' required=false)
    global Date tag_28_4_date;
    @InvocableVariable(label='Prefill Tag 29  External Id' required=false)
    global String tag_29_1_id;
    @InvocableVariable(label='Prefill Tag 29 Text' required=false)
    global String tag_29_2_text;
    @InvocableVariable(label='Prefill Tag 29 Checkbox' required=false)
    global Boolean tag_29_3_bool;
    @InvocableVariable(label='Prefill Tag 29 Date' required=false)
    global Date tag_29_4_date;
    @InvocableVariable(label='Prefill Tag 2  External Id' required=false)
    global String tag_2_1_id;
    @InvocableVariable(label='Prefill Tag 2 Text' required=false)
    global String tag_2_2_text;
    @InvocableVariable(label='Prefill Tag 2 Checkbox' required=false)
    global Boolean tag_2_3_bool;
    @InvocableVariable(label='Prefill Tag 2 Date' required=false)
    global Date tag_2_4_date;
    @InvocableVariable(label='Prefill Tag 30  External Id' required=false)
    global String tag_30_1_id;
    @InvocableVariable(label='Prefill Tag 30 Text' required=false)
    global String tag_30_2_text;
    @InvocableVariable(label='Prefill Tag 30 Checkbox' required=false)
    global Boolean tag_30_3_bool;
    @InvocableVariable(label='Prefill Tag 30 Date' required=false)
    global Date tag_30_4_date;
    @InvocableVariable(label='Prefill Tag 31  External Id' required=false)
    global String tag_31_1_id;
    @InvocableVariable(label='Prefill Tag 31 Text' required=false)
    global String tag_31_2_text;
    @InvocableVariable(label='Prefill Tag 31 Checkbox' required=false)
    global Boolean tag_31_3_bool;
    @InvocableVariable(label='Prefill Tag 31 Date' required=false)
    global Date tag_31_4_date;
    @InvocableVariable(label='Prefill Tag 32  External Id' required=false)
    global String tag_32_1_id;
    @InvocableVariable(label='Prefill Tag 32 Text' required=false)
    global String tag_32_2_text;
    @InvocableVariable(label='Prefill Tag 32 Checkbox' required=false)
    global Boolean tag_32_3_bool;
    @InvocableVariable(label='Prefill Tag 32 Date' required=false)
    global Date tag_32_4_date;
    @InvocableVariable(label='Prefill Tag 33  External Id' required=false)
    global String tag_33_1_id;
    @InvocableVariable(label='Prefill Tag 33 Text' required=false)
    global String tag_33_2_text;
    @InvocableVariable(label='Prefill Tag 33 Checkbox' required=false)
    global Boolean tag_33_3_bool;
    @InvocableVariable(label='Prefill Tag 33 Date' required=false)
    global Date tag_33_4_date;
    @InvocableVariable(label='Prefill Tag 34  External Id' required=false)
    global String tag_34_1_id;
    @InvocableVariable(label='Prefill Tag 34 Text' required=false)
    global String tag_34_2_text;
    @InvocableVariable(label='Prefill Tag 34 Checkbox' required=false)
    global Boolean tag_34_3_bool;
    @InvocableVariable(label='Prefill Tag 34 Date' required=false)
    global Date tag_34_4_date;
    @InvocableVariable(label='Prefill Tag 35  External Id' required=false)
    global String tag_35_1_id;
    @InvocableVariable(label='Prefill Tag 35 Text' required=false)
    global String tag_35_2_text;
    @InvocableVariable(label='Prefill Tag 35 Checkbox' required=false)
    global Boolean tag_35_3_bool;
    @InvocableVariable(label='Prefill Tag 35 Date' required=false)
    global Date tag_35_4_date;
    @InvocableVariable(label='Prefill Tag 36  External Id' required=false)
    global String tag_36_1_id;
    @InvocableVariable(label='Prefill Tag 36 Text' required=false)
    global String tag_36_2_text;
    @InvocableVariable(label='Prefill Tag 36 Checkbox' required=false)
    global Boolean tag_36_3_bool;
    @InvocableVariable(label='Prefill Tag 36 Date' required=false)
    global Date tag_36_4_date;
    @InvocableVariable(label='Prefill Tag 37 External Id' required=false)
    global String tag_37_1_id;
    @InvocableVariable(label='Prefill Tag 37 Text' required=false)
    global String tag_37_2_text;
    @InvocableVariable(label='Prefill Tag 37 Checkbox' required=false)
    global Boolean tag_37_3_bool;
    @InvocableVariable(label='Prefill Tag 37 Date' required=false)
    global Date tag_37_4_date;
    @InvocableVariable(label='Prefill Tag 38  External Id' required=false)
    global String tag_38_1_id;
    @InvocableVariable(label='Prefill Tag 38 Text' required=false)
    global String tag_38_2_text;
    @InvocableVariable(label='Prefill Tag 38 Checkbox' required=false)
    global Boolean tag_38_3_bool;
    @InvocableVariable(label='Prefill Tag 38 Date' required=false)
    global Date tag_38_4_date;
    @InvocableVariable(label='Prefill Tag 39  External Id' required=false)
    global String tag_39_1_id;
    @InvocableVariable(label='Prefill Tag 39 Text' required=false)
    global String tag_39_2_text;
    @InvocableVariable(label='Prefill Tag 39 Checkbox' required=false)
    global Boolean tag_39_3_bool;
    @InvocableVariable(label='Prefill Tag 39 Date' required=false)
    global Date tag_39_4_date;
    @InvocableVariable(label='Prefill Tag 3  External Id' required=false)
    global String tag_3_1_id;
    @InvocableVariable(label='Prefill Tag 3 Text' required=false)
    global String tag_3_2_text;
    @InvocableVariable(label='Prefill Tag 3 Checkbox' required=false)
    global Boolean tag_3_3_bool;
    @InvocableVariable(label='Prefill Tag 3 Date' required=false)
    global Date tag_3_4_date;
    @InvocableVariable(label='Prefill Tag 40  External Id' required=false)
    global String tag_40_1_id;
    @InvocableVariable(label='Prefill Tag 40 Text' required=false)
    global String tag_40_2_text;
    @InvocableVariable(label='Prefill Tag 40 Checkbox' required=false)
    global Boolean tag_40_3_bool;
    @InvocableVariable(label='Prefill Tag 40 Date' required=false)
    global Date tag_40_4_date;
    @InvocableVariable(label='Prefill Tag 41  External Id' required=false)
    global String tag_41_1_id;
    @InvocableVariable(label='Prefill Tag 41 Text' required=false)
    global String tag_41_2_text;
    @InvocableVariable(label='Prefill Tag 41 Checkbox' required=false)
    global Boolean tag_41_3_bool;
    @InvocableVariable(label='Prefill Tag 41 Date' required=false)
    global Date tag_41_4_date;
    @InvocableVariable(label='Prefill Tag 42  External Id' required=false)
    global String tag_42_1_id;
    @InvocableVariable(label='Prefill Tag 42 Text' required=false)
    global String tag_42_2_text;
    @InvocableVariable(label='Prefill Tag 42 Checkbox' required=false)
    global Boolean tag_42_3_bool;
    @InvocableVariable(label='Prefill Tag 42 Date' required=false)
    global Date tag_42_4_date;
    @InvocableVariable(label='Prefill Tag 43  External Id' required=false)
    global String tag_43_1_id;
    @InvocableVariable(label='Prefill Tag 43 Text' required=false)
    global String tag_43_2_text;
    @InvocableVariable(label='Prefill Tag 43 Checkbox' required=false)
    global Boolean tag_43_3_bool;
    @InvocableVariable(label='Prefill Tag 43 Date' required=false)
    global Date tag_43_4_date;
    @InvocableVariable(label='Prefill Tag 44  External Id' required=false)
    global String tag_44_1_id;
    @InvocableVariable(label='Prefill Tag 44 Text' required=false)
    global String tag_44_2_text;
    @InvocableVariable(label='Prefill Tag 44 Checkbox' required=false)
    global Boolean tag_44_3_bool;
    @InvocableVariable(label='Prefill Tag 44 Date' required=false)
    global Date tag_44_4_date;
    @InvocableVariable(label='Prefill Tag 45  External Id' required=false)
    global String tag_45_1_id;
    @InvocableVariable(label='Prefill Tag 45 Text' required=false)
    global String tag_45_2_text;
    @InvocableVariable(label='Prefill Tag 45 Checkbox' required=false)
    global Boolean tag_45_3_bool;
    @InvocableVariable(label='Prefill Tag 45 Date' required=false)
    global Date tag_45_4_date;
    @InvocableVariable(label='Prefill Tag 46  External Id' required=false)
    global String tag_46_1_id;
    @InvocableVariable(label='Prefill Tag 46 Text' required=false)
    global String tag_46_2_text;
    @InvocableVariable(label='Prefill Tag 46 Checkbox' required=false)
    global Boolean tag_46_3_bool;
    @InvocableVariable(label='Prefill Tag 46 Date' required=false)
    global Date tag_46_4_date;
    @InvocableVariable(label='Prefill Tag 47  External Id' required=false)
    global String tag_47_1_id;
    @InvocableVariable(label='Prefill Tag 47 Text' required=false)
    global String tag_47_2_text;
    @InvocableVariable(label='Prefill Tag 47 Checkbox' required=false)
    global Boolean tag_47_3_bool;
    @InvocableVariable(label='Prefill Tag 47 Date' required=false)
    global Date tag_47_4_date;
    @InvocableVariable(label='Prefill Tag 48  External Id' required=false)
    global String tag_48_1_id;
    @InvocableVariable(label='Prefill Tag 48 Text' required=false)
    global String tag_48_2_text;
    @InvocableVariable(label='Prefill Tag 48 Checkbox' required=false)
    global Boolean tag_48_3_bool;
    @InvocableVariable(label='Prefill Tag 48 Date' required=false)
    global Date tag_48_4_date;
    @InvocableVariable(label='Prefill Tag 49  External Id' required=false)
    global String tag_49_1_id;
    @InvocableVariable(label='Prefill Tag 49 Text' required=false)
    global String tag_49_2_text;
    @InvocableVariable(label='Prefill Tag 49 Checkbox' required=false)
    global Boolean tag_49_3_bool;
    @InvocableVariable(label='Prefill Tag 49 Date' required=false)
    global Date tag_49_4_date;
    @InvocableVariable(label='Prefill Tag 4  External Id' required=false)
    global String tag_4_1_id;
    @InvocableVariable(label='Prefill Tag 4 Text' required=false)
    global String tag_4_2_text;
    @InvocableVariable(label='Prefill Tag 4 Checkbox' required=false)
    global Boolean tag_4_3_bool;
    @InvocableVariable(label='Prefill Tag 4 Date' required=false)
    global Date tag_4_4_date;
    @InvocableVariable(label='Prefill Tag 50  External Id' required=false)
    global String tag_50_1_id;
    @InvocableVariable(label='Prefill Tag 50 Text' required=false)
    global String tag_50_2_text;
    @InvocableVariable(label='Prefill Tag 50 Checkbox' required=false)
    global Boolean tag_50_3_bool;
    @InvocableVariable(label='Prefill Tag 50 Date' required=false)
    global Date tag_50_4_date;
    @InvocableVariable(label='Prefill Tag 5  External Id' required=false)
    global String tag_5_1_id;
    @InvocableVariable(label='Prefill Tag 5 Text' required=false)
    global String tag_5_2_text;
    @InvocableVariable(label='Prefill Tag 5 Checkbox' required=false)
    global Boolean tag_5_3_bool;
    @InvocableVariable(label='Prefill Tag 5 Date' required=false)
    global Date tag_5_4_date;
    @InvocableVariable(label='Prefill Tag 6  External Id' required=false)
    global String tag_6_1_id;
    @InvocableVariable(label='Prefill Tag 6 Text' required=false)
    global String tag_6_2_text;
    @InvocableVariable(label='Prefill Tag 6 Checkbox' required=false)
    global Boolean tag_6_3_bool;
    @InvocableVariable(label='Prefill Tag 6 Date' required=false)
    global Date tag_6_4_date;
    @InvocableVariable(label='Prefill Tag 7  External Id' required=false)
    global String tag_7_1_id;
    @InvocableVariable(label='Prefill Tag 7 Text' required=false)
    global String tag_7_2_text;
    @InvocableVariable(label='Prefill Tag 7 Checkbox' required=false)
    global Boolean tag_7_3_bool;
    @InvocableVariable(label='Prefill Tag 7 Date' required=false)
    global Date tag_7_4_date;
    @InvocableVariable(label='Prefill Tag 8  External Id' required=false)
    global String tag_8_1_id;
    @InvocableVariable(label='Prefill Tag 8 Text' required=false)
    global String tag_8_2_text;
    @InvocableVariable(label='Prefill Tag 8 Checkbox' required=false)
    global Boolean tag_8_3_bool;
    @InvocableVariable(label='Prefill Tag 8 Date' required=false)
    global Date tag_8_4_date;
    @InvocableVariable(label='Prefill Tag 9  External Id' required=false)
    global String tag_9_1_id;
    @InvocableVariable(label='Prefill Tag 9 Text' required=false)
    global String tag_9_2_text;
    @InvocableVariable(label='Prefill Tag 9 Checkbox' required=false)
    global Boolean tag_9_3_bool;
    @InvocableVariable(label='Prefill Tag 9 Date' required=false)
    global Date tag_9_4_date;
    global Payload() {

    }
}
}
