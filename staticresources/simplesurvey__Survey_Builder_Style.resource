*:not(.fa):not(.far):not(.fas) {
    font-family: 'Roboto', Arial, sans-serif !important;
}

/* Inputs */
.slds-select[disabled] {
	background-color: #F5F5F5 !important;
}

.slds-input[type=text][disabled], .slds-input[type=number][disabled] {
	background-color: #F5F5F5;
	border-color: #DDDBDA;
}


/* Spinner */
#loading-overlay {
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 99;
    background-color: rgba(255,255,255,0.9);
}

#loading-overlay img {
    filter: hue-rotate(45deg) saturate(2.5) brightness(0.9);
}

/* Header */
.customHeaderStyling {
    background-color: #000 !important;
    color: #fff;
    margin: -1px -1px;
}

.slds-icon-standard-user,
.slds-media__figure .slds-icon {
    background-color: #0881ff !important;
}

.survey-name {
    display: inline-flex;
    justify-content: center;
    align-items: center;
}

.survey-setup {
    display: inline-flex;
    align-items: center;
    justify-content: end;
}

.slds-page-header .slds-media__figure .slds-icon_container {
    background: linear-gradient(135deg, #228eff, #8d31f7);
    background-color:#8d31f7;
}

.slds-button.slds-section__title-action {
    color: #fff !important;
    background-color: #8d31f7 !important;
    box-shadow: none !important;
}

.slds-button.slds-section__title-action:hover {
    background-color: #6F1CD8 !important;
}

/* Buttons */
.slds-button.slds-button_icon:not(.tooltip):not(.slds-modal__close),
.slds-button_neutral {
    color: #8d31f7 !important;
}

.slds-button_icon:not(.slds-modal__close):hover,
.slds-button_neutral:hover {
    color: #6F1CD8 !important;
}

.slds-button_brand, .slds-button--brand {
	border: 1px solid #8D31F7 !important;
	background-color: #8D31F7 !important;
}

.slds-button_brand[disabled], .slds-button--brand[disabled], .slds-button_brand[disabled]:hover, .slds-button--brand[disabled]:hover {
	background: #dddbda !important;
	border-color: transparent!important;
	color: #fff !important;
}

.slds-button_brand:hover, .slds-button--brand:hover {
	background-color: #6F1CD8 !important;
	border-color: #6F1CD8 !important;
}

.slds-checkbox [type=checkbox]:checked+.slds-checkbox_faux:after, .slds-checkbox [type=checkbox]:checked~.slds-checkbox_faux:after {
    border-bottom: 2px solid #8D31F7 !important;
    border-left: 2px solid #8D31F7 !important;
}

.slds-button_icon-brand svg.slds-button__icon {
    fill: #fff !important;
}

.slds-button_icon-brand {
    background-color: #8D31F7 !important;
    border-color: #8D31F7 !important;
}

.slds-button_icon-brand:focus, .slds-button_icon-brand:hover {
    background-color: #6F1CD8 !important;
    border-color: #6F1CD8 !important;
}

.slds-page-header .labelTextColor {
    color: #fff !important;
}

/* Tabs */
.slds-tabs_path__link {
    color: #fff !important;
}

.slds-tabs_path .slds-is-complete {
    background-color: #00D3B9 !important;
}
.slds-tabs_path .slds-is-complete + li.slds-tabs_path__item:before {
    background-color: #00D3B9 !important;
}
.slds-tabs_path .slds-is-complete:hover {
    background-color: #00baa3 !important;
}
.slds-tabs_path .slds-is-complete:hover + li.slds-tabs_path__item:before {
    background-color: #00baa3 !important;
}

.slds-tabs_path .slds-is-current {
    background-color: #228EFF !important;
}
.slds-tabs_path .slds-is-current + li.slds-tabs_path__item:before {
    background-color: #228EFF !important;
}
.slds-tabs_path .slds-is-current:hover {
    background-color: #0881ff !important;
}
.slds-tabs_path .slds-is-current:hover + li.slds-tabs_path__item:before {
    background-color: #0881ff !important;
}

.slds-tabs_path .slds-is-incomplete .slds-tabs_path__link {
    color: #333333 !important;
}

.slds-tabs_default__item:hover:after,
.slds-radio [type=radio]:checked+.slds-radio__label .slds-radio_faux:after {
    background: #8D31F7 !important;
}

/* Other */
.slds-docked-form-footer {
    padding-top: .75rem;
    padding-bottom: 1rem;
}


.slds .slds-tabs_path__item>a:focus {
    outline: none;
}

.tooltip {
    cursor: help;
    margin: auto 0;
    margin-top: -3px;
}

.slds-form-element__label.tooltip-label {
    padding-right: 0;
}

a.no-link {
    cursor: default !important;
    text-decoration: none !important;
}

#questions-spinner {
    margin: -200px auto 0px auto;
}

#new-question-form {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    background-color: rgba(255,255,255,0.8);
}

.italic {
    font-style: italic;
}


dt {
    font-weight: bold;
}

dd {
    margin-left: 12px !important;
}

.slds-popover__body {
    font-size: 13px !important;
}

.lightbox {
    width: 100% !important;
    max-width: 800px !important;
}

.lightbox>div {
    position: relative;
    background-color: #fff;
    border-radius: 4px;
    padding: 8px;
}

#ownerAssignment input[type="text"] {
    min-height: 34px;
    max-height: 34px;
}

svg.svg-fill-success {
    fill: #04844b !important;
}

/* color picker directive */
color-picker input{
    /* extend the slds-input class */
    background-color: white;
    color: #16325c;
    border: 1px solid #d8dde6;
    border-radius: 4px;
    width: 100%;
    transition: border 0.1s linear,background-color 0.1s linear;
    -webkit-transition: border 0.1s linear,background-color 0.1s linear;
    display: inline-block;
    padding: 0 16px 0 12px;
    line-height: 34px;
    min-height: calc(34px + 2px);
}
color-picker div.color-picker-input-wrapper{
    width: 100%;
}
color-picker span{
    width: 35px;
    display: block !important;
    left: calc(100% - 36px);
    top: 1px;
    position: relative;
    height: 32px;
    border-radius: 0px 3px 3px 0px;
    border: 0px !important;
}
color-picker input{
    height: 34px;
    min-height: 34px;
}

.checkBoxStyle{
    width: 0;
    transform: translate(4px, -8px);
    margin-left: 5px;
    visibility: visible;
    fill: green;
    position: absolute;
}

.checkBoxStyle::before {
    position: absolute;
    right: -48px;
    content: '';
    display: block;
    background-color: #fff;
    height: 48px;
    width: 0px;
    animation: 0.5s ease animate-check-mark;
}

@keyframes animate-check-mark {
    from { width: 48px; }
    to { width: 0px; }
}

.floatButton{
    float: left;
}

.bold {
     font-weight: bold;
}

.no-user-select {
    user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
}

.no-pointer-events {
    pointer-events: none;
}
        
.labelTextColor{
    color: 54698D !important; 
}
        
.labelTextColorError{
    color: red;
}
        
.labelTextSize{
    font-size: 1.1em !important;
}
        
/* Firefox Exclusive */
@-moz-document url-prefix() {
	.slds-select {height: calc(1.875rem + (1px * 2)) !important;}
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

.slds-button__icon.slds-button__icon_left {
    pointer-events: unset !important;
}
		
.customHeaderStyling{
	border-radius: 0 !important;
    box-shadow: none;
}

.bold-700 {
    font-weight: 700 !important;
}