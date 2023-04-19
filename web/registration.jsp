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
            <div class="modal-card regform-bg" style="border-radius:17px;">
                <!-- The header section of the modal -->
                <header class="modal-card-head regform-bg">
                    <p class="modal-card-title has-text-weight-semibold">Sign Up</p>
                    <a id="close-reg-modal" class="tag is-delete is-rounded" aria-label="close"></a>
                </header>

                <!-- Sign up form -->
                <form method="post" action="register">
                    <!-- The main content section of the modal -->
                    <section class="modal-card-body regform-bg">                    
                        <!-- The input fields for first name and last name -->
                        <div class="columns">
                            <div class="column">
                                <input class="input" type="text" name="fname" placeholder="First name">
                            </div>
                            <div class="column">
                                <input class="input" type="text" name="lname" placeholder="Last name">
                            </div>
                        </div>

                        <!-- The input field for username -->
                        <div class="field">
                            <input class="input" type="text" name="uname" id="uname" placeholder="User name" oninput="checkUsername()">
                            <!-- The username validation tag -->
                            <p id="username-error" class="help is-hidden has-text-danger"></p>
                        </div>

                        <!-- The input field for email -->
                        <div class="field">
                            <input class="input" type="email" name="email" id="email" placeholder="Email address" oninput="checkEmail()">
                            <!-- The email validation tag -->
                            <p id="email-error" class="help is-hidden has-text-danger"></p>
                        </div>                        

                        <!-- The input field for password -->
                        <div class="field">
                            <input class="input" type="password" name="pwd" id="pwd" placeholder="New password">
                        </div>

                        <!-- The input field to confirm password -->
                        <div class="field">
                            <input class="input" type="password" id="confirmpwd" oninput="validatePassword()" placeholder="Confirm password">
                            <!-- The passwords do not match tag -->
                            <p class="help is-hidden has-text-danger" id="confirmpwd-error">Passwords do not match</p>
                        </div>

                        <!-- The terms and conditions link -->
                        <p class="has-text-centered">By clicking Sign Up, you agree to our <a href="#">Terms & Conditions</a>.</p>

                    </section>                  

                    <!-- The footer section of the modal with sign up button -->
                    <footer class="modal-card-foot regform-bg">
                        <button class="button is-block is-success is-medium is-fullwidth" id="signup-btn">Sign Up</button>
                    </footer>
                </form>
            </div>
        </div>
    </body>
</html>