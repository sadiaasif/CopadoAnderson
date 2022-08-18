/*
    03/25/16 BS Unescape XML character entities in all metadata operations,
                allow mapping a text field from the survey object to a Text Area or Long Text Area on Survey,
                prevent clicking on an uncompleted step from redirecting to the Choose Survey step in some cases,
                attempting to add a question that already exists will no longer display the error alert underneath the new question dialog (128683)
    03/28/16 BS Added check for existing field set,
                do not attempt to add questions to the Custom Links section when that section is first on the layout,
                perform initial survey metadata creation in parallel,
                improve reliability of adding questions to page layouts (128683)
    04/14/16 BS Pick list values with special characters will no longer cause save error (128683)
    04/20/16 BS Send email for external marketing tool (130080)
    05/19/16 BS Standard Survey fields and related lists will be added to new Survey layouts,
                configure Survey Object step will now add mapped fields to the layout (131507)
    05/24/16 MD Add custom subject field (131504)
    05/27/16 BS Survey Record Ownership (131508)
    06/01/16 MD Add support for custom background colors/images on landing page & email template (131505)
    06/07/16 BS Fix for Summer 16 tooling API chenge (132338)
    07/26/16 BS Remove hard coded package namespace references (133595)
    08/01/16 BS Pre-merge survey site URL when creating templates for external systems (133619)
    08/08/16 BS Reference SITE_GUEST_PROFILE_NAME global instead of hard coded value (134900)
    08/24/16 BS New landing page background style options (135342)
    09/01/16 BS Fix for horizontalRadios and horizontalCheckboxes parameters not being added to email templates (136418)
    10/31/16 MD Added branding section (138276)
    11/17/16 MD Add support for global picklist fields (00139498)
    04/04/17 BS Fix help text escaping issue and pick-list value update issue with special characters and single value (00146232)
    06/12/17 MD Add Receiving User to user fields on field mapping when selecting User as the surveyed object (00148344)
    07/25/17 BS Display spinner as soon as Save and Continue is clicked on the Configure Survey Object step (00146874)
    09/08/17 BS Update addPicklistValuesToRecordType to avoid error with Latin1 characters due to incorrect URL encoding (00150585)
    10/12/17 BE All do navigate functions check if caller was "Return to Simple Survey Setup" link in Survey Builder. Special operation performed if it is the caller and the salesforce console is in use. Fixed a small spelling error 'showAllFialds -> showAllFields' (00148549)
    10/18/17 BE Add Thumbs Up/Down and 1-5 Star image selection to Survey Builder (00148826)
    01/10/18 BE Added fields for clear responses button configuration setting. (00153585)
                Variable for showing and hiding skip button on step 4 added.
    01/15/18 BE Added error logging for metadata API calls (00156107)
    01/16/18 BE Fixed issue where GlobalValueSets were not loading by perpending package prefix to front of full names (00156201)
    01/18/18 BE Added fields for displaying radio buttons above their corresponding labels (00146285)
    04/24/18 BE When survey configurations are retrieved, add a LastReceivedString field which is either the date the last survey of that record type was created or "Unused" (00159075)
    07/09/18 BS Apply gray border fix for thumbs up / down email template (159961)
    12/04/18 BS Remove unexpected trailing forward slash in opening survey score anchor tags for 5 star and thumbs rating types (00166724)
    03/08/19 BE Added "Survey Complete Redirect Url" to saveConfig and getConfiguration for the Branding Section (00169321)
    04/22/19 BE On creation of a new survey record type, if the user has the "Diagnostic Tracking" setting enabled, the 3 fields associated with that setting are added to the 
                System Information section of that page layout (00167213)
    04/22/19 BE Prepend http:// to any redirect url that does not start with http:// or https:// (00171355)
    08/08/19 BE Update for new landing pages.
                    - New header service that handles alerts, the spinner, and all logic.
                    - Logic for live previews for the email template and branding sections
    10/04/19 BS Updated util addPicklistValuesToRecordType() to no longer incorrectly URL encode picklist value spaces which caused a premature max length error (00177807)
    10/22/19 BE (00178202)
    10/23/19 BL Added typeahead functionality for step 2 of the survey builder process (00176622)
    11/26/19 BS Consolidate JSForce connections to use same updated API version and related updates (00179574)
    12/03/19 BE Updated "Util.formIsDirty" to check for "data-dirty-ignore" attribute instead of the "ng-dirty-ignore" class. Updated the "ssLookup" directive to include the new attribute (00179946)
    01/15/20 BL Added Human Confidence Score to the Survey Question blacklist  (00180424)
    01/30/20 BE Fix issue where Classic Surveys could not get passed step 1 of the builder (00181309)
    03/04/20 BE (00182263)
                - ":type" routing parameter in URL is no longer used. 
                - All controllers determine whether to show the Classic or Eclipse variant by using only the Type__c field on the Survey Configuration.
                - Any controllers that only used "$scope.isClassic" for the routing parameter no longer have any references to "$scope.isClassic"
    03/05/20 BE Updates to allow for custom star and thumb images for Eclipse surveys & allow users to use any folder when selecting a document. (00177282 & 00180886)
                    - Added thumbs and stars options to the live preview configuration.
                        - Allows for ability to select a document, use an image url, or upload a new document.
                    - The default rating for stars is now 3. This will allow users to view the selected and unselected rating stars at the same time whenever the Branding component loads.
                    - Several watchGroups updated from if-else to switch-case.
                    - Added new configuration variables for unselected and selected stars.
                    - For Branding and Email Template, utilize the new controller "initBrandingStep" &  "initEmailStep" methods.
                        - When creating the configs during initialization, only the values we absolutely need are populated. This means that the value of "Thumbs_Up_Document__c" is ignore if the survey is NPS.
                            - The conditions for populating a field are based on survey configuration Theme (Light/Dark), Type (Classic/Eclipse), Rating Scale, and Last Step.
                    - New Util functionality to:
                        - Handle folder changes across the Branding end Email Template components.
                        - Account for folderId when uploading a file.
                        - Resize images.
                        - Upload file pairs (the original + a resized variant)
                    - Updated Email Template generation code to account for custom stars and thumbs images.
                    - Fixed an inconsistency where uploading a file and attempting to leave to a different component without saving would allow the user to immediately switch components instead of
                        displaying an alert that there were unsaved changes.
                    - Create helper functions to determine the "for" attribute of a label based on the "image customization" value and a list of html ids.
                    - Add Questions now has lastStepCompleted variable and doesn't always overwrite last step completed
                    - For Classic surveys, fixed the alt text for the 5 star images in their email templates.
                    - Add Height and Width to Classic Thumbs Email Template links
                    - Remove Background and Border from Eclipse Thumbs Email Templates
                    - Refactored & Reorganized Branding Component
                    - Logos are resized for the email template.
    03/17/20 BE Added dropdown options for duplicate prevention + logic to handle it. Removed unneeded getConfiguration call from init of "ConfigureSurveyObjectController" (00182626)
    03/26/20 BE Updated AddQuestions controller to allow for Skip Logic (00182091)
                    - Drag and Drop now shows where the item your dragging will drop in the question dropzones.
                    - You can no longer Drag and Drop if filtering questions.
                    - Modal for updating questions now includes logic to modify skip logic for individual questions.
                    - Various updates, fixes, and optimizations for the controller.
                * See Items marked with "BE (00182091)" for more specifics.
    04/06/20 BE When creating email templates, the [[PREHEADER]] portion of the email template outlines is filled in with the greeting, or "Please take our survey." if no greeting is given (00181459)
    04/20/20 BE The privacy disclaimer will appear in the live preview of the landing page independent of whether or not clear responses/auto-save is enabled (00182892)
    04/27/20 BE Updates to control header via angular instead of APEX (00183450)
    05/29/20 BE Fixed issue where a greeting longer than 750 characters would break the pre-header generation and prevent the template from being created. (00184182)
                    - Updated the error modal to display error messages instead of error codes (which aren't always there) for JavaScript based errors.
    06/15/20 BE Questions can be moved from Available to Selected and vice-versa while the Available list is being filtered. (00184438)
                    - Updated logic that reorders questions when they are moved to respect the original question list rather than the filtered one.
    07/20/20 BE Picklists now have Contain and Does Not Contain operators, values for Picklists and Multipicklists now use arrays instead of strings (00185272)
    07/22/20 BE Removed Related Lists from generated survey layouts. See util.createSurveyLayout (00185510)
    12/29/20 BE Updated "setLastStep" to skip over setting logic if "this.$scope" is not defined (00189336)
    03/26/21 BE Fixed issue where dropdown values would not automatically load into skip logic dropdowns. The question label for the Survey_Comments__c question packaged with Simple Survey is no longer editable. (00191395)
    03/30/21 BE Privacy Disclaimer only appears in Preview if Privacy Disclaimer URL is not blank. (00190614)
    10/28/21 BE Background image folder defaults to Simple Survey if no image is selected. (00196697)
*/

"use strict";

// --( Survey Builder Application )--
var SurveyBuilder = angular.module('SurveyBuilder', ['ngRoute','color.picker']);

// --( Route Configuration )--
SurveyBuilder.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
        when('/ChooseSurvey', {
            templateUrl: SURVEY_BUILDER + '?step=choose_survey',
            controller: 'ChooseSurveyController'
        }).
        when('/ChooseSurvey/:id', {
            templateUrl: function(params) { return SURVEY_BUILDER + '?id=' + params.id + '&step=choose_survey' },
            controller: 'ChooseSurveyController'
        }).
        when('/ConfigureSurveyObject/:id', {
            templateUrl:  function(params) { return SURVEY_BUILDER + '?id=' + params.id + '&step=configure_survey_object'},
            controller: 'ConfigureSurveyObjectController'
        }).
        when('/AddQuestions/:id', {
            templateUrl:  function(params) { return SURVEY_BUILDER + '?id=' + params.id + '&step=add_questions'},
            controller: 'AddQuestionsController'
        }).
        when('/Branding/:id', {
            templateUrl:  function(params) { return SURVEY_BUILDER + '?id=' + params.id + '&step=branding'},
            controller: 'BrandingController'
        }).
        when('/CreateEmailTemplate/:id', {
            templateUrl:  function(params) { return SURVEY_BUILDER + '?id=' + params.id + '&step=create_email_template'},
            controller: 'CreateEmailTemplateController'
        }).
        otherwise({
            redirectTo: '/ChooseSurvey'
        });
}]);

// --( Controller for Choose Survey Step )--
SurveyBuilder.controller('ChooseSurveyController', ['$scope', '$routeParams', '$q', 'ctrl', 'util', 'header', function($scope, $routeParams, $q, ctrl, util, header) {
    function init() {
        $scope.step = 1;

        $scope.lastStep = 1;
        
        header.setScope($scope);
        header.showSpinner(true, LABELS.loading);
        $scope.siteConfigured = SITE_CONFIGURED;
        $scope.cantEditConfigurations = !PERMISSIONS.UpsertSurveyConfiguration;
        $scope.cantUseSurveyBuilder = !getCanModifySurveyConfiguration() && !PERMISSIONS.CreateEmailTemplate;

        if(!$scope.siteConfigured) {
            header.showAlert(true, LABELS.siteConfigurationRequired, LABELS.siteConfigurationError.format(SETUP_PAGE_URL + '#SetupYourForce.comSite'), "error");
            header.showSpinner(false);
        }
        else {
            $scope.option = getCanModifySurveyConfiguration() ? 'create_new' : 'edit_existing';
            $scope.display = 'active';
    
            $scope.surveyName = '';
            $scope.ratingScale = '0-10';
            
            $scope.existingSurveys = [];
            $scope.selectedSurvey = null;
            
            $scope.showNewSurveyModal = false;
            $scope.surveyNameErrorMessage = '';
            $scope.convertedSurvey = false;

            header.showMissingPermissionsAlert();

            ctrl.getSurveyConfigurations().then(function(results) {
                ctrl.getRecordTypeToLastCreatedMap().then(function(recordMap) {
                    for(var i = 0; i < results.length; i++) {   // [BE] - Add the last created field here
                        var r = results[i];
                        r.LastReceivedString = (recordMap.hasOwnProperty(r[PKG_NS_PREFIX + 'Record_Type__c'])) ? 'Last Survey Received ' + recordMap[r[PKG_NS_PREFIX + 'Record_Type__c']] : 'No Surveys Received';
                        if(r.Id === $routeParams.id) {
                            header.setLastStep(r[PKG_NS_PREFIX + 'Last_Step_Completed__c']);
                        }
                    }
                    $scope.existingSurveys = results;
                    header.showSpinner(false);
                }).catch(showErrorAlert);
            }).catch(showErrorAlert);
        }
    }

    $scope.$on("$viewContentLoaded", function() {
        getHeaderOffsetTop();
    });

    // Event Handlers
    $scope.handleCreateSurveyButtonOnClick = function() {
        createSurvey();
    }

    $scope.handleUpdateAvailableLinkOnClick = function(survey) {
        $scope.selectedSurvey = survey; 
        displayNewSurveyModal(true);
    }

    $scope.handleMarkActiveStatusButtonOnClick = function() {
        markActive($scope.display !== "active");
    }

    $scope.handleProceedButtonOnClick = function() {
        if($scope.selectedSurvey[PKG_NS_PREFIX + 'Last_Step_Completed__c'] === 'Choose Survey') {   // If the object wasn't configured, force it into being an Eclipse survey
            $scope.selectedSurvey[PKG_NS_PREFIX + 'Type__c'] = 'Eclipse';
        }
        proceed($scope.selectedSurvey.Id);
        header.setLastStep($scope.selectedSurvey[PKG_NS_PREFIX + 'Last_Step_Completed__c']);
    }

    $scope.handleModalCancelButtonOnClick = function() {
        displayNewSurveyModal(false);
    }

    $scope.handleModalProceedButtonOnClick = function() {
        displayNewSurveyModal(false);
        proceed($scope.selectedSurvey.Id);
    }

    $scope.handleModalUpgradeAndProceedButtonOnClick = function() {
        displayNewSurveyModal(false);
        header.showSpinner(true, LABELS.updatingSurvey);
        $scope.convertedSurvey = true;
        var surveyConfig = {
            Id : $scope.selectedSurvey.Id
        };
        surveyConfig[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Add Questions';
        surveyConfig[PKG_NS_PREFIX + 'Type__c'] = 'Eclipse';
        ctrl.saveConfiguration(surveyConfig).then(function(result) {
            header.setLastStep('Add Questions');
            proceed($scope.selectedSurvey.Id);
        }).catch(showErrorAlert);
    }

    $scope.showSurveyByActiveStatus = function(config) {
        return config[PKG_NS_PREFIX + 'Inactive__c'] != ($scope.display == 'active');
    }

    // Header Functionality
    $scope.handleSimpleSurveySetupButtonOnClick = function() {
        header.goToSimpleSurveySetup();
    }

    $scope.handleHeaderLinkOnClick = function(stepInfo) {
        if(header.canNavigate(stepInfo, $routeParams.id)) {
            var path = header.generateStepPath(stepInfo, $routeParams.id);
            header.navigate(path, 'ChooseSurvey');
        }
    }

    $scope.handleAlertOkayButtonOnClick = function() {
        header.alertOkayClicked();
    }

    // Helpers
    function displayNewSurveyModal(doShow) {
        $scope.showNewSurveyModal = doShow;
    }

    function markActive(active) {
        header.showSpinner(true, (active) ? LABELS.activating : LABELS.deactivating);
        var config = {Id: $scope.selectedSurvey.Id};
        config[PKG_NS_PREFIX + 'Inactive__c'] = !active;
        ctrl.saveConfiguration(config).then(function(result) {
            $scope.selectedSurvey[PKG_NS_PREFIX + 'Inactive__c'] = !active;
            $scope.selectedSurvey = null;
            header.showSpinner(false);
        }).catch(showErrorAlert);
    }

    function createSurvey() {
        if(util.isBlank($scope.surveyName)) {
            $scope.surveyNameErrorMessage = LABELS.surveyNameRequired;
            return;
        }

        $scope.surveyName = $scope.surveyName.trim();

        if(!surveyNameIsUniqueName()) {
            $scope.surveyNameErrorMessage = LABELS.surveyNameExistsError.format($scope.surveyName);
            return;
        }

        var apiName = util.generateName($scope.surveyName);
        header.showSpinner(true, LABELS.creatingRecordType);

        //Create metadata then insert setting and redirect
        ctrl.checkFieldsetExists(apiName).then(function(fieldsetExists) {
            if(!fieldsetExists) {
                util.createSurveyRecordType(apiName, $scope.surveyName).then(function() {
                    header.showSpinner(true, LABELS.creatingPageLayoutAndFieldSet);
                    $q.all({
                        layout: util.createSurveyLayout($scope.surveyName, $scope.ratingScale != 'None'),
                        fieldSet: util.createSurveyFieldSet(apiName, $scope.surveyName)
                    }).then(function(asyncResults) {
                        ctrl.getSurveyRecordTypeIdByDeveloperName(apiName).then(function(recordTypeId) {
                            header.showSpinner(true, LABELS.updatingLayoutAssignment);
                            util.assignLayout($scope.surveyName, apiName).then(function(result) {
                                header.showSpinner(true, LABELS.savingConfiguration);
                                var config = {Name: $scope.surveyName};
                                config[PKG_NS_PREFIX + 'Rating_Scale__c'] = $scope.ratingScale;
                                config[PKG_NS_PREFIX + 'Layout__c'] = asyncResults.layout.fullName;
                                config[PKG_NS_PREFIX + 'Record_Type__c'] = recordTypeId;
                                config[PKG_NS_PREFIX + 'Field_Set__c'] = asyncResults.fieldSet.fullName;
                                config[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Choose Survey';
                                config[PKG_NS_PREFIX + 'New_Template_Needed__c'] = true;
                                config[PKG_NS_PREFIX + 'Type__c'] = 'Eclipse';

                                ctrl.saveConfiguration(config).then(function(recordId) {
                                    if($scope.$root.lastStep < 1) {
                                        $scope.$root.lastStep = 1;
                                    }
                                    proceed(recordId);
                                }).catch(showErrorAlert);
                            }).catch(showErrorAlert);
                        }).catch(showErrorAlert);
                    }).catch(showErrorAlert);
                }).catch(showErrorAlert);
            }
            else {
                $scope.surveyNameErrorMessage = LABELS.dupeFieldSetNameError.format($scope.surveyName);
            }
        }).catch(showErrorAlert);
    }

    function proceed(surveyConfigId) {
        if($scope.canModifySurveyConfiguration) {
            if($scope.convertedSurvey) {
                header.goToStep("Branding", "ChooseSurvey", surveyConfigId);
            }
            else {
                header.goToStep("ConfigureSurveyObject", "ChooseSurvey", surveyConfigId);
            }            
        }
        else {
            header.goToStep("CreateEmailTemplate", "ChooseSurvey", surveyConfigId);
        }
    }

    function surveyNameIsUniqueName() {
        for(var i = 0; i < $scope.existingSurveys.length; i++) {
            if($scope.surveyName.toLowerCase() == $scope.existingSurveys[i].Name.toLowerCase()) {
                return false;
            }
        }
        return true;
    }

    function showErrorAlert(reason) {
        header.handleError({
            HTMLMessage : util.formatErrorMessages(reason),
            popup : true
        });
    }

    init();
}]);

// --( Controller for Configure Survey Object Step )--
SurveyBuilder.controller('ConfigureSurveyObjectController', ['$scope', '$routeParams', '$q', 'ctrl', 'util', 'header', function($scope, $routeParams, $q, ctrl, util, header) {

    var oldSurveyObject = null;
    var oldFieldMapping = null;

    function init() {
        $scope.step = 2;
        header.setScope($scope);
        $scope.showAllFields = false;
        $scope.surveyObjectFields = [];
        $scope.filtered = [];
        $scope.surveyFromObjectOptions = [{value: 'Case', label: 'Case (Case)'}];
        $scope.surveyFromObjectSearchField = 'Case (Case)';
        $scope.surveyFromObject = $scope.surveyFromObjectOptions[0];
        $scope.surveyFromObjectFields = [];
        $scope.lastStepCompleted = 'Choose Survey';
        $scope.ownerAssignmentId = '';
        $scope.ownerAssignmentName = '';
        $scope.ownerAssignmentOptions = [];
        $scope.surveyRecordOwnershipError = '';
        $scope.showExample = false;
        $scope.dropdownHovered = false;
        $scope.searchFocused = false;
        $scope.duplicateCheckTime = '-1';
        header.showMissingPermissionsAlert();

        $scope.preventDuplicatesOptions = [
            {value : '-1', label : 'Never'},
            {value : '1', label : '1 Minute'},
            {value : '15', label : '15 Minutes'},
            {value : '30', label : '30 Minutes'},
            {value : '60', label : '1 Hour'},
            {value : '1440', label : '1 Day'},
            {value : '10080', label : '1 Week'},
            {value : '0', label : 'Always'}
        ]

        $scope.showTooltips = {
            surveyRecordOwnership : false,
            recordOwner : false,
            fixedValue : false
        };

        $scope.$watch('ownerAssignmentName', function() {
            if($scope.ownerAssignmentName !== undefined) {
                ctrl.lookupUsers($scope.ownerAssignmentName).then(function(userOptions) {
                    $scope.ownerAssignmentOptions = [];

                    if(userOptions != null){
                        $scope.ownerAssignmentOptions = userOptions;
                    }
                }).catch(showErrorAlert);
            }
        });

        header.showSpinner(true, LABELS.loadingFields);
        ctrl.getSurveyObjectConfiguration($routeParams.id).then(handleSurveyObjectConfiguration).catch(showErrorAlert);
    }

    function handleSurveyObjectConfiguration(result) {
        ['surveyObjectFields', 'surveyFromObjectFields', 'lastStepCompleted', 'layoutName', 'ownerAssignment', 'ownerAssignmentId', 'ownerAssignmentName'].forEach(function(property) {
            $scope[property] = result[property];
        });

        header.setLastStep($scope.lastStepCompleted);

        if(!($scope.ownerAssignment)){
            $scope.ownerAssignment = 'manager';
        }

        if('surveyFromObject' in result){
            oldSurveyObject = result.surveyFromObject;
            $scope.surveyFromObject = {value: result.surveyFromObject, label: result.surveyFromObject+' ('+result.surveyFromObject+')'};
        }

        var assignment = null;
        if('fieldAssignment' in result) {
            assignment = JSON.parse(result.fieldAssignment);
            oldFieldMapping = result.fieldAssignment.replace(/\r/g, '');
        }

        updateFieldMapping(assignment);

        $scope.duplicateCheckTime = result.duplicateCheckTime;
        if(getPreventDuplicateOptionsValues().indexOf($scope.duplicateCheckTime) < 0) {
            $scope.preventDuplicatesOptions.splice($scope.preventDuplicatesOptions.length - 1, 0, {value : $scope.duplicateCheckTime, label : $scope.duplicateCheckTime + ' Minutes'})
        }

        ctrl.getSurveyFromObject($routeParams.id).then(handleGetSurveyFromObject).catch(function(error) {
            ctrl.getSurveyFromObjectAlternative($routeParams.id).then(handleGetSurveyFromObject).catch(showErrorAlert);
        });
    }

    function getPreventDuplicateOptionsValues() {
        var values = [];
        for(var i = 0; i < $scope.preventDuplicatesOptions.length; i++) {
            values.push($scope.preventDuplicatesOptions[i].value);
        }
        return values;
    }

    function handleGetSurveyFromObject(response) {
        $scope.surveyFromObjectOptions = response;
        header.showSpinner(false);
    }

    $scope.handleShowExampleButtonOnClick = function() {
        $scope.showExample = true;
    }

    $scope.handleExampleModalCloseButtonOnClick = function() {
        $scope.showExample = false;
    }

    $scope.handleCreateRelationshipButtonOnClick = function() {
        createSurveyObjectLookup();
    }

    $scope.handleSaveButtonOnClick = function() {
        save().then(function(result) {
            if(result.success) {
                showSaveSuccessfulPrompt();
            }
        }).catch(showErrorAlert);
    }

    $scope.handleSaveAndContinueButtonOnClick = function() {
        save().then(function(result) {
            if(result.success) {
                proceed();
            }
        }).catch(showErrorAlert);
    }

    $scope.handleSurveyFromObjectOnChange = function() {
        ctrl.getSurveyFromObjectFields($scope.surveyFromObject.value).then(function(result) {
            $scope.surveyFromObjectFields = result;
            updateFieldMapping(null);
        }).catch(showErrorAlert);
    }

    // Header Functionality
    $scope.handleSimpleSurveySetupButtonOnClick = function() {
        header.goToSimpleSurveySetup();
    }

    $scope.handleHeaderLinkOnClick = function(stepInfo) {
        if(header.canNavigate(stepInfo, $routeParams.id)) {
            var path = header.generateStepPath(stepInfo, $routeParams.id);
            header.navigate(path, 'ConfigureSurveyObject', util.formIsDirty());
        }
    }

    $scope.handleAlertOkayButtonOnClick = function() {
        header.alertOkayClicked();
    }

    $scope.handleNavConfirmCancelButtonOnClick = function() {
        header.navConfirmCancel();
    }

    $scope.handleNavConfirmSaveAndProceedButtonOnClick = function() {
        header.showAlert(false);
        save().then(function(result) {
            if(result.success) {
                header.navigate($scope.proceedTo, 'ConfigureSurveyObject');
            }
        }).catch(showErrorAlert);
    }

    $scope.handleNavConfirmProceedButtonOnClick = function() {
        header.showAlert(false);
        header.navigate($scope.proceedTo, 'ConfigureSurveyObject');
    }

    $scope.displayDropdown = function() {
        var display = $scope.dropdownHovered || $scope.searchFocused;
        if(display && $scope.filtered.length !== 0){  //NOPMD
            return '';
        }
        else if(!display && ($scope.filtered.length === 0 || $scope.surveyFromObjectSearchField != $scope.surveyFromObject.label)){
            $scope.surveyFromObjectSearchField = $scope.surveyFromObject.label;
        }

        return 'none';
    }

    $scope.onElementSelected = function(event) {
        if(event.target.dataset.label.includes(' (')){
            $scope.surveyFromObject = {value:  event.target.dataset.value, label: event.target.dataset.label};
            $scope.surveyFromObjectSearchField = $scope.surveyFromObject.label;
            $scope.handleSurveyFromObjectOnChange();
        }
        else{
            header.showSpinner(true);
            ctrl.getSingleObjectDescribe(event.target.dataset.label).then(function(result) {
                $scope.surveyFromObject = result;
                $scope.surveyFromObjectSearchField = result.label;
                $scope.handleSurveyFromObjectOnChange();
                header.showSpinner(false);
            });
        }
        $scope.dropdownHovered = false;
        $scope.searchFocused = false;
    }

    $scope.getFromObjectName = function() {
        var label = $scope.surveyFromObject.label;
        if(label.includes(' (')){
            return label.substring(0, label.indexOf(' ('));
        }

        return label;
    }

    $scope.getFilterReferenceFields = function() {
        return $scope.showAllFields ? '' : 'REFERENCE';
    }

    $scope.haveSurveyObjectLookup = function() {
        if($scope.processing){
            return true;
        }

        var haveReference = false;
        $scope.surveyObjectFields.forEach(function(field) {
            if(field.type == 'REFERENCE' && field.referenceTo[0] == $scope.surveyFromObject.value){
                haveReference = true;
            }
        });
        return haveReference;
    }

    // Helpers
    // Populate fieldOptions on surveyObjectFields with surveyFromObjectFields that can be selected and set fieldSelected to defaults
    function updateFieldMapping(assignment) {
        $scope.surveyObjectFields.forEach(function(surveyField) {
            updateFieldMappingForField(surveyField, assignment);
        });
    }

    function updateFieldMappingForField(dest, assignment) {
        dest.fieldOptions = [{value: '__NONE__', label: '--None--'}];
        dest.fieldSelected = dest.fieldOptions[0];

        $scope.surveyFromObjectFields.forEach(function(src) {
            /*
            This is a little complex, okay here we go...
            If types match and are not reference fields
            Or types match and reference fields are of same type
            Or types match and destination field is Record Owner (User Id) and source field is Owner Id (Polymorphic Id)
            Or types do not match and destination is of type REFERENCE and source is of type ID and destination referenceTo is the source object
            Or types do not match and destination is of type TEXTAREA and source is of type STRING
            */
            if((dest.type == src.type && (src.type != 'REFERENCE' || dest.referenceTo[0] == src.referenceTo[0] || (dest.value == (PKG_NS_PREFIX + 'Record_Owner__c') && src.value == 'OwnerId'))) || (dest.type == 'REFERENCE' && src.type == 'ID' && dest.referenceTo[0] == $scope.surveyFromObject.value) || (dest.type == 'TEXTAREA' && src.type == 'STRING')) {
                dest.fieldOptions.push(src);

                //Use saved assignment
                if(assignment != null && dest.value in assignment && assignment[dest.value].type == 'field' && src.value == assignment[dest.value].value){
                    dest.fieldSelected = src;
                }
                //Auto assign if no saved assignment and labels match
                else if(assignment == null && (dest.label == src.label.replace(/ ID$/, '') || (dest.value == (PKG_NS_PREFIX + 'Record_Owner__c') && src.value == 'OwnerId') || (dest.type == 'REFERENCE' && src.type == 'ID' && dest.referenceTo[0] == $scope.surveyFromObject.value))){
                    dest.fieldSelected = src;
                }
            }
        });

        if($scope.surveyFromObject.value == 'User' && dest.type == 'REFERENCE' && dest.referenceTo[0] == 'User'){
            dest.fieldOptions.push({value: '__RECEIVING_USER__', label: 'Receiving User ID'});
        }

        dest.fieldOptions.push({value: '__VALUE__', label: '(Fixed Value)'});

        //Default to first option if exists
        if(dest.fieldSelected == null && dest.fieldOptions.length > 2){
            dest.fieldSelected = dest.fieldOptions[1];
        }

        //Use saved static value
        if(assignment != null && dest.value in assignment && assignment[dest.value].type == 'value') {
            dest.fieldSelected = dest.fieldOptions[dest.fieldOptions.length - 1]; //Fixed Value
            dest.staticValue = assignment[dest.value].value;
        }
        else if(assignment != null && dest.value in assignment && assignment[dest.value].type == 'field' && assignment[dest.value].value == '__RECEIVING_USER__') {
            // dest.fieldSelected = {value: '__RECEIVING_USER__', label: 'Receiving User ID'};
            for(var i = 0; i < dest.fieldOptions.length; i++){
                if(dest.fieldOptions[i].value == '__RECEIVING_USER__'){
                    dest.fieldSelected = dest.fieldOptions[i];
                    break;
                }
            }
        }
    }

    function createSurveyObjectLookup() {
        var label = $scope.getFromObjectName();
        var name = util.generateName(label) + '__c';
        var referenceTo = $scope.surveyFromObject.value;

        header.showSpinner(true, LABELS.creatingSurveyLookup.format(label));
        util.createField(name, label, 'Lookup', label + ' associated with the Survey', '', null, null, null, null, referenceTo, true).then(function(metadata) {
            //New field to add to the field assignment editor
            var field = {
                value: util.nsPrefix + name,
                label: label,
                type: 'REFERENCE',
                referenceTo: [referenceTo]
            }

            //Find where to insert the new lookup field (lexicographic ordering on field label)
            var l = 0;
            var r = $scope.surveyObjectFields.length - 1;
            var m;
            while(l <= r) {
                m = (l + r) >> 1;
                if(label < $scope.surveyObjectFields[m].label){
                    r = m - 1;
                }   
                else{
                    l = m + 1;
                }
            }
            $scope.surveyObjectFields.splice(l, 0, field); //Insert new lookup field at 'l'

            //Populate possible field mapping options and default to the Record Id
            updateFieldMappingForField(field, null);

            header.showSpinner(true, LABELS.updatingFLS);
            util.updateFieldSecurity([field.value]).then(function() {
                header.showSpinner(false);
            }).catch(showErrorAlert);
        }).catch(showErrorAlert);
    }

    function save() {
        $scope.surveyRecordOwnershipError = '';
        header.showSpinner(true, LABELS.savingConfiguration);

        var fieldMapping = {};
        $scope.surveyObjectFields.forEach(function(dest) {
            if(dest.fieldSelected.value == '__VALUE__') {
                fieldMapping[dest.value] = {
                    type: 'value',
                    value: dest.staticValue
                }
            }
            else if(dest.fieldSelected.value == '__RECEIVING_USER__') {
                fieldMapping[dest.value] = {
                    type: 'field',
                    value: '__RECEIVING_USER__'
                }
            }
            else if(dest.fieldSelected.value != '__NONE__') {
                fieldMapping[dest.value] = {
                    type: 'field',
                    value: dest.fieldSelected.value
                }
            }
        });

        var config = {Id: $routeParams.id};
        config[PKG_NS_PREFIX + 'Survey_Object__c'] = $scope.surveyFromObject.value;

        var ownerAssigned = $scope.ownerAssignment !== 'none' && util.isNotBlank($scope.ownerAssignment);
        if(ownerAssigned) {
            if($scope.ownerAssignment === 'id' && util.isBlank($scope.ownerAssignmentId)) {
                $scope.surveyRecordOwnershipError = LABELS.surveyRecordOwnershipUserRequired;
                header.showSpinner(false);
                return $q.resolve({success : false});
            }
            config[PKG_NS_PREFIX + 'Survey_Object_Field_Assignment__c'] = JSON.stringify(fieldMapping, null, '  ');
        }
        else {
            $scope.surveyRecordOwnershipError = LABELS.required;
            header.showSpinner(false);
            return $q.resolve({success : false});
        }

        if(config[PKG_NS_PREFIX + 'Survey_Object__c'] != oldSurveyObject || config[PKG_NS_PREFIX + 'Survey_Object_Field_Assignment__c'] != oldFieldMapping){
            config[PKG_NS_PREFIX + 'New_Template_Needed__c'] = true;
        }

        if($scope.lastStepCompleted == 'Choose Survey'){
            config[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Configure Survey Object';
        }

        config[PKG_NS_PREFIX + 'Owner_Assignment__c'] = $scope.ownerAssignment != 'none' ? $scope.ownerAssignment : '';
        config[PKG_NS_PREFIX + 'Owner_Assignment_Id__c'] = $scope.ownerAssignmentId != null ? $scope.ownerAssignmentId : '';

        config[PKG_NS_PREFIX + 'Duplicate_Check__c'] = $scope.duplicateCheckTime;

        return $q(function(resolve, reject) {
            var fields = Object.keys(fieldMapping);
            util.addFieldsToLayout($scope.layoutName, fields, true, 'Survey Information').then(function() {
                ctrl.saveConfiguration(config).then(function(result) {
                    if($scope.lastStepCompleted == 'Choose Survey'){
                        $scope.lastStepCompleted = 'Configure Survey Object';
                    }
                    util.removeDirtyFlag();
                    header.showSpinner(false);
                    if($scope.$root.lastStep < 2) {
                        $scope.$root.lastStep = 2;
                    }
                    resolve({success: true});
                }).catch(showErrorAlert);
            }).catch(showErrorAlert);
        });
    }

    function showSaveSuccessfulPrompt() {
        header.showAlert(true, LABELS.configurationSaved, LABELS.configurationSavedMessage, 'success');
    }

    function proceed() {
        header.goToStep("AddQuestions", "ConfigureSurveyObject", $routeParams.id);
    }

    function showErrorAlert(reason) {
        header.handleError({
            HTMLMessage : util.formatErrorMessages(reason),
            popup : true
        });
    }

    if(getCanModifySurveyConfiguration()) {
        init();
    }
    else {
        header.goToStep("ChooseSurvey", "ConfigureSurveyObject");
    }
}]);

// --( Controller for Add Questions Step )--
SurveyBuilder.controller('AddQuestionsController', ['$scope', '$routeParams', '$q', 'ctrl', 'util', 'header', '$timeout', function($scope, $routeParams, $q, ctrl, util, header, $timeout) {
    // Globals for this controller
    var fieldSet;
    var layoutName;
    var allSkipLogicOperatorOptions;   // BE (00182091) - populated by init for Eclipse
    var allSkipLogicOperatorMapping; // BE (00182091) - populated by init for Eclipse
    var questionsDirty = false;
    var modalQuestionWatcher;   // BE (00182091) - only populated when the modal is in use.
    var allQuestionsMap = {};   // BE (00182091) - Map of question name to the question object.
    
    // For drag & drop
    var CURRENT_DRAGGING_ROW = null;    // BE (00182091) - What row is currently being dragged?
    var CURRENT_DRAG_OVER_ROW = null    // BE (00182091) - What row is currnetly being dragged over?
    var lastValidState = null;          // BE (00182091) - Contains a copy of $scope.selectedFields and $scope.availableFields where the skip logic was valid. Used for the "Undo" button of the skip logic error popover.

    // BE (00182091) - Types of questions that can be used as the skip question (skipQ) in a skip logic criterion
    var supportedSkipLogicFieldTypes = ['Checkbox', 'Currency', 'Email', 'Number', 'Percent', 'Phone', 'Picklist', 'MultiselectPicklist', 'Text', 'TextArea', 'LongTextArea'];

    function init() {
        $scope.step = 3;
        header.setScope($scope);
        header.showSpinner(true, LABELS.loadingQuestions);
        header.showMissingPermissionsAlert();

        // All Dropdown Options
        $scope.options = {
            fieldTypes : [
                {value: 'Checkbox', label: LABELS.fieldTypes.checkbox},
                {value: 'Currency', label: LABELS.fieldTypes.currency},
                {value: 'Date', label: LABELS.fieldTypes.date},
                {value: 'DateTime', label: LABELS.fieldTypes.dateTime},
                {value: 'Email', label: LABELS.fieldTypes.email},
                {value: 'Number', label: LABELS.fieldTypes.number},
                {value: 'Percent', label: LABELS.fieldTypes.percent},
                {value: 'Phone', label: LABELS.fieldTypes.phone},
                {value: 'Picklist', label: LABELS.fieldTypes.picklist},
                {value: 'MultiselectPicklist', label: LABELS.fieldTypes.multiselectPicklist},
                {value: 'Text', label: LABELS.fieldTypes.text},
                {value: 'TextArea', label: LABELS.fieldTypes.textarea},
                {value: 'LongTextArea', label: LABELS.fieldTypes.longTextarea}
            ],
            // These arrays are multidimensional as different criterion for the same question can have different questions, operators, and values for their dropdowns.
            skipLogicQuestions : [[]], // Populated dynamically, see getSkipLogicSkippableQuestions
            skipLogicOperators : [[]], // Populated dynamically, see getSkipLogicOperatorOptionsForQuestion
            skipLogicValues : [[]]  // Populated dynamically, see getSkipLogicValuesOptions. There is only one skipLogicValues since both skipValue inputs will share the same values.
        };
        
        $scope.options.visibleLinesOptions = [];
        for(var i = 0; i < 51; i++) {
            $scope.options.visibleLinesOptions.push({label: i, value: i});
        }
            
        $scope.options.precisionOptions = [];
        for(var i = 0; i < 18; i++) {
            $scope.options.precisionOptions.push({label: i, value: i});
        }

        // Set Defaults for Question Lists scope fields
        $scope.availableFields = [];
        $scope.selectedFields = [];
        $scope.availableQuestionFilter = '';
        $scope.selectedQuestionFilter = '';
        $scope.draggingRow = false;

        $scope.skipLogicPopover = {
            question : null,
            show : false,
            timeout : null,
            showUndo : false,       // Show the "Undo button" to undo the last drag and drop action.
            showEdit : true,        // Show the "Edit Logic" button to open the question modal
            showDisable : false     // Show the "Disable Skip Logic" button to disable skip logic for a question without having to open the modal. Used for when a question with skip logic is moved to the top in a questionnaire survey.
        };
    
        // Set Defaults for Modal scope fields
        $scope.modalQuestion = null;
        $scope.modalQuestionCriterionQuestionHasDisabledOption = []; // List corresponding to the modal's current criteria (in order), sets a CSS class used if a disabled select option is the current option for a question. This occurs if a skip logic criterions question comes after the current modal question or an unsupported field type is used.
        $scope.modalQuestionCriterionOpHasDisabledOption = []; // List corresponding to the modal's current criteria (in order), sets a CSS class used if a disabled select option is the current option for an operator. This occurs if an invalid, but existing, operator is selected.
        $scope.modalQuestionCriterionShowMultipicklistDropdown = [];  // List corresponding to the modals current criteria (in order), used to determine if the multi-picklist dropdown should appear.
        $scope.modalQuestionCrtierionMultipicklistText = [];    // List corresponding to the modals current criteria (in order), the text displayed on the multi-picklist dropdown's input portion.
        $scope.disableQuestionModalSaveButton = true;
        $scope.showFirstQuestionnaireQuestionInfo = false;  // Used to show info when creating a new question stating that this question cannot have skip logic since it has no questions to base it off of.

        $scope.addingQuestion = false;
        $scope.globalValueSets = [];
        $scope.globalValueSetValues = {};
        $scope.surveyObjectToolingId = null;
        $scope.surveyFieldToolingIdsByName = {};
        
        // Survey Configuration
        $scope.config = {
            surveyRecordTypeId : '',
            type : 'Classic',
            ratingScale : '',
            lastStepCompleted : '',
            enableSkipLogic : false,
            skipLogicJSONString : ''
        }

        // Displays error messages...
        $scope.errorMessages = {
            question : '',          // underneath its corresponding modal field
            label : '',             // underneath its corresponding modal field
            choices : '',           // underneath its corresponding modal field
            valueSet : '',          // underneath its corresponding modal field
            skipLogicConfig : ''    // at the top of the skip logic side of the modal
        }

        // Adds slds-has-error to inputs...
        $scope.errorFields = {
            modal : {   // in the modal...
                question : false,
                label : false,
                choices : false,
                picklistValueType : false,
                valueSet : false,
                errorFields : false,
                // When there is multiple criterion, we will need lists
                skipQ : [],
                skipOp : [],
                skipV1: [],
                skipV2: []
            }
        }

        ctrl.initAddQuestionsStep($routeParams.id, LABELS.hasOwnProperty("skipLogicErrors")).then(processConfiguration).catch(showErrorAlert);
    }

    function processConfiguration(initConfig) {
        var config = initConfig.surveyConfig;
        layoutName = config[PKG_NS_PREFIX + 'Layout__c'];
        var fieldSetName = config[PKG_NS_PREFIX + 'Field_Set__c'].split('.')[1];
        $scope.config = {
            surveyRecordTypeId : config[PKG_NS_PREFIX + 'Record_Type__c'],
            type  : (config[PKG_NS_PREFIX + 'Type__c']) ? config[PKG_NS_PREFIX + 'Type__c'] : 'Classic',
            ratingScale : config[PKG_NS_PREFIX + 'Rating_Scale__c'],
            lastStepCompleted : config[PKG_NS_PREFIX + 'Last_Step_Completed__c'],
            enableSkipLogic : config[PKG_NS_PREFIX + 'Enable_Skip_Logic__c'],
            skipLogic: parseSkipLogicJSON(config[PKG_NS_PREFIX + 'Skip_Logic_Configuration__c'])
        };

        header.setLastStep($scope.config.lastStepCompleted);

        if($scope.config.type === 'Eclipse') {
            var skLogVal = initConfig.skipLogicValidation;
            allSkipLogicOperatorOptions = initConfig.skipLogicOperatorsOptions;
            allSkipLogicOperatorOptions.none = {value : "", label : '— Select —'};
            allSkipLogicOperatorMapping = initConfig.skipLogicOperatorsMapping;
            if(!LABELS.hasOwnProperty("skipLogicErrors")) { // Special ErrorMessages for skip logic.
                LABELS.skipLogicErrors = initConfig.skipLogicErrors;
            }

            $scope.$watch('config.enableSkipLogic', function(oldValue, newValue) {
                var result = validateSkipLogicForQuestions($scope.selectedFields);
                for(var i = 0; i < $scope.selectedFields.length; i++) {
                    var question = $scope.selectedFields[i];
                    question.skipLogic.validation = result.fields[question.fullName];
                }
            });
        }
        else {
            skLogVal = {};
        }

        util.getSurveyMetadata().then(function(metadata) {
            fieldSet = null;
            for(var i = 0; i < metadata.fieldSets.length; i++) {
                if(metadata.fieldSets[i].fullName == fieldSetName) {
                    fieldSet = metadata.fieldSets[i];
                    fieldSet.fullName = PKG_NS_PREFIX + 'Survey__c.' + fieldSet.fullName;
                    break;
                }
            }
            if(fieldSet == null) {
                showNoFieldSetFoundError(fieldSetName);
                return;
            }

            //Populate list of global value sets
            util.getGlobalValueSets().then(function(gvss) {
                $scope.globalValueSets = gvss;

                // read each one and put into a map
                gvss.forEach(function(gvs){
                    $scope.globalValueSetValues[gvs.value] = gvs.customValue;
                });

                //To track which fields will be displayed
                var displayedFieldNames = {};
                var requiredFields = {};
                util.asArray(fieldSet.displayedFields).forEach(function(displayed){
                    displayedFieldNames[displayed.field] = 1;
                    requiredFields[displayed.field] = displayed.isRequired === "true";
                });

                var allowedTypes = {'Checkbox':1, 'Currency':1, 'Date':1, 'DateTime':1, 'Email':1, 'Number':1, 'Percent':1, 'Phone':1, 'Picklist':1, 'MultiselectPicklist':1, 'Text':1, 'TextArea':1, 'LongTextArea':1};
                
                // The blacklist contains fields which cannot appear on a survey
                var blackList = {};
                blackList[PKG_NS_PREFIX + 'Rating_Scale__c'] = 1;
                blackList[PKG_NS_PREFIX + 'Human_Confidence_Score__c'] = 1;
                // BE (00182091) - Added the fields below since they should also be blacklisted
                blackList[PKG_NS_PREFIX + 'Status__c'] = 1;
                blackList[PKG_NS_PREFIX + 'IP_Address__c'] = 1;
                blackList[PKG_NS_PREFIX + 'IP_Address_2__c'] = 1;
                blackList[PKG_NS_PREFIX + 'Referrer__c'] = 1;
                blackList[PKG_NS_PREFIX + 'Survey_Score__c'] = 1;
                blackList[PKG_NS_PREFIX + 'User_Agent__c'] = 1;

                var fields = metadata.fields;
                var selectedFieldsByName = {}; // Selected fields are added to this map since they will be out of order relative to the field set
                for(var i in fields) {
                    if((fields[i].type in allowedTypes) && !(fields[i].fullName in blackList) && ('inlineHelpText' in fields[i])) {
                        var q = convertFieldToQuestion(fields[i], requiredFields, skLogVal[fields[i].fullName]);
                        if(fields[i].fullName in displayedFieldNames) {
                            selectedFieldsByName[fields[i].fullName] = q;
                        }
                        else {
                            $scope.availableFields.push(q);
                        }
                        allQuestionsMap[q.fullName] = q;
                    }
                }

                // Populate selected fields in the order defined by the field set
                util.asArray(fieldSet.displayedFields).forEach(function(displayed){
                    if(selectedFieldsByName.hasOwnProperty(displayed.field)) {
                        $scope.selectedFields.push(selectedFieldsByName[displayed.field]);
                    }
                });

                util.getSurveyToolingIds().then(function(result) {
                    $scope.surveyObjectToolingId = result.objectId;
                    $scope.surveyFieldToolingIdsByName = result.fieldIdsByName;
                    $scope.processing = false;
                }).catch(showErrorAlert);
            }).catch(showErrorAlert)
        }).catch(showErrorAlert);
    }

    // BE (00182091) - Intialization function, takes a json string and converts it to a skip logic configuration object.
    function parseSkipLogicJSON(json) {
        try {
            var jsonObj = JSON.parse(json);
            var skipLogic = {};
            for(var i = 0; i < jsonObj.fields.length; i++) {    // Map each field to its skip logic.
                for(var j = 0; j < jsonObj.fields[i].criteria.length; j++) {
                    try {
                        var parsedValue = JSON.parse(jsonObj.fields[i].criteria[j].skipV1);
                        if(Array.isArray(parsedValue)) {
                            jsonObj.fields[i].criteria[j].skipV1 = parsedValue;
                        }
                    }
                    catch(err) {
                        continue;
                    }
                }
                skipLogic[jsonObj.fields[i].field] = jsonObj.fields[i];
            }
            return skipLogic;
        }
        catch(err) {
            return '';
        }
    }

    // BE (00182091) - Initialization function, converts field metadata and skip logic validation to a question object.
    function convertFieldToQuestion(fieldMetadata, requiredFieldsMap, skipLogicValidation) {
        var question = {
            fullName : fieldMetadata.fullName,
            label : fieldMetadata.label,
            type : fieldMetadata.type,
            required : (requiredFieldsMap[fieldMetadata.fullName]) ? requiredFieldsMap[fieldMetadata.fullName] : false,
            randomizeAnswerOrder : false,
            inlineHelpText : fieldMetadata.inlineHelpText,
            picklistValueType : '',
            globalValueSet : '',
            picklistOptions : '',
            valueSet : {},
            skipLogic : {
                enabled : false,
                skipCriteria : [    // Setup to potentially include multiple criteria.
                    {
                        index : 1,
                        skipQ : '',
                        skipOp : '',
                        skipV1 : '',
                        skipV2 : ''
                    }
                ],
                formula : '1',
                validation : generateSkipLogicValidation(true)
            }
        };

        if(question.type === 'Picklist' || question.type === 'MultiselectPicklist') {
            var values = [];
            if(fieldMetadata.valueSet.valueSetName) {
                question.picklistValueType = 'global';
                question.globalValueSet = fieldMetadata.valueSet.valueSetName;
                question.valueSet = fieldMetadata.valueSet;
            }
            else {
                question.picklistValueType = 'entered';
                util.asArray(fieldMetadata.valueSet.valueSetDefinition.value).forEach(function(val) {
                    values.push(val.fullName);
                });
                question.picklistOptions = values.join('\n');
            }
        }

        if(question.type === 'Currency' || question.type === 'Number' || question.type === 'Percent') {
            question.decimalPlaces = parseInt(fieldMetadata.scale);
        }

        if(question.type === 'MultiselectPicklist' || question.type === 'LongTextArea') {
            question.visibleLines = parseInt(fieldMetadata.visibleLines);
        }

        // Setup skip logic.
        if($scope.config.type === 'Eclipse' && $scope.config.skipLogic.hasOwnProperty(question.fullName)) {
            var skipLogic = $scope.config.skipLogic[question.fullName];
            question.randomizeAnswerOrder = skipLogic.randomize && (question.type === 'Picklist' || question.type === 'MultiselectPicklist');
            question.skipLogic.enabled = skipLogic.enabled;
            question.skipLogic.formula = (skipLogic.formula) ? skipLogic.formula : '1';
            question.skipLogic.skipCriteria = [];
            for(var i = 0; i < skipLogic.criteria.length; i++) {
                question.skipLogic.skipCriteria.push({
                    index : parseInt(skipLogic.criteria[i].index),
                    skipQ :  skipLogic.criteria[i].skipQ,
                    skipOp : skipLogic.criteria[i].skipOp,
                    skipV1 : skipLogic.criteria[i].skipV1,
                    skipV2 : skipLogic.criteria[i].skipV2
                });
            }
            if(skipLogicValidation) {
                question.skipLogic.validation = skipLogicValidation;
            }
        }

        return question;
    }
    
    // Error that appears if the field set for the configuration does not exist. This kicks the user back to the first step of the builder.
    function showNoFieldSetFoundError(fsName) {
        $scope.headerAlertOkayAction = function() {
            $scope.headerAlertOkayAction = null;
            header.showSpinner(true, LABELS.returningToChooseSurvey);
            setTimeout(function() {
                location.href = '#!/ChooseSurvey';
            }, 1000);
        }            
        showErrorAlert(LABELS.noFieldSetFoundError.format(fsName));
    }

    // BE (00182091) - Builds a list of all questions before the given question. The questions must be one of the supported types. If the skip logic is invalid due to another question, that one is included too, but disabled.
    function getSkipLogicSkippableQuestions(q) {
        var skipQuestions = [];
        var surveyFieldNames = [];
        var fieldNamesToField = {};
        var skippables = [{value : '', label: '— Select Question —'}];
        switch($scope.config.ratingScale) {
            case '0-1':
                skippables.push({value: 'thumbs', label: 'Rating (Thumbs)'});
                surveyFieldNames.push('thumbs');
                break;
            case '0-10':
                skippables.push({value: 'nps', label: 'Rating (NPS)'});
                surveyFieldNames.push('nps');
                break;
            case '1-5':
                skippables.push({value: 'stars', label: 'Rating (Stars)'});
                surveyFieldNames.push('stars');
                break;
        }

        var foundQ = false;
        for(var i = 0; i < $scope.selectedFields.length; i++) {
            foundQ = foundQ || $scope.selectedFields[i].fullName === q.fullName
            if(!foundQ && supportedSkipLogicFieldTypes.indexOf($scope.selectedFields[i].type) > -1) {
                skippables.push({value: $scope.selectedFields[i].fullName, label: $scope.selectedFields[i].inlineHelpText});
            }
            surveyFieldNames.push($scope.selectedFields[i].fullName.toLowerCase());
            fieldNamesToField[$scope.selectedFields[i].fullName.toLowerCase()] = $scope.selectedFields[i]; 
        }
        
        for(var i = 0; i < $scope.availableFields.length; i++) {
            fieldNamesToField[$scope.availableFields[i].fullName.toLowerCase()] = $scope.availableFields[i]; 
        }

        for(var i = 0; i < q.skipLogic.skipCriteria.length; i++) {
            var crit = q.skipLogic.skipCriteria[i];
            if(!checkFieldsInOrderInFieldSet(surveyFieldNames, crit.skipQ.toLowerCase(), q.fullName.toLowerCase())) {
                if(['nps', 'thumbs', 'stars'].indexOf(crit.skipQ.toLowerCase()) > -1) {
                    switch(crit.skipQ.toLowerCase()) {
                        case 'thumbs':
                            skipQuestions.push(skippables.concat({value: 'thumbs', label: 'Rating (Thumbs)', disabled : true}));
                            break;
                        case 'nps':
                            skipQuestions.push(skippables.concat({value: 'nps', label: 'Rating (NPS)', disabled : true}));
                            break;
                        case 'stars':
                            skipQuestions.push(skippables.concat({value: 'stars', label: 'Rating (Stars)', disabled : true}));
                            break;
                    }
                    $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = true;
                }
                else {
                    if(fieldNamesToField.hasOwnProperty(crit.skipQ.toLowerCase())) { // If the fields are out of order and both fields exist, include the invalid field but disable it.
                        skipQuestions.push(skippables.concat({value : crit.skipQ, label : fieldNamesToField[crit.skipQ.toLowerCase()].inlineHelpText, disabled : true}));
                        $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = true;
                    }
                    else {  // If the question doesn't exist, reset the criterion.
                        crit.skipQ = '';
                        crit.skipQType = '';
                        crit.skipOp = '';
                        crit.skipV1 = '';
                        crit.skipV2 = '';
                        $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = false;
                        skipQuestions.push(skippables);
                    }
                }
            }
            else {
                if(['nps', 'thumbs', 'stars'].indexOf(crit.skipQ.toLowerCase()) === -1) {
                    var skipQFieldType = fieldNamesToField[crit.skipQ.toLowerCase()].type;
                    if(supportedSkipLogicFieldTypes.indexOf(skipQFieldType) === -1) {
                        // Add an unsupported field type to the list but make it disabled.
                        skipQuestions.push(skippables.concat({value : crit.skipQ, label : fieldNamesToField[crit.skipQ.toLowerCase()].inlineHelpText, disabled : true}));
                        $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = true;
                    }
                    else {
                        $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = false;
                        skipQuestions.push(skippables);
                    }
                }
                else {
                    $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = false;
                    skipQuestions.push(skippables);
                }
            }
        }
        return skipQuestions;
    }
    
    // BE (00182091) - Builds a list of all valid operator options for the current criterion's question. If the skip logic is invalid due to an invalid, but existing, operator that one is included too, but disabled.
    function getSkipLogicOperatorOptionsForQuestion(q, crit) {
        var opNames = [];
        switch(q.type.toLowerCase()) {
            case 'nps':
            case 'stars':
            case 'number':
            case 'currency':
            case 'percent':
                opNames = ['gt', 'gte', 'eq', 'lte', 'lt', 'dne', 'between', 'outside'];
                break;
            case 'thumbs':
            case 'checkbox':
                opNames = ['eq', 'dne'];
                break;
            case 'multiselectpicklist':
            case 'picklist':
            case 'text':
            case 'textarea':
            case 'longtextarea':
            case 'phone':
            case 'email':
                opNames = ['eq', 'dne', 'con', 'dcon'];
                break;
        }
        var opts = [allSkipLogicOperatorOptions['none']];
        for(var i = 0; i < opNames.length; i++) {
            opts.push(allSkipLogicOperatorOptions[opNames[i]]);
        }
        if(opNames.indexOf(crit.skipOp) === -1) {
            if(allSkipLogicOperatorOptions.hasOwnProperty(crit.skipOp)) {
                var skipOpt = allSkipLogicOperatorOptions[crit.skipOp];
                var opt = {
                    value : skipOpt.value,
                    label : skipOpt.label,
                    disabled : true
                };
                opts.push(opt);
                $scope.modalQuestionCriterionOpHasDisabledOption[crit.index - 1] = true;
            }
            else {
                crit.skipOp = '';
                $scope.modalQuestionCriterionOpHasDisabledOption[crit.index - 1] = false;
            }
        }
        else {
            $scope.modalQuestionCriterionOpHasDisabledOption[crit.index - 1] = false;
        }
        return opts;
    }

    // BE (00182091) - Populates skip logic value dropdowns
    function getSkipLogicValuesOptions(skipQuestion, crit) {
        var values = [];
        var opts = [{value : '', label : '— Select —'}];
        switch(skipQuestion.type.toLowerCase()) {
            case 'stars':
                for(var i = 1; i <= 5; i++) {
                    opts.push({value : ('' + i), label : (i + ' ' + ((i > 1) ? 'Stars' : 'Star'))})
                    values.push('' + i);
                }
                break;
            case 'nps':
                for(var i = 0; i <= 10; i++) {
                    opts.push({value : ('' + i), label : ('' + i)});
                    values.push('' + i);
                }
                if(['between', 'outside'].indexOf(crit.skipOp) === -1) {
                    opts.push({value : 'detractors', label : 'Detractors (0-6)'});
                    opts.push({value : 'passives', label : 'Passives (7-8)'});
                    opts.push({value : 'promoters', label : 'Promoters (9-10)'});
                    values = values.concat(['detractors', 'passives', 'promoters']);
                }
                break;
            case 'thumbs':
                opts.push({value : 'rateup', label : 'Thumbs Up'});
                opts.push({value : 'ratedown', label : 'Thumbs Down'});
                values = values.concat(['rateup', 'ratedown']);
                break;
            case 'checkbox':
                opts.push({value : 'true', label : 'Checked'});
                opts.push({value : 'false', label : 'Unchecked'});
                values = values.concat(['true', 'false']);
                break;
            case 'picklist':
            case 'multiselectpicklist':
                var plOpts = getPicklistOptionsFromQuestion(skipQuestion)
                for(var i = 0; i < plOpts.length; i++) {
                    values.push(plOpts[i].value);
                }
                opts = opts.concat(plOpts);
                break;
        }

        switch(skipQuestion.type.toLowerCase()) {
            case 'multiselectpicklist':
            case 'picklist':
                var critValues = crit.skipV1;
                for(var i = 0; i < critValues.length; i++) {
                    if(values.indexOf(critValues[i]) === -1) {
                        // For picklist values that no longer exists, makes a red error icon appear next to the option, once the option is unselected it cannot be selected again.
                        opts.push({value : critValues[i], label : critValues[i], disabled : true});
                    }
                }
                break;
            default:
                if(values.indexOf(crit.skipV1) === -1) {
                    crit.skipV1 = '';
                }
                if(['between', 'outside'].indexOf(crit.skipOp) > -1 && values.indexOf(crit.skipV2) === -1) {
                    crit.skipV2 = '';
                }
        }
        return opts;
    }

    // BE (00182091) - Gets all Picklist options for a question. Currently populates skip logic value dropdowns for picklist questions
    function getPicklistOptionsFromQuestion(q) {
        var opts = [];
        if(q.picklistValueType === 'entered') {
            var plOpts = q.picklistOptions.split('\n');
            for(var i = 0; i < plOpts.length; i++) {
                opts.push({value : plOpts[i], label : plOpts[i]});
            }
        }
        else {
            var plOpts = $scope.globalValueSetValues[q.globalValueSet];
            for(var i = 0; i < plOpts.length; i++) {
                opts.push({value : plOpts[i].fullName, label : plOpts[i].label});
            }
        }
        return opts;
    }

    // BE (00182091) - Gets all Picklist values for a question.
    function getAllPicklistValuesFromQuestion(q) {
        var values = [];
        if(q.picklistValueType === 'entered') {
            var plOpts = q.picklistOptions.split('\n');
            for(var i = 0; i < plOpts.length; i++) {
                values.push(plOpts[i].toLowerCase());
            }
        }
        else {
            var plOpts = $scope.globalValueSetValues[q.globalValueSet];
            for(var i = 0; i < $scope.globalValueSetValues[q.globalValueSet].length; i++) {
                values.push(plOpts[i].fullName.toLowerCase());
            }
        }
        return values;
    }

    // -- Example Modal --
    $scope.handleShowExampleButtonOnClick = function() {
        $scope.showExample = true;
    }

    $scope.handleExampleModalCloseButtonOnClick = function() {
        $scope.showExample = false;
    }

    // -- Drag and Drop + Dropzones --
    $scope.handleQuestionRowOnDragStart = function(e) {
        CURRENT_DRAGGING_ROW = {
            element : e.currentTarget,
            rect : e.currentTarget.getBoundingClientRect()  // Rect when the element is first grabbed. This will keep the original height of the row instead of using the 0 height when we hide it.
        };
        $timeout(function() {
            var fillerRow = generateFillerRowElement();
            CURRENT_DRAGGING_ROW.element.classList.add("dragging");
            CURRENT_DRAGGING_ROW.element.parentElement.insertBefore(fillerRow, CURRENT_DRAGGING_ROW.element.nextElementSibling);
            var dropzone = determineDropzone(fillerRow);
            setFillerRowInvalid(fillerRow, dropzone);
        }, 1);
        $scope.draggingRow = true;
    }

    $scope.handleQuestionRowOnDragEnd = function(e, el) {
        clearAllDragAndDropFillerRows();
        CURRENT_DRAGGING_ROW.element.classList.remove("dragging");
        $scope.draggingRow = false;
    }

    $scope.handleDropzoneOnDragEnter = function(e, el) {
        var dndFillerQuestion = el.querySelector(".dnd-filler-question");
        if(dndFillerQuestion === null) {
            var closestElInfo = null;
            var allRows = el.querySelectorAll("[row-id]");
            
            for(var i = 0; i < allRows.length; i++) {
                if(!allRows[i].classList.contains("dragging")) {
                    var distance = Math.abs(allRows[i].getBoundingClientRect().top - e.y);
                    if(closestElInfo == null || distance < closestElInfo.distance) {
                        closestElInfo = {element : allRows[i], distance : distance};
                    }
                }
            }

            createFillerRowOnDragOver(closestElInfo.element, e.y);
        }
    }

    $scope.handleDropzoneOnDragLeave = function(e, el) {
        var dropzoneRect = el.getBoundingClientRect();
        // Check the mouseEvent coordinates are outside of the rectangle
        if(e.x > dropzoneRect.left + dropzoneRect.width || e.x < dropzoneRect.left
        || e.y > dropzoneRect.top + dropzoneRect.height || e.y < dropzoneRect.top) {
            clearAllDragAndDropFillerRows();
            CURRENT_DRAG_OVER_ROW = null;
        }
    }

    // BE (00182091) - Adds a space representing where the current dragging row will be placed.
    $scope.handleQuestionRowOnDragOver = function(e) {
        createFillerRowOnDragOver(e.currentTarget, e.y);
    }


    function createFillerRowOnDragOver(newRow, mouseY) {
        var newRowRect = newRow.getBoundingClientRect();
        var inTopHalf = mouseY <= newRowRect.top + newRowRect.height / 2;

        if(CURRENT_DRAG_OVER_ROW == null || CURRENT_DRAG_OVER_ROW.rowId !== newRow.getAttribute('row-id') || CURRENT_DRAG_OVER_ROW.topHalf !== inTopHalf) {
            clearAllDragAndDropFillerRows();
            CURRENT_DRAG_OVER_ROW = {
                rowId : newRow.getAttribute('row-id'),
                element : newRow,
                topHalf : inTopHalf
            };
    
            var noSelectedQuestionFilter = util.isBlank($scope.selectedQuestionFilter);
            var dropzone = determineDropzone(CURRENT_DRAG_OVER_ROW.element);
            // BE (00182091) - We check the next row as well to avoid creating a filler space that drops the row in the same exact spot.
            if(noSelectedQuestionFilter && newRow.getAttribute("row-id") !== CURRENT_DRAGGING_ROW.element.getAttribute("row-id")) {
                var fillerRow = generateFillerRowElement();
                if(inTopHalf) { // Add the dnd filler above the row we're dragging over.
                    CURRENT_DRAG_OVER_ROW.element.parentElement.parentElement.insertBefore(fillerRow, CURRENT_DRAG_OVER_ROW.element.parentElement);
                }
                else {
                    if(CURRENT_DRAG_OVER_ROW.element.parentElement.nextElementSibling) {    // Add the dnd filler below the row we're dragging over.
                        CURRENT_DRAG_OVER_ROW.element.parentElement.parentElement.insertBefore(fillerRow, CURRENT_DRAG_OVER_ROW.element.parentElement.nextElementSibling);
                    }
                    else {  // If there is no next row (over the filler row), add the dnd filler above the row we're dragging over.
                        CURRENT_DRAG_OVER_ROW.element.parentElement.parentElement.insertBefore(fillerRow, CURRENT_DRAG_OVER_ROW.element.parentElement);
                    }
                }
                
                var dropzone = determineDropzone(newRow);
                setFillerRowInvalid(fillerRow, dropzone, newRow);
            }
        }
    }

    function generateFillerRowElement() {
        var rect = {height : 42};
        if(CURRENT_DRAGGING_ROW) {
            rect = CURRENT_DRAGGING_ROW.rect;
        }
        var fillerRow = document.createElement("div");
        fillerRow.classList.add("dnd-filler-question");
        var fillerRowHeight = Math.max(42, rect.height) + "px";
        fillerRow.style.height = fillerRowHeight;
        fillerRow.style.minHeight = fillerRowHeight;    // BE (00182091) - This deals with a strange issue where dragging a row to the end will have it's drop shadow be the default min-height (42px) instead of the size of the item you're dragging.
        return fillerRow;
    }

    function setFillerRowInvalid(fillerRow, dropzone, swapRow) {
        // BE (00182091) - Make the filler space for the row a red color if it invalidates any skip logic due to the "skipQ" value.
        if(dropzone.getAttribute("data-dropzone-key") !== 'a' && $scope.config.enableSkipLogic) {
            var reorderedSelectedFields = getReorderedQuestionsAfterDragAndDrop(dropzone.querySelectorAll('[row-id], .dnd-filler-question'), allQuestionsMap[CURRENT_DRAGGING_ROW.element.getAttribute('row-id')], $scope.selectedFields);
            var validationResult = validateSkipLogicForQuestions(reorderedSelectedFields, false, reorderedSelectedFields);
            if(!validationResult.valid) {
                var fieldResult = validationResult.fields[CURRENT_DRAGGING_ROW.element.getAttribute('row-id')];

                if(!fieldResult.valid && fieldResult.critFields.indexOf('skipQ') > -1) {
                    fillerRow.classList.add('invalid');
                    return;
                }

                if(swapRow) {
                    fieldResult = validationResult.fields[swapRow.getAttribute('row-id')];
                    if(!(fieldResult)) {    // Swapping with the last row.
                        fieldResult = validationResult.fields[reorderedSelectedFields[reorderedSelectedFields.length - 2].fullName];
                    }
                }


                if(!fieldResult.valid && fieldResult.critFields.indexOf('skipQ') > -1) {
                    fillerRow.classList.add('invalid');
                    return;
                }

                for(var i = 0; i < reorderedSelectedFields.length; i++) {
                    var field = reorderedSelectedFields[i];
                    if(field.skipLogic.skipCriteria[0].skipQ === CURRENT_DRAGGING_ROW.element.getAttribute('row-id')) {
                        fillerRow.classList.add('invalid');
                        return;
                    }
                }
            }
        }
    }

    $scope.handleRowDrop = function(event, dropTarget) {
        questionDropped(dropTarget, angular.fromJson(event.dataTransfer.getData('Text')));
    };

    /*
        BE (00182091)
        Reorders the questions after a drop. If the skip logic becomes invalid due to a an issue with a criterion's question, display
        the skip logic error popover.
    */
    function questionDropped(dropTarget, question) {
        var dropzone = dropTarget;
        if(dropTarget.getAttribute("name") !== "dropzone") {
            dropzone = determineDropzone(dropTarget);
        }

        if(dropzone && dropzone.querySelector(".dnd-filler-question")) {
            questionsDirty = true;
            var availableDropzone = document.querySelector("[name='dropzone'][data-dropzone-key='a']");
            var selectedDropzone = document.querySelector("[name='dropzone'][data-dropzone-key='s']");
            
            var reorderedAvailableFields = getReorderedQuestionsAfterDragAndDrop(availableDropzone.querySelectorAll('.dnd-filler-question, [row-id]'), question, $scope.availableFields);
            var reorderedSelectedFields = getReorderedQuestionsAfterDragAndDrop(selectedDropzone.querySelectorAll('.dnd-filler-question, [row-id]'), question, $scope.selectedFields);

            closeSkipLogicPopover();
            if($scope.config.enableSkipLogic) {
                var currentSkipLogicIsValid = skipLogicIsValid($scope.selectedFields);
                if(currentSkipLogicIsValid) {
                    setLastValidState($scope.availableFields, $scope.selectedFields);
                }
                else {
                    clearLastValidState();  // Undo only goes back 1 step, so clear the last valid state if the current logic is invalid.
                }
                var validationResult = validateSkipLogicForQuestions(reorderedSelectedFields);
                var addedPopover = false;
                for(var i = 0; i < reorderedSelectedFields.length; i++) {
                    var question = reorderedSelectedFields[i];
                    var validation = validationResult.fields[question.fullName];
                    question.skipLogic.validation = validation;
                    setSkipLogicErrorFields(question.skipLogic.validation);
                    if(!addedPopover && !validation.valid && validation.critFields[0] === 'skipQ') {
                        dropTimeoutHandler(question);
                        addedPopover = true;
                    }
                    reorderedSelectedFields[i] = question;
                }
            }

            $scope.selectedFields = reorderedSelectedFields;
            $scope.availableFields = reorderedAvailableFields;
            CURRENT_DRAG_OVER_ROW = null;

            clearAllDragAndDropFillerRows();
        }
    }

    function dropTimeoutHandler(question) {
        $timeout(function() {
            // Note: behavior = smooth triggers event listeners which causes problems with the popover. There's not browser-consistent way to determine the time it will take.
            document.querySelector("[row-id='" + question.fullName + "']").scrollIntoView();
            openPopoverForQuestion(question);
        }, 1);
    }

    // BE (00182091) - Clear all Filler rows when a a drag and drop completes.
    function clearAllDragAndDropFillerRows() {
        var allFillers = document.querySelectorAll(".dnd-filler-question");
        for(var i = 0; i < allFillers.length; i++) {
            allFillers[i].parentElement.removeChild(allFillers[i]);
        }
    }

    // BE (00182091) - Given a qustion row in the dropzone, determine its dropzone.
    function determineDropzone(row) {
        var parent = row.parentElement;
        while(parent !== null) {
            if(parent.getAttribute("name") ==="dropzone") {
                return parent;
            }
            parent = parent.parentElement;
        }
        return null;
    }

    // BE (00182091) - Using just the row elements, get the new order of questions using the "row-id" attribute on each row.
    function getReorderedQuestionsAfterDragAndDrop(rowEls, newQuestion, qSideList) {

        // Determine where the filler question is and which question comes directly before the filler.
        // Note: The questionBeforeFiller can become undefined (e.g. moving the last question in a list), meaning do nothing.
        var questionBeforeFiller = null;
        var addingToList = false;   // If true, the value
        for(var i = 0; i < rowEls.length; i++) {
            var row = rowEls[i];
            var rowId = row.getAttribute("row-id");
            if(row.classList.contains("dnd-filler-question")) {
                addingToList = true;
                break;
            }
            else {
                questionBeforeFiller = allQuestionsMap[rowId];
            }
        }


        var reorderedQuestions = [];

        // If questionBeforeFiller is null, that means it is going to become the first question in the list.
        if(questionBeforeFiller === null){
            reorderedQuestions.push(newQuestion);
        }

        for(var i = 0; i < qSideList.length; i++) {
            var q = qSideList[i];
            if(q.fullName !== newQuestion.fullName) {
                reorderedQuestions.push(q);
            }
            if(addingToList && questionBeforeFiller && questionBeforeFiller.fullName === q.fullName) {
                reorderedQuestions.push(newQuestion);
            }
        }
        return reorderedQuestions;
    }

    // -- Header Functionality --
    $scope.handleSimpleSurveySetupButtonOnClick = function() {
        header.goToSimpleSurveySetup();
    }

    $scope.handleHeaderLinkOnClick = function(stepInfo) {
        if(header.canNavigate(stepInfo, $routeParams.id)) {
            var path = header.generateStepPath(stepInfo, $routeParams.id);
            header.navigate(path, 'AddQuestions', util.formIsDirty() || questionsDirty);
        }
    }

    $scope.handleAlertOkayButtonOnClick = function() {
        header.alertOkayClicked();
    }

    $scope.handleNavConfirmCancelButtonOnClick = function() {
        header.navConfirmCancel();
    }

    $scope.handleNavConfirmSaveAndProceedButtonOnClick = function() {
        header.showAlert(false);
        save().then(function(result) {
            header.navigate($scope.proceedTo, 'AddQuestions');
        }).catch(showErrorAlert);
    }

    $scope.handleNavConfirmProceedButtonOnClick = function() {
        header.showAlert(false);
        header.navigate($scope.proceedTo, 'AddQuestions');
    }

    // -- Question Modal --
    $scope.handleAddQuestionButtonOnClick = function() {
        initAddQuestionModal();
    }

    $scope.handleQuestionModalCreateButtonOnClick = function() {
        clearLastValidState();  // BE (00182091) - Clear the last valid state if you start to create a new question
        createQuestion(false);
    }

    $scope.handleQuestionModalCreateAndNewButtonOnClick = function() {
        clearLastValidState();  // BE (00182091) - Clear the last valid state if you start to create a new question
        createQuestion(true);
    }

    $scope.handleUpdateQuestionButtonOnClick = function(q) {
        initUpdateQuestionModal(q);
    }

    $scope.handleQuestionModalCancelButtonOnClick = function() {
        closeQuestionModal();
    }

    $scope.handleQuestionModalUpdateButtonOnClick = function() {
        clearLastValidState();  // BE (00182091) - Clear the last valid state if you start to update a question
        updateQuestion();
    }

    function initAddQuestionModal() {
        closeSkipLogicPopover();
        //Show new question dialog
        updateModalUI();
        $scope.addingQuestion = true;
        modalQuestionWatcher = setupQuestionModalWatcher(); 
        $scope.modalQuestion = generateNewQuestion();

        $scope.disableQuestionModalLabelInput = false;
        $scope.showFirstQuestionnaireQuestionInfo = $scope.config.ratingScale === 'None' && $scope.selectedFields.length === 0;

        if($scope.config.type === 'Eclipse') {
            initModalSkipLogicOptions($scope.modalQuestion);
        }

        $scope.errorMessages.question = '';
        $scope.errorMessages.label = '';

        $scope.required = {
            question: false,
            label: false,
            choices: false
        };
    }

    function generateNewQuestion() {
        return {
            fullName : '',
            label : '',
            type : 'Text',
            picklistValueType : 'entered',
            globalValueSet : ($scope.globalValueSets.length > 0) ? $scope.globalValueSets[0].value : '',
            picklistOptions : '',
            visibleLines : 4,
            decimalPlaces : 2,
            required : false,
            randomizeAnswerOrder : false,
            inlineHelpText : '',
            skipLogic : {
                enabled : false,
                skipCriteria : [    // Setup to potentially include multiple criteria.
                    {
                        index : 1,
                        skipQ : '',
                        skipOp : '',
                        skipV1 : '',
                        skipV2 : ''
                    }
                ],
                formula : '1',
                validation : generateSkipLogicValidation(true)
            }
        };
    }

    function initUpdateQuestionModal(q) {
        closeSkipLogicPopover();
        $scope.modalQuestion = {};
        if($scope.config.type === 'Eclipse') {
            initModalSkipLogicOptions(q);
        }

        angular.copy(q, $scope.modalQuestion);
        modalQuestionWatcher = setupQuestionModalWatcher();

        if($scope.config.type === 'Eclipse') {
            setSkipLogicErrorFields(q.skipLogic.validation);
        }

        $scope.showFirstQuestionnaireQuestionInfo = $scope.config.ratingScale === 'None' && $scope.selectedFields[0].fullName === q.fullName;

        $scope.disableQuestionModalSaveButton = true;
        $scope.disableQuestionModalLabelInput = q.fullName === 'simplesurvey__Survey_Comments__c';
        header.showSpinner(true, LABELS.loadingQuestion);

        $scope.required = {
            question: false,
            label: false,
            choices: false
        };

        var showModal = function() {
            updateModalUI();
            $scope.updatingQuestion = true;
            header.showSpinner(false);
        }

        ctrl.checkFieldUsedInOtherFieldSets($scope.modalQuestion.fullName, fieldSet.fullName.substring(fieldSet.fullName.indexOf('\.') + 1, fieldSet.fullName.length)).then(function(result) {
            $scope.usedInOtherFieldset = result;
            showModal();
        }).catch(function(reason) {
            // Knowing if it's used in other field sets (surveys) is not crucial. If this fails, show the modal anyway.
            console.error(reason);
            showModal();
        });
    }

    function updateModalUI() {
        // Keeps the modal headings the same size (Edge [Legacy] Compatible)
        var modalSideHeadings = document.querySelectorAll(".modal-side-heading");
        var maxHeight = 0;
        for(var i = 0; i < modalSideHeadings.length; i++) {
            modalSideHeadings[i].style.height = null;
            var rect = modalSideHeadings[i].getBoundingClientRect();
            if(rect.height > maxHeight) {
                maxHeight = rect.height;
            }
        }

        for(var i = 0; i < modalSideHeadings.length; i++) {
            modalSideHeadings[i].style.height = maxHeight + 'px';
        }
    }

    // Picklist Values
    $scope.handlePicklistInputOnFocus = function(criterion) {
        $scope.modalQuestionCriterionShowMultipicklistDropdown[criterion.index - 1] = true;
    }

    $scope.handlePicklistOptionOnClick = function(value, criterion, disabled) {
        var skipQType = getSkipQuestion(criterion.skipQ).type.toLowerCase();

        if(skipQType === 'multiselectpicklist' || (skipQType === 'picklist' && ['con', 'dcon'].indexOf(criterion.skipOp) > -1)) {
            var index = criterion.skipV1.indexOf(value);
            if(index > -1) {  // Remove
                criterion.skipV1.splice(index, 1);
            }
            else if(!disabled){  // Add
                criterion.skipV1.push(value);
            }
        }
        else {
            criterion.skipV1 = [value];
        }

        setMultipicklistTextValue(criterion.skipV1, criterion.index - 1);
    }

    // BE (00182091) - This is the text that appears on the input portion of the custom multiselect dropdown.
    function setMultipicklistTextValue(valuesList, index) {
        var MAX_OPTS = 3;    // Once the # of options is above this value, show "# options selected" instead of all the values.
        if(valuesList.length > MAX_OPTS) {
            $scope.modalQuestionCrtierionMultipicklistText[index] = LABELS.numOptionsSelected.format([valuesList.length]);
        }
        else if(valuesList.length > 0) {
            $scope.modalQuestionCrtierionMultipicklistText[index] = valuesList.join(';');
        }
        else {
            $scope.modalQuestionCrtierionMultipicklistText[index] = '';
        }
    }

    function handleWindowOnClickForAddQuestions(e) {
        var openDropdown = document.querySelector('.picklist-value-dropdown_open');
        if(openDropdown) {
            var index = parseInt(openDropdown.getAttribute("data-criterion-index")) - 1;
            var dropdownInput = openDropdown.previousElementSibling.querySelector("input");
            var openDropdownRect = openDropdown.getBoundingClientRect();
            var dropdownInputRect = dropdownInput.getBoundingClientRect();
            var xValid = (e.x >= dropdownInputRect.x && e.x <= dropdownInputRect.x + dropdownInputRect.width);
            var yValid = (e.y >= dropdownInputRect.y && e.y <= dropdownInputRect.y + dropdownInputRect.height + openDropdownRect.height);
            if(!(xValid & yValid)) {
                $scope.modalQuestionCriterionShowMultipicklistDropdown[index] = false;
            }
            $scope.$digest();
        }
    }

    // BE (00182091) - Finds a question based on it's unique name. If the name is 'nps', 'stars', or 'thumbs', returns an object containing that value.
    function getSkipQuestion(skipQuestionName) {
        var skipQuestion = {type : ''}; // This should only return the '- Select -' operator.
        if(skipQuestionName !== '') {
            if(skipQuestionName === 'nps' || skipQuestionName === 'stars' || skipQuestionName === 'thumbs') { //NOPMD
                return {type : skipQuestionName};
            }
            else {
                for(var qName in allQuestionsMap) {
                    if(qName === skipQuestionName) {
                        return allQuestionsMap[qName];
                    }
                }
            }
        }
        return skipQuestion;
    }

    function setupQuestionModalWatcher() {
        return $scope.$watch('modalQuestion', handleModalQuestionOnChange, true);
    }

    // BE (00182091) - Handles enable the save button and updating skip logic dropdowns (if needed)
    function handleModalQuestionOnChange(newVal, oldVal) {
        if(newVal !== oldVal) { // When the $scope.$watch is created, newVal and oldVal will be the same and using the same memory allocation.
            if(newVal) {
                enableQuestionModalSaveButton();
                if($scope.config.enableSkipLogic) {
                    updateModalSkipLogicOptions(newVal, oldVal);
                }
            }
        }
    }

    function enableQuestionModalSaveButton() {
        $scope.disableQuestionModalSaveButton = false;
    }

    // BE (00182091) - Handles updatesto skip logic criterion questions and operators.
    function updateModalSkipLogicOptions(newQ, oldQ) {
        for(var i = 0; i < newQ.skipLogic.skipCriteria.length; i++) {
            var skipQuestionChanged = (oldQ !== null && newQ.skipLogic.skipCriteria[i].skipQ != oldQ.skipLogic.skipCriteria[i].skipQ);
            var skipOpChanged = (oldQ !== null && newQ.skipLogic.skipCriteria[i].skipOp != oldQ.skipLogic.skipCriteria[i].skipOp);
            if(skipQuestionChanged || skipOpChanged) {
                var skipQuestion = getSkipQuestion(newQ.skipLogic.skipCriteria[i].skipQ);
                var skipQuestionIsPicklist = ['picklist', 'multiselectpicklist'].indexOf(skipQuestion.type.toLowerCase()) > -1;
                if(skipQuestionChanged) {
                    newQ.skipLogic.skipCriteria[i].skipQType = skipQuestion.type;
                    newQ.skipLogic.skipCriteria[i].skipOp = '';
                    newQ.skipLogic.skipCriteria[i].skipV1 = (skipQuestionIsPicklist) ? [] : '';
                    newQ.skipLogic.skipCriteria[i].skipV2 = '';
                    $scope.options.skipLogicOperators[i] = getSkipLogicOperatorOptionsForQuestion(skipQuestion, newQ.skipLogic.skipCriteria[i]);
                    setMultipicklistTextValue(newQ.skipLogic.skipCriteria[i].skipV1, newQ.skipLogic.skipCriteria[i].index  - 1);
                }

                if(questionTypeUsesDropdownForValues(skipQuestion.type.toLowerCase())) {
                    $scope.options.skipLogicValues[i] = getSkipLogicValuesOptions(skipQuestion, newQ.skipLogic.skipCriteria[i]);
                    if(!skipQuestionIsPicklist) {
                        var resetPicklist1 = skipQuestionChanged;
                        var resetPicklist2 = skipQuestionChanged;
                        if(!(resetPicklist1 && resetPicklist2) && skipQuestion.type === 'nps') {    // NPS can switch picklist values based on the operator. If the current values don't exist in the updated picklist, reset them.
                            var critDropdownValues = [];
                            for(var j = 0; j < $scope.options.skipLogicValues[i].length; j++) {
                                critDropdownValues.push($scope.options.skipLogicValues[i][j].value);
                            }
                            resetPicklist1 = critDropdownValues.indexOf(newQ.skipLogic.skipCriteria[i].skipV1) === -1;
                            resetPicklist2 = critDropdownValues.indexOf(newQ.skipLogic.skipCriteria[i].skipV2) === -1;
                        }
                        
                        if(resetPicklist1) {
                            newQ.skipLogic.skipCriteria[i].skipV1 = $scope.options.skipLogicValues[i][0].value;
                        }
                        else if(resetPicklist2) {
                            newQ.skipLogic.skipCriteria[i].skipV2 = $scope.options.skipLogicValues[i][0].value;
                        }
    
                    }
                    else {
                        if(skipOpChanged && skipQuestion.type.toLowerCase() === 'picklist') {
                            // Set the value to only the first 1 in the list
                            if((['con', 'dcon'].indexOf(newQ.skipLogic.skipCriteria[i].skipOp) === -1 && ['con', 'dcon'].indexOf(oldQ.skipLogic.skipCriteria[i].skipOp) > -1)) {
                                newQ.skipLogic.skipCriteria[i].skipV1 = newQ.skipLogic.skipCriteria[i].skipV1.slice(0, 1);
                                setMultipicklistTextValue(newQ.skipLogic.skipCriteria[i].skipV1, newQ.skipLogic.skipCriteria[i].index  - 1);
                            }
                        }
                    }
                }
            }

            if(skipQuestionChanged) {
                $scope.modalQuestionCriterionQuestionHasDisabledOption[i] = false;
            }
            if(skipOpChanged) {
                $scope.modalQuestionCriterionOpHasDisabledOption[i] = false;
            }
        }
    }

    // BE (00182091) - Populates all dropdowns and sets any values for skip logic inputs in the modal
    function initModalSkipLogicOptions(q) {
        $scope.options.skipLogicQuestions = getSkipLogicSkippableQuestions(q);
        for(var i = 0; i < q.skipLogic.skipCriteria.length; i++) {
            var skipQuestion = getSkipQuestion(q.skipLogic.skipCriteria[i].skipQ);
            q.skipLogic.skipCriteria[i].skipQType = skipQuestion.type;
            var usesDropdownsForValues = questionTypeUsesDropdownForValues(skipQuestion.type.toLowerCase());
            initModalSkipCriterionDropdowns(q, skipQuestion, usesDropdownsForValues, i);
            initModalSkipLogicValues(q, usesDropdownsForValues && (["MultiselectPicklist","Picklist"].indexOf(skipQuestion.type) === -1), i);
            setSkipLogicErrorFields(q.skipLogic.validation);
            if(skipQuestion.type === 'MultiselectPicklist' || skipQuestion.type === 'Picklist') {
                setMultipicklistTextValue(q.skipLogic.skipCriteria[i].skipV1, q.skipLogic.skipCriteria[i].index - 1);
            }
            else {
                $scope.modalQuestionCrtierionMultipicklistText[i] = '';
            }
        }
    }

    function initModalSkipCriterionDropdowns(q, skipQuestion, usesDropdownsForValues, i) {
        $scope.options.skipLogicOperators[i] = getSkipLogicOperatorOptionsForQuestion(skipQuestion, q.skipLogic.skipCriteria[i]);
        if(usesDropdownsForValues) {
            $scope.options.skipLogicValues[i] = getSkipLogicValuesOptions(skipQuestion, q.skipLogic.skipCriteria[i]);
        }    
    }

    function initModalSkipLogicValues(q, usesDropdownsForValues, i) {
        if(usesDropdownsForValues) {
            if(util.isBlank(q.skipLogic.skipCriteria[i].skipV1)) {
                q.skipLogic.skipCriteria[i].skipV1 = $scope.options.skipLogicValues[i][0].value;
            } 
            if(util.isBlank(q.skipLogic.skipCriteria[i].skipV1)) {
                q.skipLogic.skipCriteria[i].skipV2 = $scope.options.skipLogicValues[i][0].value;
            }
        }
    }

    // BE (00182091) - These questions types uses dropdowns instead of regular inputs.
    function questionTypeUsesDropdownForValues(qType) {
        return ['nps', 'stars', 'thumbs', 'checkbox', 'picklist', 'multiselectpicklist'].indexOf(qType) > -1;
    }

    function closeQuestionModal() {
        $scope.addingQuestion = false;
        $scope.updatingQuestion = false;
        modalQuestionWatcher(); // Stop the watch group
        $scope.modalQuestion = null;
    }

    function createQuestion(andNew) {
        resetQuestionValidation();
        if(validateQuestion($scope.modalQuestion, true)) {
            $scope.addingQuestion = false;
            header.showSpinner(true, LABELS.creatingField);
            if($scope.modalQuestion.picklistValueType === "entered") {
                $scope.modalQuestion.globalValueSet = '';
            }

            $scope.modalQuestion.fullName = util.generateName($scope.modalQuestion.label) + '__c';

            var decimalPlaces = $scope.modalQuestion.type == 'Currency' ? 2 : $scope.modalQuestion.decimalPlaces;
            util.createField($scope.modalQuestion.fullName, $scope.modalQuestion.label, $scope.modalQuestion.type, 'Question Created by the Survey Builder', $scope.modalQuestion.inlineHelpText, $scope.modalQuestion.visibleLines, $scope.modalQuestion.picklistOptions.split('\n'), $scope.modalQuestion.globalValueSet, decimalPlaces, null, true).then(function(metadata) {
                $scope.modalQuestion.fullName = metadata.fullName.split('.')[1];    // Get the correct fullName
                allQuestionsMap[$scope.modalQuestion.fullName] = $scope.modalQuestion;
                $scope.selectedFields.push($scope.modalQuestion);
                util.getSurveyToolingIds().then(function(result) {
                    $scope.surveyObjectToolingId = result.objectId;
                    $scope.surveyFieldToolingIdsByName = result.fieldIdsByName;
                    if(andNew) {
                        initAddQuestionModal();
                    }
                    questionsDirty = true;
                    header.showSpinner(false);
                }).catch(function(reason) {
                    handleQuestionError(reason, false);
                });
            }).catch(function(reason) {
                handleQuestionError(reason, false);
            });  
        }
    }

    function updateQuestion() {
        header.showSpinner(true, LABELS.updatingField);
        $timeout(continueUpdateQuestion, 250);  // BE (00182091) - Use this so the spinner appears for a brief period before showing an error. If the same error message appeared again and this timeout wasn't here, it would look like nothing happened.
    }

    function continueUpdateQuestion() {
        resetQuestionValidation();
        if(validateQuestion($scope.modalQuestion, false)) {
            $scope.updatingQuestion = false;
            allQuestionsMap[$scope.modalQuestion.fullName] = $scope.modalQuestion;
            if($scope.picklistValueType === "entered") {
                $scope.globalValueSet = '';
            }

            $scope.modalQuestion.skipLogic.validation = {
                valid : true
            }

            var decimalPlaces = $scope.modalQuestion.type == 'Currency' ? 2 : $scope.modalQuestion.decimalPlaces;
            util.createField($scope.modalQuestion.fullName, $scope.modalQuestion.label, $scope.modalQuestion.type, 'Question Created by the Survey Builder', $scope.modalQuestion.inlineHelpText, $scope.modalQuestion.visibleLines, $scope.modalQuestion.picklistOptions.split('\n'), $scope.modalQuestion.globalValueSet, decimalPlaces, null, false).then(function(metadata) {
                metadata.fullName = metadata.fullName.split('.')[1];

                // need to preserve which list, location in list, and not create duplicates
                for(var i = 0; i < $scope.selectedFields.length; i++){
                    if($scope.selectedFields[i].fullName == metadata.fullName){
                        $scope.selectedFields[i] = $scope.modalQuestion;
                    }
                }
                
                for(var i = 0; i < $scope.availableFields.length; i++){
                    if($scope.availableFields[i].fullName == metadata.fullName){
                        $scope.availableFields[i] = $scope.modalQuestion;
                    }
                } 
                
                // If a picklist value is removed, re-evaluate skip logic for any questions that use this one.
                if($scope.modalQuestion.type === 'Picklist' || $scope.modalQuestion.type === 'MultiselectPicklist') {
                    var foundQ = false;
                    for(var i = 0; i < $scope.selectedFields.length; i++) {
                        if(foundQ) {
                            var q = $scope.selectedFields[i];
                            if(q.skipLogic.enabled) {
                                var skLogCritUsesModalQuestion = false;
                                for(var j = 0; j < q.skipLogic.skipCriteria.length && !skLogCritUsesModalQuestion; j++) {
                                    skLogCritUsesModalQuestion = q.skipLogic.skipCriteria[j].skipQ === $scope.modalQuestion.fullName;
                                }
                                if(skLogCritUsesModalQuestion) {
                                    q.skipLogic.validation = validateSkipLogicForQuestion(q, false, $scope.selectedFields, ($scope.selectedFields.length > 0) ? $scope.selectedFields[0].fullName : '');
                                }
                            }
                        }
                        else {
                            foundQ = $scope.selectedFields[i].fullName === $scope.modalQuestion.fullName;
                        }
                    }
                }
                questionsDirty = true;
                $scope.processing = false;
                $scope.modalQuestion = null;
            }).catch(function(reason) {
                handleQuestionError(reason, true);
            });
        }
        else {
            header.showSpinner(false);
        }
    }

    function updateQuestionLists(q) {
        allQuestionsMap[q.fullName] = q;
        for(var i = 0; i < $scope.selectedFields.length; i++) {
            if($scope.selectedFields[i].fullName === q.fullName) {
                $scope.selectedFields[i] = q;
                return;
            }
        }
    }

    // -- Skip Logic Validation --
    function resetQuestionValidation() {
        $scope.errorFields.modal.question = false;
        $scope.errorFields.modal.label = false;
        $scope.errorFields.modal.valueSet = false;
        $scope.errorFields.modal.choices = false;
        $scope.errorMessages.question = '';
        $scope.errorMessages.label = '';
        $scope.errorMessages.choices = '';
        $scope.errorMessages.valueSet = '';
    }

    function validateQuestion(q, isNewQuestion) {
        var skipLogicEnabled = $scope.config.enableSkipLogic && q.skipLogic.enabled;
        var questionConfigValid = validateQuestionConfig(q);
        if(skipLogicEnabled) {
            var skipLogicValidation = validateSkipLogicForQuestion(q, isNewQuestion, $scope.selectedFields, ($scope.selectedFields.length > 0) ? $scope.selectedFields[0].fullName : '');
            q.skipLogicValidation = skipLogicValidation;
            setSkipLogicErrorFields(q.skipLogicValidation);
            return questionConfigValid && q.skipLogicValidation.valid;
        }
        return questionConfigValid;
    }

    function validateQuestionConfig(q) {
        if(util.isBlank(q.inlineHelpText)) {
            $scope.errorFields.modal.question = true;
            $scope.errorMessages.question = LABELS.required;
        }
        if(util.isBlank(q.label)) {
            $scope.errorFields.modal.label = true;
            $scope.errorMessages.label = LABELS.required;
        }
        if(q.type == 'Picklist' || q.type == 'MultiselectPicklist'){
            if(q.picklistValueType === 'entered' && util.isBlank(q.picklistOptions)) {
                $scope.errorFields.modal.choices = true;
                $scope.errorMessages.choices = LABELS.required;
            }
            else if(q.picklistValueType === 'global' && util.isBlank(q.globalValueSet)) {
                $scope.errorFields.modal.valueSet = true;
                $scope.errorMessages.valueSet = LABELS.required;
            }
        }
        return !($scope.errorFields.modal.question || $scope.errorFields.modal.label || $scope.errorFields.modal.choices || $scope.errorFields.modal.valueSet);
    }

    // BE (00182091) - Validates skip logic for a single question.
    function validateSkipLogicForQuestion(q, isNewQuestion, questions, firstQuestionName) {
        var fieldNames = [];
        switch($scope.config.ratingScale) {
            case '0-1':
                fieldNames.push('thumbs');
                break;
            case '0-10':
                fieldNames.push('nps');
                break;
            case '1-5':
                fieldNames.push('stars');
                break;
        }
        for(var i = 0; i < questions.length; i++) {
            fieldNames.push(questions[i].fullName.toLowerCase());
        }

        var firstQuestionQuestionnaireAutoFail = firstQuestionName.toLowerCase() === q.fullName.toLowerCase() && $scope.config.ratingScale.toLowerCase() === 'none';

        for(var i = 0; i < q.skipLogic.skipCriteria.length; i++) {
            var crit = q.skipLogic.skipCriteria[i];
            var questionValidation = validateSkipLogicQuestion(fieldNames, crit, q, isNewQuestion, firstQuestionQuestionnaireAutoFail);
            if(questionValidation.valid) {
                var validOp = checkOpIsValid(crit, q);
                if(validOp) {
                    return checkValueIsValid(crit, q);
                }
                
                return generateSkipLogicValidation(false, getInvalidOpErrorMessage(crit.skipOp), crit.index, ["skipOp"]);
            }

            return questionValidation;
        }
    }

    // BE (00182091) - Checks if the "valid" field for all questions skip logic is set to true
    function skipLogicIsValid(questions) {
        var valid = true;
        for(var i = 0; i < questions.length && valid; i++) {
            var q = questions[i];
            if(q.skipLogic.enabled) {
                valid = q.skipLogic.validation.valid;
            }
        }
        return valid;
    }

    // BE (00182091) - Validates skip logic for multiple questions.
    function validateSkipLogicForQuestions(questions) {
        var firstQuestionName = (questions.length > 0) ? questions[0].fullName : '';
        var result = {
            valid : true,
            fields : {}
        };
        for(var i = 0; i < questions.length; i++) {
            var validation = (questions[i].skipLogic.enabled) ? validateSkipLogicForQuestion(questions[i], false, questions, firstQuestionName) : generateSkipLogicValidation(true);
            result.fields[questions[i].fullName] = validation;
            result.valid = result.valid && validation.valid; 
        }
        return result;
    }

    // BE (00182091) - Used to get an error message for skipV1.
    function getInvalidValueErrorMessage(value, hasValueMessage) {
        return (value) ? hasValueMessage : LABELS.skipLogicErrors.UI_VALUE_REQUIRED;
    }

    // BE (00182091) - Used to get an error message for skipV1 and/or skipV2.
    function getInvalidValuesErrorMessage(value1, value2, hasValuesMessage) {
        if(value1.length > 0 && value2.length > 0) { //NOPMD
            return hasValueMessage;
        }
        else if(value2.length > 0 || value1.length > 0) {
            return LABELS.skipLogicErrors.UI_VALUE_REQUIRED;
        }
        return LABELS.skipLogicErrors.UI_VALUES_REQUIRED;
    }
    
    // BE (00182091) - Used to get an error message for skipQ.
    function getInvalidQuestionErrorMessage(question, inSurvey) {
        if(inSurvey) {
            return (question) ? LABELS.skipLogicErrors.QUESTION_AFTER_ERROR : LABELS.skipLogicErrors.UI_QUESTION_REQUIRED;
        }
        return LABELS.skipLogicErrors.QUESTION_NOT_IN_SURVEY_ERROR;
    }

    // BE (00182091) - Used to get an error message for skipOp.
    function getInvalidOpErrorMessage(opValue) {
        return (opValue) ? LABELS.skipLogicErrors.INVALID_OP.format(getSkipLogicOperatorByOpValue(opValue)) : LABELS.skipLogicErrors.UI_OP_REQUIRED;
    }

    // BE (00182091) - Gets label of operator.
    function getSkipLogicOperatorByOpValue(opValue) {
        if(allSkipLogicOperatorMapping.hasOwnProperty(opValue)) {
            return allSkipLogicOperatorMapping[opValue];
        }
        return opValue;
    }

    // BE (00182091) - Uses a questions skipLogicValidation to determine which fields should have a red border in the modal as well as the error message that appears.
    function setSkipLogicErrorFields(skipLogicValidation) {
        $scope.errorMessages.skipLogicConfig = '';
        $scope.errorFields.modal.skipQ =  [];
        $scope.errorFields.modal.skipOp = [];
        $scope.errorFields.modal.skipV1 = [];
        $scope.errorFields.modal.skipV2 = [];
        if(skipLogicValidation && !skipLogicValidation.valid) {
            $scope.errorMessages.skipLogicConfig = skipLogicValidation.message;
            for(var i = 0; i < skipLogicValidation.critFields.length; i++) {
                var newVal = {};
                newVal["" + skipLogicValidation.critIndex] = true;
                $scope.errorFields.modal[skipLogicValidation.critFields[i]] = newVal;
            }
        }
    }

    // BE (00182091) - Generates a skip logic validation result.
    function generateSkipLogicValidation(valid, message, critIndex, critFields) {
        if(valid) {
            return {
                valid : true
            }
        }

        return {
            valid : false,
            message : message,
            critIndex : critIndex,
            critFields : critFields
        };
    }

    /*
        BE (00182091)
        The question in 'crit' must come before the current question 'field'.
        The type of the question in 'crit' must be supported.
    */
    function validateSkipLogicQuestion(fieldNames, crit, q,  isNewQuestion, firstQuestionQuestionnaireAutoFail) {
        if(firstQuestionQuestionnaireAutoFail) {
            return generateSkipLogicValidation(false, LABELS.skipLogicErrors.QUESTIONNAIRE_FIRST_QUESTION, 0, ['skipQ']);
        }

        var fieldsInOrder = isNewQuestion || checkFieldsInOrderInFieldSet(fieldNames, crit.skipQ.toLowerCase(), q.fullName.toLowerCase());
        if(fieldsInOrder) {
            if(['nps', 'stars', 'thumbs'].indexOf(crit.skipQ.toLowerCase()) === -1) {
                var skipQuestion = getSkipQuestion(crit.skipQ);
                if(supportedSkipLogicFieldTypes.indexOf(skipQuestion.type) > -1) {
                    return generateSkipLogicValidation(true);
                }
                return generateSkipLogicValidation(false, LABELS.skipLogicErrors.FIELD_TYPE_NOT_SUPPORTED.format([skipQuestion.type]), crit.index, ["skipQ"]);
            }
            
            return generateSkipLogicValidation(true);
        }
        
        return generateSkipLogicValidation(false, getInvalidQuestionErrorMessage(crit.skipQ, fieldNames.indexOf(crit.skipQ.toLowerCase())  > -1), crit.index, ["skipQ"]);
    }

    // BE (00182091)  - Returns true if f1 comes before f2 in the field set and both are in the field set (represented as a list of strings)
    function checkFieldsInOrderInFieldSet(fieldNames, f1, f2) {
        var found1 = false, found2 = false;
        for(var i = 0; i < fieldNames.length && !(found1 && found2); i++) {
            found1 = found1 || fieldNames[i] == f1;
            found2 = found2 || fieldNames[i] == f2;
            if(found2 && !found1) {
                return false;
            }
        }
        return found1 && found2;
    }

    function checkOpIsValid(crit, q) {
        switch(crit.skipQ.toLowerCase()) {
            // Score Fields
            case 'nps':
            case 'stars':
            case 'thumbs':  
                return validateOpByFieldType(crit, crit.skipQ.toLowerCase());
            default:
                q.skipLogic.skipQType = getSkipQuestion(crit.skipQ).type;
                return validateOpByFieldType(crit, q.skipLogic.skipQType.toUpperCase());
        }
    }

    // BE (00182091) - Certain field types may only use certain operators
    function validateOpByFieldType(crit, fieldType) {
        var validOps = [];
        switch(fieldType) {
            case 'CHECKBOX':
            case 'thumbs':
                validOps = ['eq', 'dne'];
                break;
            case 'MULTISELECTPICKLIST':
            case 'PICKLIST':
            case 'EMAIL':
            case 'PHONE':
            case 'TEXT':
            case 'TEXTAREA':   
            case 'LONGTEXTAREA': // All Picklist & Text fields
                validOps = ['eq', 'dne', 'con', 'dcon'];
                break;
            case 'CURRENCY':
            case 'NUMBER':
            case 'PERCENT':
            case 'nps':
            case 'stars': // All Number fields + nps and stars
                validOps = ['gt', 'gte', 'eq', 'dne', 'lte', 'lt', 'between', 'outside'];
                break;
        }
        return validOps.indexOf(crit.skipOp.toLowerCase()) > -1;
    }

    // BE (00182091) - Validate one or two values based on the question type
    function checkValueIsValid(crit, q) {
        switch(crit.skipQ.toLowerCase()) {
            case 'nps':
                return validateNPSValues(crit);
            case 'stars':
                return validateStarsValues(crit);
            case 'thumbs':
                return validateThumbsValues(crit);
            default:
                var skipQuestion = getSkipQuestion(crit.skipQ);
                q.skipLogic.skipQType = skipQuestion.type;
                switch(q.skipLogic.skipQType.toUpperCase()) {
                    case 'CHECKBOX':
                        return validateBooleanValues(crit);
                    case 'PICKLIST':
                    case 'MULTISELECTPICKLIST':
                        return validatePicklistValues(crit, skipQuestion);
                    case 'CURRENCY':
                    case 'NUMBER':
                    case 'PERCENT':
                        return validateNumericValues(crit);
                    case 'EMAIL':
                    case 'PHONE':
                    case 'TEXT':
                    case 'TEXTAREA':
                    case 'LONGTEXTAREA':
                        return validateTextValues(crit);
                }
        }
    }

    // BE (00182091) - NPS is a special case where the value can be numeric or one of three strings : 'detractors', 'passives', 'promoters'.
    function validateNPSValues(crit) {
        switch(crit.skipOp.toLowerCase()) {
            case 'gt':
            case 'gte':
            case 'eq':
            case 'dne':
            case 'lte':
            case 'lt':
                if(util.stringIsNumeric(crit.skipV1)) { // 0 - 10
                    var val = parseInt(crit.skipV1);
                    var valid = val > -1 && val < 11;
                    if(valid) {
                        crit.skipV1 = '' + val;   // In case they modify the dropdown with a decimal value.
                        return generateSkipLogicValidation(true);
                    }
                    return generateSkipLogicValidation(false, LABELS.skipLogicErrors.NPS_VALUE_RANGE_ERROR, crit.index, ["skipV1"]);
                }
                // NPS groups
                var valid = ['detractors', 'passives', 'promoters'].indexOf(crit.skipV1.toLowerCase()) > -1;
                return generateSkipLogicValidation(valid, getInvalidValueErrorMessage(crit.skipV1, LABELS.skipLogicErrors.NPS_VALUE_ERROR), crit.index, ['skipV1']);
            case 'between':
            case 'outside':
                if(util.stringIsNumeric(crit.skipV1) && util.stringIsNumeric(crit.skipV2)) {
                    var val1 = parseInt(crit.skipV1);
                    var val2 = parseInt(crit.skipV2);
                    var val1Valid = val1 > -1 && val1 < 11;
                    var val2Valid = val2 > -1 && val2 < 11;
                    var orderValid = val1 < val2;
                    if(!val1Valid || !val2Valid) { //NOPMD
                        var invalidFields = [];
                        if(!val1Valid){
                            invalidFields.push('skipV1');
                        }
                        if(!val2Valid){
                            invalidFields.push('skipV2');
                        }
                        return generateSkipLogicValidation(false, LABELS.skipLogicErrors.NPS_VALUE_RANGE_ERROR, crit.index, invalidFields);
                    }
                    else if(!orderValid) {
                        return generateSkipLogicValidation(false, LABELS.skipLogicErrors.BETWEEN_ORDER_ERROR, crit.index, ['skipV1', 'skipV2']);
                    }
                    // In case either field is modified to be a decimal
                    crit.skipV1 = '' + val1;
                    crit.skipV2 = '' + val2;
                    return generateSkipLogicValidation(true);
                }
                
                var invalidFields = [];
                if(!util.stringIsNumeric(crit.skipV1)){
                    invalidFields.push('skipV1');
                }
                if(!util.stringIsNumeric(crit.skipV2)){
                    invalidFields.push('skipV2');
                }
                return generateSkipLogicValidation(false, getInvalidValuesErrorMessage(crit.skipV1, crit.skipV2, LABELS.skipLogicErrors.NPS_VALUE_RANGE_ERROR), crit.index, invalidFields);
        }
        return generateSkipLogicValidation(false, getInvalidOpErrorMessage(crit.skipOp), crit.index, 'skipOp');
    }

    function validateStarsValues(crit) {
        switch(crit.skipOp.toLowerCase()) {
            case 'gt':
            case 'gte':
            case 'eq':
            case 'dne':
            case 'lte':
            case 'lt':
                if(util.stringIsNumeric(crit.skipV1)) { // 1-5
                    var val = parseInt(crit.skipV1);
                    var valid = val > 0 && val < 6;
                    if(valid) {
                        crit.skipV1 = '' + val;   // In case they modify the dropdown with a decimal value.
                        return generateSkipLogicValidation(true);
                    }
                }
                return generateSkipLogicValidation(false, getInvalidValueErrorMessage(crit.skipV1, LABELS.skipLogicErrors.STARS_VALUE_RANGE_ERROR), crit.index, ['skipV1']);
            case 'between':
            case 'outside':
                if(util.stringIsNumeric(crit.skipV1) && util.stringIsNumeric(crit.skipV2)) {
                    var val1 = parseInt(crit.skipV1);
                    var val2 = parseInt(crit.skipV2);
                    var val1Valid = val1 > 0 && val1 < 6;
                    var val2Valid = val2 > 0 && val2 < 6;
                    var orderValid = val1 < val2;
                    if(!val1Valid || !val2Valid) { //NOPMD
                        var invalidFields = [];
                        if(!val1Valid){
                            invalidFields.push('skipV1');
                        }
                        if(!val2Valid){
                            invalidFields.push('skipV2');
                        }
                        return generateSkipLogicValidation(false, LABELS.skipLogicErrors.STARS_VALUE_RANGE_ERROR, crit.index, invalidFields);
                    }
                    else if(!orderValid) {
                        return generateSkipLogicValidation(false, LABELS.skipLogicErrors.BETWEEN_ORDER_ERROR, crit.index, ['skipV1', 'skipV2']);
                    }
                    crit.skipV1 = '' + val1;
                    crit.skipV2 = '' + val2;
                    return generateSkipLogicValidation(true);
                }
                
                var invalidFields = [];
                if(!util.stringIsNumeric(crit.skipV1)){
                    invalidFields.push('skipV1');
                }
                if(!util.stringIsNumeric(crit.skipV2)){
                    invalidFields.push('skipV2');
                }
                return generateSkipLogicValidation(false, getInvalidValuesErrorMessage(crit.skipV1, crit.skipV2, LABELS.skipLogicErrors.STARS_VALUE_RANGE_ERROR), crit.index, invalidFields);
        }
        return generateSkipLogicValidation(false, getInvalidOpErrorMessage(crit.skipOp), crit.index, 'skipOp');
    }

    // BE (00182091) - Values must either be "rateup" or "ratedown"
    function validateThumbsValues(crit) {
        var valid = (crit.skipV1 === 'rateup' || crit.skipV1 === 'ratedown');
        return generateSkipLogicValidation(valid, getInvalidValueErrorMessage(crit.skipV1, LABELS.skipLogicErrors.INVALID_THUMBS_ERROR), crit.index, ['skipV1']);
    }

    // BE (00182091) - Values must either be "true" or "false"
    function validateBooleanValues(crit) {
        var valid = crit.skipV1 === 'true' || crit.skipV1 === 'false';
        return generateSkipLogicValidation(valid, getInvalidValueErrorMessage(crit.skipV1, LABELS.skipLogicErrors.INVALID_BOOLEAN_ERROR), crit.index, ['skipV1']);
    }

    // BE (00182091) - Values must be in the list of all picklists values for the field
    function validatePicklistValues(crit, q) {
        var picklistValues = getAllPicklistValuesFromQuestion(q);
        var critValues = crit.skipV1;
        if(critValues.length === 0 && (crit.skipOp === 'con' || crit.skipOp === 'dcon')) {
            return generateSkipLogicValidation(false, LABELS.skipLogicErrors.VALUE_REQUIRED, crit.index, ['skipV1']);
        }
        var invalidValues = [];
        for(var i = 0; i < critValues.length; i++) {
            if(picklistValues.indexOf(critValues[i].toLowerCase()) === -1) {
                invalidValues.push(critValues[i]);
            }
        }
        return (invalidValues.length === 0) ? generateSkipLogicValidation(true) :  generateSkipLogicValidation(false, getInvalidValueErrorMessage(crit.skipV1, LABELS.skipLogicErrors.INVALID_PICKLIST_VALUES_ERROR.format(invalidValues.join(', '))), crit.index, ['skipV1']);
    }

    // BE (00182091) - Values (strings) must represent a number.
    function validateNumericValues(crit) {
        switch(crit.skipOp.toLowerCase()) {
            case 'gt':
            case 'gte':
            case 'eq':
            case 'dne':
            case 'lte':
            case 'lt':
                var valid = util.stringIsNumeric(crit.skipV1);
                return generateSkipLogicValidation(valid, LABELS.skipLogicErrors.NON_NUMERIC_ERROR, crit.index, ['skipV1']);
            case 'between':
            case 'outside':
                var val1Valid = util.stringIsNumeric(crit.skipV1);
                var val2Valid = util.stringIsNumeric(crit.skipV2);
                if(val1Valid && val2Valid) {
                    var val1 = parseFloat(crit.skipV1);
                    var val2 = parseFloat(crit.skipV2);
                    var valid = val1 < val2;
                    return generateSkipLogicValidation(valid, LABELS.skipLogicErrors.BETWEEN_ORDER_ERROR, crit.index, ['skipV1', 'skipV2']);
                }
                
                var invalidFields = [];
                if(!val1Valid){
                    invalidFields.push('skipV1');
                }
                if(!val2Valid){
                    invalidFields.push('skipV2');
                }
                return generateSkipLogicValidation(false, LABELS.skipLogicErrors.NON_NUMERIC_ERROR, crit.index, invalidFields);
        }
        return generateSkipLogicValidation(false, getInvalidOpErrorMessage(crit.skipOp), crit.index, ['skipOp']);
    }

    // BE (00182091) - Can be any text, except if the operator is "Contains (con)" or "Does Not Contain (dcon)" in which the values cannot be blank.
    function validateTextValues(crit) {
        if(crit.skipOp === 'con' || crit.skipOp === 'dcon') {
            return generateSkipLogicValidation(!util.isBlank(crit.skipV1), LABELS.skipLogicErrors.VALUE_REQUIRED, crit.index, ['skipV1']);
        }
        return generateSkipLogicValidation(true);
    }


    // BE (00182091) - Remembers the last time the available and selected states were valid.
    function setLastValidState(available, selected) {
        lastValidState = {
            selected : [],
            available : []
        };
        angular.copy(selected, lastValidState.selected);
        angular.copy(available, lastValidState.available);
        $scope.skipLogicPopover.showUndo = true;
    }

    function clearLastValidState() {
        lastValidState = null;
        $scope.skipLogicPopover.showUndo = false;
    }

    // -- Popover -- 
    $scope.handleSkipLogicIconOnClick = function(question) {
        if(!question.skipLogic.validation.valid) {
            openPopoverForQuestion(question);
        }
    }

    $scope.handlePopoverCloseButtonOnClick = function(question) {
        closeSkipLogicPopover();
    }

    // BE (00182091) - Uses the lastValidState to restore invalid skip logic to valid skip logic.
    $scope.handlePopoverUndoButtonOnClick = function(question) {
        closeSkipLogicPopover();

        if(lastValidState !== null) {
            $scope.selectedFields = lastValidState.selected;
            $scope.availableFields = lastValidState.available;
            clearLastValidState();
        }
    }

    $scope.handlePopoverUpdateQuestionButtonOnClick = function(question) {
        closeSkipLogicPopover();
        initUpdateQuestionModal(question);
    }

    $scope.handlePopoverDisableSkipLogicButtonOnClick = function(question) {
        closeSkipLogicPopover();
        question.skipLogic.enabled = false;
        question.skipLogic.validation =generateSkipLogicValidation(true);
        updateQuestionLists(question);
    }

    function openPopoverForQuestion(q) {
        if($scope.skipLogicPopover.timeout) {
            $timeout.cancel($scope.skipLogicPopover.timeout);
        }
        $scope.skipLogicPopover.question = {};
        angular.copy(q, $scope.skipLogicPopover.question);
        $scope.skipLogicPopover.show = true;
        $scope.skipLogicPopover.showDisable = (q.skipLogic.validation.message.toLowerCase() === LABELS.skipLogicErrors.QUESTIONNAIRE_FIRST_QUESTION.toLowerCase());
        $scope.skipLogicPopover.showEdit = !$scope.skipLogicPopover.showDisable;
        $timeout(function() {
            positionPopover(q);
        }, 10);
    }
    
    // BE (00182091) - Given a question, positions the skip logic error popover over the "skip-logic-icon" for that questions row. Uses the "row-id" attribute.
    function positionPopover(question) {
        var iconRect = document.querySelector('.question[row-id="' + question.fullName + '"] .skip-logic-icon').getBoundingClientRect();
        var skipLogicErrorPopover = document.querySelector(".skip-logic-error-popover");
        var popoverRect = skipLogicErrorPopover.getBoundingClientRect();
        skipLogicErrorPopover.style.top = (iconRect.top - (popoverRect.height + (iconRect.height / 1.5)) + window.scrollY) + 'px';
        skipLogicErrorPopover.style.left = (iconRect.left - popoverRect.width + 32 + (iconRect.width / 4) + 2) + 'px';
    }

    function closeSkipLogicPopover() {
        $scope.skipLogicPopover.show = false;
        if($scope.skipLogicPopover.timeout) {
            $timeout.cancel($scope.skipLogicPopover.timeout);
        }
        $scope.skipLogicPopover.timeout = $timeout(function() {
            $scope.skipLogicPopover.question = null;
        }, 500);
    }

    // -- Save --
    $scope.handleSaveButtonOnClick = function() {
        save().then(showSaveSuccessfulPrompt).catch(showErrorAlert);
    }

    $scope.handleSaveAndContinueButtonOnClick = function() {
        save().then(proceedToNextStep).catch(showErrorAlert);
    }

    function save() {
        return $q(function(resolve, reject) {
            var surveyFields = [];
            $scope.selectedFields.forEach(function(field) {
                surveyFields.push({
                    field: field.fullName,
                    isFieldManaged: false,
                    isRequired: field.required
                });
            });

            fieldSet.availableFields = [];
            fieldSet.displayedFields = surveyFields;

            var skipLogicValid = true;
            if($scope.config.enableSkipLogic) {
                var skLogicValidationResult = validateSkipLogicForQuestions($scope.selectedFields);
                skipLogicValid = skLogicValidationResult.valid;
            }


            if(skipLogicValid) {
                header.showSpinner(true, LABELS.updatingFieldSet);
                util.saveFieldSet(fieldSet).then(function() {
                    header.showSpinner(true, LABELS.updatingRecordType);
                    util.addPicklistValuesToRecordType($scope.config.surveyRecordTypeId, $scope.selectedFields, $scope.globalValueSetValues).then(function() {
                        header.showSpinner(true, LABELS.updatingLayout);
                        var fields = surveyFields.reduce(function(acc, item) {
                            return acc.concat(item.field);
                        }, []);
    
                        util.addFieldsToLayout(util.escapeXMLEntities(layoutName), fields, false, 'Questions').then(function() {
                            header.showSpinner(true, LABELS.updatingFLS);
                            util.updateFieldSecurity(fields).then(function() {
                                var config = {Id: $routeParams.id};
                                if($scope.config.lastStepCompleted === 'Configure Survey Object') {
                                    config[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Add Questions';
                                    if($scope.$root.lastStep < 3) {
                                        $scope.$root.lastStep = 3;
                                    }
                                }
                                config[PKG_NS_PREFIX + 'Enable_Skip_Logic__c'] = $scope.config.enableSkipLogic;
                                config[PKG_NS_PREFIX + 'Skip_Logic_Configuration__c'] = stringifySkipLogic();
                                header.showSpinner(true, LABELS.savingConfiguration);
                                ctrl.saveConfiguration(config).then(function(result) {
                                    $scope.processing = false;
                                    util.removeDirtyFlag();
                                    questionsDirty = false;
                                    resolve({success : true});
                                }).catch(showErrorAlert);
                            }).catch(showErrorAlert);
                        }).catch(showErrorAlert);
                    }).catch(showErrorAlert);
                }).catch(showErrorAlert);
            }
            else {
                showErrorAlert('Cannot save due to invalid skip logic. Please see individual questions for more details.');
            }
        });
    }

    /*
        BE (00182091)
        Converts a skip logic configuration object to a JSON string for saving. We need to do this since the fields
        for the APEX object and the JavaScript object aren't 1-to-1.
    */
    function stringifySkipLogic() {
        var skipLogic = {
            fields: []
        };

        for(var i = 0; i < $scope.selectedFields.length; i++) {
            var q = $scope.selectedFields[i];
            if(q.skipLogic.enabled || q.randomizeAnswerOrder) {
                var skipLogicEntry = {
                    field : q.fullName,
                    enabled : q.skipLogic.enabled,
                    criteria : [],
                    formula : q.skipLogic.formula,
                    randomize : q.randomizeAnswerOrder && ['Picklist', 'MultiselectPicklist'].indexOf(q.type) > -1
                };
                for(var j = 0; j < q.skipLogic.skipCriteria.length; j++) {
                    var crit = q.skipLogic.skipCriteria[j];
                    skipLogicEntry.criteria.push(
                        {
                            index : j+1,
                            skipQ : crit.skipQ,
                            skipOp : crit.skipOp,
                            skipV1 : (typeof crit.skipV1 === "object") ? JSON.stringify(crit.skipV1) : crit.skipV1,
                            skipV2 : crit.skipV2
                        }
                    );
                }
                skipLogic.fields.push(skipLogicEntry);
            }
        }
        return JSON.stringify(skipLogic);
    }

    function showSaveSuccessfulPrompt() {
        header.showAlert(true, LABELS.configurationSaved, LABELS.configurationSavedMessage, 'success');
    }

    function proceedToNextStep() {
        header.goToStep("Branding", "AddQuestions", $routeParams.id);
    }

    // -- Error Handlers --
    /*
    *   Only used for metadata handlers when creating/updating a question.
    *   1. Hides the question modal
    *   2. Shows the Error Alert
    *   3. When the user clicks "Okay" on the error prompt, brings back the question modal.
    */
    function handleQuestionError(reason, updating) {
        header.showSpinner(false);
        var title = "Error " + ((updating) ? "Updating" : "Creating") + " Question"
        header.showAlert(true, title, util.formatErrorMessages(reason), "error");
        if(updating) {
            $scope.headerAlertOkayAction = function() {
                $scope.headerAlertOkayAction = null;
                $scope.updatingQuestion = true;
            }            
        }
        else {
            $scope.headerAlertOkayAction = function() {
                $scope.headerAlertOkayAction = null;
                $scope.addingQuestion = true;
            }
        }
    }

    // Shows the error notification
    function showErrorAlert(reason) {
        header.handleError({
            HTMLMessage : util.formatErrorMessages(reason),
            popup : true
        });
    }

    // -- Code Generated Event Listeners --
    // BE (00182091) - Used to reposition the skip logic error popover.
    var selectedDropzoneOverflow = document.querySelector('[name="dropzone"][data-dropzone-key="s"] .overflow');
    window.addEventListener('resize', handleWindowOnResizeForAddQuestions);
    window.addEventListener('scroll', handleWindowOnScrollForAddQuestions);
    window.addEventListener('beforeunload', handleWindowOnBeforeUnloadForAddQuestions);
    window.addEventListener('click', handleWindowOnClickForAddQuestions);
    selectedDropzoneOverflow.addEventListener("scroll", handleSelectedDropzoneOnScroll);

    // BE (00182091) - Remove any event listeners set in code before leaving the "AddQuestions" section.
    $scope.$on("$destroy", function() {
        window.removeEventListener("resize", handleWindowOnResizeForAddQuestions);
        window.removeEventListener("scroll", handleWindowOnScrollForAddQuestions);
        window.removeEventListener('beforeunload', handleWindowOnBeforeUnloadForAddQuestions);
        window.removeEventListener('click', handleWindowOnClickForAddQuestions);
        selectedDropzoneOverflow.removeEventListener("scroll", handleSelectedDropzoneOnScroll);
    });

    function handleWindowOnBeforeUnloadForAddQuestions(e) {
        if(questionsDirty) {
            // Cancel the event
            e.preventDefault(); // If you prevent default behavior in Mozilla Firefox prompt will always be shown
            // Chrome requires returnValue to be set
            e.returnValue = '';
        }
    }

    function handleWindowOnResizeForAddQuestions(e) {
        repositionPopoverOnWindowEvent();
        updateModalUI();
    }

    function handleWindowOnScrollForAddQuestions(e) {
        repositionPopoverOnWindowEvent();
    }

    function repositionPopoverOnWindowEvent() {
        // Reposition the skipLogicPopover on window resize.
        if($scope.skipLogicPopover.show) {
            $timeout(function() {
                positionPopover($scope.skipLogicPopover.question);
            }, 1);
        }
    }

    function handleSelectedDropzoneOnScroll(e) {
        if($scope.skipLogicPopover.question !== null) {
            $timeout(function() {
                positionPopover($scope.skipLogicPopover.question);
                var popover = document.querySelector(".skip-logic-error-popover");
                var popoverRect = popover.getBoundingClientRect();
                if((popoverRect.y + popoverRect.height + 16) < selectedDropzoneOverflow.getBoundingClientRect().y) {
                    closeSkipLogicPopover();
                    $scope.$digest();
                }
            }, 1);
        }
    }

    if(getCanModifySurveyConfiguration()) {
        init();
    }
    else {
        header.goToStep("ChooseSurvey", "AddQuestions");
    }
}]);

// --( Controller for Customize Branding & Design )--
SurveyBuilder.controller('BrandingController', ['$scope', '$routeParams', '$q', 'ctrl', 'util', 'header', function($scope, $routeParams, $q, ctrl, util, header) {
    // GLOBALS
    var continueFlag;   // Set on "Save & Continue"
    
    function init() {
        $scope.step = 4;
        header.setScope($scope);
        header.showSpinner(true, LABELS.loading);

        $scope.cantUploadDocuments = !PERMISSIONS.CreateDocument;

        $scope.config = {};
        $scope.oldConfig = {};  // Used for comparison when determining if a new email template needs to be generated.

        // Live Preview Configuration
        $scope.livePreviewConfig = {
            view : 'desktop',
            rating : 0,
            logo : '',  // Can be an image url or document Id
            background : '',    // Can be an image url, document Id, or hex color.
            backgroundLayout : '',
            brandColor : '',
            
            thumbs : {
                customizeUp : '',
                customizeDown : '',
                upImage : '',   // Can be an image url or document Id
                downImage : ''  // Can be an image url or document Id
            },

            stars : {
                customizeSelected : '',
                customizeUnselected : '',
                selectedImage : '',     // Can be an image url or document Id
                unselectedImage : ''    // Can be an image url or document Id
            },
            
            // The initial ratings for the live preview by rating scale.
            defaultRatings : {
                '0-10' : 10,
                '1-5' : 3,
                '0-1' : 1
            },

            // The four picklist options that appear in the live preview
            demoOpts : [
                {value : 'Answer One' , label : LABELS.demoSurveyAnswers[0]},
                {value : 'Answer Two' , label : LABELS.demoSurveyAnswers[1]},
                {value : 'Answer Three' , label : LABELS.demoSurveyAnswers[2]},
                {value : 'Answer Four' , label : LABELS.demoSurveyAnswers[3]}
            ]
        }

        $scope.documents = {};  // All Document Dropdown Options (by folder) + Presets
        $scope.starsNotConfigured = true;

        $scope.$on("$viewContentLoaded", function() {
            util.resizePreview();
        });

        setupConfig().then(function(result) {
            util.timeout(function() {
                util.initColorPickers();    // The color pickers need some time to set up.
                header.showSpinner(false);
                header.showMissingPermissionsAlert();
            }, 1);
        }).catch(showErrorAlert);
    }

    function setupConfig() {
        return $q(function(resolve, reject) {
            ctrl.initBrandingStep($routeParams.id).then(function(initResult) {
                if(!(initResult.config)) {
                    reject(LABELS.noConfigFound);
                }

                var surveyConfig = initResult.config;
                $scope.documents = initResult.documentImages;
                $scope.folders = initResult.folders;
                $scope.defaultDocumentFolderId = initResult.simpleSurveyDocumentFolderId;

                if(initResult.documentImages.hasOwnProperty(initResult.simpleSurveyDocumentFolderId)) {
                    util.setPresetDocuments(initResult.documentImages, initResult.documentImages[initResult.simpleSurveyDocumentFolderId]);
                }
                
                initConfigs(surveyConfig, initResult);

                // Set the default rating
                if($scope.livePreviewConfig.defaultRatings.hasOwnProperty($scope.config.ratingScale)) {
                    $scope.livePreviewConfig.rating = $scope.livePreviewConfig.defaultRatings[$scope.config.ratingScale];
                }
                initWatches($scope.config);
                resolve('');
            });
        });
    }

    // Set "$scope.config" and "$scope.oldConfig"
    function initConfigs(surveyConfig, initResult) {
        $scope.oldConfig = {};
        $scope.oldConfig.ratingScale = surveyConfig[PKG_NS_PREFIX + 'Rating_Scale__c'];
        $scope.oldConfig.lastStepCompleted = surveyConfig[PKG_NS_PREFIX + 'Last_Step_Completed__c'];
        header.setLastStep($scope.oldConfig.lastStepCompleted);
        $scope.oldConfig.newTemplateNeeded = surveyConfig[PKG_NS_PREFIX + 'New_Template_Needed__c'];
        $scope.oldConfig.type = (surveyConfig[PKG_NS_PREFIX + 'Type__c']) ? surveyConfig[PKG_NS_PREFIX + 'Type__c'] : 'Classic';
        $scope.oldConfig.theme = (surveyConfig[PKG_NS_PREFIX + 'Theme__c']) ? surveyConfig[PKG_NS_PREFIX + 'Theme__c'] : '';

        switch($scope.oldConfig.type) {
            case 'Classic':
                setConfigurationFieldsForClassic($scope.oldConfig, surveyConfig, initResult);
                break;
            case 'Eclipse':
                setupConfigurationFieldsForEclipse($scope.oldConfig, surveyConfig, initResult);
        }

        switch($scope.oldConfig.ratingScale) {
            case '0-1':
                setConfigurationFieldsForThumbs($scope.oldConfig, surveyConfig, initResult);
                break;
            case '1-5':
                setConfigurationFieldsForStars($scope.oldConfig, surveyConfig, initResult);
                break;
        }

        // Landing Page Background
        $scope.oldConfig.customizeLandingPageBackground = (surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page__c'] : ('none');
        $scope.oldConfig.landingPageBackgroundColor = (surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Color__c']) ? surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Color__c'] : '';
        $scope.oldConfig.landingPageBackgroundImage = (surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Image__c'] : '';
        $scope.oldConfig.landingPageBackgroundDocument = (surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Document__c'] : 'none';
        $scope.oldConfig.landingPageBackgroundLayout = (surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Background_Layout__c'] && surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Background_Layout__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Background_Layout__c'] : 'Fill';
        if($scope.oldConfig.type === 'Eclipse') {
            let folderId = initResult.documentFieldToFolderId['Landing_Page_Document__c'];
            if(folderId) {
                $scope.oldConfig.landingPageBackgroundDocumentFolder = folderId;
            }
            else {
                $scope.oldConfig.landingPageBackgroundDocumentFolder = $scope.defaultDocumentFolderId;
            }
        }

        // Landing Page Logo
        $scope.oldConfig.customizeLandingPageLogo = (surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'] : 'none';
        $scope.oldConfig.landingPageLogoImage = (surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Image__c'] : '';
        $scope.oldConfig.landingPageLogoDocument = (surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'] : 'none';
        
        // Clear Responses
        $scope.oldConfig.showClearResponsesButton = surveyConfig[PKG_NS_PREFIX + 'Show_Clear_Responses_Button__c'];

        // From Custom Settings
        var settings = initResult.ssSettings;
        $scope.oldConfig.displayClearResponsesCheckbox = (settings[PKG_NS_PREFIX + 'Auto_Save_Partial_Responses__c']) ? settings[PKG_NS_PREFIX + 'Auto_Save_Partial_Responses__c'] : false,
        $scope.oldConfig.displayPreviewPrivacyDisclaimer = (Boolean(settings[PKG_NS_PREFIX + 'Privacy_Disclaimer_URL__c']) && settings[PKG_NS_PREFIX + 'Privacy_Disclaimer_URL__c'].length > 0)

        $scope.config = angular.copy($scope.oldConfig);
    }

    // Sets fields on the "config" object used when the rating type is "0-1"
    function setConfigurationFieldsForThumbs(config, surveyConfig, initResult) {
        config.customizeThumbsUp = (surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'] : 'none';
        config.thumbsUpImage = (surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Image__c'] : '';
        config.thumbsUpDocument = (surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] : 'none';

        config.customizeThumbsDown = (surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'] : 'none';
        config.thumbsDownImage = (surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Image__c'] : '';
        config.thumbsDownDocument = (surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] : 'none';
        
        if(config.type === 'Eclipse') {
            var thumbsHaveCustomization = config.customizeThumbsUp !== 'none' || config.customizeThumbsDown !== 'none';
            if(config.brandingStep === 'choose_theme' && !thumbsHaveCustomization) { // Special Case, brand new survey.
                config.thumbsRatingModel = 'thumbs';    // Just set the rating model. When we save the theme we'll populate the documents.
                config.landingPageRateUpDocumentFolder = initResult.simpleSurveyDocumentFolderId;   // Use "Simple Survey" folder
                config.landingPageRateDownDocumentFolder = initResult.simpleSurveyDocumentFolderId;
            }
            else {
                config.thumbsRatingModel = 'custom';
                if(config.theme !== '') { // You need a theme to use presets
                    var checkPresetResult = util.checkIfThumbsArePreset(config, $scope.documents);
                    if(checkPresetResult.isPreset) {
                        config.thumbsRatingModel = checkPresetResult.value;
                        setThumbsPreviewFromPreset(config);
                    }
                    if(!thumbsHaveCustomization) {
                        config.thumbsRatingModel = 'thumbs';
                        var preset = util.getPresetThumbs(config.thumbsRatingModel, $scope.documents, config.theme.toUpperCase());
                        config.customizeThumbsUp = 'Document';
                        config.customizeThumbsDown = 'Document';
                        config.thumbsUpDocument = preset.upPreset;
                        config.thumbsDownDocument = preset.downPreset;
                    }
                }
                config.landingPageRateUpDocumentFolder = initResult.documentFieldToFolderId['Thumbs_Up_Document__c'];
                config.landingPageRateDownDocumentFolder = initResult.documentFieldToFolderId['Thumbs_Down_Document__c'];
            }
        }
    }

    // Sets fields on the "config" object used when the rating type is "1-5"
    function setConfigurationFieldsForStars(config, surveyConfig, initResult) {
        switch(config.type) {
            case 'Classic':
                config.starConfigs = [];
                for(var i = 1; i <=5; i++) {
                    var option = surveyConfig[PKG_NS_PREFIX + 'Customize_Ratings_Stars_' + i + '_Of_5__c'];
                    var image = surveyConfig[PKG_NS_PREFIX + 'Ratings_Stars_' + i + '_Of_5_Image__c'];
                    var doc = 'none';

                    config.starConfigs.push({
                        customizeRatingStars : (option && option.length > 0) ? option : 'Default',
                        ratingStarsImage : (image) ? image : '',
                        ratingStarsDocument : doc
                    });
                }
                break;
            case 'Eclipse':
                config.useSelectedRatingStars = surveyConfig[PKG_NS_PREFIX + 'Use_Custom_Rating_Stars__c'];

                config.customizeUnselectedStar = (surveyConfig[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'] : 'none';
                config.unselectedStarImage = (surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Image__c'] : '';
                config.unselectedStarDocument = (surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] : 'none';
                
                config.customizeSelectedStar = (surveyConfig[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'] : 'none';
                config.selectedStarImage = (surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Image__c'] : '';
                config.selectedStarDocument = (surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] : 'none';

                var starsHaveCustomization = config.customizeSelectedStar !== 'none' || config.customizeUnselectedStar !== 'none';
                if(config.brandingStep === 'choose_theme' && !starsHaveCustomization) { // Special Case, brand new survey.
                    config.starsRatingModel = 'stars';    // Set the rating model and folders. When we save the theme we'll populate the documents.
                    config.landingPageSelectedStarDocumentFolder = initResult.simpleSurveyDocumentFolderId; // Use "Simple Survey" folder
                    config.landingPageUnselectedStarDocumentFolder = initResult.simpleSurveyDocumentFolderId;
                }
                else {
                    config.starsRatingModel = 'custom';
                    if(config.theme !== '') { // You need a theme to use presets
                        var checkPresetResult = util.checkIfStarsArePreset(config, $scope.documents);
                        if(checkPresetResult.isPreset) {
                            config.starsRatingModel = checkPresetResult.value;
                            setStarsPreviewFromPreset(config);
                        }
                        if(!starsHaveCustomization) {
                            config.starsRatingModel = 'stars';
                            var preset = util.getPresetStars(config.starsRatingModel, $scope.documents, config.theme.toUpperCase());
                            config.customizeSelectedStar = 'Document';
                            config.customizeUnselectedStar = 'Document';
                            config.selectedStarDocument = preset.selectedPreset;
                            config.unselectedStarDocument = preset.unselectedPreset;
                        }
                    }
                    config.landingPageSelectedStarDocumentFolder = initResult.documentFieldToFolderId['Selected_Rating_Star_Document__c'];
                    config.landingPageUnselectedStarDocumentFolder = initResult.documentFieldToFolderId['Unselected_Rating_Star_Document__c'];
                }
                break;
        }
    }

    // Sets fields on the "config" object used when the Survey Configuration type is "Classic"
    function setConfigurationFieldsForClassic(config, surveyConfig, initResult) {
        // Email Template Logo
        config.customizeEmailTemplateLogo = (surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] : 'none';
        config.emailTemplateLogoImage = (surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c'] : '';
        config.emailTemplateLogoDocument = (surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] : 'none';
        
        // Email Template Background
        config.customizeEmailTemplateBackground = (surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template__c'] && surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template__c'] : 'none';
        config.emailTemplateBackgroundColor = (surveyConfig[PKG_NS_PREFIX + 'Email_Template_Color__c']) ? surveyConfig[PKG_NS_PREFIX + 'Email_Template_Color__c'] : '';
        config.emailTemplateBackgroundImage = (surveyConfig[PKG_NS_PREFIX + 'Email_Template_Image__c']) ? surveyConfig[PKG_NS_PREFIX + 'Email_Template_Image__c'] : '';
        config.emailTemplateBackgroundDocument = (surveyConfig[PKG_NS_PREFIX + 'Email_Template_Document__c'] && surveyConfig[PKG_NS_PREFIX + 'Email_Template_Document__c'].length > 0) ? surveyConfig[PKG_NS_PREFIX + 'Email_Template_Document__c'] : 'none';
        
        // Classic Only Settings
        config.picklistDisplay = surveyConfig[PKG_NS_PREFIX + 'Picklist_Display__c'];
        config.multiPicklistDisplay = surveyConfig[PKG_NS_PREFIX + 'Multiselect_Picklist_Display__c'];
        config.displayRadioAboveLabel = surveyConfig[PKG_NS_PREFIX + 'Radio_Button_Above_Label__c'];
    }

    // Sets fields on the "config" object used when the Survey Configuration type is "Eclipse"
    function setupConfigurationFieldsForEclipse(config, surveyConfig, initResult) {
        config.brandingStep = (config.theme.length > 0) ? 'customize_branding' : 'choose_theme';  // Used to determine if user is choosing a theme or editing the live preview

        config.brandColor = (surveyConfig[PKG_NS_PREFIX + 'Brand_Color__c']) ? surveyConfig[PKG_NS_PREFIX + 'Brand_Color__c'] : '#8D31F7';
        config.landingPageLogoDocumentFolder = initResult.documentFieldToFolderId['Landing_Page_Logo_Document__c'];

        // Redirect Options
        var redirectType = (surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_Type__c']) ? surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_Type__c'] : 'None';
        config.redirectOn = (redirectType !== 'None');
        config.redirectImmediate = (redirectType === 'Immediate');
        config.redirectUrl = (surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_URL__c']) ? surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_URL__c'] : '';
        config.redirectDuration = (surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_Time__c']) ? surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_Time__c'] : 3;
    }

    // Sets up any angular watches.
    function initWatches(config) {
        if(config.type === 'Eclipse') {
            // Live Preview Logo Automatic Updates
            $scope.$watchGroup(['config.customizeLandingPageLogo', 'config.landingPageLogoDocument', 'config.landingPageLogoImage'], function(v) {
                $scope.livePreviewConfig.logoType = v[0];
                $scope.livePreviewConfig.logo = getUpdatedLivePreviewImage(v[0], v[1], v[2]);
            });

            if(config.ratingScale === '0-1') {
                // Live Preview Thumbs Up Automatic Updates
                $scope.$watchGroup(['config.customizeThumbsUp', 'config.thumbsUpDocument', 'config.thumbsUpImage'], function(v) {
                    $scope.livePreviewConfig.thumbs.customizeUp = v[0];
                    $scope.livePreviewConfig.thumbs.upImage = getUpdatedLivePreviewImage(v[0], v[1], v[2]);
                });

                // Live Preview Thumbs Down Automatic Updates
                $scope.$watchGroup(['config.customizeThumbsDown', 'config.thumbsDownDocument', 'config.thumbsDownImage'], function(v) {
                    $scope.livePreviewConfig.thumbs.customizeDown= v[0];
                    $scope.livePreviewConfig.thumbs.downImage = getUpdatedLivePreviewImage(v[0], v[1], v[2]);
                });
            }

            if(config.ratingScale === '1-5') {
                /*$scope.$watchGroup(['config.useSelectedRatingStars'], function(v, old) {
                    if($scope.starsNotConfigured) {
                        setFirstTimeStarsConfig($scope.config);
                    }
    
                    if($scope.starsNotConfigured && v[0] !== old[0]) {
                        $scope.starsNotConfigured = false;
                    }
                });*/

                // Live Preview Filled/Selected Star Automatic Updates
                $scope.$watchGroup(['config.customizeSelectedStar', 'config.selectedStarDocument', 'config.selectedStarImage'], function(v) {
                    $scope.livePreviewConfig.stars.customizeSelected = v[0];
                    $scope.livePreviewConfig.stars.selectedImage = getUpdatedLivePreviewImage(v[0], v[1], v[2]);
                });

                // Live Preview Hollow/Unselected Star Automatic Updates
                $scope.$watchGroup(['config.customizeUnselectedStar', 'config.unselectedStarDocument', 'config.unselectedStarImage'], function(v) {
                    $scope.livePreviewConfig.stars.customizeUnselected = v[0];
                    $scope.livePreviewConfig.stars.unselectedImage = getUpdatedLivePreviewImage(v[0], v[1], v[2]);
                });
            }

            // Live Preview Background Automatic Updates
            $scope.$watchGroup(['config.customizeLandingPageBackground', 'config.landingPageBackgroundDocument', 'config.landingPageBackgroundImage', 'config.landingPageBackgroundColor'], function(v, old) {
                $scope.livePreviewConfig.background = getUpdatedLivePreviewImage(v[0], v[1], v[2], v[3]);
                if(v[0] === 'Color' && old[0] !== 'Color') {
                    util.initColorPickers();
                }
            });

            // Live Preview Background Layout Automatic Updates
            $scope.$watchGroup(['config.landingPageBackgroundLayout'], function(v) {
                $scope.livePreviewConfig.backgroundLayout = v[0];
            });

            // Live Preview Brand Color Automatic Updates
            $scope.$watchGroup(['config.brandColor'], function(v) {
                $scope.livePreviewConfig.brandColor = v[0];
            });
        }
    }

    function setFirstTimeStarsConfig(config) {

    }

    // Given a customization type and its corresponding values, get the correct value.
    function getUpdatedLivePreviewImage(customizationType, document, image, color) {
        switch(customizationType) {
            case 'Document':
                return document;
            case 'Image':
                return (image) ? util.escapeQuotes(image) : '#';
            case 'Color':
                return color;
        }
        return 'none';
    }

    // Used to dynamically set the "for" attribute on labels where there are multiple inputs that can be used.
    $scope.getMultiOptionImageOrColorInputLabel = function(value) {
        return util.getMultiOptionImageOrColorInputLabel(value);
    }

    // Used to dynamically set the "for" attribute on labels where there are multiple inputs that can be used.
    $scope.getMultiOptionImageOrColorInputLabelForAttribute = function(value, documentInputId, imageURLInputId, colorInputId) {
        return util.getMultiOptionImageOrColorInputLabelForAttribute(value, documentInputId, imageURLInputId, colorInputId);
    }

    // Folder Changes
    $scope.handleLandingPageLogoFolderOnChange = function() {
        handleFolderChange("landingPageLogoDocumentFolder", "landingPageLogoDocument");
    }

    $scope.handleLandingPageBackgroundFolderOnChange = function() {
        handleFolderChange("landingPageBackgroundDocumentFolder", "landingPageBackgroundDocument");
    }

    $scope.handleLandingPageRateUpFolderOnChange = function() {
        handleFolderChange("landingPageRateUpDocumentFolder", "thumbsUpDocument");
    }
    
    $scope.handleLandingPageRateDownFolderOnChange = function() {
        handleFolderChange("landingPageRateDownDocumentFolder", "thumbsDownDocument");
    }
    
    $scope.handleLandingPageSelectedStarFolderOnChange = function() {
        handleFolderChange("landingPageSelectedStarDocumentFolder", "selectedStarDocument")
    }

    $scope.handleLandingPageUnselectedStarFolderOnChange = function() {
        handleFolderChange("landingPageUnselectedStarDocumentFolder", "unselectedStarDocument")
    }

    function handleFolderChange(folderFieldName, documentFieldName) {
        var info = {
            documents : $scope.documents,
            config : $scope.config,
            folderFieldName : folderFieldName,
            documentFieldName : documentFieldName,
            searchOptions : {
                excludeEmailVariants : true // Don't show any files auto-generated specifically for email templates.
            }
        };
        util.handleFolderChange(ctrl, showErrorAlert, info);
    }

    // File Upload
    $scope.handleFileDrop = function(event, element) {
        var input = element.querySelector("input");
        handleFileChange(input, event.dataTransfer.files[0]);
    }

    $scope.handleFileUploadInputOnChange = function(input) {
        handleFileChange(input, input.files[0]);
        $scope.$digest();
    }

    function handleFileChange(input, file) {
        util.handleFileInputChange(ctrl, header, input, file, function(result) {
            handleFileUploadOnComplete(result, input);
        });
    }

    // Completion Handler for "handleFileChange"
    function handleFileUploadOnComplete(result, input) {
        input.value = null;
        if(result.success) {    // Grab the updated documents list and set the newly uploaded document as the currently selected document.
            ctrl.getDocumentImagesForFolder(input.getAttribute("data-folder-id"), {excludeEmailVariants : true}).then(function(documentImages) {
                util.updateDocumentsMappingWithFolderId($scope.documents, input.getAttribute("data-folder-id"), documentImages);
                input.classList.add("ng-dirty");
                input.classList.remove("ng-pristine");
                switch(input.id) {
                    case 'lp-logo-file-upload':
                        $scope.config.landingPageLogoDocument = result.document.Id;
                        break;
                    case 'lp-bg-file-upload':
                        $scope.config.landingPageBackgroundDocument = result.document.Id;
                        break;
                    case 'lp-selected-star-file-upload':
                        $scope.config.selectedStarDocument = result.document.Id;
                        break;
                    case 'lp-unselected-star-file-upload':
                        $scope.config.unselectedStarDocument = result.document.Id;
                        break;
                    case 'lp-rate-up-file-upload':
                        $scope.config.thumbsUpDocument = result.document.Id;
                        break;
                    case 'lp-rate-down-file-upload':
                        $scope.config.thumbsDownDocument = result.document.Id;
                        break;
                }
                header.showSpinner(false);
            })
        }
        else {
            showErrorAlert(result.message);
        }
    }

    // Update Preview View
    $scope.handleDesktopPreviewClicked = function($event) {
        updatePreviewView('desktop');
    }

    $scope.handleMobilePreviewClicked = function($event) {
        updatePreviewView('mobile');
    }

    function updatePreviewView(newPreviewName) {
        if($scope.livePreviewConfig.view !== newPreviewName) {
            $scope.livePreviewConfig.view = newPreviewName;

            var oldPreviewName = (newPreviewName === 'desktop') ? 'mobile' : 'desktop';
            // To calculate the correct dimensions, we need to manually add the class when switching between mobile/desktop as the $digest hasn't
            // occurred yet. A timeout could be used with resizePreview, but it causes the wrong dimensions to show for a moment.
            var previewContent = document.getElementById("preview-content");
            previewContent.classList.remove(oldPreviewName + "-preview");
            previewContent.classList.add(newPreviewName + "-preview");
            util.resizePreview();
        }
    }

    // Rating Changes
    $scope.handleNPSRatingOnClick = function($event) {
        $scope.livePreviewConfig.rating = parseFloat($event.currentTarget.getAttribute("data-rating-score"));
    }

    $scope.handleStarRatingOnClick = function($event) {
        $scope.livePreviewConfig.rating = parseFloat($event.currentTarget.getAttribute("data-rating-score"));
    }

    $scope.handleThumbsRatingOnClick = function($event) {
        $scope.livePreviewConfig.rating = parseFloat($event.currentTarget.getAttribute("data-rating-score"));
    }

    // Hover Effects
    $scope.handleResponseOnMouseOver = function($event) {
        $event.currentTarget.querySelector(".response-decoration").classList.add("response-decoration-hover");
    }

    $scope.handleResponseOnMouseOut = function($event) {
        $event.currentTarget.querySelector(".response-decoration").classList.remove("response-decoration-hover");
    }

    // Update Thumbs
    $scope.handleThumbsRatingModelOnChange = function() {
        if($scope.config.thumbsRatingModel !== 'custom') {
            setThumbsPreviewFromPreset($scope.config);
        }
        else {
            $scope.livePreviewConfig.thumbs.customizeUp = $scope.config.customizeThumbsUp;
            $scope.livePreviewConfig.thumbs.upImage = getUpdatedLivePreviewImage($scope.config.customizeThumbsUp, $scope.config.thumbsUpDocument, $scope.config.thumbsUpImage);

            $scope.livePreviewConfig.thumbs.customizeDown = $scope.config.customizeThumbsDown;
            $scope.livePreviewConfig.thumbs.downImage = getUpdatedLivePreviewImage($scope.config.customizeThumbsDown, $scope.config.thumbsDownDocument, $scope.config.thumbsDownImage);
        }
    }

    function setThumbsPreviewFromPreset(config) {
        $scope.livePreviewConfig.thumbs.customizeUp = 'Document';
        $scope.livePreviewConfig.thumbs.customizeDown = 'Document';
        var preset = util.getPresetThumbs(config.thumbsRatingModel, $scope.documents, config.theme.toUpperCase());
        setThumbsPreview(preset.upPreset, preset.downPreset);
    }

    function setThumbsPreview(upPreset, downPreset) {
        $scope.livePreviewConfig.thumbs.upImage = upPreset;
        $scope.livePreviewConfig.thumbs.downImage = downPreset;
    }

    // Update Stars
    $scope.handleStarsRatingModelOnChange = function() {
        if($scope.config.starsRatingModel !== 'custom') {
            setStarsPreviewFromPreset($scope.config);
        }
        else {
            $scope.livePreviewConfig.stars.customizeSelectedStar = $scope.config.customizeSelectedStar;
            $scope.livePreviewConfig.stars.selectedImage = getUpdatedLivePreviewImage($scope.config.customizeSelectedStar, $scope.config.selectedStarDocument, $scope.config.selectedStarImage);

            $scope.livePreviewConfig.stars.customizeUnselectedStar = $scope.config.customizeUnselectedStar;
            $scope.livePreviewConfig.stars.unselectedImage = getUpdatedLivePreviewImage($scope.config.customizeUnselectedStar, $scope.config.unselectedStarDocument, $scope.config.unselectedStarImage);
        }
    }

    function setStarsPreviewFromPreset(config) {
        $scope.livePreviewConfig.stars.customizeSelected = 'Document';
        $scope.livePreviewConfig.stars.customizeUnselected = 'Document';
        var preset = util.getPresetStars(config.starsRatingModel, $scope.documents, config.theme.toUpperCase());
        setStarsPreview(preset.selectedPreset, preset.unselectedPreset);
    }

    function setStarsPreview(selectedPreset, unselectedPreset) {
        $scope.livePreviewConfig.stars.selectedImage = selectedPreset;
        $scope.livePreviewConfig.stars.unselectedImage= unselectedPreset;
    }

    // Menu
    $scope.handleMenuIconOnClick = function() {
        toggleMenu();
    }

    function toggleMenu() {
        document.getElementById("menu-dropdown").classList.toggle("menu-open");
    }

    function showMenu() {
        document.getElementById("menu-dropdown").classList.add("menu-open");
    }

    $scope.handleClearResponsesCheckboxOnChange = function() {
        if($scope.config.showClearResponsesButton) {
            showMenu();
        }
    }

    // Example Modal
    $scope.handleExampleButtonOnClick = function() {
        $scope.showExample = true;
    }

    $scope.handleExampleModalCancelButtonOnClick = function() {
        $scope.showExample = false;
    }

    // Save Branding
    $scope.handleSaveButtonOnClick = function() {
        if($scope.config.brandingStep === 'choose_theme') {
            saveTheme().then(handleSaveThemeOnSuccess).catch(showErrorAlert);
        }
        else {
           saveBranding().then(handleSaveOnSuccess).catch(showErrorAlert); 
        }
    }

    $scope.handleSaveAndContinueButtonOnClick = function() {
        continueFlag = true;
        if($scope.config.brandingStep === 'choose_theme') {
            saveTheme().then(handleSaveThemeOnSuccess).catch(showErrorAlert);
        }
        else {
            saveBranding().then(handleSaveOnSuccess).catch(showErrorAlert);
        }
    }

    function saveBranding() {
        return $q(function(resolve, reject) {
            header.showSpinner(true, LABELS.savingConfiguration);

            var surveyConfig = {
                'Id' : $routeParams.id
            };

            if($scope.config.lastStepCompleted !== 'Create Email Template') {
                surveyConfig[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Customize Branding & Design';
            }

            if($scope.config.type === 'Classic') {
                // Email Template Logo
                surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] = ($scope.config.customizeEmailTemplateLogo !== 'none') ? $scope.config.customizeEmailTemplateLogo : '';
                surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c'] = $scope.config.emailTemplateLogoImage;
                surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] = ($scope.config.emailTemplateLogoDocument !== 'none') ? $scope.config.emailTemplateLogoDocument : '';

                // Email Template Background
                surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template__c'] = ($scope.config.customizeEmailTemplateBackground !== 'none') ? $scope.config.customizeEmailTemplateBackground  : '';
                surveyConfig[PKG_NS_PREFIX + 'Email_Template_Color__c'] = $scope.config.emailTemplateBackgroundColor;
                surveyConfig[PKG_NS_PREFIX + 'Email_Template_Image__c'] = $scope.config.emailTemplateBackgroundImage;
                surveyConfig[PKG_NS_PREFIX + 'Email_Template_Document__c'] = ($scope.config.emailTemplateBackgroundDocument !== 'none') ? $scope.config.emailTemplateBackgroundDocument : '';
            
                // Classic Stars
                if($scope.config.ratingScale === '1-5') {
                    for(var i = 1; i <=5; i++) {
                        var starConfig = $scope.config.starConfigs[i-1];
                        surveyConfig[PKG_NS_PREFIX + 'Customize_Ratings_Stars_' + i + '_Of_5__c'] = starConfig.customizeRatingStars;
                        surveyConfig[PKG_NS_PREFIX + 'Ratings_Stars_' + i + '_Of_5_Image__c'] = starConfig.ratingStarsImage;
                    }
                }

                // Classic Only Options
                surveyConfig[PKG_NS_PREFIX + 'Picklist_Display__c'] = $scope.config.picklistDisplay;
                surveyConfig[PKG_NS_PREFIX + 'Multiselect_Picklist_Display__c'] = $scope.config.multiPicklistDisplay;
                surveyConfig[PKG_NS_PREFIX + 'Radio_Button_Above_Label__c'] = $scope.config.displayRadioAboveLabel;
            }
            else {
                // Eclipse Stars
                if($scope.config.ratingScale === '1-5') {
                    surveyConfig[PKG_NS_PREFIX + 'Use_Custom_Rating_Stars__c'] = $scope.config.useSelectedRatingStars;
                    if($scope.config.useSelectedRatingStars) {
                        if($scope.config.starsRatingModel === 'custom') {
                            surveyConfig[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'] = ($scope.config.customizeUnselectedStar !== 'none') ? $scope.config.customizeUnselectedStar : '';
                            surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Image__c'] = $scope.config.unselectedStarImage;
                            surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] = ($scope.config.unselectedStarDocument !== 'none') ? $scope.config.unselectedStarDocument : '';
                
                            surveyConfig[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'] = ($scope.config.customizeSelectedStar !== 'none') ? $scope.config.customizeSelectedStar : '';
                            surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Image__c'] = $scope.config.selectedStarImage;
                            surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] = ($scope.config.selectedStarDocument !== 'none') ? $scope.config.selectedStarDocument : '';
                        }
                        else {
                            setSurveyConfigStarsWithPreset(surveyConfig, $scope.config.starsRatingModel, $scope.config.theme.toUpperCase());
                        }

                    }
                }


                // Eclipse Only Options
                surveyConfig[PKG_NS_PREFIX + 'Brand_Color__c'] = $scope.config.brandColor;

                var redirectType = 'None';
                if($scope.config.redirectOn) {
                    redirectType = ($scope.config.redirectImmediate) ? 'Immediate' : 'Timed';
    
                    if(util.isBlank($scope.config.redirectUrl)) {
                        reject(LABELS.redirectUrlRequired);
                    }
    
                    var redirectUrl = $scope.config.redirectUrl;
                    if(redirectUrl && !redirectUrl.startsWith('http://') && !redirectUrl.startsWith('https://')) {
                        redirectUrl = 'http://' + redirectUrl;
                    }
                    surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_URL__c'] = redirectUrl;
    
                    if(redirectType === 'Timed') {
                        surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_Time__c'] = $scope.config.redirectDuration;
                    }
                }
                surveyConfig[PKG_NS_PREFIX + 'Survey_Complete_Redirect_Type__c'] = redirectType;    
            }

            // Rate Up/ Rate Down
            if($scope.config.ratingScale == '0-1') {
                // Using custom thumb images or in Classic.
                if($scope.config.type === 'Classic' || ($scope.config.type === 'Eclipse' && $scope.config.thumbsRatingModel === 'custom')) {
                    surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'] = ($scope.config.customizeThumbsUp !== 'none') ? $scope.config.customizeThumbsUp : '';
                    surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Image__c'] = $scope.config.thumbsUpImage;
                    surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] = ($scope.config.thumbsUpDocument !== 'none') ? $scope.config.thumbsUpDocument : '';

                    surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'] = ($scope.config.customizeThumbsDown !== 'none') ? $scope.config.customizeThumbsDown : '';
                    surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Image__c'] = $scope.config.thumbsDownImage;
                    surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] = ($scope.config.thumbsDownDocument !== 'none') ? $scope.config.thumbsDownDocument : '';
                }
                else {  // Using a preset
                    setSurveyConfigThumbsWithPreset(surveyConfig, $scope.config.thumbsRatingModel, $scope.config.theme.toUpperCase());
                }

            }

            // Landing Page Background
            if($scope.config.type === 'Classic' || $scope.config.theme === 'Dark') {
                surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page__c'] = ($scope.config.customizeLandingPageBackground !== 'none') ? $scope.config.customizeLandingPageBackground : '';
                surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Color__c'] = $scope.config.landingPageBackgroundColor;
                surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Image__c'] = $scope.config.landingPageBackgroundImage;
                surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Document__c'] = ($scope.config.landingPageBackgroundDocument !== 'none') ? $scope.config.landingPageBackgroundDocument : '';
                surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Background_Layout__c'] = $scope.config.landingPageBackgroundLayout;
            }

            // Landing Page Logo
            surveyConfig[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'] = ($scope.config.customizeLandingPageLogo !== 'none') ? $scope.config.customizeLandingPageLogo : '';
            surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Image__c'] = $scope.config.landingPageLogoImage;
            surveyConfig[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'] = ($scope.config.landingPageLogoDocument !== 'none') ? $scope.config.landingPageLogoDocument : '';
            
            // Clear Responses
            surveyConfig[PKG_NS_PREFIX + 'Show_Clear_Responses_Button__c'] = $scope.config.showClearResponsesButton;

            var newTemplateNeeded = $scope.config.newTemplateNeeded || getNewTemplateNeededByConfig($scope.oldConfig, $scope.config);
            if(newTemplateNeeded) {
                surveyConfig[PKG_NS_PREFIX + 'New_Template_Needed__c'] = true;
            }

            ctrl.saveConfiguration(surveyConfig).then(function(result) {
                if(result == null) {
                    reject('An error occurred while saving the survey configuration');
                }
                else {
                    if($scope.$root.lastStep < 4) {
                        $scope.$root.lastStep = 4;
                    }
                    util.removeDirtyFlag();
                    resolve({
                        "newTemplateNeeded" : newTemplateNeeded
                    });
                }
            });
        });
    }

    function setSurveyConfigStarsWithPreset(surveyConfig, ratingModel, theme) {
        surveyConfig[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'] = 'Document';
        surveyConfig[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'] = 'Document';
        switch(ratingModel) {
            case 'stars':
                surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] = $scope.documents.presets.STAR_SELECTED[theme].STAR;
                surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] = $scope.documents.presets.STAR_UNSELECTED[theme].STAR;
                break;
            case 'hearts':
                surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] = $scope.documents.presets.STAR_SELECTED[theme].HEART;
                surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] = $scope.documents.presets.STAR_UNSELECTED[theme].HEART;
                break;
            case 'rockstars':
                surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] = $scope.documents.presets.STAR_SELECTED[theme].ROCKSTAR;
                surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] = $scope.documents.presets.STAR_UNSELECTED[theme].STAR;
                break;
        }
    }

    function setSurveyConfigThumbsWithPreset(surveyConfig, ratingModel, theme) {
        surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'] = 'Document';
        surveyConfig[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'] = 'Document';
        switch(ratingModel) {
            case 'thumbs':
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] = $scope.documents.presets.RATE_UP[theme].THUMB;
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] = $scope.documents.presets.RATE_DOWN[theme].THUMB;
                break;
            case 'happysad':
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] = $scope.documents.presets.RATE_UP[theme].HAPPY_SAD;
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] = $scope.documents.presets.RATE_DOWN[theme].HAPPY_SAD;
                break;
            case 'laughangry':
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] = $scope.documents.presets.RATE_UP[theme].LAUGH_ANGRY;
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] = $scope.documents.presets.RATE_DOWN[theme].LAUGH_ANGRY;
                break;
            case 'checkx':
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] = $scope.documents.presets.RATE_UP[theme].CHECK_X;
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] = $scope.documents.presets.RATE_DOWN[theme].CHECK_X;
                break;
            case 'hearts':
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] = $scope.documents.presets.RATE_UP[theme].HEART_HEARTBROKEN;
                surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] = $scope.documents.presets.RATE_DOWN[theme].HEART_HEARTBROKEN;
                break;
        }
    }
    
    // If any of the fields in "fields" does not match between the old and new configs, a new email tmplate needs to be generated.
    function getNewTemplateNeededByConfig(oldConfig, newConfig) {
        var fields = [  // Even though some of these fields are not set under certain circumstances, they will still be equal since both would be undefined.
                        'picklistDisplay', 'multiPicklistDisplay', 'radioButtonAboveLabel',
                        'customizeEmailTemplateBackground', 'emailTemplateBackgroundColor', 'emailTemplateBackgroundImage', 'emailTemplateBackgroundDocument', 
                        'customizeEmailTemplateLogo', 'emailTemplateLogoImage', 'emailTemplateLogoDocument',
                        'customizeThumbsUp', 'thumbsUpImage', 'thumbsUpDocument',
                        'customizeThumbsDown', 'thumbsDownImage', 'thumbsDownDocument',
                        'customizeRatingStars1', 'customizeRatingStars2', 'customizeRatingStars3', 'customizeRatingStars4', 'customizeRatingStars5',
                        'ratingStars1Image', 'ratingStars2Image', 'ratingStars3Image', 'ratingStars4Image', 'ratingStars5Image',
                        'useSelectedRatingStars', 'customizeUnselectedStar', 'unselectedStarImage', 'unselectedStarDocument', 'customizeSelectedStar', 'selectedStarImage',
                        'selectedStarDocument'
                    ];
        for(var i = 0; i < fields.length; i++) {
            if(oldConfig[fields[i]] !== newConfig[fields[i]]) {
                return true;
            }
        }
        return false;
    }

    function handleSaveOnSuccess(resolveObj) {
        header.showSpinner(false);
        if(resolveObj.newTemplateNeeded) {
            showSaveSuccessButNewTemplateNeededAlert(continueFlag);
        }
        else {
            if(continueFlag) {
                proceed();
            }
            else {
                showSaveSuccessAlert();
            }
        }
        continueFlag = false;
    }
    
    // Save Theme
    function saveTheme() {
        return $q(function(resolve, reject) {
            header.showSpinner(true, LABELS.savingTheme);

            var surveyConfig = {
                'Id' : $routeParams.id
            };
            surveyConfig[PKG_NS_PREFIX + 'Theme__c'] = $scope.config.theme;
            
            // If the user is using an Eclipse Preset, automatically switch the values from their old theme variations to their new theme variations.
            // Also sets the proper images if the user is setting the theme for a new survey.
            if($scope.config.type === 'Eclipse') {
                switch($scope.config.ratingScale) {
                    case '1-5':
                        if($scope.config.starsRatingModel !== 'custom') {
                            setSurveyConfigStarsWithPreset(surveyConfig, $scope.config.starsRatingModel, $scope.config.theme.toUpperCase());
                            if($scope.config.customizeSelectedStar === 'none' && $scope.config.customizeUnselectedStar === 'none') {    // Should only be true when the theme is set for the first time on a new survey.
                                $scope.config.customizeSelectedStar = $scope.config.customizeUnselectedStar = 'Document';
                                $scope.config.selectedStarDocument = surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'];
                                $scope.config.unselectedStarDocument = surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'];
                            }
                            else {
                                $scope.livePreviewConfig.customizeSelected = $scope.livePreviewConfig.customizeUnselected = 'Document';
                                $scope.livePreviewConfig.stars.selectedImage = surveyConfig[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'];
                                $scope.livePreviewConfig.stars.unselectedImage = surveyConfig[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'];
                            }
                        }
                        break;
                    case '0-1':
                        if($scope.config.thumbsRatingModel !== 'custom') {
                            setSurveyConfigThumbsWithPreset(surveyConfig, $scope.config.thumbsRatingModel, $scope.config.theme.toUpperCase());
                            if($scope.config.customizeThumbsUp === 'none' && $scope.config.customizeThumbsDown === 'none') { // Should only be true when the theme is set for the first time on a new survey.
                                $scope.config.customizeThumbsUp = $scope.config.customizeThumbsDown = 'Document';
                                $scope.config.thumbsUpDocument = surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'];
                                $scope.config.thumbsDownDocument = surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'];
                            }
                            else {
                                $scope.livePreviewConfig.thumbs.customizeUp  = $scope.livePreviewConfig.thumbs.customizeDown = 'Document';
                                $scope.livePreviewConfig.thumbs.upImage = surveyConfig[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'];
                                $scope.livePreviewConfig.thumbs.downImage = surveyConfig[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'];
                            }
                        }
                        break;
                }
            }

            ctrl.saveConfiguration(surveyConfig).then(function(result) {
                if(result == null) {
                    reject('An error occurred while saving the survey configuration');
                }
                else {
                    resolve('success');
                }
            });
        });
    }

    function handleSaveThemeOnSuccess() {
        if(continueFlag) {
            $scope.config.brandingStep = 'customize_branding';
        }
        else {
            showSaveSuccessAlert();
        }
        header.showSpinner(false);
        continueFlag = false;
    }

    function showSaveSuccessAlert() {
        header.showAlert(true, LABELS.configurationSaved, LABELS.configurationSavedMessage, 'success');
    }

    function showSaveSuccessButNewTemplateNeededAlert(doContinue) {
        header.showAlert(true, LABELS.updateYourEmailTemplate, LABELS.updateYourEmailTemplateMsg, "info");
        if(doContinue) {
            $scope.headerAlertOkayAction = function() {
                $scope.headerAlertOkayAction = null;
                proceed();
            }
        }
    }

    // Header Functionality
    $scope.handleSimpleSurveySetupButtonOnClick = function() {
        header.goToSimpleSurveySetup();
    }

    $scope.handleHeaderLinkOnClick = function(stepInfo) {
        if(header.canNavigate(stepInfo, $routeParams.id)) {
            var path = header.generateStepPath(stepInfo, $routeParams.id);
            var toEmailTemplate = path && path.indexOf('CreateEmailTemplate') > -1;
            // Special Case Where you can advance straight to the Email Template Step without having to update the branding after selecting a theme.
            if(toEmailTemplate && $scope.config.lastStepCompleted !== 'Customize Branding & Design' && $scope.config.lastStepCompleted !== 'Create Email Template') {
                if($scope.config.type === 'Classic' || $scope.config.brandingStep !== 'choose_theme') {
                    var surveyConfig = {
                        Id : $routeParams.id
                    };
                    surveyConfig[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Customize Branding & Design';
                    header.showSpinner(true, LABELS.savingConfiguration);
                    ctrl.saveConfiguration(surveyConfig).then(function() {
                        if($scope.$root.lastStep < 4) {
                            $scope.$root.lastStep = 4;
                        }
                        header.navigate(path, 'Branding', false);
                    }).catch(showErrorAlert);
                }
            }
            else {
                header.navigate(path, 'Branding', util.formIsDirty());
            }
        }
    }

    $scope.handleAlertOkayButtonOnClick = function() {
        header.alertOkayClicked();
    }

    $scope.handleNavConfirmCancelButtonOnClick = function() {
        header.navConfirmCancel();
    }

    $scope.handleNavConfirmSaveAndProceedButtonOnClick = function() {
        header.showAlert(false);
        saveBranding().then(function() {
            header.navigate($scope.proceedTo, 'Branding');
        }).catch(showErrorAlert);
    }

    $scope.handleNavConfirmProceedButtonOnClick = function() {
        header.showAlert(false);
        header.navigate($scope.proceedTo, 'Branding');
    }

    // Navigation
    $scope.handleChooseThemeButtonOnClick = function() {
        goToChooseTheme();
    }

    function goToChooseTheme() {
        header.showSpinner(true);
        setTimeout(function() {
            $scope.config.brandingStep = 'choose_theme';
            header.showSpinner(false);
            $scope.$digest();
        }, 500);
    }

    function proceed() {
        header.goToStep("CreateEmailTemplate", "Branding", $routeParams.id);
    }

    function showErrorAlert(reason) {
        header.handleError({
            HTMLMessage : util.formatErrorMessages(reason),
            popup : true
        });
    }

    // BE (00182091) - Handle Window Resize in controller instead of outside of all controllers
    window.addEventListener('resize', handleWindowOnResizeForBranding);

    $scope.$on("$destroy", function() {
        window.removeEventListener('resize', handleWindowOnResizeForBranding);
    });

    function handleWindowOnResizeForBranding(e) {
        util.resizePreview();
    }

    if(getCanModifySurveyConfiguration()) {
        init();
    }
    else {
        header.goToStep("ChooseSurvey", "Branding");
    }
}]);

// --( Controller for Create Email Template Step )--
SurveyBuilder.controller('CreateEmailTemplateController', ['$scope', '$routeParams', 'ctrl', 'util', 'header', function($scope, $routeParams, ctrl, util, header) {
    function init() {
        $scope.step = 5;
        header.setScope($scope);
        $scope.initialized = false;

        $scope.cantUploadDocuments = !PERMISSIONS.CreateDocument;
        header.showSpinner(true, LABELS.loadingTemplateInfo);

        $scope.templateDefaults = LABELS.templateDefaults;

        $scope.template = generateTemplateConfig();
        $scope.templateOutline = '';
        $scope.templatePreview = {
            view : 'desktop',
            greeting : '',
            closing : '',
            brandColor : '',
            logoType : '',
            logo : '',
            thumbsUpType : '',
            thumbsUp : '',
            thumbsDownType : '',
            thumbsDown : '',
            brandColor : '',
            useSelectedRatingStars : false,
            selectedStarType : '',
            selectedStar : '',
            unselectedStarType : '',
            unselectedStar : ''
        };

        $scope.branding = {
            brandColor : '',
            logoType : '',
            logoImage: '',
            logoDoc : ''
        };

        $scope.documents = {};

        $scope.$watchGroup(['branding.brandColor', 'branding.logoType', 'branding.logoImage', 'branding.logoDoc'], function(v) {
            switch(v[1]) {
                case 'Document':
                    $scope.templatePreview.logo = v[3];
                    break;
                case 'Image':
                    $scope.templatePreview.logo = util.escapeQuotes(v[2]);
                    break;
            }
            $scope.templatePreview.logoType = v[1];
            $scope.templatePreview.brandColor = v[0];
        });

        $scope.surveyConfig = {};
        $scope.settings = {};
        $scope.permissions = {
            haveCustomizeApplciation : getCanModifySurveyConfiguration()
        }
        $scope.baseImgUrl = '';

        $scope.options = {
            languages : [
                {value: "sq", label: "Albanian: sq"},
                {value: "ar", label: "Arabic: ar"},
                {value: "hy", label: "Armenian: hy"},
                {value: "eu", label: "Basque: eu"},
                {value: "bs", label: "Bosnian: bs"},
                {value: "bn", label: "Bengali: bn"},
                {value: "bg", label: "Bulgarian: bg"},
                {value: "zh_CN", label: "Chinese (Simplified): zh_CN"},
                {value: "zh_TW", label: "Chinese (Traditional): zh_TW"},
                {value: "hr", label: "Croatian: hr"},
                {value: "cs", label: "Czech: cs"},
                {value: "da", label: "Danish: da"},
                {value: "nl_NL", label: "Dutch: nl_NL"},
                {value: "en_US", label: "English: en_US"},
                {value: "en_AU", label: "English (Australia): en_AU"},
                {value: "en_CA", label: "English (Canada): en_CA"},
                {value: "en_IN", label: "English (India): en_IN"},
                {value: "en_MY", label: "English (Malaysia): en_MY"},
                {value: "en_PH", label: "English (Philippines): en_PH"},
                {value: "en_GB", label: "English (UK): en_GB"},
                {value: "et", label: "Estonian: et"},
                {value: "fi", label: "Finnish: fi"},
                {value: "fr", label: "French: fr"},
                {value: "fr_CA", label: "French (Canada): fr_CA"},
                {value: "de", label: "German: de"},
                {value: "de_AT", label: "German (Austria): de_AT"},
                {value: "de_CH", label: "German (Switzerland): de_CH"},
                {value: "ka", label: "Georgian: ka"},
                {value: "el", label: "Greek: el"},
                {value: "iw", label: "Hebrew: iw"},
                {value: "hi", label: "Hindi: hi"},
                {value: "hu", label: "Hungarian: hu"},
                {value: "is", label: "Icelandic: is"},
                {value: "in", label: "Indonesian: in"},
                {value: "ga", label: "Irish: ga"},
                {value: "it", label: "Italian: it"},
                {value: "ja", label: "Japanese: ja"},
                {value: "ko", label: "Korean: ko"},
                {value: "lv", label: "Latvian: lv"},
                {value: "lt", label: "Lithuanian: lt"},
                {value: "lb", label: "Luxembourgish: lb"},
                {value: "mk", label: "Macedonian: mk"},
                {value: "ms", label: "Malay: ms"},
                {value: "mt", label: "Maltese: mt"},
                {value: "sh_ME", label: "Montenegrin: sh_ME"},
                {value: "no", label: "Norwegian: no"},
                {value: "pl", label: "Polish: pl"},
                {value: "pt_BR", label: "Portuguese (Brazil): pt_BR"},
                {value: "pt_PT", label: "Portuguese (European): pt_PT"},
                {value: "ro", label: "Romanian: ro"},
                {value: "ro_MD", label: "Romanian (Moldova): ro_MD"},
                {value: "rm", label: "Romansh: rm"},
                {value: "ru", label: "Russian: ru"},
                {value: "es", label: "Spanish: es"},
                {value: "es_MX", label: "Spanish (Mexico): es_MX"},
                {value: "sv", label: "Swedish: sv"},
                {value: "sr", label: "Serbian (Cyrillic): sr"},
                {value: "sh", label: "Serbian (Latin): sh"},
                {value: "sk", label: "Slovak: sk"},
                {value: "sl", label: "Slovenian: sl"},
                {value: "tl", label: "Tagalog: tl"},
                {value: "ta", label: "Tamil: ta"},
                {value: "th", label: "Thai: th"},
                {value: "tr", label: "Turkish: tr"},
                {value: "uk", label: "Ukrainian: uk"},
                {value: "ur", label: "Urdu: ur"},
                {value: "vi", label: "Vietnamese: vi"},
                {value: "cy", label: "Welsh: cy"}
            ],
            folders : [],
            objects : []
        }

        $scope.starRatings = [
            {index : 5, text : LABELS.verySatisfied, customization: '', imgUrl : ''},
            {index : 4, text : LABELS.satisfied, customization: '', imgUrl : ''},
            {index : 3, text : LABELS.fair, customization: '', imgUrl : ''},
            {index : 2, text : LABELS.dissatisfied, customization: '', imgUrl : ''},
            {index : 1, text : LABELS.veryDissatisfied, customization: '', imgUrl : ''}
        ];

        $scope.mergeFields = {
            subject : {
                object : '',
                field : ''
            },
            greeting : {
                object : '',
                field : ''
            },
            closing : {
                object : '',
                field : ''
            }
        }

        $scope.requiredFieldsFocused = {
            'language' : false,
            'folder' : false,
            'templateName' : false,
            'subject' : false       
        }

        $scope.backgroundConfig = {
            customization : 'none',
            color : '',
            imageUrl : '',
            documentId : ''
        }

        $scope.lastCreatedTemplate = {
            id : '',
            name : ''
        }

        $scope.ratingScale = 'None';
        $scope.isClassic = false;
        $scope.canCreateTemplate = false;
        $scope.canSendInstructions = false;
        $scope.externalMarketing = {
            email : ((USER_EMAIL) ? USER_EMAIL : '')
        };
        $scope.sendSuccessful = false;

        $scope.$watchGroup(['template.name', 'template.language', 'template.subject', 'template.folderId', 'externalMarketing.email'], function(v) {
            $scope.canCreateTemplate = (v[0] && v[0].trim() !== '') && (v[1] && v[1].trim() !== '') && (v[2] && v[2].trim() !== '') && (v[3] && v[3].trim() !== '');
            $scope.canSendInstructions = (v[0] && v[0].trim() !== '') && (v[1] && v[1].trim() !== '') && (v[3] && v[3].trim() !== '') && (v[4] && v[4].trim() !== '');
        });

        $scope.$watchGroup(['mergeFields.subject.object', 'mergeFields.greeting.object', 'mergeFields.closing.object'], function(newV, oldV) {
            if(oldV[0].value !== newV[0].value) {
                $scope.mergeFields.subject.field = $scope.mergeFields.subject.object.fields[0]
            }

            if(oldV[1].value !== newV[1].value) {
                $scope.mergeFields.greeting.field = $scope.mergeFields.greeting.object.fields[0]
            }

            if(oldV[2].value !== newV[2].value) {
                $scope.mergeFields.closing.field = $scope.mergeFields.closing.object.fields[0]
            }
        });

        $scope.$on("$viewContentLoaded", function() {
            util.resizePreview();
        });

        ctrl.initEmailStep($routeParams.id).then(function(initResult) {
            var config = initResult.etInfo.configuration;
            if(!config) {
                throw LABELS.noConfigFound;
            }
            header.setLastStep(config[PKG_NS_PREFIX + 'Last_Step_Completed__c']);

            $scope.baseImgUrl = initResult.baseUrl;
            $scope.settings = initResult.etInfo.settings;
            $scope.documents = initResult.documentImages;
            $scope.assignmentFieldInfo = {
                dateFields : initResult.etInfo.dateFields,
                dateTimeFields : initResult.etInfo.dateTimeFields
            };

            $scope.ratingScale = config[PKG_NS_PREFIX + 'Rating_Scale__c'];
            $scope.surveyType = config[PKG_NS_PREFIX + 'Type__c'];
            $scope.isClassic = ($scope.surveyType) ? $scope.surveyType === 'Classic' : true;
            $scope.theme = config[PKG_NS_PREFIX + 'Theme__c'];
            
            $scope.template.firstTemplate = !(config[PKG_NS_PREFIX + 'Last_Created_Template_Id__c']) || config[PKG_NS_PREFIX + 'Last_Created_Template_Id__c'].length === 0;
            $scope.template.name = (config.Name) ? config.Name : '';
            $scope.template.subject = (config[PKG_NS_PREFIX + 'Subject__c'] && config[PKG_NS_PREFIX + 'Subject__c'].length > 0) ? config[PKG_NS_PREFIX + 'Subject__c'] : $scope.templateDefaults.subject;
            $scope.template.greeting = (config[PKG_NS_PREFIX + 'Last_Email_Template_Greeting__c']) ? config[PKG_NS_PREFIX + 'Last_Email_Template_Greeting__c'] : $scope.templateDefaults.greetings[$scope.ratingScale];
            $scope.template.unescapedGreeting = util.unescapeXMLEntities($scope.template.greeting);
            $scope.template.closing = (config[PKG_NS_PREFIX + 'Last_Email_Template_Closing__c']) ? config[PKG_NS_PREFIX + 'Last_Email_Template_Closing__c'] : $scope.templateDefaults.closing;
            $scope.template.unescapedClosing = util.unescapeXMLEntities($scope.template.closing);
            $scope.template.folderId = (initResult.etInfo.defaultFolderId) ? initResult.etInfo.defaultFolderId : '';
            
            // Logo
            if(config[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] && config[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'].length > 0) {
                $scope.branding.logoType = config[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'];
                $scope.branding.logoImage = (config[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c']) ? config[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c'] : '';
                $scope.branding.logoDoc = (config[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] && config[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'].length > 0) ? config[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] : 'none';
            }

            // Thumbs
            $scope.templatePreview.thumbsUpType = (config[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'] && config[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'].length > 0) ? config[PKG_NS_PREFIX + 'Customize_Thumbs_Up__c'] : 'none';
            switch($scope.templatePreview.thumbsUpType) {
                case 'Document':
                    var thumbsUpDocId = (config[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] && config[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'].length > 0) ? config[PKG_NS_PREFIX + 'Thumbs_Up_Document__c'] : 'none';
                    $scope.templatePreview.thumbsUp = (!$scope.isClassic && thumbsUpDocId !== 'none') ? initResult.documentIdToEmailVariantId[thumbsUpDocId] : thumbsUpDocId;
                    break;
                case 'Image':
                    $scope.templatePreview.thumbsUp = (config[PKG_NS_PREFIX + 'Thumbs_Up_Image__c']) ? config[PKG_NS_PREFIX + 'Thumbs_Up_Image__c'] : '';
                    break;
            }

            $scope.templatePreview.thumbsDownType = (config[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'] && config[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'].length > 0) ? config[PKG_NS_PREFIX + 'Customize_Thumbs_Down__c'] : 'none';
            switch($scope.templatePreview.thumbsDownType) {
                case 'Document':
                    var thumbsDownDocId = (config[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] && config[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'].length > 0) ? config[PKG_NS_PREFIX + 'Thumbs_Down_Document__c'] : 'none';
                    $scope.templatePreview.thumbsDown = (!$scope.isClassic && thumbsDownDocId !== 'none') ? initResult.documentIdToEmailVariantId[thumbsDownDocId] : thumbsDownDocId;
                    break;
                case 'Image':
                    $scope.templatePreview.thumbsDown = (config[PKG_NS_PREFIX + 'Thumbs_Down_Image__c']) ? config[PKG_NS_PREFIX + 'Thumbs_Down_Image__c'] : '';
                    break;
            }

            // Classic Only
            if($scope.isClassic) {
                $scope.backgroundConfig = {
                    customization : (config[PKG_NS_PREFIX + 'Customize_Email_Template__c'] && config[PKG_NS_PREFIX + 'Customize_Email_Template__c'].length > 0) ? config[PKG_NS_PREFIX + 'Customize_Email_Template__c'] : 'none',
                    color : (config[PKG_NS_PREFIX + 'Email_Template_Color__c']) ? config[PKG_NS_PREFIX + 'Email_Template_Color__c'] : '#FFFFFF',
                    imgUrl : (config[PKG_NS_PREFIX + 'Email_Template_Image__c']) ? config[PKG_NS_PREFIX + 'Email_Template_Image__c'] : '',
                    documentId : (config[PKG_NS_PREFIX + 'Email_Template_Document__c']) ? config[PKG_NS_PREFIX + 'Email_Template_Document__c'] : ''
                };

                for(var i = 0; i < $scope.starRatings.length; i++) {
                    $scope.starRatings[i].customization = (config[PKG_NS_PREFIX + 'Customize_Ratings_Stars_' + $scope.starRatings[i].index + '_Of_5__c'] && config[PKG_NS_PREFIX + 'Customize_Ratings_Stars_' + $scope.starRatings[i].index + '_Of_5__c'].length > 0) ? config[PKG_NS_PREFIX + 'Customize_Ratings_Stars_' + $scope.starRatings[i].index + '_Of_5__c'] : 'Default';
                    $scope.starRatings[i].imgUrl = (config[PKG_NS_PREFIX + 'Ratings_Stars_' + $scope.starRatings[i].index + '_Of_5_Image__c']) ? config[PKG_NS_PREFIX + 'Ratings_Stars_' + $scope.starRatings[i].index + '_Of_5_Image__c'] : '';
                }
            }
            // Eclipse Only
            else {
                if(config[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] && config[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'].length > 0)  {
                    // Set final variable needed for Eclipse.
                    $scope.branding.logoDocumentFolderId = initResult.documentFieldToFolderId['Email_Template_Logo_Document__c'];
                }
                // If this is the first time accessing this page with the current survey configuration, automatically use the landing page logo's email template variation.
                else if(config[PKG_NS_PREFIX + 'Last_Step_Completed__c'] !== 'Create Email Template' && $scope.branding.logoType === '' && config[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'] && config[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'].length > 0) {                 // If no Email Template Logo is specified, try using the Landing Page's logo.
                    $scope.branding.logoType = config[PKG_NS_PREFIX + 'Customize_Landing_Page_Logo__c'];
                    if($scope.branding.logoType === 'Image') {
                        $scope.branding.logoImage = (config[PKG_NS_PREFIX + 'Landing_Page_Logo_Image__c']) ? config[PKG_NS_PREFIX + 'Landing_Page_Logo_Image__c'] : '';
                    }
                    else if($scope.branding.logoType === 'Document') {
                        var logoDocId = (config[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'] && config[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'].length > 0) ? config[PKG_NS_PREFIX + 'Landing_Page_Logo_Document__c'] : 'none';
                        $scope.branding.logoDoc = (logoDocId !== 'none') ? initResult.documentIdToEmailVariantId[logoDocId] : logoDocId;
                    }
                    $scope.branding.logoDocumentFolderId = initResult.documentFieldToFolderId['Landing_Page_Logo_Document__c'];
                }
                else {
                    $scope.branding.logoType = 'none';
                    $scope.branding.logoImage = '';
                    $scope.branding.logoDoc = 'none';
                    $scope.branding.logoDocumentFolderId = initResult.simpleSurveyDocumentFolderId;
                }
                

                if(config[PKG_NS_PREFIX + 'Email_Template_Color__c'] && config[PKG_NS_PREFIX + 'Email_Template_Color__c'].length > 0) {
                    $scope.branding.brandColor = config[PKG_NS_PREFIX + 'Email_Template_Color__c'];
                }
                else {
                    $scope.branding.brandColor = (config[PKG_NS_PREFIX + 'Brand_Color__c']) ? config[PKG_NS_PREFIX + 'Brand_Color__c'] : '#8D31F7';
                }

                if(initResult.documentImages.hasOwnProperty(initResult.simpleSurveyDocumentFolderId)) {
                    util.setPresetDocuments(initResult.documentImages, initResult.documentImages[initResult.simpleSurveyDocumentFolderId]);
                }
                $scope.documents = initResult.documentImages;


                var cfg = {
                    theme : $scope.theme,
                    customizeThumbsUp : $scope.templatePreview.thumbsUpType,
                    thumbsUpDocument : ($scope.templatePreview.thumbsUpType == 'Document') ? $scope.templatePreview.thumbsUp : '',
                    customizeThumbsDown : $scope.templatePreview.thumbsDownType,
                    thumbsDownDocument : ($scope.templatePreview.thumbsDownType == 'Document') ? $scope.templatePreview.thumbsDown : ''
                };
                switch($scope.ratingScale) {
                    // Rate Up/Down
                    case '0-1':
                        var checkPresetResult = util.checkIfThumbsArePreset(cfg, $scope.documents);
                        if(checkPresetResult.isPreset) {
                            setEmailTemplateThumbsFromPreset(util.getPresetThumbs(checkPresetResult.value, $scope.documents, 'EMAIL'));
                        }
                        break;
                    
                    // Stars
                    case '1-5':
                        $scope.templatePreview.useSelectedRatingStars = config[PKG_NS_PREFIX + 'Use_Custom_Rating_Stars__c'];
                        if($scope.templatePreview.useSelectedRatingStars) {
                            $scope.templatePreview.selectedStarType = cfg.customizeSelectedStar = (config[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'] && config[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'].length > 0) ? config[PKG_NS_PREFIX + 'Customize_Selected_Rating_Star__c'] : 'none';
                            cfg.selectedStarDocument = (config[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] && config[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'].length > 0) ? config[PKG_NS_PREFIX + 'Selected_Rating_Star_Document__c'] : 'none';
                            switch(cfg.customizeSelectedStar) {
                                case 'Document':
                                    $scope.templatePreview.selectedStar = (cfg.selectedStarDocument !== 'none') ? initResult.documentIdToEmailVariantId[cfg.selectedStarDocument] : cfg.selectedStarDocument;
                                    break;
                                case 'Image':
                                    $scope.templatePreview.selectedStar = (config[PKG_NS_PREFIX + 'Selected_Rating_Star_Image__c']) ? config[PKG_NS_PREFIX + 'Selected_Rating_Star_Image__c'] : '';
                                    break;
                            }
    
                            $scope.templatePreview.unselectedStarType = cfg.customizeUnselectedStar = (config[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'] && config[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'].length > 0) ? config[PKG_NS_PREFIX + 'Customize_Unselected_Rating_Star__c'] : 'none';
                            cfg.unselectedStarDocument = (config[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] && config[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'].length > 0) ? config[PKG_NS_PREFIX + 'Unselected_Rating_Star_Document__c'] : 'none';
                            switch(cfg.customizeUnselectedStar) {
                                case 'Document':
                                    $scope.templatePreview.unselectedStar = (cfg.unselectedStarDocument) ? initResult.documentIdToEmailVariantId[cfg.unselectedStarDocument] : cfg.unselectedStarDocument;
                                    break;
                                case 'Image':
                                    $scope.templatePreview.unselectedStar = (config[PKG_NS_PREFIX + 'Unselected_Rating_Star_Image__c']) ? config[PKG_NS_PREFIX + 'Unselected_Rating_Star_Image__c'] : '';
                                    break;
                            }
    
                            var checkPresetResult = util.checkIfStarsArePreset(cfg, $scope.documents);
                            if(checkPresetResult.isPreset) {
                                setEmailTemplateStarsFromPreset(util.getPresetStars(checkPresetResult.value, $scope.documents, 'EMAIL'));
                            }
                        }

                        break;
                }

                $scope.options.documentFolders = initResult.documentFolders;
                $scope.defaultDocumentFolderId = initResult.simpleSurveyDocumentFolderId;
                refreshPreview();
            }

            $scope.templateOutline = (initResult.etInfo.template) ? initResult.etInfo.template : '';
            $scope.options.folders = (initResult.etInfo.folders) ? initResult.etInfo.folders : [];
            $scope.options.objects = (initResult.etInfo.objectFieldInfo) ? initResult.etInfo.objectFieldInfo : [];

            $scope.mergeFields = {
                subject : {
                    object : $scope.options.objects[0],
                    field : $scope.options.objects[0].fields[0]
                },
                greeting : {
                    object : $scope.options.objects[0],
                    field : $scope.options.objects[0].fields[0]
                },
                closing : {
                    object : $scope.options.objects[0],
                    field : $scope.options.objects[0].fields[0]
                }
            };

            $scope.lastCreatedTemplate = {
                id : (config[PKG_NS_PREFIX + 'Last_Created_Template_Id__c'])  ? config[PKG_NS_PREFIX + 'Last_Created_Template_Id__c'] : '',
                name : ''
            };

            $scope.surveyConfig = config;
            util.timeout(function() {
                    util.initColorPickers();
                    $scope.initialized = true;
                    util.timeout(function() {
                    header.showSpinner(false);
                    header.showMissingPermissionsAlert();
                    util.resizePreview();
                }, 500);
            }, 500);
        }).catch(handleInitError);
    }

    function setEmailTemplateThumbsFromPreset(preset) {
        $scope.templatePreview.thumbsUp = preset.upPreset;
        $scope.templatePreview.thumbsDown = preset.downPreset;
    }

    function setEmailTemplateStarsFromPreset(preset) {
        $scope.templatePreview.selectedStar = preset.selectedPreset;
        $scope.templatePreview.unselectedStar = preset.unselectedPreset;
    }

    $scope.handleEmailTemplateLogoFolderOnChange = function() {
        handleFolderChange("logoDocumentFolderId", "logoDoc");
    }

    function handleFolderChange(folderFieldName, documentFieldName) {
        var info = {
            documents : $scope.documents,
            config : $scope.branding,
            folderFieldName : folderFieldName,
            documentFieldName : documentFieldName,
            searchOptions : {
                emailVariantsOnly : true
            }
        };
        util.handleFolderChange(ctrl, showErrorAlert, info);
    }

    $scope.getMultiOptionImageOrColorInputLabel = function(value) {
        return util.getMultiOptionImageOrColorInputLabel(value);
    }

    $scope.getMultiOptionImageOrColorInputLabelForAttribute = function(value, documentInputId, imageURLInputId, colorInputId) {
        return util.getMultiOptionImageOrColorInputLabelForAttribute(value, documentInputId, imageURLInputId, colorInputId);
    }

    // File Upload
    // File Upload
    $scope.handleFileDrop = function(event, element) {
        var input = element.querySelector("input");
        handleFileChange(input, event.dataTransfer.files[0]);
    }

    $scope.handleFileUploadInputOnChange = function(input) {
        handleFileChange(input, input.files[0]);
        $scope.$digest();
    }

    function handleFileChange(input, file) {
        util.handleFileInputChange(ctrl, header, input, file, function(result) {
            handleFileUploadOnComplete(result, input);
        });
    }

    function handleFileUploadOnComplete(result, input) {
        input.value = null;
        if(result.success) {
            ctrl.getDocumentImagesForFolder(input.getAttribute("data-folder-id"), {excludeVariantsOnly : true}).then(function(documentImages) {
                util.updateDocumentsMappingWithFolderId($scope.documents, input.getAttribute("data-folder-id"), documentImages);
                switch(input.id) {
                    case 'em-logo-file-upload':
                        $scope.branding.logoDoc = result.document.Id;
                        break;
                }
                header.showSpinner(false);
            });
        }
        else {
            showErrorAlert(result.message);
        }
    }

    $scope.handleExampleButtonOnClick = function() {
        $scope.showExample = true;
    }

    $scope.handleExampleModalCancelButtonOnClick = function() {
        $scope.showExample = false;
    }

    $scope.handleLanguageInputOnBlur = function() {
        requiredFieldFocused('language');
    }
    
    $scope.handleFolderInputOnBlur = function() {
        requiredFieldFocused('folder');
    }

    $scope.handleTemplateNameInputOnBlur = function() {
        requiredFieldFocused('templateName');
    }

    $scope.handleSubjectInputOnBlur = function() {
        requiredFieldFocused('subject');
    }

    $scope.handleInsertSubjectMergeFieldButtonOnClick = function() {
        insertMergeField('Subject');
    }

    $scope.handleInsertGreetingMergeFieldButtonOnClick = function() {
        insertMergeField('Greeting');
    }

    $scope.handleInsertClosingMergeFieldButtonOnClick = function() {
        insertMergeField('Closing');
    }

    $scope.handleSetDefaultsButtonOnClick = function() {
        setDefaults();
    }

    $scope.handleRefreshPreviewLinkOnClick = function() {
        refreshPreview();
    }

    $scope.handleCreateTemplateButtonOnClick = function() {
        createTemplate(false);
    }

    $scope.handleSendInstructionsButtonOnClick = function() {
        sendInstructions();
    }

    $scope.handleDesktopPreviewClicked = function($event) {
        if($scope.templatePreview.view !== 'desktop') {
            $scope.templatePreview.view = 'desktop';

            // To calculate the correct dimensions, we need to manually add the class when switching between mobile/desktop as the $digest hasn't
            // occurred yet. A timeout could be used with resizePreview, but it causes the wrong dimensions to show for a moment.
            var previewContent = document.getElementById("preview-content");
            previewContent.classList.remove("mobile-preview");
            previewContent.classList.add("desktop-preview");
            util.resizePreview();
        }
    }

    $scope.handleMobilePreviewClicked = function($event) {
        if($scope.templatePreview.view !== 'mobile') {
            $scope.templatePreview.view = 'mobile';

            // To calculate the correct dimensions, we need to manually add the class when switching between mobile/desktop as the $digest hasn't
            // occurred yet. A timeout could be used with resizePreview, but it causes the wrong dimensions to show for a moment.
            var previewContent = document.getElementById("preview-content");
            previewContent.classList.add("mobile-preview");
            previewContent.classList.remove("desktop-preview");
            util.resizePreview();
        }
    }

    // Header Functionality
    $scope.handleSimpleSurveySetupButtonOnClick = function() {
        header.goToSimpleSurveySetup();
    }

    $scope.handleHeaderLinkOnClick = function(stepInfo) {
        if(header.canNavigate(stepInfo, $routeParams.id)) {
            var path = header.generateStepPath(stepInfo, $routeParams.id);
            header.navigate(path, 'CreateEmailTemplate', util.formIsDirty());
        }
    }

    $scope.handleAlertOkayButtonOnClick = function() {
        header.alertOkayClicked();
    }

    $scope.handleNavConfirmCancelButtonOnClick = function() {
        header.navConfirmCancel();
    }

    $scope.handleNavConfirmSaveAndProceedButtonOnClick = function() {
        header.showAlert(false);
        saveConfiguration().then(function() {
            header.navigate($scope.proceedTo, 'CreateEmailTemplate');
        }).catch(showErrorAlert);
    }

    $scope.handleNavConfirmProceedButtonOnClick = function() {
        header.showAlert(false);
        header.navigate($scope.proceedTo, 'CreateEmailTemplate');
    }

    $scope.handleDupeAlertProceedButtonOnClick = function() {
        header.showAlert(false);
        createTemplate(true);
    }

    $scope.handleDupeAlertCancelButtonOnClick = function() {
        header.showAlert(false);
    }

    // Helpers
    function generateTemplateConfig() {
        return {
            language : 'en_US',
            name : '',
            description : '',
            folderId : '',
            subject : '',
            greeting : $scope.templateDefaults.greetings['None'],
            closing : $scope.templateDefaults.closing,
            firstTemplate : true
        }
    }

    function requiredFieldFocused(key) {
        $scope.requiredFieldsFocused[key] = true;
    }

    function insertMergeField(templateSection) {
        var mergeField = getSelectedField(templateSection.toLowerCase());
        var id = 'email-' + templateSection.toLowerCase();
        var textArea = document.getElementById(id);
        var ss = textArea.selectionStart;
        var se = textArea.selectionEnd;

        textArea.value = textArea.value.substring(0, ss) + mergeField + textArea.value.substring(se);
        textArea.focus();
        textArea.selectionStart = textArea.selectionEnd = ss + mergeField.length;

        //Manually sync the model to match the updated DOM value (this was done in reverse of the Angular way to preserve the selection manually set above)
        $scope.template['unescaped' + templateSection] = textArea.value;
        $scope.template[templateSection.toLowerCase()] = util.unescapeXMLEntities(textArea.value);
        if(templateSection === 'Greeting' || templateSection === 'Closing') {
            refreshPreview();
        } 
    }

    function getSelectedField(section) {
        if(($scope.mergeFields[section].object.value && $scope.mergeFields[section].object.value.length > 0) && ($scope.mergeFields[section].field.value && $scope.mergeFields[section].field.value.length > 0)) {
            return getMergeField($scope.mergeFields[section].object.value, $scope.mergeFields[section].field.value, false, false);
        }
        
        return '';
    }

    function getMergeField(objectName, fieldName, isDateUrlParam, isDateTimeUrlParam) {
        var mergeField = objectName + '.' + fieldName;
        if(objectName == 'Contact' && fieldName == 'AccountId') { //NOPMD
            return '{!Account.Id}';
        }
        // (00178202) If using date and date time in the url parameters for field mappings, we need to use salesforce's standard date format
        else if(isDateUrlParam) { //NOPMD
            return '{!year(' + mergeField + ')}-' + '{!month(' + mergeField + ')}-' + '{!day(' + mergeField + ')}'; // YYYY-MM-DD
        }
        else if(isDateTimeUrlParam) {   // YYYY-MM-DD HH:mm:ss
            return '{!year(datevalue(text(' + mergeField + ')))}-' + '{!month(datevalue(text(' + mergeField + ')))}-' + '{!day(datevalue(text(' + mergeField + ')))} ' + '{!hour(timevalue(' + mergeField + '))}:' + '{!minute(timevalue(' + mergeField + '))}:' + '{!second(timevalue(' + mergeField + '))}';
        }
        
        return '{!' + mergeField + '}';
    }

    function setDefaults() {
        $scope.template.unescapedGreeting = $scope.templateDefaults.greetings[$scope.ratingScale];
        $scope.template.greeting = util.escapeXMLEntities($scope.template.unescapedGreeting);
        $scope.template.unescapedClosing = $scope.templateDefaults.closing;
        $scope.template.closing = util.escapeXMLEntities($scope.template.unescapedClosing);
        refreshPreview();
    }

    $scope.refreshPreviewTimeout;

    $scope.handleEmailClosingOnChange = function() {
        $scope.template.closing = util.escapeXMLEntities($scope.template.unescapedClosing);
        clearTimeout($scope.refreshPreviewTimeout);
        setRefreshPreviewTimeout();
    }

    $scope.handleEmailClosingOnBlur = function() {
        clearTimeout($scope.refreshPreviewTimeout);
        refreshPreview();
    }

    $scope.handleEmailGreetingOnChange = function() {
        $scope.template.greeting = util.escapeXMLEntities($scope.template.unescapedGreeting);
        clearTimeout($scope.refreshPreviewTimeout);
        setRefreshPreviewTimeout();
    }

    $scope.handleEmailGreetingOnBlur = function() {
        clearTimeout($scope.refreshPreviewTimeout);
        refreshPreview();
    }

    function setRefreshPreviewTimeout() {
        $scope.refreshPreviewTimeout = setTimeout(function() {
            refreshPreview();
        }, 1000);
    }

    function refreshPreview() {
        if(!$scope.isClassic) {
            $scope.templatePreview.greeting = $scope.template.greeting;
            $scope.templatePreview.closing = $scope.template.closing;

            // If html line breaks are not found, assume all line break characters are html line breaks.
            if(!hasHTMLBreaks($scope.template.greeting) && !hasHTMLBreaks($scope.template.closing)) {
                $scope.templatePreview.greeting = $scope.templatePreview.greeting.replace(/\r?\n/g, '<br/>');
                $scope.templatePreview.closing = $scope.templatePreview.closing.replace(/\r?\n/g, '<br/>');
            }

            var greetingDOM = document.getElementById("email-preview-greeting").querySelector("p");
            var closingDOM = document.getElementById("email-preview-closing").querySelector("p");

            greetingDOM.innerHTML = $scope.templatePreview.greeting;
            closingDOM.innerHTML = $scope.templatePreview.closing;            
        }
    }

    function saveConfiguration() {
        header.showSpinner(true, LABELS.savingConfiguration);
        var surveyConfig = {
            id : $routeParams.id
        };

        surveyConfig[PKG_NS_PREFIX + 'Last_Email_Template_Greeting__c'] = $scope.template.greeting;
        surveyConfig[PKG_NS_PREFIX + 'Last_Email_Template_Closing__c'] = $scope.template.closing;
        if(!$scope.isClassic) {
            surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] = ($scope.branding.logoType !== 'none') ? $scope.branding.logoType : '';
            surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c'] = $scope.branding.logoImage;
            surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] = ($scope.branding.logoDoc !== 'none') ? $scope.branding.logoDoc : '';
            surveyConfig[PKG_NS_PREFIX + 'Email_Template_Color__c'] = $scope.branding.brandColor;
        }
        return ctrl.saveConfiguration(surveyConfig);
    }

    function createTemplate(forceCreate) {
        if(forceCreate) {
            try {
                saveTemplate();
            }
            catch(e) {
                showErrorAlert(e);
            }
        }
        else {
            $scope.template.name = $scope.template.name.trim();
            $scope.template.subject = $scope.template.subject.trim();
            $scope.template.greeting = $scope.template.greeting.trim();
            $scope.template.closing = $scope.template.closing.trim();
            $scope.template.description = $scope.template.description.trim();
            
            header.showSpinner(true, "Validating");
            var invalidFields = validateTemplate();
            if(invalidFields.length === 0) {
                ctrl.checkTemplateExists($scope.template.name, $scope.template.folderId).then(function(result) {
                    if(result) {
                        header.showSpinner(false);
                        showDuplicateTemplateAlert();
                    }
                    else {
                        saveTemplate();
                    }
                }).catch(showErrorAlert);
            }
            else {
                
            }
        }
    }

    function validateTemplate() {
        var invalidFields = [];
        var fieldsToCheck = [
                                {name : 'language', label : 'Language'},
                                {name : 'folderId', label : 'Folder'}, 
                                {name : 'name', label : 'Template Name'}, 
                                {name : 'subject', label : 'Subject'}
                            ]
        for(var i = 0; i < fieldsToCheck.length; i++) {
            if(util.isBlank($scope.template[fieldsToCheck[i].name])) {
                invalidFields.push(fieldToCheck[i].label);
            }
        }
        return invalidFields;
    }

    function saveTemplate() {
        var templateContent = generateEmailTemplateContent(false);
        var developerName = util.generateName($scope.template.name) + '_' + (new Date()).toISOString().substring(2,19).replace(/[^\dT]/g, '').replace('T', '_');

        var surveyConfig = {
            id : $routeParams.id
        }
        surveyConfig[PKG_NS_PREFIX + 'Last_Email_Template_Greeting__c'] = surveyConfig[PKG_NS_PREFIX + 'Last_Email_Template_Greeting__c'] = $scope.template.greeting;
        surveyConfig[PKG_NS_PREFIX + 'Last_Email_Template_Closing__c'] = surveyConfig[PKG_NS_PREFIX + 'Last_Email_Template_Closing__c'] = $scope.template.closing;
        surveyConfig[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = surveyConfig[PKG_NS_PREFIX + 'Last_Step_Completed__c'] = 'Create Email Template';
        surveyConfig[PKG_NS_PREFIX + 'Subject__c'] = surveyConfig[PKG_NS_PREFIX + 'Subject__c'] = $scope.template.subject;
        if(!$scope.isClassic) {
            surveyConfig[PKG_NS_PREFIX + 'Customize_Email_Template_Logo__c'] = ($scope.branding.logoType !== 'none') ? $scope.branding.logoType : '';
            surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Image__c'] = $scope.branding.logoImage;
            surveyConfig[PKG_NS_PREFIX + 'Email_Template_Logo_Document__c'] = ($scope.branding.logoDoc !== 'none') ? $scope.branding.logoDoc : '';
            surveyConfig[PKG_NS_PREFIX + 'Email_Template_Color__c'] = $scope.branding.brandColor;
        }
        header.showSpinner(true, LABELS.creatingEmailTemplate);

        ctrl.insertTemplate($scope.template.name, developerName, $scope.template.subject, $scope.template.description, templateContent, $scope.template.folderId).then(function(templateId) {
            if(templateId !== null) {
                $scope.surveyConfig[PKG_NS_PREFIX + 'Last_Created_Template_Id__c'] = surveyConfig[PKG_NS_PREFIX + 'Last_Created_Template_Id__c'] = templateId;
                $scope.surveyConfig[PKG_NS_PREFIX + 'New_Template_Needed__c'] = surveyConfig[PKG_NS_PREFIX + 'New_Template_Needed__c'] = false;
                header.showSpinner(true, LABELS.savingConfiguration);
                ctrl.saveConfiguration(surveyConfig).then(function(result) {
                    header.setLastStep('Create Email Template');
                    $scope.lastCreatedTemplate.name = $scope.template.name;
                    $scope.lastCreatedTemplate.id = templateId
                    util.removeDirtyFlag();
                    header.showSpinner(false);
                    //showTemplateCreatedAlert();
                    showBuilderFinishedAlert();
                    $scope.template.firstTemplate = false;
                }).catch(showErrorAlert);
            }
        }).catch(showErrorAlert);
    }

    $scope.forceShowFinishedAlert = function() {
        $scope.lastCreatedTemplate.id = '00X0V000002ON3AUAW';
        showBuilderFinishedAlert();
    }

    function showDuplicateTemplateAlert() {
        header.showAlert(true, LABELS.templateAlreadyExists, LABELS.templateAlreadyExistsMsg.format($scope.template.name),"warning");
        header.showDupeTemplateButtons();
    }

    function showTemplateCreatedAlert() {
        var alertMessageHTML = LABELS.templateCreatedMsg.format($scope.lastCreatedTemplate.id, $scope.lastCreatedTemplate.name);
        if($scope.template.firstTemplate) {
            alertMessageHTML += LABELS.templateCreatedMsgAdditionalCreate;
        }
        else {
            alertMessageHTML += LABELS.templateCreatedMsgAdditionalUpdate;
        }

        header.showAlert(true, LABELS.success, alertMessageHTML, 'success');
    }

    function showBuilderFinishedAlert() {
        header.showAlert(true, LABELS.finishedAlert, LABELS.finishedAlertMsg, 'success');
        header.showFinishedAlertButtons();
    }

    $scope.handleFinishedAlertCancelButtonOnClick = function() {
        header.showAlert(false);
    }

    $scope.handleFinishedAlertViewTemplateButtonOnClick = function() {
        var inLightning = !!(sforce && sforce.one);
        var inWrongView = inLightning !== APEX.preferenceLEx;

        var path = '/' + $scope.lastCreatedTemplate.id;
        if(APEX.preferenceLEx) {
            path = '/lightning/setup/CommunicationTemplatesEmail/page?address=%2F' + $scope.lastCreatedTemplate.id + '%3Fsetupid%3DCommunicationTemplatesEmail';
        }

        window.open(path, '_blank');
        header.showAlert(false);
    }

    $scope.handleFinishedAlertReturnToSFButtonOnClick = function() {
        header.goToPage('/home/home.jsp');
    }

    function showNoTemplateUpdateNeededAlert() {
        header.showAlert(true, LABELS.noTemplateUpdateNeeded, LABELS.noTemplateUpdateNeededMsg, 'info');
    }

    function sendInstructions() {
        if(!util.isBlank($scope.externalMarketing.email)) {
            header.showSpinner(true, LABELS.sending);
            var templateContent = generateEmailTemplateContent(true);
            $scope.sendSuccessful = false;
            ctrl.sendExternalMarketingInstructions($scope.externalMarketing.email, templateContent, util.generateFileName($scope.template.name) + '.txt.', $scope.ratingScale, $scope.surveyType).then(function(errMsg) {
                if(errMsg) {
                    reject(errMsg);
                }
                else {
                    header.showSpinner(false);
                    $scope.sendSuccessful = true;
                }
            }).catch(showErrorAlert);
        }
        else {
            header.showAlert(true, LABELS.error, LABELS.emailRequired, 'error');
        }
    }

    function hasHTMLBreaks(string) {
        return string.indexOf('<br/>') > -1;
    }

    function generateEmailTemplateContent(forExternalEmail) {
        var template = '';
        var preHeaderFiller = '';
        // In case no greeting is given.
        if($scope.template.greeting.length === 0) {
            preHeaderFiller = 'Please take our survey.';
        }
        // Add about spacing up to 750 characters wide in order to not show the alt text for the email template logo.
        // This was enough to cover all mobile and desktop email clients I could work with.
        preHeaderFiller += '&zwnj;'.repeat(Math.max(750 - (preHeaderFiller.length + $scope.template.greeting.length), 0));
        
        if($scope.isClassic) {
            var links = generateLinks(forExternalEmail);
            if(forExternalEmail) {
                template = $scope.templateOutline.replace('[[PREHEADER]]', $scope.template.greeting).replace('[[PREHEADER_FILLER]]', preHeaderFiller).replace('[[GREETING]]', $scope.template.greeting).replace('[[FAREWELL]]', $scope.template.closing).replace('[[LINKS]]', links.desktop);
            }
            else{
                template = $scope.templateOutline.replace('[[PREHEADER]]', $scope.template.greeting).replace('[[PREHEADER_FILLER]]', preHeaderFiller).replace('[[GREETING]]', $scope.template.greeting.replace(/\n/g, '<br/>')).replace('[[FAREWELL]]', $scope.template.closing.replace(/\n/g, '<br/>')).replace('[[LINKS]]', links.desktop);
            }
        }
        else {
            var links = generateLinks(forExternalEmail);
            if(forExternalEmail) {
                template = $scope.templateOutline.replace('[[PREHEADER]]', $scope.template.greeting).replace('[[PREHEADER_FILLER]]', preHeaderFiller).replace('[[LINKS]]', links.desktop).replace('[[LINKS_MOBILE]]', links.mobile).replace(/\[\[BRAND_COLOR\]\]/g, $scope.branding.brandColor).replace('[[GREETING]]', $scope.template.greeting).replace('[[FAREWELL]]', $scope.template.closing);
            }
            else {
                template = $scope.templateOutline.replace('[[PREHEADER]]', $scope.template.greeting).replace('[[PREHEADER_FILLER]]', preHeaderFiller).replace('[[LINKS]]', links.desktop).replace('[[LINKS_MOBILE]]', links.mobile).replace(/\[\[BRAND_COLOR\]\]/g, $scope.branding.brandColor).replace('[[GREETING]]', $scope.template.greeting.replace(/\n/g, '<br/>')).replace('[[FAREWELL]]', $scope.template.closing.replace(/\n/g, '<br/>'));
            }
        }

        if(PKG_NS_PREFIX === '') {
            template.replace(/simplesurvey__/g, '');
        }

        if($scope.isClassic) {
            if($scope.backgroundConfig.customization === 'Color') {
                template = template.replace(new RegExp('bgcolor="#.*"', 'g'), 'bgcolor="' + $scope.backgroundConfig.color + '"');
            }
            else if($scope.backgroundConfig.customization === 'Image') {
                template = template.replace(new RegExp('bgcolor="#.*"', 'g'), '');
                template = template.replace('/*SURVEY_BUILDER_BG_STYLE*/', 'background-image: url(\'' + $scope.backgroundConfig.imgUrl + '\'); background-position: 0px 0px;');
            }
            else if($scope.backgroundConfig.customization === 'Document') {
                template = template.replace(new RegExp('bgcolor="#.*"', 'g'), '');
                template = template.replace('/*SURVEY_BUILDER_BG_STYLE*/', 'background-image: url(\'' + $scope.baseImgUrl + '&id=' + $scope.backgroundConfig.documentId + '\'); background-position: 0px 0px;');
            }
        }

        // Logo
        if($scope.branding.logoType === 'Image') {
            template = template.replace('{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Site_Logo__c}', $scope.branding.logoImage);
        }
        else if($scope.branding.logoType === 'Document') {
            template = template.replace('{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Site_Logo__c}', $scope.baseImgUrl + '&id=' + $scope.branding.logoDoc);
        }

        if($scope.ratingScale === '0-1') {
            // Thumbs Up
            if($scope.templatePreview.thumbsUpType === 'Image') {
                template = template.replace('{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Up_URL__c}', $scope.templatePreview.thumbsUp);
            }
            else if($scope.templatePreview.thumbsUpType === 'Document') {
                template = template.replace('{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Up_URL__c}', $scope.baseImgUrl + '&id=' + $scope.templatePreview.thumbsUp);
            }
    
            // Thumbs Down
            if($scope.templatePreview.thumbsDownType === 'Image') {
                template = template.replace('{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Down_URL__c}', $scope.templatePreview.thumbsDown);
            }
            else if($scope.templatePreview.thumbsDownType === 'Document') {
                template = template.replace('{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Down_URL__c}', $scope.baseImgUrl + '&id=' + $scope.templatePreview.thumbsDown);
            }
        }
        return template;
    }

    function generateLinks(mergeSiteURL) {
        var linksHTML = '';
        var mobileLinksHTML = '';
        if($scope.isClassic) {
            switch($scope.ratingScale) {
                case '0-10' :
                    linksHTML = generateNPSClassicLinks(mergeSiteURL);
                    break;
                case '1-5' :
                    linksHTML = generateStarsClassicLinks(mergeSiteURL);
                    break;
                case '0-1' :
                    linksHTML = generateThumbsClassicLinks(mergeSiteURL);
                    break;
                default :
                    linksHTML = generateQuestionnaireClassicLinks(mergeSiteURL);
                    break;
            }
        }
        else {
            switch($scope.ratingScale) {
                case '0-10' :
                    linksHTML = generateNPSEclipseDesktopLinks(mergeSiteURL);
                    mobileLinksHTML = generateNPSEclipseMobileLinks(mergeSiteURL);
                    break;
                case '1-5' :
                    linksHTML = generateStarsEclipseLinks(mergeSiteURL);
                    break;
                case '0-1' :
                    linksHTML = generateThumbsEclipseLinks(mergeSiteURL);
                    break;
                default :
                    linksHTML = generateQuestionnaireEclipseLinks(mergeSiteURL);
                    break;
            }
        }
        return {
            'desktop' : linksHTML,
            'mobile' : mobileLinksHTML
        };
    }

    function generateNPSClassicLinks(mergeSiteURL) {
        var links = '';
        var colorCodes = ['#cf4b4b', '#cf5744', '#cf6d38', '#cf9024', '#cfa11a', '#caa615', '#b0a514', '#879d15', '#599216', '#2b8719', 'green'];

        for(var i = 0; i < 11; i++) {
            var linkParts = [];
            linkParts.push('<td>');
            linkParts.push('<a style="text-decoration: none; color: ' + colorCodes[i] + '; font-weight: bold;" href="' + getRatingHref(i, mergeSiteURL) + '">');
            linkParts.push('<span  style="text-decoration: none;">' + i + '&#8203;</span>');
            linkParts.push('</a>');
            linkParts.push('</td>');

            links += linkParts.join('\n');
        }
        return links;
    }

    function generateStarsClassicLinks(mergeSiteURL) {
        var links = '';
        for(var i = 0; i < $scope.starRatings.length; i++) {
            var imgSrc = '';
            if($scope.starRatings[i].customization == 'Default') {
                imgSrc = '{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_' + $scope.starRatings[i].index + '_IMG__c}';
            }
            else if($scope.starRatings[i].customization == 'Image') {
                imgSrc = $scope.starRatings[i].imgUrl;
            }

            var linkParts = [];
            linkParts.push('<a style="text-decoration: none; color: #222222;" href="' + getRatingHref($scope.starRatings[i].index, mergeSiteURL) + '" border="0" alt="' + (5-i) + '">&nbsp;');
            linkParts.push('<img src="' + imgSrc + '" border="0" alt="' + (5-i)+ '" />');
            linkParts.push('<span style="text-decoration: underline;">' + $scope.starRatings[i].text + '&#8203;</span>');
            linkParts.push('</a>');
            linkParts.push('<br/><br/>');

            links += linkParts.join('\n');
        }
        return links;
    }

    function generateThumbsClassicLinks(mergeSiteURL) {
        var linkParts = [];
        linkParts.push('<div style="text-align: center;">');

        var style = 'text-decoration: none; color: #222222; display: inline-block; background-color: #eee; border-radius: 5px';
        
        // Thumbs Up
        linkParts.push('<a style="' + style + '" href="' + getRatingHref(1, mergeSiteURL) + '" border="0" alt="' + 1 + '">');
        linkParts.push('<img src="{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Up_URL__c}" border="0" alt="' + 1 + '"  style="height: 100px; width: 100px;"/>');
        linkParts.push('</a>');
        
        linkParts.push('&nbsp;');

        // Thumbs Down
        linkParts.push('<a style="' + style + '" href="' + getRatingHref(0, mergeSiteURL) + '" border="0" alt="' + 0 + '">');
        linkParts.push('<img src="{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Down_URL__c}" border="0" alt="' + 0 + '"  style="height: 100px; width: 100px;"/>');
        linkParts.push('</a>');
        linkParts.push('</div>');

        return linkParts.join('\n');
    }

    function generateQuestionnaireClassicLinks(mergeSiteURL) {
        return '<a href="' + getRatingHref(null, mergeSiteURL) + '">Click here to take our survey</a><br/><br/>\n';
    }

    function generateNPSEclipseDesktopLinks(mergeSiteURL) {
        var links = '';
        for(var i = 0; i < 11; i++) {
            var linkParts = [];
            linkParts.push('<!-- ' + i + '-->');
            linkParts.push('<th class="small-1 large-1 columns" style="Margin: 0 auto; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0 auto; padding: 0; padding-bottom: 5px; padding-left: 8px; padding-right: 8px; text-align: left; width: 32.33333px;">');
            linkParts.push('<table style="border-collapse: collapse; border-spacing: 0; padding: 0; text-align: left; vertical-align: top; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<th style="Margin: 0; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0; padding: 0; text-align: left;">');
            linkParts.push('<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-spacing: 0; padding: 0; text-align: left; vertical-align: top; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border-collapse: collapse !important; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; hyphens: auto; line-height: 1.3; margin: 0; padding: 0; text-align: left; vertical-align: top; word-wrap: break-word;">');
            linkParts.push('<table border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-spacing: 0; padding: 0; text-align: left; vertical-align: top; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td align="center" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border-collapse: collapse !important; border-radius: 3px; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; hyphens: auto; line-height: 1.3; margin: 0; padding: 0; text-align: left; vertical-align: top; word-wrap: break-word;" bgcolor="#FFFFFF" class="hoverCell">');

            // 0-9 are slightly different from 10
            if(i < 10) {
                linkParts.push('<a href="' + getRatingHref(i, mergeSiteURL) + '" style="Margin: 0; border: 1px solid #DDDDDD; border-radius: 3px; color: [[BRAND_COLOR]]; display: inline-block; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0; padding: 12px 18px; text-align: left; text-decoration: none;">');
            }
            else {
                linkParts.push('<a href="' + getRatingHref(i, mergeSiteURL) + '" style="Margin: 0; border: 1px solid #DDDDDD; border-radius: 3px; color: [[BRAND_COLOR]]; display: inline-block; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0; min-width: 20px; padding: 12px 14px; text-align: left; text-decoration: none;">');
            }
            linkParts.push(i);
            linkParts.push('</a>');

            linkParts.push('</td>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</td>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</th>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</th>');
            links += linkParts.join('\n');
        }

        return links;
    }

    function generateNPSEclipseMobileLinks(mergeSiteURL) {
        var links = '';
        for(var i = 10; i >= 0; i--) {
            var linkParts = [];
            linkParts.push('<!-- ' + i + '-->');
            linkParts.push('<table class="row onlyForMobile" style="border-collapse: collapse; border-spacing: 0; display: none; margin-bottom: 0px; margin-top: 0px; padding: 0; position: relative; text-align: left; vertical-align: top; visibility: hidden; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<th style="Margin: 0; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0; padding: 0; text-align: left;">');
            linkParts.push('<table class="button radius expanded eight" style="border-collapse: collapse; border-spacing: 0; margin: 0 0 8px 0; padding: 0; text-align: left; vertical-align: top; width: 100% !important;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border-collapse: collapse !important; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; hyphens: auto; line-height: 1.3; margin: 0; padding: 0; text-align: left; vertical-align: top; word-wrap: break-word;">');
            linkParts.push('<table border="0" cellspacing="0" cellpadding="0" width="100%" class="scoreButton" style="border-collapse: collapse; border-spacing: 0; padding: 0; text-align: left; vertical-align: top; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td align="center" bgcolor="#FFFFFF" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; background: #FFFFFF; border: 1px solid #DDDDDD; border-collapse: collapse !important; border-radius: 3px; color: [[BRAND_COLOR]]; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; hyphens: auto; line-height: 1.3; margin: 0; padding: 0 0; text-align: left; vertical-align: top; word-wrap: break-word;">');
            
            linkParts.push('<a href="' + getRatingHref(i, mergeSiteURL) + '" style="Margin: 0; border-radius: 3px; color: [[BRAND_COLOR]]; display: inline-block; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0; padding: 6px 0; padding-left: 0; padding-right: 0; text-align: center; text-decoration: none; width: 100%;">' + i + '</a>');
            
            linkParts.push('</td>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</td>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</th>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');

            links += linkParts.join('\n');
        }
        return links;
    }

    function generateStarsEclipseLinks(mergeSiteURL) {
        var links = '';
        for(var i = 0; i < $scope.starRatings.length; i++) {
            var linkParts = [];

            linkParts.push('<!-- ' + $scope.starRatings[i].index + '-->');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<th style="Margin: 0; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.3; margin: 0; padding: 0; text-align: left;">');
            linkParts.push('<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse; border-spacing: 0; margin: 0 0 0 0; padding: 0; text-align: left; vertical-align: top; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border-collapse: collapse !important; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; hyphens: auto; line-height: 1.3; margin: 0; padding: 0; text-align: left; vertical-align: top; word-wrap: break-word;">');
            linkParts.push('<table border="0" cellspacing="0" cellpadding="0" width="100%" class="scoreButton" style="border-collapse: collapse; border-spacing: 0; padding: 0; text-align: left; vertical-align: top; width: 100%;">');
            linkParts.push('<tbody>');
            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td align="center" bgcolor="#FFFFFF" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border: 1px solid #DDDDDD; border-collapse: collapse !important; border-radius: 3px; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: normal; hyphens: auto; line-height: 2; margin: 0; padding: 0px 0; text-align: left; vertical-align: top; word-wrap: break-word;" class="hoverCell">');
            linkParts.push('<p style="Margin: 0; color: [[BRAND_COLOR]]; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: normal; line-height: 2; margin: 0; padding: 0; text-align: center; cursor:pointer !important;">');
            linkParts.push('<a href="'+ getRatingHref($scope.starRatings[i].index) + '" style="Margin: 0; color: [[BRAND_COLOR]]; font-family: Helvetica, Arial, sans-serif; font-weight: normal; line-height: ' + (($scope.templatePreview.useSelectedRatingStars) ? '1.72' : '2') +  '; margin: 0; padding: 0; text-align: center; text-decoration: none; cursor:pointer !important; width:100%; display:block;">');

            var starHTML = [];
            for(var j = 1; j <= 5; j++) {
                if($scope.templatePreview.useSelectedRatingStars) {
                    var useSelectedStar = $scope.starRatings[i].index >= j;
                    if(useSelectedStar) {
                        if($scope.templatePreview.selectedStarType === 'Document') {
                            //linkParts.push('<img width="100px" src="{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Up_URL__c}" border="0" alt="Thumbs Up" />');
                            starHTML.push('<img width="25" height="25" src="' + $scope.baseImgUrl + '&id=' + $scope.templatePreview.selectedStar + '" border="0" alt="Filled Star" style="max-width: 25px; max-height: 25px; padding-top: 8px;"/>');
                        }
                        else {
                            starHTML.push('<img width="25" height="25" src="' + $scope.templatePreview.selectedStar + '" border="0" alt="Filled Star" style="max-width: 25px; max-height: 25px; padding-top: 8px;"/>');
                        }
                    }
                    else {
                        if($scope.templatePreview.unselectedStarType === 'Document') {
                            starHTML.push('<img width="25" height="25" src="' + $scope.baseImgUrl + '&id=' + $scope.templatePreview.unselectedStar + '" border="0" alt="Hollow Star" style="max-width: 25px; max-height: 25px; padding-top: 8px;"/>');
                        }
                        else {
                            starHTML.push('<img width="25" height="25" src="' + $scope.templatePreview.unselectedStar + '" border="0" alt="Hollow Star" style="max-width: 25px; max-height: 25px; padding-top: 8px;"/>');
                        }
                    }
                }
                else {
                    starHTML.push(($scope.starRatings[i].index >= j) ? '&#9733;' : '&#9734;');
                }
            }
            linkParts.push(starHTML.join(' ') + '<br/>' + $scope.starRatings[i].text);

            linkParts.push('</a>');
            linkParts.push('</p>');
            linkParts.push('</td>');
            linkParts.push('</tr>');

            linkParts.push('<tr style="padding: 0; text-align: left; vertical-align: top;">');
            linkParts.push('<td bgcolor="#FFFFFF" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; background-color: #FFFFFF !important; border-collapse: collapse !important; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: normal; hyphens: auto; line-height: 1.3; margin: 0; padding: 0; text-align: left; vertical-align: top; word-wrap: break-word;">&nbsp;</td>');
            linkParts.push('</tr>');

            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</td>');
            linkParts.push('</tr>');
            linkParts.push('</tbody>');
            linkParts.push('</table>');
            linkParts.push('</th>');
            linkParts.push('</tr>');

            links += linkParts.join('\n');
        }
        return links;
    }

    function generateThumbsEclipseLinks(mergeSiteURL) {
        var linkParts = [];

        // Thumbs Up
        linkParts.push('<td width="100px" height="100px" align="center" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border-collapse: collapse !important; border-radius: 3px; color: #aaaaaa; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: normal; hyphens: auto;  margin: 0; padding: 0px 0; text-align: left; vertical-align: middle; word-wrap: break-word;">');
        linkParts.push('<p style="Margin: 0; color: #44ae4c; font-family: Helvetica, Arial, sans-serif; font-size: 3rem; font-weight: normal; margin: 0; padding: 0; text-align: center; cursor:pointer !important;">');
        linkParts.push('<a href="' + getRatingHref(1, mergeSiteURL) + '" style="Margin: 0; color: #44ae4c; font-family: Helvetica, Arial, sans-serif; font-weight: normal; margin: 0; padding: 0; text-align: center; text-decoration: none; cursor:pointer !important; width:100%; display:block;">');
        linkParts.push('<img src="{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Up_URL__c}" border="0" alt="Thumbs Up" />');
        linkParts.push('</a>');
        linkParts.push('</p>');
        linkParts.push('</td>');

        // Divider
        linkParts.push('<td width="50px" align="center" bgcolor="#FFFFFF" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border: 0px; border-collapse: collapse !important; border-radius: 3px; color: #0a0a0a; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: normal; hyphens: auto; margin: 0; padding: 0px 0; text-align: left; vertical-align: middle; word-wrap: break-word;">&nbsp;</td>');

        // Thumbs Down
        linkParts.push('<td width="100px" height="100px" align="center" style="-moz-hyphens: auto; -webkit-hyphens: auto; Margin: 0; border-collapse: collapse !important; border-radius: 3px; color: #aaaaaa; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: normal; hyphens: auto;  margin: 0; padding: 0px 0; text-align: left; vertical-align: middle; word-wrap: break-word;">');
        linkParts.push('<p style="Margin: 0; color: #44ae4c; font-family: Helvetica, Arial, sans-serif; font-size: 3rem; font-weight: normal; margin: 0; padding: 0; text-align: center; cursor:pointer !important;">');
        linkParts.push('<a href="' + getRatingHref(0, mergeSiteURL) + '" style="Margin: 0; color: #44ae4c; font-family: Helvetica, Arial, sans-serif; font-weight: normal; margin: 0; padding: 0; text-align: center; text-decoration: none; cursor:pointer !important; width:100%; display:block;">');
        linkParts.push('<img src="{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Rate_Down_URL__c}" border="0" alt="Thumbs Down" />');
        linkParts.push('</a>');
        linkParts.push('</p>');
        linkParts.push('</td>');

        return linkParts.join('\n');
    }

    function generateQuestionnaireEclipseLinks(mergeSiteURL) {
        return '<a href="' + getRatingHref(null, mergeSiteURL) + '" target="_blank" style="font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; text-decoration: none;border-radius: 3px; padding: 12px 18px; border: 1px solid [[BRAND_COLOR]]; display: inline-block;">Take our survey &rarr;</a>\n';
    }

    function getRatingHref(score, mergeSiteURL) {
        var link;
        if(!mergeSiteURL) {
            link = '{!$Setup.' + PKG_NS_PREFIX + 'Simple_Survey_Setting__c.' + PKG_NS_PREFIX + 'Survey_Site_URL__c}';
        }
        else {
            link = $scope.settings[PKG_NS_PREFIX + 'Survey_Site_URL__c'];
        }

        var params = [];
        switch($scope.ratingScale) {
            case '1-5':
                params.push('ratingType=1');
                params.push(PKG_NS_PREFIX + 'Rating_Scale__c=1-5');
                params.push(PKG_NS_PREFIX + 'Survey_Score__c=' + score);
                break;

            case '0-10':
                params.push('ratingType=2');
                params.push(PKG_NS_PREFIX + 'Rating_Scale__c=0-10');
                params.push(PKG_NS_PREFIX + 'Survey_Score__c=' + score);
                break;

            case '0-1':
                params.push('ratingType=0');
                params.push(PKG_NS_PREFIX + 'Rating_Scale__c=0-1');
                params.push(PKG_NS_PREFIX + 'Survey_Score__c=' + score);
                break;

            case 'None':
                params.push('ratingType=3');
                break;
        }

        params.push('RecordTypeId=' + $scope.surveyConfig[PKG_NS_PREFIX + 'Record_Type__c']);
        params.push('fieldset=' + encodeURIComponent($scope.surveyConfig[PKG_NS_PREFIX + 'Field_Set__c'].split('.')[1]));
        params.push('lang=' + $scope.template.language);

        if($scope.surveyConfig[PKG_NS_PREFIX + 'Picklist_Display__c'] == 'Vertical Radio Buttons' || $scope.surveyConfig[PKG_NS_PREFIX + 'Picklist_Display__c'] == 'Horizontal Radio Buttons') {
            params.push('radioPicklistOptions=true');
            params.push('horizontalRadios=' + ($scope.surveyConfig[PKG_NS_PREFIX + 'Picklist_Display__c'] == 'Horizontal Radio Buttons'));
        }
        else {
            params.push('radioPicklistOptions=false');
        }

        if($scope.surveyConfig[PKG_NS_PREFIX + 'Radio_Button_Above_Label__c'] === true) {
            params.push('radioAboveLabel=true')
        }

        var mappings = angular.fromJson($scope.surveyConfig[PKG_NS_PREFIX + 'Survey_Object_Field_Assignment__c']);
        for(var surveyField in mappings) {
            if(mappings[surveyField].type == 'field'){
                if(mappings[surveyField].value == '__RECEIVING_USER__'){
                    params.push(surveyField + '={!Receiving_User.Id}');
                }
                else{
                    params.push(surveyField + '=' + getMergeField($scope.surveyConfig[PKG_NS_PREFIX + 'Survey_Object__c'], mappings[surveyField].value, $scope.assignmentFieldInfo.dateFields.indexOf(surveyField) > -1, $scope.assignmentFieldInfo.dateTimeFields.indexOf(surveyField) > -1));
                }
            }
            else if(mappings[surveyField].type == 'value'){
                params.push(surveyField + '=' + encodeURIComponent(mappings[surveyField].value));
            }
        }

        link += '?' + params.join('&');
        return link;
    }

    function showErrorAlert(reason) {
        header.handleError({
            HTMLMessage : util.formatErrorMessages(reason),
            popup : true
        });
    }

    function handleInitError(reason) {
        $scope.initialized = true;
        showErrorAlert(reason);
    }

    // BE (00182091) - Handle Window Resize in controller instead of outside of all controllers
    window.addEventListener('resize', handleWindowOnResizeForEmailTemplate);

    $scope.$on("$destroy", function() {
        window.removeEventListener('resize', handleWindowOnResizeForEmailTemplate);
    });

    function handleWindowOnResizeForEmailTemplate(e) {
        util.resizePreview();
    }

    if(PERMISSIONS.CreateEmailTemplate && PERMISSIONS.UpsertSurveyConfiguration) {
        init();
    }
    else {
        header.goToStep("ChooseSurvey", "CreateEmailTemplate");
    }

}]);

// --( Utility Service )--
SurveyBuilder.service('util', ['$q', '$timeout', function($q, $timeout) {
    //Just to note, I do not trust the promises returned by JSforce methods since they may lie about success
    //Results are manually checked in the callback parameters instead

    //Need api 38+ for global picklists
    //Version must be a string otherwise the decimal will be missing from tooling API call URLs and will break as a result
    var conn = new jsforce.Connection({accessToken: SESSION_ID, version: '47.0'});

    this.nsPrefix = DEVELOPER_ORG ? 'simplesurvey__' : ''
    var nsPrefix = this.nsPrefix; //For use by asynchronous actions defined in util

    this.timeout = function(fn, time) {
        $timeout(fn, time);
    }

    // BE - Performs a split but an empty string results in an empty array.
    this.splitString = function(text, splitChar) {
        return (text.length > 0) ? text.split(splitChar) : [];
    }

    this.initColorPickers = function() {
        removeDirtyFlag();
        var colorPickers = document.querySelectorAll("color-picker");
        for(var i = 0; i < colorPickers.length; i++) {
            var pickerInput = colorPickers[i].querySelector("input");
            pickerInput.id = colorPickers[i].getAttribute("data-id");
            pickerInput.placeholder = "#xxxxxx";
        }
    }

    //Recursively escapes XML entities in object fields / arrays / text
    this.escapeXMLEntities = function(obj) {
        if(typeof obj == 'string'){ //NOPMD
            // return obj.replace(/&/g, '&amp;')
            return obj.replace(/&/g, '%26')
                      .replace(/'/g, '&apos;')
                      .replace(/"/g, '&quot;')
                      .replace(/</g, '&lt;')
                      .replace(/>/g, '&gt;');
        }
        else if(typeof obj == 'object') {
            for(var field in obj){
                obj[field] = escapeXMLEntities(obj[field]);
            }
        }
        return obj;
    }
    var escapeXMLEntities = this.escapeXMLEntities; //For use by asynchronous actions defined in util

    
    this.escapeQuotes = function(string) {
        return string.replace('\'', '\\\'').replace('"', '\\"');
    }

    this.createImageOpt = function(fileObj) {
        var fileNameArr = fileObj.name.split(".");
        var extension = fileNameArr[fileNameArr.length - 1];
        return {label : fileObj.name + ' (' + extension + ')', value : fileObj.id};
    }

    //Recursively unescapes XML entities in object fields / arrays / text
    this.unescapeXMLEntities = function(obj) {
        if(typeof obj == 'string'){ //NOPMD
            return obj.replace(/(&quot;)|(&#34;)/g, '"')
            .replace(/(&apos;)|(&#39;)/g, "'")
            .replace(/(&lt;)|(&#60;)/g, '<')
            .replace(/(&gt;)|(&#62;)/g, '>')
            .replace(/(&amp;)|(%26)/g, '&');
             // .replace(/(&amp;)|(&#38;)/g, '&');
        }
        else if(typeof obj == 'object'){
            for(var field in obj){
                obj[field] = unescapeXMLEntities(obj[field]);
            }
        }
        
        return obj;
    }
    var unescapeXMLEntities = this.unescapeXMLEntities; //For use by asynchronous actions defined in util

    this.isNotBlank = function(string) {
        return string && string.trim().length > 0;
    }

    this.isBlank = function(string) {
        return !this.isNotBlank(string);
    }

    // BE (00182091) - Check if a string represents a number.
    this.stringIsNumeric = function(numString)  {
        if(numString) {
            numString = numString.trim();
            return numString.length > 0 && !isNaN(numString);
        }
        return false;
    }

    // BE (00182091) - Resizes Live Previews
    this.resizePreview = function() {
        var previewContent = document.getElementById("preview-content");
        if(previewContent) {
            var previewWidth = previewContent.parentElement.getBoundingClientRect().width;
            var scale = previewContent.classList.contains("mobile-preview") ? Math.min((previewWidth / 414), 1) :  Math.min((previewWidth / 1100), 1);
            previewContent.style.transform = "scale(" + scale + ")";
        }
    }

    this.handleFileInputChange = function(ctrl, header, input, file, completionHandler) {
        var maxFileSize = 4000000;
        if(file.size < maxFileSize) {
            if(this.fileIsImage(file)) {
                header.showSpinner(true, LABELS.uploading);
                var util = this;
                var reader = new FileReader();
                reader.onload = function(evt) {
                    var docObj = {
                        FolderId : input.getAttribute("data-folder-id"),
                        Name : file.name,
                        IsPublic : true
                    };
                    switch(input.getAttribute("data-image-for")) {
                        case 'star':
                            util.uploadDocumentPair(ctrl, this.result, docObj, {width: 25, height: 25}, true, completionHandler);
                            break;
                        case 'rateupdown':
                            util.uploadDocumentPair(ctrl, this.result, docObj, {width: 100, height: 100}, true, completionHandler);
                            break;
                        case 'logo':
                            var dimensions = {width: 200, height: 100};
                            if(input.getAttribute("data-for-email-only") === "true") {
                                // If uploading just for the email template, resize the image and then upload the resized version
                                util.resizeImage(this.result, dimensions, function(resizedDataUrl) {
                                    util.uploadDocument(ctrl, docObj, util.getBase64DataFromDataUrl(resizedDataUrl), completionHandler)
                                });
                            }
                            else {
                                util.uploadDocumentPair(ctrl, this.result, docObj, dimensions, false, completionHandler);
                            }
                            break;
                        default:
                            util.uploadDocument(ctrl, docObj, util.getBase64DataFromDataUrl(this.result), completionHandler);
                            break;
                    }
                }
                reader.readAsDataURL(file);
            }
            else {
                completionHandler({success : false, message : LABELS.unsupportedImageFile});
            }
        }
        else {
            completionHandler({success : false, message : LABELS.fileTooLarge});
        }

        // Reset's the file input
        input.type = '';
        input.type = 'file';
    }

    this.fileIsImage = function(file) {
        return ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'image/bmp', 'image/svg+xml'].indexOf(file.type) > -1;
    }

    // Uploads a resized version of a document for email as well as the original document.
    // The original document's description contains JSON linking it to it's corresponding Email Document.
    this.uploadDocumentPair = function(ctrl, dataURL, docObj, maxDimensions, renameVariant, completionHandler) {
        var util = this;
        this.resizeImage(dataURL, maxDimensions, function(resizedDataURL) {
            var resizedDocObj = {
                Name : '',
                FolderId : docObj.FolderId,
                IsPublic : true,
                Description : 'SimpleSurvey: Auto-Generated Image for Email Template. Do Not Delete'
            };
            if(renameVariant) {
                var docNameParts = docObj.Name.split('.')
                for(var i = 0; i < docNameParts.length - 1; i++) {
                    resizedDocObj.Name += docNameParts[i];
                }
                resizedDocObj.Name += ' (Email).png';
            }
            else {
                resizedDocObj.Name = docObj.Name;
            }
            util.uploadDocument(ctrl, resizedDocObj, util.getBase64DataFromDataUrl(resizedDataURL), function(result) {
                if(result.success) {
                    docObj.Description = '{"emailDocumentId" : "' + result.document.Id + '"}'
                    util.uploadDocument(ctrl, docObj, util.getBase64DataFromDataUrl(dataURL), completionHandler);
                }
                else {
                    completionHandler(result);
                }
            })
        });
    }

    // Resized an image recusively
    this.resizeImage = function(dataURL, maxDimensions, completionHandler) {
        var util = this;
        var img = new Image();
        img.onload = function() {
            if(img.width <= maxDimensions.width && img.height <= maxDimensions.height) {
                completionHandler(img.src);
            }
            else {
                // Setting img.src will call onload again.
                img.src = util.shrinkImage(img, maxDimensions).toDataURL('image/png', 1.0);
            }
        }
        img.src = dataURL;
    }

    // Decreases the image by 1/2 or a scale factor that best maintains the aspect ratio.
    this.shrinkImage = function(img, maxDimensions) {
        var sf = 0.5;   // Default Scale Factor
        var sw = maxDimensions.width / img.width;   // Scale Width
        var sh = maxDimensions.height / img.height; // Scale Height
        if(sw > 0.5 && sw < 1 && sh > 0.5 && sh < 1) {
            sf = (sw < sh) ? sw : sh;
        }
        else if(sw > 0.5 && sw < 1) {
            sf = sw;
        }
        else if(sh > 0.5 && sh < 1) {
            sf = sh;
        }

        var canvas = document.createElement('canvas');
        canvas.width = img.width * sf;
        canvas.height = img.height * sf;
        canvas.getContext('2d').drawImage(img, 0, 0, canvas.width, canvas.height);
        return canvas;
    }

    this.getBase64DataFromDataUrl = function(dataURL) {
        return dataURL.split('base64,')[1];
    }

    this.uploadDocument = function(ctrl, docObj, data, completionHandler) {
        this.uploadDocumentChunk(ctrl, docObj, 0, data, completionHandler);
    }

    this.uploadDocumentChunk = function(ctrl, docObj, startPos, data, completionHandler) {
        var chunkSize = 95000;
        var chunk = data.substring(startPos, startPos + chunkSize);
        if(this.isBlank(chunk)) {
            completionHandler({
                success : true,
                document : docObj
            });
        }
        else {
            var util = this;
            ctrl.uploadDocumentChunk(chunk, JSON.stringify(docObj)).then(function(result) {
                if(result.success) {
                    docObj.Id = result.message;
                    util.uploadDocumentChunk(ctrl, docObj, startPos + chunkSize, data, completionHandler);
                }
            }).catch(function(err) {
                completionHandler({
                    success : false,
                    message : err
                });
            });
        }
    }

    //Generates an API name based on a label
    this.generateName = function(label) {
        return '' + label.replace(/^[^\da-z]+|[^\da-z]+$|[^\da-z ]| (?=[^\da-z]* )/gi, '').replace(/ /g, '_').replace(/(^\d)/, 'X$1');
    }

    //Strip invalid or undesired characters from text for filename
    this.generateFileName = function(text) {
        return text.replace(/[\/:*?"<>|.'\r\n]/g, '');
    }

    this.extractErrors = function(reason) {
        if(reason instanceof Error) {
            console.error(reason);
            if(reason.errorCode === "sf:INVALID_SESSION_ID") {
                return 'Your session has expired. Please login and try again.';
            }
            return LABELS.scriptThrownException + ': ' + reason.message;
        }

        if(typeof reason === 'object') {
            var errorArray = reason;
            if(reason.hasOwnProperty('errors')) {
                errorArray = [reason.errors];
            }
            var errors = [];
            for(var i = 0; i < errorArray.length; i++) {
                var error = errorArray[i];
                errors.push(error.message);
            }
            return errors.join("\n");
        }
        
        return reason;
    }

    this.formatErrorMessages = function(reason) {
        var errors = this.extractErrors(reason);
        var msg = '<p class="slds-text-heading_medium slds-text-align_center slds-p-bottom_small">The following error';
        if(errors.indexOf('\n') > -1) { // Are there multiple errors
            msg += "s have occurred.<p>";
        }
        else {
            msg += " has occurred.<p>";
        }

        msg += '<ul class="slds-list_dotted">';

        errors = errors.split('\n');
        for(var i = 0; i < errors.length; i++) {
            msg += '<li>' + errors[i] + '</li>';
        }
        msg += '</ul>';

        return msg;
    }

    this.removeDirtyFlag = function() {
        [].forEach.call(document.querySelectorAll('.ng-dirty'), function(element) {
            element.className = element.className.replace(/ ?ng-dirty ?/, '');
        });
    }
    var removeDirtyFlag = this.removeDirtyFlag; //For use by asynchronous actions defined in util

    //Returns the supplied object as an array
    this.asArray = function(obj) {
        if(obj === undefined){
            return [];
        }
            
        return [].concat.call([], obj);
    }
    var asArray = this.asArray; //For use by asynchronous actions defined in util

    this.createSurveyLayout = function(name, includeScore) {
        var self = this;
        return $q(function(resolve, reject) {
            var metadata = {
                fullName: PKG_NS_PREFIX + "Survey__c-" + (nsPrefix == '' ? (PKG_NS_PREFIX != '' ? '__' : '') : nsPrefix) + escapeXMLEntities(name),
                excludeButtons: "Submit",
                layoutSections: [
                    {
                        customLabel: true,
                        detailHeading: false,
                        editHeading: false,
                        label: "Survey Information",
                        layoutColumns: [
                            {
                                layoutItems: [
                                    {
                                        behavior: "Edit",
                                        field: PKG_NS_PREFIX + "Rating_Scale__c"
                                    },
                                    {
                                        behavior: "Edit",
                                        field: PKG_NS_PREFIX + "Record_Owner__c"
                                    }
                                ]
                            },
                            ""
                        ],
                        style: "TwoColumnsTopToBottom"
                    },
                    {
                        customLabel: "true",
                        detailHeading: "true",
                        editHeading: "true",
                        label: "Questions",
                        layoutColumns: [""],
                        style: "OneColumn"
                    },
                    {
                        customLabel: false,
                        detailHeading: true,
                        editHeading: true,
                        label: "System Information",
                        layoutColumns: [
                            {
                                layoutItems: [
                                    {
                                        behavior: "Readonly",
                                        field: "Name"
                                    },
                                    {
                                        behavior: "Edit",
                                        field: "OwnerId"
                                    },
                                    {
                                        behavior: "Edit",
                                        field: "RecordTypeId"
                                    }
                                ]
                            },
                            {
                                layoutItems: [
                                    {
                                        behavior: "Readonly",
                                        field: "CreatedById"
                                    },
                                    {
                                        behavior: "Readonly",
                                        field: "LastModifiedById"
                                    },
                                    {
                                        behavior: "Readonly",
                                        field: PKG_NS_PREFIX +"Human_Confidence_Score__c"
                                    }
                                ]
                            }
                        ],
                        style: "TwoColumnsTopToBottom"
                    },
                    {
                        customLabel: "true",
                        detailHeading: "true",
                        editHeading: "false",
                        label: "Custom Links",
                        layoutColumns: ["", "", ""],
                        style: "CustomLinks"
                    }
                ],
                showEmailCheckbox: "false",
                showHighlightsPanel: "false",
                showInteractionLogPanel: "false",
                showRunAssignmentRulesCheckbox: "false",
                showSubmitAndAttachButton: "false"
            };

            if(includeScore){
                metadata.layoutSections[0].layoutColumns[0].layoutItems.unshift({
                    behavior: "Edit",
                    field: PKG_NS_PREFIX + "Survey_Score__c"
                });
            }
                
            if(DIAGNOSTIC_TRACKING_ENABLED) {
                self.addDiagnosticFields(metadata);
            }
            
            conn.metadata.create('Layout', metadata, function(err, result) {
                if(err !== null) {
                    var errIntro = generateMDTErrorMessage('creating survey layout "' + metadata.fullName + '"', 'createSurveyLayout');
                    err.message = errIntro + '\n' + err.message;
                    reject(err);
                }
                else if(('success' in result) && result.success){
                    result.fullName = result.fullName.replace('-__', '-.__');
                    resolve(result)
                }
                else {
                    reject(result);
                }
            });
        });
    }

    // [BE - 00167213] - If the "Diagnostic Tracking Information" setting is enabled, add those fields to the "System Information" section. Preferably the fiels should alternate
    //                      columns when added.
    this.addDiagnosticFields = function(metadata) {
        var sysInfoSection;
        asArray(metadata.layoutSections).forEach(function(section) {
            if(section.label === "System Information") {
                sysInfoSection = section;
            }
        });
        if(sysInfoSection) {
            var sectionFields = {};
            asArray(sysInfoSection.layoutColumns).forEach(function(column) {
                asArray(column.layoutItems).forEach(function(item) {
                    if(typeof item == 'object' && 'field' in item) {
                        sectionFields[item.field] = 1;
                    }
                });
            });
            var fieldsToAdd = ["Referrer__c", "User_Agent__c", "IP_Address_2__c"];
            var firstCol = true;
            for(var i = 0; i < fieldsToAdd.length; i++) {
                if(!((PKG_NS_PREFIX + fieldsToAdd[i]) in sectionFields)) {
                    var col = (firstCol && sysInfoSection.layoutColumns[1]) ? 0 : 1;
                    sysInfoSection.layoutColumns[col].layoutItems.push({
                        behavior : "Readonly",
                        field : PKG_NS_PREFIX + fieldsToAdd[i]
                    });
                    firstCol = !firstCol;
                }
            }
        }
    }

    this.createSurveyRecordType = function(name, label) {
        return $q(function(resolve, reject) {
            var metadata = escapeXMLEntities({
                fullName: PKG_NS_PREFIX + "Survey__c." + nsPrefix + name,
                active: "true",
                label: label
            });

            conn.metadata.create('RecordType', metadata, function(err, result) {
                if(err !== null) {
                    var errIntro = generateMDTErrorMessage('creating record type "' + metadata.fullName + '"', 'createSurveyRecordType');
                    err.message = errIntro + '\n' + err.message;
                    reject(err);
                }
                else if(('success' in result) && result.success) {
                    resolve(result)
                }
                else {
                    reject(result);
                }
            });
        });
    }

    this.createSurveyFieldSet = function(name, label) {
        return $q(function(resolve, reject) {
            var metadata = escapeXMLEntities({
                fullName: PKG_NS_PREFIX + "Survey__c." + nsPrefix + name,
                description: "Fields for " + label,
                label: label
            });

            conn.metadata.create('FieldSet', metadata, function(err, result) {
                if(err !== null) {
                    var errIntro = generateMDTErrorMessage('creating field set "' + metadata.fullName + '"','createSurveyFieldSet');
                    err.message = errIntro + '\n' + err.message;
                    reject(err);
                }
                else if(('success' in result) && result.success) {
                    resolve(result)
                }
                else {
                    reject(result);
                }
            });
        });
    }

    this.saveFieldSet = function(fieldSetMetadata) {
        var metadata = escapeXMLEntities(angular.copy(fieldSetMetadata));

        return $q(function(resolve, reject) {
            conn.metadata.update('FieldSet', metadata, function(error, result) {
                if(error !== null) {
                    var errIntro = generateMDTErrorMessage('updating field set "' + metadata.fullName + '"', 'saveFieldSet');
                    error.message = errIntro + '\n' + error.message;
                    reject(error);
                }
                if(('success' in result) && result.success) {
                    resolve(result)
                }
                else {
                    reject(result);
                }
            });
        });
    }

    this.assignLayout = function(layoutName, recordTypeName) {
        return $q(function(resolve, reject) {
            conn.metadata.list({type: 'Profile'}, function(err, result) {
                if(err !== null) {
                    err.message = generateMDTErrorMessage('retrieving profile information', 'assignLayout') + '\n' + err.message;
                    reject(err);
                    return;
                }

                //Create array of metadata for each profile to update the layout assignment
                var metadata = escapeXMLEntities(result.reduce(function(acc, item) {
                    //Limit to the admin and current user profile for now to increase speed (turns out updating all profiles is really slow)
                    //Note that Profile.Name is not necessarily equal to the metadata profile fullName so Id is checked instead
                    if(item.fullName == 'Admin' || item.id == PROFILE_ID) {
                        return acc.concat({
                            fullName: item.fullName,
                            layoutAssignments: [{
                                layout: PKG_NS_PREFIX + 'Survey__c-' + nsPrefix + layoutName,
                                recordType: PKG_NS_PREFIX + 'Survey__c.' + nsPrefix + recordTypeName
                            }]
                        });
                    }
                    return acc;
                }, []));

                //Can only update up to 10 records at a time
                //Build list of promises for each batch of 10
                var promises = [];
                for(var i = 0; i < metadata.length; i += 10) {
                    promises.push($q(function(resolve, reject) {
                        conn.metadata.update('Profile', metadata.slice(i, (i + 10 < metadata.length) ? (i + 10) : metadata.length), function(err, results) {
                            if(err !== null) {
                                var errIntro = generateMDTErrorMessage('updating profiles','assignLayout');
                                var profileNames = [];
                                for(var j = 0; j < metadata.length; j++) {
                                    profileNames.push(metadata[j].fullName);
                                }
                                err.message = errIntro + '\n' + 'Profiles: [' + profileNames + ']\n' + err.message;
                                reject(err);
                                return;
                            }
                            if(results instanceof Array) {
                                var errors = [];
                                for(var j = 0; j < results.length; j++) {
                                    if(!results[j].success) {
                                        errors.push(generateMDTErrorMessage('updating profile "' + metadata[j].fullName + '"','assignLayout'));
                                    }
                                }
                                if(errors.length > 0) {
                                    console.error(errors.join('\n'));
                                    reject(results);
                                    return;
                                }
                            }
                            else {
                                if(!results.success) {
                                    console.error(generateMDTErrorMessage('updating profile "' + results.fullName + '"','assignLayout'));
                                    reject(results);
                                    return;
                                }
                            }
                            resolve(results);
                        });
                    }));
                }

                //Once all batches of 10 have finished running then resolve
                $q.all(promises).then(function(results) {
                    resolve(results);
                }).catch(function(err) {
                    reject(err);
                })
            });
        });
    }

    this.getSurveyMetadata = function() {
        return $q(function(resolve, reject) {
            conn.metadata.read('CustomObject', PKG_NS_PREFIX + 'Survey__c', function(err, result) {
                $timeout(function() {
                    if('fullName' in result){
                        resolve(result);
                    }
                    else {
                        err.message = generateMDTErrorMessage('reading survey metadata for "' + PKG_NS_PREFIX + 'Survey__c"', 'getSurveyMetadata') + '\n' + err.message;
                        console.error(err.message); 
                        reject(result);
                    }
                });
            });
        });
    }

    this.createField = function(name, label, type, description, helpText, visibleLines, picklistOptions, globalValueSet, decimalPlaces, referenceTo, create) {
        return $q(function(resolve, reject) {
            var metadata = {
                fullName: PKG_NS_PREFIX + 'Survey__c.' + (name.indexOf(nsPrefix) !== 0 ? nsPrefix : '') + name,
                label: label,
                inlineHelpText: helpText,
                type: type
                // ,description: description
            };
            if(create){
                metadata.description = description;
            }

            if(type == 'Text'){
                metadata.length = '255';
            }
            else if(type == 'LongTextArea'){
                metadata.length = '32768';
            }

            if(type == "Checkbox"){
                metadata.defaultValue = false;
            }

            if(type == 'Currency' || type == 'Number' || type == 'Percent') {
                metadata.precision = 18;
                metadata.scale = decimalPlaces;
            }

            if(type == 'Picklist' || type == 'MultiselectPicklist') {
                if(globalValueSet != null && globalValueSet != ''){
                    metadata.valueSet = {
                        valueSetName: globalValueSet,
                        restricted: true
                    };
                }
                else if(picklistOptions != null && picklistOptions.length > 0){
                    var values = [];
                    picklistOptions.forEach(function(val) {
                        values.push({
                            fullName: val.replace(/\s+/g, ' ').trim(),
                            "default": false
                        });
                    });

                    // metadata.picklist = {
                    //     picklistValues: values,
                    //     sorted: false
                    metadata.valueSet = {
                        valueSetDefinition: {
                            sorted: false,
                            value: values
                        }
                    };
                }
            }

            if(type == 'MultiselectPicklist' || type == 'LongTextArea') {
                metadata.visibleLines = parseInt(visibleLines);
            }

            if(type == 'Lookup') {
                metadata.referenceTo = referenceTo;
                metadata.relationshipName = "Surveys";
            }

            var resultMatadata = angular.copy(metadata);
            //var escapedMetadata = escapeXMLEntities(metadata);

            if(create){
                conn.metadata.create('CustomField', metadata, function(error, result) {
                    $timeout(function() {
                        if(error !== null) {
                            var errIntro = generateMDTErrorMessage('creating custom ' + type + ' field "' + label + ' (' + name + ')"','createField');
                            error.message = errIntro + '\n' + error.message;
                            reject(error);
                        }
                        else if(('success' in result) && result.success) {
                            resolve(resultMatadata);
                        }
                        else {
                            if(('errors' in result)) {
                                if(result.errors instanceof Array) {
                                    var errStringParts = [generateMDTErrorMessage('creating custom ' + type + ' field "' + label + ' (' + name + ')"','createField')];
                                    for(var ec = 0; ec < result.errors.length; ec++) {
                                        errStringParts.push(result.errors[ec].statusCode + ' --- ' + result.errors[ec].message);
                                    }
                                    console.error(errStringParts.join('\n'));
                                }
                                else {
                                    console.error(result.errors.statusCode + ' --- ' + result.errors.message);
                                }
                            }
                            reject(result);
                        }
                    });
                });
            }
            else{
                conn.metadata.update('CustomField', metadata, function(error, result) {
                    $timeout(function() {
                        if(error !== null) {
                            var errIntro = generateMDTErrorMessage('updating custom ' + type + ' field "' + label + ' (' + name + ')"','createField');
                            error.message = errIntro + '\n' + error.message;
                            reject(error);
                        }
                        else if(('success' in result) && result.success) {
                            resolve(resultMatadata);
                        }
                        else {
                            console.error('An unkown error occurred updating custom ' + type + ' field "' + label + ' (' + name + ')" in "createField"');
                            reject(result);
                        }
                    });
                });
            }
        });
    }

    this.addFieldsToLayout = function(layoutName, fieldNames, rightColumn, preferredSectionLabel) {
        var self = this;
        return $q(function(resolve, reject) {
            conn.metadata.read('Layout', escapeXMLEntities(unescapeXMLEntities(layoutName)), function(error, result) {
                if(error !== null) {
                    error.message = generateMDTErrorMessage('reading metadata for layout "' + escapeXMLEntities(unescapeXMLEntities(layoutName)),'addFieldsToLayout') + '\n' + error.message; 
                    reject(error);
                }
                else if(self.objectIsEmpty(result)) { // Not found
                    reject(LABELS.pageLayoutNotFound.format(layoutName));
                }
                else {
                    //asArray is used since the property may be an empty string or a single object instead of an Array if there are 1 or fewer elements
                    var layoutFields = {};
                    asArray(result.layoutSections).forEach(function(section) {
                        asArray(section.layoutColumns).forEach(function(column) {
                            asArray(column.layoutItems).forEach(function(item) {
                                if(typeof item == 'object' && 'field' in item){
                                    layoutFields[item.field] = 1;
                                }
                            });
                        });
                    });

                    var sectionIndex = -1;

                    //Try to select the preferred section by label
                    if(preferredSectionLabel != null && result.layoutSections != null) {
                        for(var i = 0; i < result.layoutSections.length; i++) {
                            if(result.layoutSections[i].style != 'CustomLinks' && result.layoutSections[i].label == preferredSectionLabel) {
                                sectionIndex = i;
                                break;
                            }
                        }
                    }

                    //Default to first section that is not Custom Links
                    if(sectionIndex == -1 && result.layoutSections != null) {
                        for(var i = 0; i < result.layoutSections.length; i++) {
                            if(result.layoutSections[i].style != 'CustomLinks') {
                                sectionIndex = i;
                                break;
                            }
                        }
                    }

                    //Add new section for custom fields if necessary (only section on the layout currently is Custom Links)
                    if(sectionIndex == -1) {
                        sectionIndex = 0;
                        var sectionInsert = {
                            customLabel: "true",
                            detailHeading: "true",
                            editHeading: "true",
                            label: "Survey Fields",
                            layoutColumns: [{layoutItems: []}, ''],
                            style: "TwoColumnsTopToBottom"
                        };

                        if(result.layoutSections instanceof Array){
                            result.layoutSections.unshift(sectionInsert);
                        }
                        else{
                            result.layoutSections = [sectionInsert, result.layoutSections];
                        }
                    }

                    //`layoutColumns` is returned by JSForce as an object on single column layouts instead of an array with a single item
                    if(!(result.layoutSections[sectionIndex].layoutColumns instanceof Array)){
                        result.layoutSections[sectionIndex].layoutColumns = [result.layoutSections[sectionIndex].layoutColumns];
                    }

                    var column = 0;
                    if(rightColumn && result.layoutSections[sectionIndex].layoutColumns.length === 2){
                        column = 1;
                    }

                    //Make sure layoutSections[sectionIndex].layoutColumns[column].layoutItems exists and is an array
                    if(typeof result.layoutSections[sectionIndex].layoutColumns[column] == 'string'){
                        result.layoutSections[sectionIndex].layoutColumns[column] = {layoutItems: []};
                    }
                    else if(!(result.layoutSections[sectionIndex].layoutColumns[column].layoutItems instanceof Array)){
                        result.layoutSections[sectionIndex].layoutColumns[column].layoutItems = [result.layoutSections[sectionIndex].layoutColumns[column].layoutItems];
                    }

                    //Add missing fields to the layout
                    fieldNames.forEach(function(fieldName) {
                        if(!(fieldName in layoutFields)) {
                            result.layoutSections[sectionIndex].layoutColumns[column].layoutItems.push({
                                behavior: 'Edit',
                                field: fieldName
                            });
                        }
                    });

                    //Update metadata
                    conn.metadata.update('Layout', escapeXMLEntities(result), function(error, result) {
                        if(error !== null) {
                            var errIntro = generateMDTErrorMessage('updating page layout "' + layoutName + '"','addFieldsToLayout');
                            error.message = errIntro + '\n' + error.message;
                            reject(error);                       
                        }
                        else if(('success' in result) && result.success) {
                            resolve(result);
                        }
                        else {
                            console.error('An unkown error occurred updating page layout "' + layoutName + '" in "addFieldsToLayout"');
                            reject(result);
                        }
                    });
                }
            });
        });
    }

    this.objectIsEmpty = function(obj) {
        return Object.keys(obj).length === 0;
    }

    this.updateFieldSecurity = function(fieldNames) {
        return $q(function(resolve, reject) {
            conn.metadata.list({type: 'Profile'}, function(err, result) {
                if(err !== null) {
                    err.message = generateMDTErrorMessage('retrieving profile information', 'updateFieldSecurity') + '\n' + err.message;
                    reject(err);
                    return;
                }

                var profileFullNames = result.reduce(function(acc, profile) {
                    //Limit to the admin, current user profile, and site guest profile for now to increase speed (turns out updating all profiles is really slow)
                    //Note that Profile.Name is not necessarily equal to the metadata profile fullName
                    if(profile.fullName == 'Admin' || profile.fullName == SITE_GUEST_PROFILE_NAME || profile.id == PROFILE_ID){
                        return acc.concat(profile.fullName);
                    }
                    
                    return acc;
                }, []);

                conn.metadata.read('Profile', profileFullNames, function(err, result) {
                    if(err !== null) {
                        err.message = generateMDTErrorMessage('reading metadata for profiles "[' + profileFullNames + ']"', 'updateFieldSecurity') + '\n' + err.message;
                        reject(err);
                        return;
                    }
                    //Create array of metadata for each profile to update the layout assignment
                    var metadata = escapeXMLEntities(asArray(result).reduce(function(acc, profile) {
                        var permByName = {};
                        profile.fieldPermissions.forEach(function(fp) {
                            permByName[fp.field] = fp;
                        });

                        //Check existing field permissions in case no changes are needed for a field (otherwise a vague error will occur: "duplicate value found: <unknown> duplicates value on record with id: <unknown>")
                        var newFieldPerms = [];
                        fieldNames.forEach(function(fieldName) {
                            var fullFieldName = PKG_NS_PREFIX + 'Survey__c.' + fieldName;

                            if(permByName[fullFieldName].editable == "false" || permByName[fullFieldName].readable == "false") {
                                newFieldPerms.push({
                                    field: fullFieldName,
                                    editable: true,
                                    readable: true
                                });
                            }
                        });

                        //Check Survey__c object permissions for Simple Survey Profile
                        var newObjPerms = [];
                        if(profile.fullName == SITE_GUEST_PROFILE_NAME) {
                            var foundSurveyObject = false;

                            //Check for existing Survey__c object permissions and update if needed
                            asArray(profile.objectPermissions).forEach(function(op) {
                                //At least Create, Read, and Edit are required
                                if(op.object == PKG_NS_PREFIX + 'Survey__c') {
                                    foundSurveyObject = true;

                                    if(op.allowCreate == "false" || op.allowRead == "false" || op.allowEdit == "false") {
                                        op.allowCreate = true;
                                        op.allowRead = true;
                                        op.allowEdit = true;
                                        newObjPerms.push(op);
                                    }
                                }
                            });

                            //No Survey__c object permissions exist yet, set defaults
                            if(!foundSurveyObject) {
                                newObjPerms.push({
                                    object: PKG_NS_PREFIX + "Survey__c",
                                    allowCreate: true,
                                    allowRead: true,
                                    allowEdit: true,
                                    allowDelete: false,
                                    viewAllRecords: false,
                                    modifyAllRecords: false
                                });
                            }
                        }

                        if(newFieldPerms.length > 0 || newObjPerms.length > 0){
                            return acc.concat({
                                fullName: profile.fullName,
                                fieldPermissions: newFieldPerms,
                                objectPermissions: newObjPerms
                            });
                        }
                        
                        return acc;
                    }, []));

                    //Update field security
                    if(metadata.length > 0) {
                        conn.metadata.update('Profile', metadata, function(error, results) {
                            if(error !== null) {
                                var errIntro = generateMDTErrorMessage('updating profiles','updateFieldSecurity');
                                var profileNames = [];
                                for(var j = 0; j < metadata.length; j++) {
                                    profileNames.push(metadata[j].fullName);
                                }
                                error.message = errIntro + '\n' + 'Profiles: [' + profileNames + ']\n' + error.message;
                                reject(error);
                                return;
                            }
                            if(results instanceof Array) {
                                var errors = [];
                                for(var j = 0; j < results.length; j++) {
                                    if(!results[j].success) {
                                        errors.push(generateMDTErrorMessage('updating profile "' + metadata[j].fullName + '"','updateFieldSecurity'));
                                    }
                                }
                                if(errors.length > 0) {
                                    console.error(errors.join('\n'));
                                    reject(results);
                                    return;
                                }
                            }
                            else {
                                if(!results.success) {
                                    console.error(generateMDTErrorMessage('updating profile "' + results.fullName + '"','updateFieldSecurity'));
                                    reject(results);
                                    return;
                                }
                            }
                            resolve(results);
                        });
                    }
                    else {
                        resolve([]);
                    }
                });
            });
        });
    }

    this.getSurveyToolingIds = function() {
        var result = {
            objectId: null,
            fieldIdsByName: {}
        };

        return $q(function(resolve, reject) {
            conn.tooling.query('SELECT Id FROM CustomObject WHERE DeveloperName = \'Survey\' AND NamespacePrefix = \'simplesurvey\' ORDER BY CreatedDate ASC LIMIT 1', function(err, response) {
                if(err !== null) { //NOPMD
                    err.message = generateMDTErrorMessage('querying custom object Id for Survey','getSurveyToolingIds') + '\n' + err.message;
                    reject(err);
                    return;
                }
                else if(response.records.length === 1) {
                    result.objectId = response.records[0].Id;

                    conn.tooling.query('SELECT Id, DeveloperName, NamespacePrefix FROM CustomField WHERE TableEnumOrId = \'' + result.objectId + '\'', function(err, response) {
                        if(err !== null) {
                            err.message = generateMDTErrorMessage('querying Survey fields', 'getSurveyToolingIds') + '\n' + err.message;
                            reject(err);
                            return;
                        }
                        response.records.forEach(function(field) {
                            var prefix = field.NamespacePrefix != null ? (field.NamespacePrefix + '__') : '';
                            //Salesforce randomly included the prefix for RecordType FullName in Summer 16 so one would not be surprised if this broke in a future release as well
                            if(prefix != '' && field.DeveloperName.indexOf(prefix) !== 0){
                                result.fieldIdsByName[prefix + field.DeveloperName + '__c'] = field.Id;
                            }
                            else{
                                result.fieldIdsByName[field.DeveloperName + '__c'] = field.Id; //Proactive potential fix
                            }
                        });

                        $timeout(function() {
                            resolve(result);
                        });
                    });
                }
                else{
                    // reset the api to 38
                    console.error('ERROR - CustomObject simplesurvey__Survey__c does not exist.');
                    $timeout(reject);
                }
            });
        });
    }

    this.addPicklistValuesToRecordType = function(recordTypeId, fields, globalValueSetValues) {
        return $q(function(resolve, reject) {
            var picklists = [];

            fields.forEach(function(field) {
                if(field.type == 'Picklist' || field.type == 'MultiselectPicklist') {
                    var metadataObj = {picklist: field.fullName, values : []};
                    if(field.picklistValueType === 'entered') {
                        var plOpts = field.picklistOptions.split('\n');
                        for(var i = 0; i < plOpts.length; i++) {
                            metadataObj.values.push({fullName : plOpts[i], label : plOpts[i]});
                        }
                    }
                    else {
                        metadataObj.values = angular.copy(globalValueSetValues[field.globalValueSet]);
                    }
                    picklists.push(metadataObj);
                }
            });

            if(picklists.length === 0) {
                $timeout(resolve);
                return;
            }

            //Get fullName by Id used to retrieve the metadata (the Metadata field on RecordType does not contain the picklist values)
            conn.tooling.query('SELECT FullName FROM RecordType WHERE Id = \'' + recordTypeId.replace(/'/g, '\\\'') + '\' LIMIT 1', function(err, response) {
                if(err !== null) {
                    err.message = generateMDTErrorMessage('querying for record type', 'addPicklistValuesToRecordType') + '\n' + err.message;
                    console.error(err);
                }

                if(response.records.length === 1) {
                    //Summer 16 randomly started including the package namespace prefix in the FullName
                    var fullName = response.records[0].FullName;
                    if(PKG_NS_PREFIX != '' && fullName.indexOf(PKG_NS_PREFIX) !== 0){
                        fullName = PKG_NS_PREFIX + fullName;
                    }

                    conn.metadata.read('RecordType', fullName, function(err, result) {
                        if(err !== null) {
                            err.message = generateMDTErrorMessage('reading metadata for record type "' + fullName + '"','addPicklistValuesToRecordType') + '\n' + err.message;
                            $timeout(function(){ reject(err); });
                            return;
                        }

                        //Get all existing pick-list values by name
                        var picklistValuesByName = {};
                        asArray(result.picklistValues).forEach(function(entry) {
                            picklistValuesByName[entry.picklist] = entry;
                        });

                        //Append values not yet added and URL encoding since the API expects that for some characters
                        picklists.forEach(function(entry) {
                            entry.values = asArray(entry.values); //JSForce returns a single value as an object

                            // metadata api needs url escaped values
                            for(let i = 0; i < entry.values.length; i++){
                                // entry.values[i].fullName = entry.values[i].fullName;
                                // entry.values[i].fullName = escape(entry.values[i].fullName);
                                // entry.values[i].fullName = escape(entry.values[i].fullName).replace('@', '%40').replace('+', '%2B').replace('.', '%2E').replace('/', '%2F');
                                // entry.values[i].fullName = encodeURIComponent(entry.values[i].fullName).replace(/\./g, '%2E').replace(/'/g, '%27')
                                let fullName = entry.values[i].fullName,
                                    encodedValue = '';
                                for (let j = 0; j < fullName.length; j++) {
                                    if(fullName.charCodeAt(j) >= 0xD800 && fullName.charCodeAt(j) <= 0xDBFF) { //UTF-16 leading surrogate http://unicode.org/faq/utf_bom.html#utf16-2
                                        if(j + 1 < fullName.length){
                                            encodedValue += fullName.substr(j, 2);
                                        }
                                            
                                        j++;
                                    }
                                    else {
                                        if(fullName[j] == ' '){
                                            encodedValue += ' ';
                                        }
                                        else {
                                            let encodedChar = encodeURIComponent(fullName[j]).replace(/\./g, '%2E').replace(/'/g, '%27');
                                            if (encodedChar.length > 3){
                                                encodedValue += fullName[j];
                                            }
                                            else{
                                                encodedValue += encodedChar;
                                            }
                                        }
                                    }
                                }
                                entry.values[i].fullName = encodedValue;
                            }

                            //Avoid "Element {http://soap.sforce.com/2006/04/metadata}label invalid at this location in type PicklistValue" error
                            let entryLessLabel = angular.copy(entry);
                            if(entryLessLabel.values){
                                for(let value of entryLessLabel.values){
                                    delete value.label;
                                }
                            }

                            picklistValuesByName[entry.picklist] = entryLessLabel;
                        });

                        //Rebuild silly array for the API
                        result.picklistValues = [];
                        for(var key in picklistValuesByName){
                            result.picklistValues.push(picklistValuesByName[key]);
                        }

                        conn.metadata.update('RecordType', escapeXMLEntities(result), function(err, result) {
                            $timeout(function() {
                                if(err !== null) {
                                    var errIntro = generateMDTErrorMessage('updating record type "' + fullName + '"', 'addPicklistValuesToRecordType');
                                    err.message = errIntro + '\n' + err.message;
                                    reject(err);
                                    return;
                                }

                                if(('success' in result) && result.success){
                                    resolve(result)
                                }
                                else{
                                    reject(result)
                                }
                            });
                        });
                    });
                }
                else {
                    console.error('ERROR - RecordType with Id "' + recordTypeId + '" does not exist.');
                    $timeout(reject);
                }
            });
        });
    }

    this.getGlobalValueSets = function(){
        return $q(function(resolve, reject) {
            conn.metadata.list({type: 'GlobalValueSet'}, function(err, result) {
                if(err !== null) {
                    err.message = generateMDTErrorMessage('retrieving all global value sets','getGlobalValueSets') + '\n' + err.message;
                    reject(err);
                    return;
                }
                var valueSetNames = [];
                var promises = [];
                asArray(result).forEach(function(val){
                    var promise = getGlobalValueSetValues(val.fullName).then(function(gvSet){
                        valueSetNames.push({
                            value: gvSet.fullName,
                            label: gvSet.masterLabel,
                            customValue: gvSet.customValue});
                    }).catch(function() {
                        console.error('An error occurred while retrieving global value set values.');
                    });
                    promises.push(promise);
                    /*valueSetNames.push({
                        value: val.fullName,
                        label: val.fullName});*/
                        // label: val.masterLabel});
                });

                /*$timeout(function() {
                    resolve(valueSetNames);
                });*/
                $q.all(promises).then(function(){
                    resolve(valueSetNames);
                });
            });
        });
    }

    this.getGlobalValueSetValues = function(fullName){
        return $q(function(resolve, reject) {
            conn.metadata.read('GlobalValueSet', (DEVELOPER_ORG ? 'simplesurvey__' : '') + fullName, function(err, result) {
                $timeout(function() {
                    if(err !== null) {
                        err.message = generateMDTErrorMessage('reading values for global value set "' + fullName + '"', 'getGlobalValueSetValues') + '\n' + err.message;
                        reject(err);
                    }
                    // Global Value Sets do not have a 'success' property in the result. 
                    // Checking if the object is empty will determine if something was found.
                    else if(!angular.equals({},result)) {
                        resolve(result);  
                    }
                    else {
                        reject(result);
                    }
                });
            });
        });
    }

    var getGlobalValueSetValues = this.getGlobalValueSetValues;

    this.generateMDTErrorMessage = function(actionString, funcName) {
        return 'Error occurred ' + actionString + ' in "' + funcName + '".';
    }

    var generateMDTErrorMessage = this.generateMDTErrorMessage;

    this.formIsDirty = function() {
        return document.querySelector('.ng-dirty:not([data-dirty-ignore="true"])') !== null;
    }

    // Use this to get the "for" attributes value for a label of a form entry that has values "--Select--", "Image", and "Image URL".
    // The id chosen comes from the idList which expects the order of ids to be "none"/"Default", "Document", "Image".
    this.getForAttributeValueForMultiOptionImageLabel = function(value, idList) {
        switch(value) {
            case "none":
            case "Default":
                return idList[0];
            case "Document":
                return idList[1];
            case "Image":
                return idList[2];
        }
    }

    // Use this to get the "for" attribute value for a label that can be used with a Document Dropdown, Image URL Input, Color Input
    // The id chosen comes from the idList which expects the order of ids to be  "Document", "Image", "Color".
    this.getMultiOptionImageOrColorInputLabelForAttribute = function(value, documentInputId, imageURLInputId, colorInputId) {
        switch(value) {
            case "Document":
                return documentInputId;
            case "Image":
                return imageURLInputId;
            case "Color":
                return colorInputId;
        }
    }

    // Use this to get the text for a label of a form entry that has values "--Select--", "Color" "Image", and "Image URL".
    // The id chosen comes from the idList which expects the order of ids to be  "none"/"Default", "Document", "Image", "Color".
    this.getMultiOptionImageOrColorInputLabel = function(value) {
        switch(value) {
            case 'Image':
                return 'URL';
            case 'Document':
                return 'Document';
            case 'Color': 
                return 'Color';
            default:
                return '';
        }
    }

    this.handleFolderChange = function(ctrl, errorHandler, info) {
        if(info.documents.hasOwnProperty(info.folderFieldName)) {
            this.updateDocumentOnFolderChange(info.documentFieldName);
        }
        else {
            var self = this;
            ctrl.getDocumentImagesForFolder(info.config[info.folderFieldName], info.searchOptions).then(function(result) {
                self.updateDocumentsMapping(info, result);
                self.updateDocumentOnFolderChange(info);
            }).catch(errorHandler);
        }
    }

    this.updateDocumentOnFolderChange = function(info) {
        info.config[info.documentFieldName] = 'none';
    }

    this.updateDocumentsMapping = function(info, documentImages) {
        var folderId = info.config[info.folderFieldName];
        this.updateDocumentsMappingWithFolderId(info.documents, folderId, documentImages);
    }

    this.updateDocumentsMappingWithFolderId = function(documents, folderId, documentImages) {
        documents[folderId] = {
            logos : documentImages.logos,
            rateUps : documentImages.rateUps,
            rateDowns : documentImages.rateDowns,
            selectedStars : documentImages.selectedStars,
            unselectedStars : documentImages.unselectedStars,
            nonDefaults : documentImages.nonDefaults
        }
    }

    this.checkIfThumbsArePreset = function(config, documentImages) {
        if(config.customizeThumbsUp === 'Document' && config.customizeThumbsDown === 'Document') {
            var theme = config.theme.toUpperCase();
            if(config.thumbsUpDocument === documentImages.presets.RATE_UP[theme].CHECK_X && config.thumbsDownDocument === documentImages.presets.RATE_DOWN[theme].CHECK_X) { //NOPMD
                return {isPreset : true, value : 'checkx'};
            }
            else if(config.thumbsUpDocument === documentImages.presets.RATE_UP[theme].HAPPY_SAD && config.thumbsDownDocument === documentImages.presets.RATE_DOWN[theme].HAPPY_SAD) { //NOPMD
                return {isPreset : true, value : 'happysad'};
            }
            else if(config.thumbsUpDocument === documentImages.presets.RATE_UP[theme].LAUGH_ANGRY && config.thumbsDownDocument === documentImages.presets.RATE_DOWN[theme].LAUGH_ANGRY) { //NOPMD
                return {isPreset : true, value : 'laughangry'};
            }
            else if(config.thumbsUpDocument === documentImages.presets.RATE_UP[theme].HEART_HEARTBROKEN && config.thumbsDownDocument === documentImages.presets.RATE_DOWN[theme].HEART_HEARTBROKEN) { //NOPMD
                return {isPreset : true, value : 'hearts'};
            }
            else if(config.thumbsUpDocument === documentImages.presets.RATE_UP[theme].THUMB && config.thumbsDownDocument === documentImages.presets.RATE_DOWN[theme].THUMB) { //NOPMD
                return {isPreset : true, value : 'thumbs'};
            }
        }
        return {isPreset : false};
    },

    this.checkIfStarsArePreset = function(config, documentImages) {
        if(config.customizeSelectedStar === 'Document' && config.customizeUnselectedStar === 'Document') {
            var theme = config.theme.toUpperCase();
            if(config.selectedStarDocument === documentImages.presets.STAR_SELECTED[theme].STAR && config.unselectedStarDocument === documentImages.presets.STAR_UNSELECTED[theme].STAR) { //NOPMD
                return {isPreset : true, value : 'stars'};
            }
            else if(config.selectedStarDocument === documentImages.presets.STAR_SELECTED[theme].HEART && config.unselectedStarDocument === documentImages.presets.STAR_UNSELECTED[theme].HEART) { //NOPMD
                return {isPreset : true, value : 'hearts'};
            }
            else if(config.selectedStarDocument === documentImages.presets.STAR_SELECTED[theme].ROCKSTAR && config.unselectedStarDocument === documentImages.presets.STAR_UNSELECTED[theme].STAR) {
                return {isPreset : true, value : 'rockstars'};
            }
        }
        return {isPreset : false};
    },

    this.setPresetDocuments = function(documents, defaultDocumentImages) {
        documents.presets = defaultDocumentImages.presets;
        defaultDocumentImages.presets = null;
    },

    this.getPresetThumbs  = function(ratingModel, documents, theme) {
        switch(ratingModel) {
            case 'checkx':
                return {upPreset : documents.presets.RATE_UP[theme].CHECK_X, downPreset : documents.presets.RATE_DOWN[theme].CHECK_X};
            case 'happysad':
                return {upPreset : documents.presets.RATE_UP[theme].HAPPY_SAD, downPreset: documents.presets.RATE_DOWN[theme].HAPPY_SAD};
            case 'laughangry':
                return {upPreset : documents.presets.RATE_UP[theme].LAUGH_ANGRY, downPreset: documents.presets.RATE_DOWN[theme].LAUGH_ANGRY};
            case 'hearts':
                return {upPreset : documents.presets.RATE_UP[theme].HEART_HEARTBROKEN, downPreset: documents.presets.RATE_DOWN[theme].HEART_HEARTBROKEN};
            case 'thumbs':
                return {upPreset : documents.presets.RATE_UP[theme].THUMB, downPreset: documents.presets.RATE_DOWN[theme].THUMB};
        }
    }

    this.getPresetStars = function(ratingModel, documents, theme) {
        switch(ratingModel) {
            case 'stars':
                return {selectedPreset : documents.presets.STAR_SELECTED[theme].STAR, unselectedPreset : documents.presets.STAR_UNSELECTED[theme].STAR};
            case 'hearts':
                return {selectedPreset : documents.presets.STAR_SELECTED[theme].HEART, unselectedPreset: documents.presets.STAR_UNSELECTED[theme].HEART};
            case 'rockstars':   // Rockstar uses the normal stars STAR_UNSELECTED type.
                return {selectedPreset : documents.presets.STAR_SELECTED[theme].ROCKSTAR, unselectedPreset: documents.presets.STAR_UNSELECTED[theme].STAR};
        }
    }

    this.checkPermissions = function(ctrl) {
        ctrl.checkPermissions()
    }
}]);

// --( Handles Common Items for All Controllers )--
SurveyBuilder.service("header", ["$q", "$timeout", function($q, $timeout) {
    this.$scope = null;

    this.setScope = function(scope) {
        this.$scope = scope;
        this.initScope()
    }

    this.hasScope = function() {
        if(this.$scope !== null) {
            return true;
        }
        
        console.error("Missing controller for header, please set a controller with \"setScope\"");
        return false;
    }

    this.initScope = function() {
        this.$scope.canModifySurveyConfiguration = getCanModifySurveyConfiguration();
        angular.element(window).bind("scroll", function(e){
            var progress = document.getElementById("header-progress");
            if(window.pageYOffset > HEADER_OFFSET_TOP) {
                progress.classList.add("sticky");
            }
            else {
                progress.classList.remove("sticky");
            }
        });
        this.$scope.showTooltips = {
            surveyTypes : [false, false, false, false],
            fixedValue : false,
            surveyRecordOwnership : false,
            recordOwner : false,
            picklistOptions : false,
            radioAboveLabel : false,
            multipicklistOptions : false,
            questionText : false,
            questionLabel : false,
            customizeLandingPageLogo : false,
            customizeClassicLandingPageLogo : false,
            customizeEmailTemplateLogo : false,
            customizeClassicEmailTemplateLogo : false,
            customizeLandingPageBackground : false,
            customizeClassicLandingPageBackground : false,
            customizeEmailTemplateBackground : false,
            customizeClassicEmailTemplateBAckground : false,
            customizeBackgroundLayout : false,
            backgroundColor : false,
            clearResponses  : false,
            redirectUrl : false,
            customizeThumbsUp : false,
            customizeThumbsDown : false,
            customizeStars : false,
            brandColor : false,
            redirectImmediate : false,
            templateName : false,
            templateLanguage : false,
            preventDuplicates : false
        };

        this.$scope.inConsole = sforce && sforce.console && sforce.console.isInConsole();
        this.$scope.SETUP_PAGE_URL = SETUP_PAGE_URL;
        this.$scope.ORG_ID = ORG_ID;
        this.$scope.stepInfos = [
            {
                step : 1,
                label : 'Choose Survey',
                linkLabel : 'ChooseSurvey'
            },
            {
                step : 2,
                label : 'Configure Survey Object',
                linkLabel : 'ConfigureSurveyObject'
            },
            {
                step : 3,
                label : 'Add Questions',
                linkLabel : 'AddQuestions'
            },
            {
                step : 4,
                label : 'Customize Branding & Design',
                linkLabel : 'Branding'
            },
            {
                step : 5,
                label : 'Create Email Template',
                linkLabel : 'CreateEmailTemplate'
            }
        ];
        
        this.initLastStep();
    }

    this.initLastStep = function() {
        if(this.$scope.$root.lastStep) {
            return;
        }
        
        this.$scope.$root.lastStep = this.$scope.step - 1;
    }

    this.setLastStep = function(lastStepString) {
        if(this.$scope) {
            var stepsMap = {
                'Choose Survey' : 1,
                'Configure Survey Object'  : 2,
                'Add Questions' : 3,
                'Customize Branding & Design' : 4,
                'Create Email Template' : 5
            }
            if(stepsMap.hasOwnProperty(lastStepString)) {
                this.$scope.$root.lastStep = stepsMap[lastStepString];
            }
            else {
                this.$scope.$root.lastStep = 0;
            }
        }
    }

    this.canNavigate = function(stepInfo, configId) {
        if(getCanModifySurveyConfiguration() && configId) {
            return this.$scope.step !== stepInfo.step && stepInfo.step <= this.$scope.$root.lastStep + 1;
        }
        
        return stepInfo.step === 1;
    }

    this.generateStepPath = function(stepInfo, configId) {
        var path = '#!/' + stepInfo.linkLabel;
        if(configId) {
            path += '/' + configId;
        }
        return path;
    }

    this.showSpinner = function(doShow, label) {
        if(this.hasScope()) {
            this.$scope.processing = doShow;
            this.$scope.processingText = (doShow) ? ((label) ? label : "") : "";
            this.$scope.processingLabel = this.$scope.processingText + ((this.$scope.processingText.length > 0) ? "..." : "");
        }
    }

    this.showAlert = function(doShow, title, messageHTML, type) {
        if(this.hasScope()) {
            this.$scope.alertShow = doShow;
            if(doShow) {
                this.resetAlertButtons();
                this.$scope.alertTitle = title;
                this.$scope.alertType = type;
                document.getElementById("header-alert-content").innerHTML = messageHTML;
            }
            else {
                this.$scope.alertTitle = "";
                this.$scope.alertType = "info";
                document.getElementById("header-alert-content").innerHTML = "";
            }
        }
    }

    this.showMissingPermissionsAlert = function() {
        if(!DISPLAYED_PERMISSIONS_MODAL) {
            var messageHTML = '<p>' + LABELS.permissionsErrorOpening + '</p>';
            messageHTML += '<ul class="slds-list_dotted slds-m-left_small">';
    
            var doShow = false;
    
            for(let permissionName in PERMISSIONS) {
                // These two are checked separately
                if(permissionName === 'ModifyAllData' || permissionName === 'ModifyMetadata') {
                    continue;
                }

                if(!PERMISSIONS[permissionName]) {
                    doShow = true;
                    messageHTML += '<li>';
                    messageHTML += this.getPermissionLabel(permissionName);
                    messageHTML += '</li>'
                }
            }

            if(!PERMISSIONS.ModifyAllData && !PERMISSIONS.ModifyMetadata) {
                doShow = true;
                messageHTML += '<li>';
                messageHTML += this.getPermissionLabel('ModifyAllData') + ' or ' + this.getPermissionLabel('ModifyMetadata');
                messageHTML += '</li>'
            }
    
            messageHTML += '</ul>';
            messageHTML += '<p class="slds-m-top_small">' + LABELS.permissionsErrorClosing + '</p>';
            if(doShow) {
                DISPLAYED_PERMISSIONS_MODAL = true;
                this.showAlert(true, LABELS.missingPermissions, messageHTML, "warning");
            }
        }
    }

    this.getPermissionLabel = function(permissionName) {
        switch(permissionName) {
            case 'APIEnabled':
                return 'API Enabled';
            case 'CustomizeApplication':
                return 'Customize Application';
            case 'ModifyAllData':
                return 'Modify All Data';
            case 'ModifyMetadata':
                return 'Modify Metadata';
            case 'ManageProfilesPermissionSets':
                return 'Manage Profiles and Permission Sets';
            case 'CreateDocument':
                return 'Create permission on Document';
            case 'CreateEmailTemplate':
                return 'Create permission on Email Template';
            case 'ReadSurveyConfiguration':
                return 'Read permission on Simple Survey Configuration';
            case 'UpsertSurveyConfiguration':
                return 'Create and Edit permissions on Simple Survey Configuration';
        }
    }

    this.resetAlertButtons = function() {
        this.$scope.useDefaultAlertButtons = true;
        this.$scope.useDupeTemplateButtons = false;
        this.$scope.useNavConfirmButtons = false;
        this.$scope.useFinishedAlertButtons = false;
        this.$scope.useFinishedAlertReturnButton = false;
    }

    this.showDupeTemplateButtons = function() {
        this.$scope.useDefaultAlertButtons = false;
        this.$scope.useDupeTemplateButtons = true;
    }

    this.showNavConfirmButtons = function() {
        this.$scope.useDefaultAlertButtons = false;
        this.$scope.useNavConfirmButtons = true;
    }
    this.showFinishedAlertButtons = function() {
        this.$scope.useDefaultAlertButtons = false;
        this.$scope.useFinishedAlertButtons = true;
        this.$scope.useFinishedAlertReturnButton = !(this.$scope.inConsole && sforce && sforce.one);    // LEx Console has no home page
    }

    this.goToSimpleSurveySetup = function() {
        if(this.$scope.inConsole) {
            sforce.console.getEnclosingPrimaryTabId(function(result) {
                (result.success) ? sforce.console.openSubtab(result.id, SETUP_PAGE_URL, true) : sforce.console.openPrimaryTab(null, SETUP_PAGE_URL, true);
            });
        }
    }

    // Go to a page, override the current console tab.
    this.goToPage = function(path, isId) {
        if(this.$scope.inConsole) {
            sforce.console.getEnclosingTabId(function(encTabResult) {
                var enclosingTabId = encTabResult.id;
                if(encTabResult.success) {
                    sforce.console.getEnclosingPrimaryTabId(function(primTabResult) {
                        sforce.console.getSubtabIds(primTabResult.id, function(subtabsResult) {
                            if(subtabsResult.ids.length > 1) {  // Multiple Subtabs
                                sforce.console.openSubtab(primTabResult.id, path, true);
                                sforce.console.closeTab(enclosingTabId);
                            }
                            else {
                                sforce.console.generateConsoleUrl([path], function(genUrlResult) {  // Only Subtab
                                    sforce.console.openPrimaryTab(primTabResult.id, path, true, undefined, function(openResult) {
                                        if(!openResult.success) {   // If failed to open, most likely due to a dupe tab error, close this tab and focus the correct tab.
                                            sforce.console.getPrimaryTabIds(function(primTabsResult) {
                                                var focusId;
                                                for(var i = 0; i < primTabsResult.ids.length; i++) {
                                                    var id = primTabsResult.ids[i];
                                                    if(id !== enclosingTabId) {
                                                        sforce.console.getPageInfo(id, function(pageInfoResult) {
                                                            var pageInfo = JSON.parse(pageInfoResult.pageInfo);
                                                            if(pageInfo.url.indexOf(path) > -1 || (isId && pageInfo.url.indexOf(path.substring(0, path.length - 3)))) {
                                                                focusId = id;
                                                                sforce.console.focusPrimaryTabById(focusId);
                                                                sforce.console.closeTab(enclosingTabId);
                                                            }
                                                        })
                                                    }
                                                }
                                            });  
                                        }
                                    });
                                });
                            }
                        });
                    });
                }
                else if(enclosingTabId === "null") {    // Navigation
                    sforce.console.generateConsoleUrl([path], function(genUrlResult) {
                        sforce.console.refreshNavigationTab();
                        sforce.console.openConsoleUrl(null, genUrlResult.consoleUrl, true);                    
                    });
                }
            });
        }
        else {
            window.top.location = path;
        }
    }

    this.navigate = function(path, currentPath, dirty) {
        if(path && path.trim() !== '' && path.indexOf(currentPath) === -1) {
            if(dirty) {
                this.$scope.proceedTo = path;
                this.showNavConfirm();
            }
            else {
                location.assign(path);
                this.$scope = null;        
            }
        }
    }

    this.goToStep = function(stepName, currentStep, surveyConfigId) {
        if(stepName === "ChooseSurvey") {
            surveyConfigId = undefined;
        }
        this.navigate(this.buildPath(stepName, surveyConfigId), currentStep);
    }

    this.buildPath = function(stepName, surveyConfigId) {
        return "#!/" + stepName + "/" + ((typeof(surveyConfigId) !== "undefined") ? surveyConfigId : '');
    }

    this.alertOkayClicked = function() {
        this.$scope.alertShow = false;
        if(this.$scope.headerAlertOkayAction) {
            this.$scope.headerAlertOkayAction();
        }
    }

    this.showNavConfirm = function() {
        this.showAlert(true, LABELS.unsavedChanges, LABELS.unsavedChangesMsg, 'warning');
        this.showNavConfirmButtons();
    }

    this.navConfirmCancel = function() {
        this.showAlert(false);
    }

    this.handleError = function(errObj) {
        this.showSpinner(false);
        if(errObj.popup) {
            this.showAlert(true, LABELS.error, errObj.HTMLMessage, "error");
        }
    }
}]);

// --( Apex Controller Service )--
SurveyBuilder.factory('ctrl', ['$q', '$timeout', 'util', function($q, $timeout, util) {
    if(window.simplesurvey == null){
        window.simplesurvey = window;
    }

    //Modify the remote actions to return a promise that will resolve with the unescaped results.
    for(var methodName in simplesurvey.SurveyBuilderController) {
        var originalMethod = simplesurvey.SurveyBuilderController[methodName];

        //Assigned to a closure which invokes the original method and returns a promise
        simplesurvey.SurveyBuilderController[methodName] = (function(originalMethod) {
            return function() {
                var parameters = [].slice.call(arguments);

                return $q(function(resolve, reject) {
                    parameters.push(function(result, event) {
                        //Insure digest cycle runs
                        $timeout(function() {
                            if(event.status) {
                                resolve(util.unescapeXMLEntities(result));                                
                            }
                            else {
                                reject("An error occurred: " + ((event.message) ? event.message : ''));
                            }
                        });
                    });

                    originalMethod.apply(simplesurvey.SurveyBuilderController, parameters);
                });
            }
        })(originalMethod);
    }

    return simplesurvey.SurveyBuilderController;
}]);

// --( ss-tooltip Directive )--
SurveyBuilder.directive('ssTooltip', function() {
    return {
        restrict: 'E', //Elements only
        scope: {
            show: '=show'
        },
        transclude: true,
        template: '<div ng-show="show" style="position: fixed; left: {{x}}px; top: {{y}}px; z-index: 9999; background: {{bgcolor}}; box-shadow: {{boxshadow}}" class="slds-popover slds-popover_tooltip slds-nubbin_{{nubbin}}" role="tooltip">' +
                  '    <div class="slds-popover__body" style="color: {{color}};" ng-transclude></div>' +
                  '</div>',
        link: function(scope, element, attrs) {
            scope.x = 0;
            scope.y = 0;
            if('nubbin' in attrs){
                scope.nubbin = attrs.nubbin;
            }
            else{
                scope.nubbin = 'bottom';
            }
            
            if('inverse' in attrs && attrs.inverse) {
                scope.bgcolor = '#ffffff';
                scope.color = '#16325c';
                scope.boxshadow = '0 1px 4px 3px rgba(0,0,0,.16)';
            }
            else {
                scope.bgcolor = '#16325c';
                scope.color = '#ffffff';
                scope.boxshadow = '0 2px 3px 0 rgba(0,0,0,.16)';
            }

            window.addEventListener('mousemove', function(e) {
                var sw = window.clientWidth;
                var sh = window.clientHeight;

                switch(scope.nubbin) {
                    case 'top-left':
                        scope.x = e.clientX - 32;
                        scope.y = e.clientY + 32;
                        break;
                    case 'bottom-left':
                        scope.x = e.clientX - 22;
                        scope.y = e.clientY - element[0].firstElementChild.clientHeight - 20;
                        break;
                    case 'left' : 
                        scope.x = e.clientX + 22;
                        scope.y = e.clientY - (element[0].firstElementChild.clientHeight/2);
                        break;
                    default: //bottom
                        scope.x = e.clientX - element[0].firstElementChild.clientWidth / 2;
                        scope.y = e.clientY - element[0].firstElementChild.clientHeight - 20;
                        break;
                }
                scope.$digest();
            });
        }
    };
});

// --( ss-lookup Directive )--
SurveyBuilder.directive('ssLookup', function() {
    return {
        restrict: 'E', //Elements only
        scope: {
            label: '=label',
            value: '=value',
            options: '=options',
            ignoreDirty: '=ignorechangesif'
        },
        template: '<div class="slds-input-has-icon slds-input-has-icon_right">' +
                  '    <svg ng-class="{\'slds-input__icon\' : true, \'slds-icon-text-default\' : true, \'svg-fill-success\' : value !== null && value.length > 0}">' +
                  '        <use xlink:href="{{getIconURL()}}"></use>' +
                  '    </svg>' +
                  '    <input id="{{attrId}}" class="slds-input" placeholder="Name" data-dirty-ignore={{ignoreDirty}} type="text" ng-model="label" ng-keyup="checkClearValue($event)" ng-focus="showList = true" ng-blur="showList = false"/>' +
                  '    <div ng-show="showList && options.length > 0" >' +
                  '        <div class="slds-lookup__menu slds-show" role="listbox">' +
                  '             <ul class="slds-lookup__list slds-show" role="presentation">' +
                  '                 <li class="slds-lookup__item" ng-repeat="option in options" ng-mousedown="optionSelected(option)"><a role="option">{{option.label}}</a></li>' +
                  '             </ul>' +
                  '        </div>' +
                  '    </div>' +
                  '</div>',
        link: function(scope, element, attrs) {
            scope.showList = false;
            scope.attrId = attrs["dataid"];

            scope.getIconURL = function() {
                return SYMBOLS_URL + (scope.value == null || scope.value == '' ? '#search' : '#check');
            }

            scope.checkClearValue = function(event) {
                //Not tab(9), enter(13), shift(16), ctrl(17), end(35), home(36), left(37), up(38), right(39), down(40)
                if(event.keyCode !== 9 && event.keyCode !== 13 && event.keyCode !== 16 && event.keyCode !== 17 && !(event.keyCode >= 35 && event.keyCode <= 40)){
                    scope.value = null;
                }
            }

            scope.optionSelected = function(option) {
                scope.value = option.value;
                scope.label = option.label;
                scope.showList = false;
            }
        }
    }
});

// --( ss-drag Directive )--
SurveyBuilder.directive('ssDrag', function() {
    return {
        restrict: 'A', //Attributes only
        link: function(scope, element, attrs) {
            // BE (00182091) - ss-drag now uses a JSON string to differentiate options. It no longer automatically makes an element draggable.
            var varMapping = angular.fromJson(attrs.ssDrag);

            // Drag Start
            element.on('dragstart', function(e) {
                element.addClass('drag');
                e.dataTransfer.setData('Text', angular.toJson(scope.$eval(varMapping.data)));
                e.dataTransfer.effectAllowed = "move";
                evaluateDragAndDropHandler(scope, e, varMapping, "dragstart");
            });

            // Drag End
            element.on('dragend', function(e) {
                this.classList.remove('drag');
                evaluateDragAndDropHandler(scope, e, varMapping, "dragend");
            });

            function evaluateDragAndDropHandler(scope, event, varMapping, eventName) {
                if(varMapping.hasOwnProperty(eventName)) {
                    evaluateEventFunctionCalls(scope, event, varMapping, eventName, "stopPropagation");
                    evaluateEventFunctionCalls(scope, event, varMapping, eventName, "preventDefault");

                    if(varMapping[eventName].hasOwnProperty("handler") && typeof(scope[varMapping[eventName].handler]) === "function") {
                        scope.$apply(function() {
                            scope[varMapping[eventName].handler](event);
                        });
                    }
                }
            }

            function evaluateEventFunctionCalls(scope, event, varMapping, eventName, eventFunctionName) {
                if(varMapping[eventName].hasOwnProperty(eventFunctionName) && typeof(event[eventFunctionName]) === 'function') {
                    var doFunc = varMapping[eventName][eventFunctionName];

                    // Uses a scope variable
                    if(typeof(doFunc) === 'string') {
                        doFunc = scope[varMapping[eventName][eventFunctionName]];
                    }

                    if(typeof(doFunc) === 'boolean' && doFunc) {
                        event[eventFunctionName]();
                    }
                }
            }
        }
    };
});

// --( ss-drop Directive )--
SurveyBuilder.directive('ssDrop', function() {
    return {
        restrict: 'A', //Attributes only
        link: function(scope, element, attrs) {
            // BE (00182091) - ss-drag now uses a JSON string to differentiate options.
            var varMapping = angular.fromJson(attrs.ssDrop);

            // Drag Enter
            element.on('dragenter', function(e) {
                this.classList.add('over');
                evaluateDragAndDropHandler(scope, e, varMapping, "dragenter");
            });

            // Drag Leave
            element.on('dragleave', function(e) {
                this.classList.remove('over');
                evaluateDragAndDropHandler(scope, e, varMapping, "dragleave");
            });

            // Drag Over
            element.on('dragover', function(e) {
                this.classList.add('over');
                evaluateDragAndDropHandler(scope, e, varMapping, "dragover");
            });

            // Drop
            if(!varMapping.hasOwnProperty("drop") || (varMapping.hasOwnProperty("drop") && varMapping.drop.useEvent !== false)) {
                element.on('drop', function(e){
                    evaluateDragAndDropHandler(scope, e, varMapping, "drop");
    
                    [].forEach.call(document.querySelectorAll('[ss-drop]'), function(dropZone) {
                        dropZone.classList.remove('over');
                    });
                });
            }

            function evaluateDragAndDropHandler(scope, event, varMapping, eventName) {
                if(varMapping.hasOwnProperty(eventName)) {
                    evaluateEventFunctionCalls(scope, event, varMapping, eventName, "stopPropagation");
                    evaluateEventFunctionCalls(scope, event, varMapping, eventName, "preventDefault");

                    if(varMapping[eventName].hasOwnProperty("handler") && typeof(scope[varMapping[eventName].handler]) === "function") {
                        scope.$apply(function() {
                            scope[varMapping[eventName].handler](event, element[0]);
                        });
                    }
                }

                if(varMapping.hasOwnProperty("dropeffect") && (eventName === 'dragover')) {
                    event.dataTransfer.dropEffect = varMapping.dropeffect;
                }
            }

            function evaluateEventFunctionCalls(scope, event, varMapping, eventName, eventFunctionName) {
                if(varMapping[eventName].hasOwnProperty(eventFunctionName) && typeof(event[eventFunctionName]) === 'function') {
                    var doFunc = varMapping[eventName][eventFunctionName];

                    // Uses a scope variable
                    if(typeof(doFunc) === 'string') {
                        doFunc = scope[varMapping[eventName][eventFunctionName]];
                    }

                    if(typeof(doFunc) === 'boolean' && doFunc) {
                        event[eventFunctionName]();
                    }
                }
            }
        }
    };
});

// -- (file-upload-change Directive ) --
SurveyBuilder.directive('fileOnChange', function() {
    return {
        restrict : 'A',
        link : function(scope, element, attrs) {
            element.on('change', function(e) {
                scope[attrs.fileOnChange](element[0]);
            });
        }
    }
});

// --( ss-section Directive ) --
SurveyBuilder.directive('ssSection', function() {
    return {
        restrict: 'E', //Elements only
        scope: {
            "open" : '=open',
            "id" : '=sectionid',
            "label" : '=sectiontitle'
        },
        transclude: true,
        template:   '<div ng-class="{\'slds-section\' : true, \'slds-is-open\' : open}">' + 
                        '<h3 class="slds-section__title">' +
                            '<button aria-controls="{{id}}" aria-expanded="{{open}}" class="slds-button slds-section__title-action" ng-click="toggle()">' +
                                '<svg class="slds-section__title-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">' +
                                    '<use xlink:href="{{getIconUrl()}}"/>' +
                                '</svg>' +
                                '<span class="slds-truncate" title="{{label}}">{{label}}</span>' +
                            '</button>' +
                        '</h3>' +
                        '<div aria-hidden="{{!open}}" class="slds-section__content slds-p-around_x-small" id="{{id}}">' +
                            '<ng-transclude></ng-transclude>' + 
                        '</div>' +
                    '</div>',

        link: function(scope, element, attrs) {
            if(typeof(scope.open) === 'undefined' || scope.open === null) {
                scope.open = true;
            }

            scope.toggle = function(e) {
                scope.open = !scope.open;
            }

            scope.getIconUrl = function() {
                return SYMBOLS_URL + '#switch';
            }
        }
    };
});

// Handles Scaling of Live Previews
window.addEventListener("resize", function(e) {
    getHeaderOffsetTop();
});

var HEADER_OFFSET_TOP = 0;
function getHeaderOffsetTop() {
    HEADER_OFFSET_TOP = document.getElementById("header-progress").offsetTop;
}