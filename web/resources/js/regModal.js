/*
 Document   : js file for the regestration modal and the login button.
 Created on : Apr 13, 2023, 6:41:50 AM
 Author     : Sadik Al Barid
 */

// Get the button that opens the modal
let openRegModalButton = document.querySelector('[id="open-reg-modal"]');

// Get the modal element
let regModal = document.querySelector('[id=reg-modal]');

// Get the button that closes the modal
let closeRegModalButton = document.querySelector('[id="close-reg-modal"]');

// get the sign-up button
let signup = document.querySelector('[id="signup-btn"]');

// username, password, email field flags and the function for sign up button status
let uFlag = pFlag = eFlag = false;
function signupStatus() {
    return pFlag | uFlag | eFlag;
}

// Function to open the modal
function openRegModal() {
    regModal.classList.add('is-active');
}

// Function to close the modal
function closeRegModal() {
    regModal.classList.remove('is-active');
}

// Event listener to open the modal when the button is clicked
openRegModalButton.addEventListener('click', openRegModal);

// Event listener to close the modal when the close button is clicked
closeRegModalButton.addEventListener('click', closeRegModal);

// Function to check if the passwords match
function validatePassword() {
    // Get the password and confirm password input fields
    let pwd = document.getElementById("pwd");
    let confirmpwd = document.getElementById("confirmpwd");

    // Get the error message element
    let error = document.getElementById("confirmpwd-error");

    // Check if the passwords match
    if (pwd.value !== confirmpwd.value) {
        // If the passwords don't match, show the error message and disable the sign-up button
        error.classList.remove('is-hidden');
        confirmpwd.classList.add('is-danger');
        pFlag = true;
        signup.disabled = signupStatus();
    } else {
        // If the passwords match, hide the error message and enable the sign-up button
        error.classList.add('is-hidden');
        confirmpwd.classList.remove('is-danger');
        pFlag = false;
        signup.disabled = signupStatus();
    }
}

// Function to check whether the user name is alphanumeric (with _)
function isValidUname(username) {
    // regex pattern
    let regex = /^[a-zA-Z0-9_]+$/;
    return regex.test(username);
}

// Function to check whether the email is alphanumeric (with _), contains @ and a domain name
function isValidEmail(email) {
    // regex pattern
    let regex = /^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*$/gm;
    return regex.test(email);
}

// Function to check whether the user name is valid
function checkUsername() {
    // Get the value of the input field for username
    let username = document.getElementById("uname");

    //Get the username-error p tag
    let usernameError = document.getElementById("username-error");

    // Create a new XMLHttpRequest object
    let xhttp = new XMLHttpRequest();

    // Set the function to handle the AJAX response
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            // Parse the JSON response
            let response = JSON.parse(this.responseText);

            // Show the validation message
            if (response.count > 0) {
                // If not valid, show the error message and disable the sign-up button
                usernameError.classList.remove("is-hidden");
                usernameError.innerHTML = "Username not available";
                username.classList.add('is-danger');
                uFlag = true;
                signup.disabled = signupStatus();
            } else {
                // If valid, hide the error message and enable the sign-up button
                usernameError.classList.add("is-hidden");
                username.classList.remove('is-danger');
                uFlag = false;
                signup.disabled = signupStatus();
            }
        }
    };

    // Send an AJAX GET request to the server to check if the username already exists
    if (isValidUname(username.value)) {
        xhttp.open("GET", "./checkers/checkUsername.jsp?username=" + username.value, true);
        xhttp.send();
    } else {
        // If not valid, show the error message and disable the sign-up button
        usernameError.classList.remove("is-hidden");
        usernameError.innerHTML = "Username can only contain alphanumeric characters and underscore";
        username.classList.add('is-danger');
        uFlag = true;
        signup.disabled = signupStatus();
    }
}

// Function to check whether the email is valid
function checkEmail() {
    // Get the value of the input field for email
    let email = document.getElementById("email");

    //Get the email-error p tag
    let emailError = document.getElementById("email-error");

    // Create a new XMLHttpRequest object
    let xhttp = new XMLHttpRequest();

    // Set the function to handle the AJAX response
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            // Parse the JSON response
            let response = JSON.parse(this.responseText);

            // Show the validation message
            if (response.count > 0) {
                // If not valid, show the error message and disable the sign-up button
                emailError.classList.remove("is-hidden");
                emailError.innerHTML = "Email is already registered with another account";
                email.classList.add('is-danger');
                eFlag = true;
                signup.disabled = signupStatus();
            } else {
                // If valid, hide the error message and enable the sign-up button
                emailError.classList.add("is-hidden");
                email.classList.remove('is-danger');
                eFlag = false;
                signup.disabled = signupStatus();
            }
        }
    };

    // Send an AJAX GET request to the server to check if the email already exists
    if (isValidEmail(email.value)) {
        xhttp.open("GET", "./checkers/checkEmail.jsp?email=" + email.value, true);
        xhttp.send();
    } else {
        // If not valid, show the error message and disable the sign-up button
        emailError.classList.remove("is-hidden");
        emailError.innerHTML = "Invalid email";
        email.classList.add('is-danger');
        eFlag = true;
        signup.disabled = signupStatus();
    }
}