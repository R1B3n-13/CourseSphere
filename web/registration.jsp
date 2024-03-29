<%-- 
    Document   : registration form modal
    Created on : Apr 13, 2023, 5:13:19 AM
    Author     : Sadik Al Barid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Set character encoding and viewport -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Set the title of the page -->
        <title>CourseSphere - log in or sign up</title>

        <!-- Set the favicon and page icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/png">
        <link rel="icon" href="${pageContext.request.contextPath}/resources/images/pageicon.png" type="image/png">

        <!-- Import Bulma CSS framework -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" 
              onerror="this.onerror=null;this.href='${pageContext.request.contextPath}/resources/css/bulma.min.css';">

        <!--Import the custom css file to modify Bulma styles-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">   
    </head>

    <body>
        <!-- The modal for the registration form -->
        <div id="reg-modal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card form-bg" style="border-radius:10px;">
                <!-- The header section of the modal -->
                <header class="modal-card-head form-bg">
                    <p class="modal-card-title has-text-grey-lighter has-text-weight-semibold">Register</p>
                    <a id="close-reg-modal" class="delete" aria-label="close"></a>
                </header>

                <!-- Sign up form -->
                <form method="post" action="register">
                    <!-- The main content section of the modal -->
                    <section class="modal-card-body form-bg">                    
                        <!-- The input fields for first name and last name -->
                        <div class="columns">
                            <div class="column">
                                <input class="input is-link custom-input has-text-grey-lighter" type="text" name="fname" id="fname" placeholder="First name" oninput="checkName('fname', 'fname-error')">
                                <!-- The first name validation tag -->
                                <p id="fname-error" class="help is-hidden has-text-danger"></p>
                            </div>
                            <div class="column">
                                <input class="input is-link custom-input has-text-grey-lighter" type="text" name="lname" id="lname" placeholder="Last name" oninput="checkName('lname', 'lname-error')">
                                <!-- The last name validation tag -->
                                <p id="lname-error" class="help is-hidden has-text-danger"></p>
                            </div>
                        </div>

                        <!-- The input field for username -->
                        <div class="field">
                            <input class="input is-link custom-input has-text-grey-lighter" type="text" name="uname" id="uname" placeholder="User name" oninput="checkUsername()">
                            <!-- The username validation tag -->
                            <p id="username-error" class="help is-hidden has-text-danger"></p>
                        </div>

                        <!-- The input field for email -->
                        <div class="field mt-5">
                            <input class="input is-link custom-input has-text-grey-lighter" type="email" name="email" id="email" placeholder="Email address" oninput="checkEmail()">
                            <!-- The email validation tag -->
                            <p id="email-error" class="help is-hidden has-text-danger"></p>
                        </div>                        

                        <!-- The input field for password -->
                        <div class="field mt-5">
                            <input class="input is-link custom-input has-text-grey-lighter" type="password" name="pwd" id="pwd" oninput="validatePassword()" placeholder="New password">
                        </div>

                        <!-- The input field to confirm password -->
                        <div class="field mt-5">
                            <input class="input is-link custom-input has-text-grey-lighter" type="password" id="confirmpwd" oninput="validatePassword()" placeholder="Confirm password">
                            <!-- The passwords do not match tag -->
                            <p class="help is-hidden has-text-danger" id="confirmpwd-error">Passwords do not match</p>
                        </div>

                        <!-- The radio buttons for the role selection -->
                        <div class="field mt-4 is-horizontal">
                            <div class="field-label is-normal mt-1 mr-0">
                                <label class="label is-pulled-left has-text-grey-lighter">Role :</label>
                            </div>

                            <div class="field-body mt-2">
                                <div class="control">
                                    <div class="buttons has-addons is-toggle">
                                        <label class="button is-rounded is-link is-small has-text-grey-lighter">
                                            <input type="radio" class="has-text-danger" name="role" value="teacher" checked>
                                            <span class="icon is-small m-1"><i class="fas fa-person-chalkboard"></i></span>
                                            <span>Teacher</span>
                                        </label>
                                        <label class="button is-rounded is-info is-small has-text-grey-lighter">
                                            <input type="radio" name="role" value="student">
                                            <span class="icon is-small m-1"><i class="fas fa-user-graduate"></i></span>
                                            <span>Student</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- The terms and conditions link -->
                        <p class="has-text-centered has-text-grey-lighter mt-5">By clicking Sign Up, you agree to our <a class="has-text-link">Terms & Conditions</a>.</p>
                    </section>                  

                    <!-- The footer section of the modal with sign up button -->
                    <footer class="modal-card-foot form-bg">
                        <button class="button is-block is-rounded is-primary is-medium is-fullwidth" id="signup-btn" disabled>Sign Up</button>
                    </footer>
                </form>
            </div>
        </div>
    </body>
</html>