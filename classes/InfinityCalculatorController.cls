/**
* A controller class to used to save the infinite calculator data in corresponding object.
* 
* @author ranjitk
* @version 1.0 - Aug 14, 2018
*/ 

public without sharing class InfinityCalculatorController {
    // Code we will invoke on page load.
    Public Infinity_Calculator__c nc {get;set;}
    Public User usObj{get;set;}
    Public Contact con{get;set;}
    Public Account acc{get;set;}
     
    public InfinityCalculatorController(ApexPages.StandardController controller) {        
        
        nc = new Infinity_Calculator__c();
        con=new Contact();
        acc=new Account();
        usObj=[Select id,Username,AboutMe,Name,FirstName,LastName,Phone,ContactId,SmallPhotoUrl,FullPhotoUrl,AccountId,Email,Alias,ProfileId,Title,MobilePhone,LastLoginDate,CreatedDate,Client_Image__c,IsActive from User where Id=:UserInfo.getUserId() Limit 1];
        try{
            if(usObj.contactid!=null) {    
                con=[Select id,Name,Email,AccountId,account.Platinum_Client_View__c,account.Phone,FirstName, LastName, MobilePhone, Birthdate From contact where id =:usObj.contactid limit 1];           
                acc=[Select Id, Name,Platinum_Client_View__c, Assigned_CAM__c, Assigned_CSR__c, Account_Number__c, First_Name__c, Last_Name__c, Email__c, Mobile_Number__c, BillingAddress, ShippingAddress, Phone, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, Profile_background__c, E_Mail__c,Bookkeeper_Pic__c, Bookkeeper_Text__c, CAM_Pic__c, CSR_Pic__c, Senior_Advisor_Pic__c, Senior_Advisor_Picklist__c, Tax_Preparer_Pic__c, CAM_Email__c, CAM_Ext__c, CSR_Email__c, CSR_Ext__c, Tax_Preparer__c,Senior_Advisor__c, Bookkeeper__r.name, Bookkeeper_Picklist__c From Account where id =:con.accountid limit 1];
                nc =[Select Id,Name,Account__c,first_name__c,last_name__c,email__c,your_take_home_pay__c,spouse_take_home_pay__c,your_commissions__c,spouse_commissions__c,spouse_tips__c,your_bonuses__c,spouse_bonuses__c,your_net_profit_from_business__c,spouse_net_profit_from_business__c,your_interest__c,spouse_interest__c,your_dividends__c,spouse_dividends__c,your_net_proceeds_from_sales_of_assets__c,spouse_net_proceeds_from_sales_of_asse__c,your_net_profit_from_rental_properties__c,spouse_net_profit_from_rental_properti__c,your_income_from_alimony__c,spouse_income_from_alimony__c,your_social_security_benefits__c,spouse_social_security_benefits__c,your_ira_income__c,spouse_ira_income__c,your_pension_income__c,spouse_pension_income__c,your_veterans_benefits__c,spouse_veterans_benefits__c,your_unemployment_benefits__c,spouse_unemployment_benefits__c,your_royalties__c,spouse_royalties__c,rent_payment__c,other_taxes__c,mortgage_payment__c,personal_maintenance__c,household_repairs__c,recreation__c,utilities__c,child_care__c,food__c,Charity_Church__c,Auto_Expense__c,Medical_Expenses__c,Bus_Expense__c,Dental_Expenses__c,Train_Expense__c,School_Expenses__c,Credit_Card_Payments__c,Car_Gasoline__c,Installment_Contract_Payment__c,Cell_Phone__c,Alimony__c,Cable_Bill__c,Child_Support__c,Internet__c,Home_Insurance__c,Vacation__c,Life_Insurance__c,Landscaping__c,Auto_Insurance__c,Dry_Cleaning_Laundry__c,Property_Taxes__c,Other_Expenses__c,checking_accounts__c,savings_accounts__c,stock_non_ira_or_401k__c,bonds__c,cash_value_of_life_insurance__c,accounts_receivables__c,tax_refund__c,autos__c,boats__c,recreational_vehicles__c,home__c,vacation_homes__c,rental_real_estate__c,vested_pension__c,ira__c,X401k__c,home_furnishings__c,antiques__c,collectibles__c,other_asset__c,other_asset_1__c,other_asset_2__c,mortgage_personal_home__c,mortgage_vacation_home__c,mortgages_on_rentals__c ,doctor_bills__c,credit_card_balances__c,other_revolving_credit__c,contracts_payable__c,taxes_payable__c,auto_loans__c,boat_loans__c,rv_loans__c,judgement_payable__c,contingent_liabilities__c,college_loans__c,other_liabilities__c,other_liabilities_1__c,other_liabilities_2__c,other_liabilities_3__c,other_liabilities_4__c,other_liabilities_5__c,other_liabilities_6__c,other_liabilities_7__c,Minimum_Rent_Payment__c,Minimum_Mortgage_Payment__c,Minimum_Household_Repairs__c,Minimum_Utilities__c,Minimum_Food__c,Minimum_Auto_Expense__c,Minimum_Bus_Expense__c,Minimum_Train_Expense__c,Minimum_Credit_Card_Payments__c,Minimum_Alimony__c,Minimum_Child_Support__c,Minimum_Home_Insurance__c,Minimum_Life_Insurance__c,Minimum_Auto_Insurance__c,Minimum_Property_Taxes__c,Minimum_Other_Taxes__c,Minimum_Personal_Maintenance__c,Minimum_Recreation__c,Minimum_Child_Care__c,Minimum_Charity_Church__c,Minimum_Medical_Expenses__c,Minimum_Dental_Expenses__c,Minimum_School_Expenses__c,Minimum_Car_Gasoline__c,Minimum_Cable_Bill__c,Minimum_Internet__c,Minimum_Vacation__c,Minimum_Landscaping__c,Minimum_Dry_Cleaning_Laundry__c,Minimum_Other_Expenses__c,Your_Monthly_Infinity_Income_Rents__c,Spouse_Monthly_Infinity_Income_Rents__c,Your_Monthly_Infinity_Income_Royalties__c,Spouse_Monthly_Infinity_Income_Royalti__c,Your_Monthly_Infinity_Income_Dividends__c,Spouse_Monthly_Infinity_Income_Dividen__c,Your_Monthly_Infinity_Income_Interest__c,Spouse_Monthly_Infinity_Income_Interes__c,Your_Monthly_Infinity_Income_Short_Ter__c,Spouse_Monthly_Infinity_Income_Short_T__c,your_tips__c ,Minimum_Cell_Phone__c ,Minimum_Installment_Contract_Payment__c ,Infinity_Net_Worth_2__c,Infinity_Net_Worth__c,Daily_Expenses__c,Daily_Infinity_Income__c,Total_Calculated_Monthly_Expenses__c, Total_Monthly_Infinity_Income_Calculated__c, Infinity_Net_Worth_Number__c, Total_Calculated_Assets__c, Total_Calculated_All_Fat__c, Traditional_Net_Worth_Calculated__c, Total_Calculated_Liabilities__c , Traditional_Net_Worth_2__c, Daily_Infinity_Income_Needed__c, Additional_Infinity_Income_Needed__c, Monthly_Money_Available_For_Investment__c,Total_Calculated_Income_for_Both_Spouses__c from Infinity_Calculator__c where Account__c =:acc.id Limit 1];
            }
            
        }catch(Exception e){
            system.debug('Error ==== ' + e);            
        }
    }
    
    
   
    public PageReference saveInfinity(){
        try{
            system.debug('NC = = ' + nc);
            nc.Account__c = acc.id;
            //nc.Name = incName;
            Upsert nc;
            PageReference myVFPage = new PageReference('/apex/Infinite_calculator');
            myVFPage.setRedirect(true);
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!'));
            return myVFPage;
        }catch(Exception e){            
            system.debug('Error ==== ' + e);  
            return null;
        }
    }
}