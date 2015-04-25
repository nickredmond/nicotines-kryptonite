var EMAIL_PATTERN = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";

function hide(elementID){
	var element = document.getElementById(elementID);
	element.style.height = "0";
	element.style.visibility = "hidden";
	element.style.margin = "0";
	element.style.padding = "0";
}

function show(elementID){
	var element = document.getElementById(elementID);
	element.style.height = "auto";
	element.style.visibility = "visible";
	element.style.margin = "10px 0 0 0";
	element.style.padding = "0 0 10px 0";
}

function switchPanels(oldElementID, newElementID){
	removeValidationErrors();
	hide(oldElementID);
	show(newElementID);
}

function showValidationErrors(errorMessages){
	removeValidationErrors();
	document.getElementById('validationArea').style.display = "block";

	for (var i = 0; i < errorMessages.length; i++){
		var listItem = document.createElement('li');
		var textNode = document.createTextNode(errorMessages[i]);
		listItem.appendChild(textNode);
		document.getElementById('errorList').appendChild(listItem);
	}
}

function removeValidationErrors(){
	document.getElementById('validationArea').style.display = "none";

	var errorList = document.getElementById('errorList');
	while (errorList.firstChild) {
	    errorList.removeChild(errorList.firstChild);
	}
}

function start(){
	hide('userInfo');
	hide('addictionInfo');
	hide('accountInfo');
}

// Courtesy of @Fabiano, StackOverflow
function removeOptions(selectbox)
{
    var i;
    for(i=selectbox.options.length-1;i>=0;i--)
    {
        selectbox.remove(i);
    }
}

function addOption(select_id, option_value){
	var x = document.getElementById(select_id);
	var option = document.createElement("option");
	option.text = option_value;
	x.add(option);
}

function updateNumberDaysInMonth(){
	var month = $('#user_date_of_birth_2i').val();
	var year = $('#user_date_of_birth_1i').val();

	$.ajax({
		type: 'get',
		url: '/get_date',
		data: {month: month, year: year},
		success: function(data) {
			removeOptions(document.getElementById('user_date_of_birth_3i'));

			for (var i=0; i < data; i++)
				addOption('user_date_of_birth_3i', i+1);
		}
	});
}

function hideAddictionOptions(){
	var tobaccoTypeFields = document.getElementsByClassName('tobaccoTypeField');

	for (var i = 0; i < tobaccoTypeFields.length; i++){
		tobaccoTypeFields[i].style.visibility = "hidden"
		tobaccoTypeFields[i].style.height = "0"
	}
}

function showAddictionOptions(className){
	var shownOptions = document.getElementsByClassName(className);

	for (var i = 0; i < shownOptions.length; i++){
		shownOptions[i].style.visibility = "visible"
		shownOptions[i].style.height = "auto"
	}
}

function addictionInfoClick(){
	var isCigarettesChecked = document.getElementById('areCigarettesUsed').checked;
	var isSmokelessChecked = document.getElementById('areSmokelessUsed').checked;
	var isCigarsChecked = document.getElementById('areCigarsUsed').checked;

	if (!(isCigarettesChecked || isSmokelessChecked || isCigarsChecked)){
		showValidationErrors(["You wouldn't be here if you didn't use some form of tobacco. Please select one or more."]);
	}
	else {
		if (isCigarettesChecked){
			showAddictionOptions('cigarettesField');
		}
		if (isSmokelessChecked){
			showAddictionOptions('dipsField');
		}
		if (isCigarsChecked){
			showAddictionOptions('cigarsField');
		}

		switchPanels('userInfo', 'addictionInfo');
	}
}

function accountInfoClick(){
	hideAddictionOptions();
	switchPanels('addictionInfo', 'accountInfo');
}

function signupClick(){
	var validationErrors = []
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var passwordConfirmation = document.getElementById('passwordConfirmation').value;
	var email = document.getElementById('email').value;

	if (!username){
		validationErrors.push("You must provide a username.");
	}
	if (!password){
		validationErrors.push("You must provide a password.");
	}

	if (!email){
		validationErrors.push("You must provide an email address.");
	}
	else if (!email.match(EMAIL_PATTERN)){
		validationErrors.push("Email address is invalid.")
	}

	if (!passwordConfirmation){
		validationErrors.push("Please confirm your password.")
	}
	if (!(password === passwordConfirmation)){
		validationErrors.push("Password and password confirmation do not match.");
	}

	if (validationErrors.length > 0){
		showValidationErrors(validationErrors);
	}
	else{
		$.ajax({
			type: 'post',
			url: '/account/create',
			data: {
				fullName: document.getElementById('fullName').value,
				birthYear: document.getElementById('user_date_of_birth_1i').value,
				birthMonth: document.getElementById('user_date_of_birth_2i').value,
				birthDay: document.getElementById('user_date_of_birth_3i').value,
				placeOfResidence: document.getElementById('place_of_residence').value,
				cigarettesPerDay: document.getElementById('cigarettesPerDay').value,
				dipsPerDay: document.getElementById('dipsPerDay').value,
				cigarsPerDay: document.getElementById('cigarsPerDay').value,
				cigaretteBrand: document.getElementById('cigarette_brand').value,
				cigarBrand: document.getElementById('cigar_brand').value,
				dipBrand: document.getElementById('dip_brand').value,
				username: username,
				email: email,
				password: password,
				passwordConfirmation: passwordConfirmation
			},
			dataType: "json",
			headers: {
			  'X-Transaction': 'POST Example',
			  'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			},
			success: function(redirect_url) {
				alert('aw man');
				location.href = redirect_url;
			},
			error: function(data) {
				//alert('here comes the sun: ' + error_messages.toString());
				showValidationErrors(data.responseJSON.errors);
			}
		});
	}
}

$('#user_date_of_birth_2i').change(function() {
	updateNumberDaysInMonth();
})
$('#user_date_of_birth_1i').change(function() {
	updateNumberDaysInMonth();
})

start();
hideAddictionOptions();
$(document).ready(function() { updateNumberDaysInMonth() });