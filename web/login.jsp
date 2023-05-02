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
                        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo">
                        <h2 class="title">Sign in</h2>

                        <!-- Sign in form -->
                        <form method="post" action="login">
                            <!-- Username input field -->
                            <div class="field">
                                <p class="control has-icons-left">
                                    <input class="input" type="text" name="username" placeholder="Username" 
                                           required oninvalid="this.setCustomValidity('Please enter your user name')" oninput="this.setCustomValidity('')">
                                    <span class="icon is-small is-left">
                                        <i class="fas fa-user"></i>
                                    </span>
                                </p>
                            </div>

                            <!-- Password input field -->
                            <div class="field">
                                <p class="control has-icons-left">
                                    <input class="input" type="password" name="password" placeholder="Password" 
                                           required oninvalid="this.setCustomValidity('Please enter your password')" oninput="this.setCustomValidity('')">
                                    <span class="icon is-small is-left">
                                        <i class="fas fa-lock"></i>
                                    </span>

                                    <!-- Login validation using jstl -->
                                    <c:choose>
                                        <c:when test="${sessionScope.status == 'failed'}">
                                        <p class="help has-text-danger">Invalid username or password</p>
                                        <% session.removeAttribute("status"); %>
                                    </c:when>    
                                    <c:when test="${sessionScope.status == 'error'}">
                                        <p class="help has-text-danger">Internal error. Login failed!</p>
                                        <% session.removeAttribute("status"); %>
                                    </c:when>
                                </c:choose>
                                </p>
                            </div>

                            <!-- Remember me checkbox -->
                            <div class="field">
                                <p class="control">
                                    <label class="checkbox">
                                        <input type="checkbox" name="rememberMe">
                                        Remember me for 30 days
                                    </label>
                                </p>
                            </div>

                            <!-- Log in button -->
                            <div class="field">
                                <p class="control">
                                    <button class="button is-link">Log in</button>
                                </p>
                            </div>
                        </form>
                    </div>

                    <!-- Image column -->
                    <div class="column has-text-centered">
                        <!-- Image related to registration -->
                        <figure class="pt-3">
                            <img src="${pageContext.request.contextPath}/resources/images/add-user.png" alt="log in image">
                        </figure>
                        <!-- Button to open registration modal -->
                        <button id="open-reg-modal" class="button is-success mt-5">Create new account</button>
                    </div>
                </div>
            </div>
        </section>                      
        <!-- Include the JavaScript file for the registration modal and the log in button -->
        <script src="${pageContext.request.contextPath}/resources/js/regModal.js"></script>
    </body>
</html>
