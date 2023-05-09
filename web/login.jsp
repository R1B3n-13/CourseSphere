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
                        <label class="is-flex is-align-items-center mb-2">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo">
                            <p class="has-text-dark has-text-weight-bold is-size-2">Course</p>
                            <p class="has-text-success-dark has-text-weight-bold is-size-4">Sphere</p>
                        </label>

                        <!-- Sign in form -->
                        <form method="post" action="login">
                            <!-- Username input field -->
                            <h2 class="title has-text-weight-semibold is-4 mb-2 mt-4">Sign in</h2>
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
                        <figure class="pt-4">
                            <img src="${pageContext.request.contextPath}/resources/images/add-user.png" alt="log in image">
                        </figure>

                        <!-- Button to open registration modal -->
                        <c:choose>
                            <c:when test="${sessionScope.status == 'failed' or sessionScope.status == 'error'}">
                                <button id="open-reg-modal" class="button is-success mt-4">Create new account</button>
                                <% session.removeAttribute("status"); %>
                            </c:when>    
                            <c:otherwise>
                                <button id="open-reg-modal" class="button is-success">Create new account</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>                      
        <!-- Include the JavaScript file for the registration modal and the log in button -->
        <script src="${pageContext.request.contextPath}/resources/js/regModal.js"></script>
    </body>
</html>
