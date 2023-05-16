<%-- 
    Document   : login page
    Created on : Apr 12, 2023, 2:13:57 AM
    Author     : Sadik Al Barid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="registration.jsp" %>
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

        <!--Include the fontawesome cdn-->
        <script src="https://kit.fontawesome.com/75e766e3de.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <!-- Hero section with image related to registration and login form -->
        <section class="hero loginpage-bg is-fullheight is-flex is-align-items-center is-justify-content-center">
            <!-- Container for login form -->
            <div class="hero-body-padding loginform-bg">

                <!-- Columns for login form and image -->
                <div class="columns is-vcentered is-centered has-text-centered-mobile is-variable is-5">
                    <!-- Login form column -->
                    <div class="column">
                        <!-- Logo -->
                        <label class="is-flex is-align-items-center mb-2">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="47" height="47" alt="Logo">
                            <p class="has-text-light has-text-weight-bold is-size-3">Course</p>
                            <p class="has-text-success has-text-weight-bold is-size-5">Sphere</p>                            
                        </label>

                        <h2 class="subtitle has-text-grey-light is-6 mb-2 mt-3">Sign in to your account to continue</h2>

                        <!-- Sign in form -->
                        <form method="post" action="login">
                            <!-- Username input field -->
                            <div class="field mt-5">
                                <label class="label has-text-grey-light">Username</label>
                                <p class="control has-icons-left">                                   
                                    <input class="input is-link custom-input has-text-grey-lighter" type="text" name="username" placeholder="Username" 
                                           required oninvalid="this.setCustomValidity('Please enter your user name')" oninput="this.setCustomValidity('')">
                                    <span class="icon has-text-grey is-small is-left">
                                        <i class="fas fa-user"></i>
                                    </span>
                                </p>
                            </div>

                            <!-- Password input field -->
                            <div class="field mt-4">
                                <label class="label has-text-grey-light">Password</label>
                                <p class="control has-icons-left">
                                    <input class="input is-link custom-input has-text-grey-lighter" type="password" name="password" placeholder="Password" 
                                           required oninvalid="this.setCustomValidity('Please enter your password')" oninput="this.setCustomValidity('')">
                                    <span class="icon has-text-grey is-small is-left">
                                        <i class="fas fa-lock"></i>
                                    </span>

                                    <!-- Login validation message using jstl -->
                                    <c:choose>
                                        <c:when test="${sessionScope.status == 'failed'}">
                                        <p class="help has-text-danger m-0">Invalid username or password</p>
                                    </c:when>    
                                    <c:when test="${sessionScope.status == 'error'}">
                                        <p class="help has-text-danger m-0">Internal error. Login failed!</p>
                                    </c:when>
                                </c:choose>
                                </p>
                            </div>

                            <!-- Remember me checkbox -->
                            <div class="field mt-3">
                                <p class="control">
                                    <label class="checkbox has-text-grey-lighter">
                                        <input class="checkbox" type="checkbox" name="rememberMe">
                                        Remember me for 30 days
                                    </label>
                                </p>
                            </div>

                            <!-- Log in button -->
                            <div class="field mt-4">
                                <p class="control">
                                    <button class="button is-link is-rounded">Sign in</button>
                                </p>
                            </div>
                            
                            <label class="label has-text-weight-medium has-text-white mt-4">
                            <a class="has-text-link"> Forgot password? </a>
                        </label>
                        </form>

                        <!-- Button to open registration modal -->
                        <label class="label has-text-centered has-text-weight-medium has-text-grey-lighter mt-6">
                            Not registered? 
                            <a id="open-reg-modal" class="has-text-link"> Create account </a>
                        </label>
                        <% session.removeAttribute("status"); %>  
                    </div>
                </div>
            </div>
        </section>                      
        <!-- Include the JavaScript file for the registration modal and the log in button -->
        <script src="${pageContext.request.contextPath}/resources/js/regModal.js"></script>
    </body>
</html>
