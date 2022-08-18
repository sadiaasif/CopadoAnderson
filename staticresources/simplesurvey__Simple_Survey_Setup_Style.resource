/**
	03/26/18  BE  Style that is applied to any IC app that is using SLDS
	03/08/19  BE  Tweaks for Lighting Design System version update (00169399)
	11/04/21  BS  Rebrand tweaks (00196663)
**/

.slds-scope * {
    font-family: 'Roboto', Arial, sans-serif !important;
}

/* Inputs */
.slds-checkbox .slds-checkbox_faux:after {
	border-color: #8D31F7 !important;
}

.slds-checkbox [type=checkbox][disabled] + .slds-checkbox__label .slds-checkbox_faux {
	background-color: #F5F5F5 !important;
	border-color: #DDDBDA !important;
}

.slds-checkbox [type=checkbox][disabled] + .slds-checkbox__label .slds-checkbox_faux:after {
	border-color: #9A9A9A !important;
}

.slds-select[disabled] {
	background-color: #F5F5F5 !important;
}

.slds-input[type=text][disabled], .slds-input[type=number][disabled] {
	background-color: #F5F5F5;
	border-color: #DDDBDA;
}

/* Underline HyperLinks if they are not in a table */
.slds a:not(.slds-tabs_default__link):not(.slds-button):not(.slds-tabs_scoped__link) {
	text-decoration: underline;
}

.slds .slds-table  a {
	text-decoration: none !important;
}

/* Salesforce Classic Tab Colors */
.primaryPalette {
	background-color: #228EFF !important;
}
.brdPalette, .secondaryPalette {
	border-top-color: #228EFF !important;
}

/* Alerts' Background Animation */
/*.slds-notify_alert {
	-webkit-animation: alertAnimation 1s infinite linear; /* Safari 4.0 - 8.0 *
	animation: alertAnimation 1s infinite linear;
}*/

/* Safari 4.0 - 8.0 */
@-webkit-keyframes alertAnimation {
	from {background-position-x:0}
	to {background-position-x:63px;}
}

@keyframes alertAnimation {
	from {background-position-x:0}
	to {background-position-x:63px;}
}

/* Transition for when alerts appear */
.slds-notify_alert {
	-webkit-transition: max-height 0.4s ease-out, padding 0.4s ease-out,height 0.4s ease-out;
	-moz-transition: max-height 0.4s ease-out, padding 0.4s ease-out,height 0.4s ease-out;
	-ms-transition: max-height 0.4s ease-out, padding 0.4s ease-out,height 0.4s ease-out;
	-o-transition: max-height 0.4s ease-out, padding 0.4s ease-out,height 0.4s ease-out;
	transition: max-height 0.4s ease-out, padding 0.4s ease-out,height 0.4s ease-out;
	max-height:35px;
	height: 35px;
	overflow-y: hidden;
}

/* Remove Transparency from some alert themes background colors */
.slds-notify_alert.slds-theme_error, .slds-notify_alert.slds-theme_error {
	background-color: rgba(194, 57, 52) !important;
}

.slds-notify_alert, .slds-notify_alert.slds-theme_info, .slds-notify_alert.slds-theme_info {
    background-color: rgba(84, 105, 141) !important;
}

/* White backdrop */
.slds-backdrop_white {
	background: rgba(255,255,255,.8) !important;
}

/* Remove delay from spinner */
.slds-spinner::before {
	animation-delay: -600ms !important;
	-webkit-animation-delay: -600ms !important;
	-moz-animation-delay: -600ms !important;
}

.slds-spinner::after {
	animation-delay: -183.3ms !important;
	-moz-animation-delay: -183.3ms !important;
	-webkit-animation-delay: -183.3ms !important;
	background-color: #8D31F7 !important;
}

.slds-spinner__dot-a::before {
	animation-delay: -516ms !important;
	-moz-animation-delay: -516ms !important;
	-webkit-animation-delay: -516ms !important;
	background-color: #8D31F7 !important;
}

.slds-spinner__dot-a::after {
	animation-delay:-16.6ms !important;
	-moz-animation-delay:-16.6ms !important;
	-webkit-delay:-16.6ms !important;
	background-color: #8D31F7 !important;
}

.slds-spinner__dot-b::before {
	animation-delay:-350ms !important;
	-moz-animation-delay:-350ms !important;
	-webkit-animation-delay:-350ms !important;
	background-color: #8D31F7 !important;
}

.slds-spinner__dot-b::after {
	animation-delay:150ms !important;
	-moz-animation-delay:150ms !important;
	-webkit-animation-delay:150ms !important;
	background-color: #8D31F7 !important;
}

/** Spinner Color **/
.slds-spinner::before, .slds-spinner::after, .slds-spinner__dot-a::before, .slds-spinner__dot-a::after, .slds-spinner__dot-b::before, .slds-spinner__dot-b::after{
	background-color: #8D31F7 !important;
}

/** Buttons **/
.slds-scope .slds-button:not(.slds-notify__close):not(.slds-modal__close) {
    color: #8D31F7;
}

.slds-scope .slds-button_neutral {
    color: #8D31F7 !important;
    border-color: #DDDBDA !important;
}

/* Branded Button */
.slds-scope .slds-button_brand {
	color: #fff !important;
	border: 1px solid #8D31F7 !important;
	background-color: #8D31F7 !important;
}

.slds-scope .slds-button_brand:hover, .slds-scope .slds-button_brand:active {
	color: #fff !important;
	border: 1px solid #6F1CD8 !important;
	background-color: #6F1CD8 !important;
}

.slds-button_brand[disabled], .slds-button_brand[disabled]:hover {
	background: #DDDBDA !important;
	border-color: transparent!important;
	color: #fff !important;
}

/* Section Button */
.slds .slds-section__title {
	color: white !important;
	background-color: #8D31F7 !important;
	border-top: 0 !important;
	height: 32px !important;
}

.slds-section__title-action,.slds-section__title-action:hover,.slds-section__title-action:focus{
	background-color: #8D31F7 !important;
}

/* Single Arrow Select consistent across all browsers */

/* Firefox Exclusive */
@-moz-document url-prefix() {
    .slds-select {height: calc(1.875rem + (1px * 2)) !important;}
}

.slds-select_container-inline {
	display: inline-block !important;
}

.slds-select_container::before {
    content: none !important;
}

.slds-select_container::after {
    border-top-width: 6px !important;
    border-left-width: 4px !important;
    border-right-width: 4px !important;
    bottom: 0.80rem !important;
    pointer-events:none;
}

/* Navigation Tabs */
.slds-scope .slds-tabs_default__link,
.slds-scope .slds-tabs_default__item.slds-is-active, .slds-scope .slds-tabs_default__item.slds-is-active .slds-tabs_default__link:hover, 
.slds-scope .slds-tabs_default__item .slds-tabs_default__link:hover, .slds-scope .slds-tabs_default__item.slds-is-active .slds-tabs_default__link {
	color: #000 !important;
}

.slds-tabs_default__item.slds-is-active .slds-tabs_default__link {
    text-shadow: -0.25px 0px 0px #000, 0px -0.25px 0px #000;
}

.slds-tabs_default__item.slds-is-active:after, .slds-tabs_default__item.slds-has-focus:after, .slds-tabs_default__item:hover:after {
	background-color: #6F1CD8 !important;
}

ul.slds-tabs_default__nav {
	padding: 0 2rem !important;
}

ul.slds-tabs_default__nav > li.slds-tabs_default__item {
	cursor:pointer !important;
}

.slds-scope .slds-tabs_default__item.slds-is-active .slds-tabs_default__link {
	font-weight: normal !important;
}

/** Buttons **/
.btn.slds-button.slds-button_neutral:focus {
    outline: 0;
    box-shadow: 0 0 3px #0070D2;
}

.btn.slds-button.slds-button_neutral:active {
	border:1px solid rgb(216, 221, 230) !important;
	color: #005fb2 !important;
}

/* Tooltips */
.tooltip {
    position: relative;
    display: inline-block;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 275px;
    position:absolute;
}

.slds-popover {
    text-align:left;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

.tooltip-button:focus {
    border-radius: 0.25rem;
}

.tooltip-button {
	background-position: -1px -1px !important;
	width: 14px;
    height: 14px;
    background-size: 14px 28px !important;
}

.tooltip-button:hover,:focus {
	background-position: -15px -15px !important;
}

.tooltip-button:focus + .tooltiptext {
    visibility: visible;
}

.tooltip_top {
    left:-121%;
    bottom:145%;
}

.tooltip-button_warning:focus {
	box-shadow:none !important;
}

/* Checkboxes */
.slds-checkbox_faux:after {
	border-bottom: 2px solid #8D31F7 !important;
    border-left: 2px solid #8D31F7 !important;
}

.slds-checkbox_add-button .slds-checkbox_faux:after {
	border: none !important;
}

/* Radios */
.slds-radio_faux:after {
	background: #8D31F7 !important;
}

/* Date Picker */
.slds-date-bar {
	display:flex;
	display: -ms-flexbox;
    display: -webkit-flex; /* Safari */
    -webkit-align-items: center; /* Safari 7.0+ */
    align-items: center;
}

.datePicker {
	background-color: #ffffff;
	background-image:none;
}

.dateBar select:focus {
	outline: 0 !important;
	border-color: #1589ee !important;
	background-color: #fff !important;
}

.datePicker .calDays .weekend, .datePicker .calDays .weekday {
    background: none;
    border: 0 !important;
    padding: 2px 0 !important;
    width: 2rem !important;
    height: 2rem !important;
    border-radius: 50% !important;
    margin: auto !important;
    font-weight:normal !important;
}

.datePicker .calDays .todayDate {
	background: none !important;
	color: black !important;
}

.datePicker .calDays .selectedDate {
    background-color: #005fb2 !important;    
    color: white !important;
}

.datePicker .calDays .highlight {
	background: none;
}

.calButton {
    height:16px !important;
    width:16px !important;
    margin-top:2px !important;
    margin-right:10px !important;
    margin-left:10px !important;
}

.dateBar {
	padding-top: 4px !important;
}

/** SLDSC - Salesforce Lightning Design System Custom **/

/* Border */
.sldsc-border_around {
	border: 1px solid #dddbda;
}

/* Fix for IE */
.sldsc-flex-item {
    -webkit-flex: 1; /* Safari 6.1+ */
    -ms-flex: 1; /* IE 10 */ 
    flex: 1;
}

.sldsc-alert-is-closed {
	/* Show/Hide Transition */
	max-height: 0px !important;
	padding: 0 2rem 0 .5rem !important;
	height: 0px !important;
}

/* Green for Success */
.slds-theme_alert-texture.sldsc-theme_success {
	color: #fff !important;
	background-color: #04844b !important;
}