public with sharing class PrintAddress2 
{
    public boolean displayPopup {get; set;}
    public String itemAddress {get; set;}
    public String printBarcode { get; set; }
    public String formattedAddress {get; set;}
    public String strSelected {get; set;}
    public Account m_contact;
    private Id caseId { get; set; }
    
    public PrintAddress2(ApexPages.StandardController controller)
    {
        Id id = System.currentPageReference().getParameters().get('id');
        caseId = System.currentPageReference().getParameters().get('caseId');
        
        m_contact = id == null ? new Account() :
            [Select Id, First_Name__c, Last_Name__c, BillingStreet, BillingCity, BillingState, BillingCountry, BillingPostalCode, Alternate_Shipping_Street__c, Alternate_Shipping_State_Province__c, Alternate_Shipping_City__c, Alternate_Shipping_Zip_Postal_Code__c, ShippingStreet, ShippingState, ShippingCity, ShippingPostalCode, Alternate_Shipping_Address_Notes__c, Primary_Shipping_Notes__c FROM Account WHERE Id = :id];        
       
        displayPopup = true;
        itemAddress = '1';
        formattedAddress  = '';
        actionSave();
    }
    
    public void createSentMailTask() {
        if (caseId == null) return;
        
        Task t = new Task(Subject = 'Sent Mail', OwnerId = UserInfo.getUserId(), ActivityDate = Date.today(), WhatId = caseId, Status = 'Completed', Description = 'Created Automatically');
        
        try {
            insert t;
        } catch (Exception e) {
            ApexPages.addMessages(e);
        }
    }
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        String primaryAdd = 'Primary Shipping Address ' + '(' + m_contact.Primary_Shipping_Notes__c+ ')';
        String alternateAdd = 'Alternate Shipping Address ' + '(' + m_contact.Alternate_Shipping_Address_Notes__c + ')';
        String billingAdd = 'Billing Address';
        options.add(new SelectOption('1', primaryAdd)); 
        options.add(new SelectOption('2', alternateAdd)); 
        options.add(new SelectOption('3', billingAdd)); 
        return options; 
    }  
   
    public PageReference actionSave() {

        printBarcode = 'false';
        
        formattedAddress = PrepareFormattedAddress();
        
        return null;
    }   
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;    
    }
    
    
    private String PrepareFormattedAddress()
    {
        if (m_contact == null)
        {
            system.Debug(logginglevel.ERROR, 'PaObject.m_contact is null');
            return '';
        }
        String state = '';
        String city = '';
        String zip = '';
        String street = '';
        
        if(itemAddress == '1') {
            strSelected = 'Primary Shipping Address ' + '(' + m_contact.Primary_Shipping_Notes__c+ ')';
            street = m_contact.ShippingStreet;
            state = m_contact.ShippingState;
            city = m_contact.ShippingCity;
            zip = m_contact.ShippingPostalCode;
        }
        
        if(itemAddress == '2') {
            strSelected = 'Alternate Shipping Address ' + '(' + m_contact.Alternate_Shipping_Address_Notes__c + ')';
            street = m_contact.Alternate_Shipping_Street__c;
            state = m_contact.Alternate_Shipping_State_Province__c ;
            city = m_contact.Alternate_Shipping_City__c;
            zip = m_contact.Alternate_Shipping_Zip_Postal_Code__c;
        }
        
        if(itemAddress == '3') {
            strSelected = 'Billing Address';
            street = m_contact.BillingStreet;
            state = m_contact.BillingState;
            city = m_contact.BillingCity;
            zip = m_contact.BillingPostalCode;
        }

        
        List<String> params = new List<String>();            
    
        // check if zip, state and city meet to some formatting condition
        if (zip != null && zip.length() >= 5 && state != null && state.length() >= 2 && city != null && city.length() > 0)
        {
            // format address from these fields
            params.add(m_contact.Last_Name__c + ', ' + m_contact.First_Name__c);
            params.add(street.trim());
            params.add(city.trim());
            params.add(state.trim());
            params.add(zip.trim());

            return String.format('{0}\r\n{1}\r\n{2}, {3} {4}', params);
        }
        else
        {
            // make address from BillingStreet field
            params.add(m_contact.Last_Name__c + ', ' + m_contact.First_Name__c);
            params.add(m_contact.BillingStreet.trim());

            return String.format('{0}\r\n{1}', params);
        }
    }
    
    public String getContactFullName()
    {
        if (m_contact == null)
        {
            system.Debug(logginglevel.ERROR, 'PaObject.m_contact is null');
            return '';
        }
        
        return m_contact.Last_Name__c + ', ' + m_contact.First_Name__c;
    }
    
    public Account getContact()
    {
        return m_contact;
    }
    
    public class PaObject
    {
        /*private Account m_contact;
        public PaObject()
        {
            Id id = System.currentPageReference().getParameters().get('id');
            
            m_contact = id == null ? new Account() :
                [Select Id, First_Name__c, Last_Name__c, BillingStreet, BillingCity, BillingState, BillingCountry, BillingPostalCode FROM Account WHERE Id = :id];        
           
            printBarcode = 'true';
            
            formattedAddress = PrepareFormattedAddress();
        }*/
        
       
        
        // contact full name
        
        
        /*public String printBarcode { get; set; }
             
        private String formattedAddress = '';
        
        public void setFormattedAddress(String value)
        {
            System.debug(logginglevel.INFO, 'Address is updated: ' + value);
            formattedAddress = value;
        }
        
        public String getFormattedAddress()
        {
            return formattedAddress;
        }*/
 
        
       
        public String getAddressLabelXml()
        {
            String template = '<?xml version="1.0" encoding="utf-8"?>' +
                '<DieCutLabel Version="8.0" Units="twips">' +
                '<PaperOrientation>Landscape</PaperOrientation>' +
                '<Id>Address</Id>' +
                '<PaperName>30252 Address</PaperName>' +
                '<DrawCommands>' +
                    '<RoundRectangle X="0" Y="0" Width="1581" Height="5040" Rx="270" Ry="270" />' +
                '</DrawCommands>' +
                '<ObjectInfo>' +
                '<AddressObject>' +
                    '<Name>Address</Name>' +
                    '<ForeColor Alpha="255" Red="0" Green="0" Blue="0" />' +
                    '<BackColor Alpha="0" Red="255" Green="255" Blue="255" />' +
                    '<LinkedObjectName></LinkedObjectName>' +
                    '<Rotation>Rotation0</Rotation>' +
                    '<IsMirrored>False</IsMirrored>' +
                    '<IsVariable>True</IsVariable>' +
                    '<HorizontalAlignment>Left</HorizontalAlignment>' +
                    '<VerticalAlignment>Middle</VerticalAlignment>' +
                    '<TextFitMode>ShrinkToFit</TextFitMode>' +
                    '<UseFullFontHeight>True</UseFullFontHeight>' +
                    '<Verticalized>False</Verticalized>' +
                    '<StyledText>' +
                        '<Element>' +
                        '<String></String>' +
                        '<Attributes>' +
                            '<Font Family="Arial" Size="12" Bold="False" Italic="False" Underline="False" Strikeout="False" />' +
                            '<ForeColor Alpha="255" Red="0" Green="0" Blue="0" />' +
                        '</Attributes>' +
                        '</Element>' +
                    '</StyledText>' +
                    '<ShowBarcodeFor9DigitZipOnly>False</ShowBarcodeFor9DigitZipOnly>' +
                    '<BarcodePosition>AboveAddress</BarcodePosition>' +
                    '<LineFonts>' +
                        '<Font Family="Arial" Size="12" Bold="False" Italic="False" Underline="False" Strikeout="False" />' +
                        '<Font Family="Arial" Size="12" Bold="False" Italic="False" Underline="False" Strikeout="False" />' +
                        '<Font Family="Arial" Size="12" Bold="False" Italic="False" Underline="False" Strikeout="False" />' +
                    '</LineFonts>' +
                '</AddressObject>' +
                '<Bounds X="332" Y="150" Width="4455" Height="1260" />' +
                '</ObjectInfo>' +
                '</DieCutLabel>';

            return template;        
        }
      
        private String imageSrc = 'data:image/png;base64';
        
        public void setImageSrc(String value)
        {
            imageSrc = value;
        }
        
        public String getImageSrc()
        {
            return imageSrc;
        }

    }

    private paObject m_paObject;
   
    public PaObject getPaObject()
    {
        if (m_paObject == null)
        {
            m_paObject = new PaObject();
            System.debug(logginglevel.INFO, 'singleton PaObject is created');
        }
        return m_paObject;
    }
}