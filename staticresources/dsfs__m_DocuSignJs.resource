/**
 * Runs when hitting cancel in add user view, returns to checkbox view
 */
function cancelAdd() {
  showEditEnvelope();
}

/**
 * Used on Result object strings to escape possible html characters
 */
function unescapeHTMLSpecialCharacters(str) {
  return str.replace(/&quot;/g, '"').replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">");
}

/**
 * Ran on page load
 * hides html elements that are initially hidden
 * and loops through Result object to populate html with recipients and documents
 */
function populateUsers() {

  for (var i = 0; i < Result.envelope.documents.length; i++) {
    Result.envelope.documents[i].name = unescapeHTMLSpecialCharacters(Result.envelope.documents[i].name);
  }

  for (var i = 0; i < Result.envelope.recipients.length; i++) {
    Result.envelope.recipients[i].name = unescapeHTMLSpecialCharacters(Result.envelope.recipients[i].name);
  }

  $j('#dsDocsList').sortable({
    axis: 'y',
    opacity: 0.6,
    items: '> li',
    containment: 'document',
    placeholder: 'ui-placeholder',
    stop: function (event, ui) {
      newDocOrders = $j('#dsDocsList').sortable('toArray');
    }
  });
  
  $j('#dsSignersList').sortable({
    axis: 'y',
    opacity: 0.6,
    items: '> li',
    containment: 'document',
    placeholder: 'ui-placeholder',
    stop: function (event, ui) {
      newSignerOrders = $j('#dsSignersList').sortable('toArray');
    }
  });
  
  $j('#dsDocsList, #dsSignersList').sortable('disable');
  $j('#dsDocsList, #dsSignersList').disableSelection();

  window.addEventListener('load', function () {
    new FastClick(document.body);
  }, false);

  showEditEnvelope();

  document.getElementById("signerDoneBtn").style.display = 'none';
  document.getElementById("docDoneBtn").style.display = 'none';
  document.getElementById("docSortBtn").style.display = 'none';
  document.getElementById("signerSortBtn").style.display = 'none';

  //Add Documents to page:
  for(var i = 0; i < Result.envelope.documents.length; i++) {
    var docList = document.createElement("li");
    docList.id = "doc-" + i;

    var docLabel = document.createElement("label");
    docLabel.setAttribute("for", "dsDocCheckBox" + i);

    var docCheck = document.createElement("input");
    docCheck.id = "dsDocCheckBox" + i;
    docCheck.type = "checkbox";
    docCheck.setAttribute("onchange", "checkDoc(" + i + ")");

    var docImg = document.createElement("img");
    docImg.setAttribute("class", "ds-doc-icon");
    docImg.setAttribute("src", getDocURL(Result.envelope.documents[i].extension))

    docLabel.appendChild(docCheck);
    docLabel.appendChild(docImg);
    //include docLabel span:
    docLabel.innerHTML = docLabel.innerHTML + "<span id = 'docLabelSpan-"+ i +"' >"+ docNameTrim(Result.envelope.documents[i].name) + "<small class = 'sub-text'>" + sizeTrim(Result.envelope.documents[i].size) +"</small></span>";

    var link = document.createElement("a");
    link.setAttribute("href", "javascript:;");
    link.setAttribute("class", "move");
    link.style.display = 'none'
    docList.appendChild(link);

    docList.appendChild(docLabel);

    document.getElementById("dsDocsList").appendChild(docList);
  }

  if (Result.envelope.documents.length > 1) {
    addSortButton("doc");
  }

  var myDiv = document.getElementById("dsSignersList");
    //Add signers to page:
  for (var i = 0; i < Result.envelope.recipients.length; i++) {
    var newName = Result.envelope.recipients[i].name;
    var newMail = Result.envelope.recipients[i].email;

    var userDiv = document.createElement('li');
    userDiv.id = "signer-" + i;
  
    //new checkbox
    var newDiv = document.createElement('div');
    var checkBox = document.createElement("input");
    var label = document.createElement("label");
    label.setAttribute('for', "dsSignerCheckBox" + i)
  
    newDiv.id = "signerCheck" + i;
    checkBox.type = "checkbox";
    checkBox.id = "dsSignerCheckBox" + i;
    checkBox.setAttribute("onchange", "addRadioButtons(" + i + ")")
  
    label.appendChild(checkBox);
    label.innerHTML = label.innerHTML + "<span id='signerLabelSpan-"+  i  + "' >"+ nameTrim(newName) + "<small class = 'sub-text'>" + nameTrim(newMail) +"</small></span>";

    var link = document.createElement("a");
    link.setAttribute("href", "javascript:;");
    link.setAttribute("class", "move");
    link.style.display = 'none'
    userDiv.appendChild(link);

    userDiv.appendChild(label)
    myDiv.appendChild(userDiv)
  
    //radio buttons:
    var radioDiv = document.createElement("div");
    radioDiv.setAttribute("class", "sign-how")
    radioDiv.id = "radioDiv" + i;
  
    var radio = document.createElement("input");
    var rlabel =document.createElement("label");
    radio.id = "dsSignerEmailType" + i;
    radio.type = "radio"
    radio.value = "via email"
    radio.name = "user" + i
    radio.setAttribute("checked", true);
  
    rlabel.appendChild(radio)
    rlabel.innerHTML = rlabel.innerHTML + "<span>" + Label.viaEmail + "</span>"
  
    var radio2 = document.createElement("input");
    var rlabel2 =document.createElement("label");
    radio2.id = "dsSignerInPersonType" + i;
    radio2.type = "radio"
    radio2.value = "via in-person"
    radio2.name = "user" + i
  
    rlabel2.appendChild(radio2)
    rlabel2.innerHTML = rlabel2.innerHTML + "<span>"+ Label.viaInPerson +"</span>"
      
    radioDiv.appendChild(rlabel);
    radioDiv.appendChild(rlabel2);

    if (!showInPersonOption) {
      rlabel2.style.display = 'none';
    }

    //Outer div for hiding radio buttons:
    var outSideDiv = document.createElement("div");
    outSideDiv.setAttribute("class", "radioClass");
    outSideDiv.appendChild(radioDiv);
  
    userDiv.appendChild(outSideDiv);
    //set to hidden:
    radioDiv.style.display = 'none'

  }
  if (Result.envelope.recipients.length > 1) {
    addSortButton("signer");
  }
}

/**
 * Ran when hitting the add signer button,
 * sends user to the add signer view
 */
function newSigner() {
  showAddSigner();
}

/**
 * Takes input from text boxes and creates a new signer, then adds it to the html and Result object
 */
function addSigners() {
  var newName = document.getElementById("dsSignerName").value;
  var newMail = document.getElementById("dsSignerEmail").value;

  var i = Result.envelope.recipients.length; 

  if (!/^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/.test(newMail.toLowerCase())) {
    showError('', Label.invalidEmailError, true);
    return;
  }

  showEditEnvelope();
  //Add empty role value and names for recipients created from the mobile UI
  var roleMapping = {name: '', value: 0};
  Result.envelope.recipients.push({
    name: newName,
    email: newMail,
    routingOrder: (Result.envelope.recipients.length + 1),
    role: roleMapping,
    type: 'Signer',
    selected: true
  });

  if (Result.envelope.recipients.length > 1) {
    addSortButton("signer");
  }

  //add checkbox and radio buttons:
  var myDiv = document.getElementById('dsSignersList');
  //create new div for the user:
  var userDiv = document.createElement('li');
  userDiv.id = "signer-" + i;

  //new checkbox
  var newDiv = document.createElement('div');
  var checkBox = document.createElement("input");
  var label = document.createElement("label");

  label.setAttribute('for', "dsSignerCheckBox" + i)

  newDiv.id = "signerCheck" + i;
  checkBox.type = "checkbox";
  checkBox.setAttribute('checked', true);
  signersChecked++;
  checkBox.id = "dsSignerCheckBox" + i;
  checkBox.setAttribute("onchange", "addRadioButtons(" + i + ")")

  label.appendChild(checkBox);
  label.innerHTML = label.innerHTML + "<span id='signerLabelSpan-" + i + "' >"+ nameTrim(newName) + "<small class = 'sub-text'>" + nameTrim(newMail) +"</small></span>";

  var link = document.createElement("a");
  link.setAttribute("href", "javascript:;");
  link.setAttribute("class", "move");
  link.style.display = 'none'
  userDiv.appendChild(link);

  userDiv.appendChild(label)
  myDiv.appendChild(userDiv)

  //radio buttons:
  var radioDiv = document.createElement("div");
  radioDiv.setAttribute("class", "sign-how")
  radioDiv.id = "radioDiv" + i;

  var radio = document.createElement("input");
  var rlabel =document.createElement("label");
  radio.id = "dsSignerEmailType" + i;
  radio.type = "radio"
  radio.value = "via email"
  radio.name = "user" + i
  radio.setAttribute('checked', true);

  rlabel.appendChild(radio)
  rlabel.innerHTML = rlabel.innerHTML + "<span>" + Label.viaEmail + "</span>"

  var radio2 = document.createElement("input");
  var rlabel2 =document.createElement("label");
  radio2.id = "dsSignerInPersonType" + i;
  radio2.type = "radio"
  radio2.value = "via in-person"
  radio2.name = "user" + i

  rlabel2.appendChild(radio2)
  rlabel2.innerHTML = rlabel2.innerHTML + "<span>"+ Label.viaInPerson +"</span>"
  
  radioDiv.appendChild(rlabel);
  radioDiv.appendChild(rlabel2);

  if (!showInPersonOption) {
    rlabel2.style.display = 'none';
  }
  //Outer div for hiding radio buttons:
  var outSideDiv = document.createElement("div");
  outSideDiv.setAttribute("class", "radioClass");
  outSideDiv.appendChild(radioDiv);

  userDiv.appendChild(outSideDiv);
  //set to hidden:
  radioDiv.style.display = 'block'

  //check to see if submit button can be activated:
  var btn = document.getElementById('docusignBtn');
  if (signersChecked > 0 && documentsChecked > 0) {
    //activate submit button:
    btn.classList.remove('inactive');
    btn.disabled = false;

  } else {
    //deactivate:
    btn.classList.add('inactive');
    btn.disabled = true;
  }
}


/**
 * Ran when a signers checkbox is checked,
 * displays the radio button html elements of the signer that was checked
 */
function addRadioButtons(i) {

  //check if checked or unchecked
  var signerBox = document.getElementById("dsSignerCheckBox" + i);
  var radDiv = document.getElementById("radioDiv" + i);
  if (signerBox.checked == false)
  {
      radDiv.style.display = 'none';
      signersChecked--;
  }
  else if (signerBox.checked == true)
  {
      radDiv.style.display = 'block';
      signersChecked++;
  }

  var btn = document.getElementById('docusignBtn');
  if (signersChecked > 0 && documentsChecked > 0) {
    //activate submit button:
    btn.classList.remove('inactive');
    btn.disabled = false;
  } else {
    //deactivate:
    btn.classList.add('inactive');
    btn.disabled = true;
  }
}


/**
 * Ran when a document is checked, adjusts variables and checks
 * whether or not submit button should be enabled/disabled
 */
function checkDoc(i) {
  //check if checked or unchecked
  var docBox = document.getElementById("dsDocCheckBox" + i);
  if (docBox.checked == false)
  {
      documentsChecked--;
  }
  else if (docBox.checked == true)
  {
      documentsChecked++;
  }

  var btn = document.getElementById('docusignBtn');
  if (signersChecked > 0 && documentsChecked > 0) {
    //activate submit button:
    btn.classList.remove('inactive');
    btn.disabled = false;

  } else {
    //deactivate:
    btn.classList.add('inactive');
    btn.disabled = true;
  }
}


/**
 * Adjsuts Result object based on what documents/signers are checked
 * Re-orders object if the documents or signers were sorted by the user
 * Then sends calls the apex remote action call to send the envelope
 */
function submitForm(result) {
  var btn = document.getElementById("docusignBtn");
  btn.disabled = true;
  btn.classList.add("inactive");
  //get data from page and fill in selected/signNow properties of Result.envelope
  for (var i = 0; i < Result.envelope.documents.length; i++) {
    var doc = document.getElementById("dsDocCheckBox" + i);
    if(doc.checked) {
      Result.envelope.documents[i].selected = true;
    } else {
      Result.envelope.documents[i].selected = false;
    }
  }
  for (var i = 0 ; i < Result.envelope.recipients.length; i++) {
    var signer = document.getElementById("dsSignerCheckBox" + i);
    if(signer.checked) {
      Result.envelope.recipients[i].selected = true;
    } else {
      Result.envelope.recipients[i].selected = false;
    }
    var radio1 = document.getElementById("dsSignerEmailType" + i);
    var radio2 = document.getElementById("dsSignerInPersonType" + i);
    if(radio2.checked) {
      Result.envelope.recipients[i].type = "InPersonSigner"
    } else {
      Result.envelope.recipients[i].type = "Signer"
    }
  }

  //if new doc order:
  if(newDocOrders.length != 0) {
    var newOrder = [];
    for (var i = 0 ; i < newDocOrders.length; i++) {
      var docPos = parseInt(newDocOrders[i].replace('doc-', ''));
      var doc = Result.envelope.documents[docPos];
      doc.sequence = i + 1;
      //delete doc.$$hashkey;
      newOrder.push(doc);
    }
    Result.envelope.documents = newOrder;
  }

  //if new signer order:
  if (newSignerOrders.length != 0) {
    var newOrder = [];
    for (var i = 0; i < newSignerOrders.length; i++) {
      var signerPos = parseInt(newSignerOrders[i].replace('signer-', ''));
      var signer = Result.envelope.recipients[signerPos];
      newOrder.push(signer);
    }
    Result.envelope.recipients = newOrder;
  }

  for (var i = 0 ; i < Result.envelope.recipients.length; i++) {
    if(Result.envelope.recipients[i].selected === true) {
      Result.envelope.recipients[i].routingOrder = i + 1;
      if (Result.envelope.recipients[i].type === 'InPersonSigner') {
        Result.envelope.recipients[i].signNow = true;
        Result.envelope.recipients[i].hostName = CurrentUser.name;
        Result.envelope.recipients[i].hostEmail = CurrentUser.email;
      } else {
        Result.envelope.recipients[i].signNow = false;
      }
    }
  }
  showMobileLoading();
  try {
    var selectedDocs = [];
    for (var i = 0 ; i < Result.envelope.documents.length; i++) {
      var doc = Result.envelope.documents[i];
      if (doc.selected) {
        delete doc.selected;
        selectedDocs.push(doc)
      }
    }
    Result.envelope.documents = selectedDocs;

    var selectedRecipients = [];
    var roleSequence = 0;
    for (var i = 0; i < Result.envelope.recipients.length; i++) {
      var recipient = Result.envelope.recipients[i];
      if (recipient.selected) {
        if (DSUtil.isDefined(DefaultRoles[roleSequence])) {
          recipient.role.name = DefaultRoles[roleSequence].name;
          recipient.role.value = DefaultRoles[roleSequence].value;
          roleSequence++;
        }
        delete recipient.selected;
        selectedRecipients.push(recipient);
      }
    }

    Result.envelope.recipients = selectedRecipients;
    //Remote action call:
    Visualforce.remoting.Manager.invokeAction(Envelope.updateEnvelope, Result.envelope, function (result, event) {
      if (isSuccessfulResult(event, result)) {
        submitEnvelope(result.envelope);
      }
    });
  } catch (err) {
    showRemoteActionError(err.message);
  }

}

/**
 * Returns status of the remote action call
 */
function isSuccessfulResult(event, result) {
  var status = true;
  if (event.status && result) {
    if (!result.success && DSUtil.isNotEmpty(result.messages)) {
      showRemoteActionError(result.messages[0]);
      status = false;
    } else if (!result.success) {
      showRemoteActionError(Label.unknownError);
      status = false;
    }
  } else {
    showRemoteActionError(event.message);
    status = false;
  }
  return status;
}


/**
 * sends envelope or opens tagger page  if needed
 */
function submitEnvelope(envelope) {
  Visualforce.remoting.Manager.invokeAction(Envelope.sendEnvelope,
    envelope,
    navigator.userAgent,
    DSUtil.isMaybeIPad(),
    DSConfiguration.sendNow,
    function (result, event) {
      if (isSuccessfulResult(event, result)) {
        if (DSUtil.isBlank(result.url)) {
          DSUtil.navigateToSObject(Envelope.sourceId);
        } else if (result.url.substring(0, 11) === 'docusign-v1') { // mobile tagger
          DSUtil.navigateToURL(result.url, true);
          setTimeout(function () {
            hideMobileLoading();
            showInstall();
          }, 10000);
        } else {
          showIframe(result.url);
        }
      }
    }, {escape: false});
}

/**
 * Displays error of remote action call on page
 */
function showRemoteActionError(message) {
  $j("#errorDialog").bind({
    popupafterclose: function (event, ui) {
      DSUtil.navigateToSObject(Envelope.sourceId);
    }
  });
  $j('#errorMessage').html(message);
  $j("#errorDialog").show();
}

/**
 * Show embedded signing or tagging page.
 */
function showIframe(url) {
  hideAll();

  var dsIFrame = $j('#ds-iframe');
  dsIFrame.attr('src', url);
  $j('#ds-dialog').show();
}

/**
 * Hides all pages
 */
function hideAll() {
  hideError();
  hideAddSigner();
  hideInstall();
  hideMobileLoading();
  hideEditEnvelope();

}

/**
 * shows loading wheel
 */
function showMobileLoading() {
  document.getElementById("dsMobileLoading").style.display = 'block';
}

/**
 * Hides loading wheel
 */
function hideMobileLoading() {
  document.getElementById("dsMobileLoading").style.display = 'none';
}

/**
 * shows the edit envelope page
 */
function showEditEnvelope() {
  hideAll();
  document.getElementById("dsEditEnvelope").style.display = 'block';
}

/**
 * Hides edit envelope page
 */
function hideEditEnvelope() {
  document.getElementById("dsEditEnvelope").style.display = 'none';
}

/**
 * Shows the add signer page, resets inputs
 */
function showAddSigner() {
  hideAll();
  document.getElementById("dsSignerName").value = '';
  document.getElementById("dsSignerEmail").value = '';

  //reset add button:
  var btn = document.getElementById("dsAddSignerBtn");
  btn.classList.add('inactive');
  btn.disabled = true;

  document.getElementById("dsAddSignerModal").style.display = 'block';
}

/**
 * hides add signer pages
 */
function hideAddSigner() {
  document.getElementById("dsAddSignerModal").style.display = 'none';
}

/**
 * Shows install docusign button
 */
function showInstall() {
  document.getElementById("dsInstall").style.display = 'block';
  $j("html, body").animate({scrollTop: $j(document).height()}, "slow");
}

/**
 * Hides install docusign button
 */
function hideInstall() {
  document.getElementById("dsInstall").style.display = 'none';
}


 /*
  * Show error page.
  * @param errorCode - errorCode from backend
  * @param errorDescription - description of error from backend
  * @param showAtTop - just show error at top of page
  */
function showError(errorCode, errorDescription, showAtTop) {
  if (!showAtTop) {
    hideAll();
  }
  var code = '';
  if (errorCode && errorCode !== '') {
    code = ' (' + errorCode + ')';
  }
  $j("#dsAlert ul").empty().append('<li><p>' + errorDescription + code + '</p></li>');
  $j("#dsAlert").show();
}

/**
 * Hides error messages
 */
function hideError() {
  document.getElementById("dsAlert").style.display = 'none';
}

/**
 * Adds sort button for documents or signers, ran when more than one document or signers are available
 */
function addSortButton(type) {
  var btn;
  if (type === "doc") {
    btn = document.getElementById("docSortBtn");
  }
  else if (type === "signer") {
    btn = document.getElementById("signerSortBtn");
    //move add button:
    document.getElementById("addSignerBtn").style.right = "50px";
  } else {
    return;
  }
  btn.style.display = 'block'
  
}

/**
 * implementation of install button
 */
function clickInstall() {
  hideInstall();
  $('#docusignBtn').removeClass('inactive');
  $('#docusignBtn').prop('disabled', false);
  if (DSConfiguration.currentDevice.os.toLowerCase() === 'ios') {
    DSUtil.navigateToURL(Download.ios);
  } else {
    DSUtil.navigateToURL(Download.android);
  }
}

// release dollar sign for other libraries possible
jQuery.noConflict();
// all docusign front end logic starts from document.loaded event
jQuery(document).ready(function ($) {

  $('#dsSignerName, #dsSignerEmail').bind('keyup change', function () {
    if ($('#dsSignerName').val() && $('#dsSignerEmail').val()) {
      $('#dsAddSignerBtn').removeClass('inactive');
      $('#dsAddSignerBtn').prop('disabled', false);
    } else {
      $('#dsAddSignerBtn').addClass('inactive');
      $('#dsAddSignerBtn').prop('disabled', true);
    }
  });

  

});
