<%-- 
    Document   : index
    Created on : Apr 11, 2023, 5:19:15 AM
    Author     : Sadik Al Barid
--%>

<% 
  String uname = (String)session.getAttribute("uname");
  String fname = (String)session.getAttribute("fname");
  String lname = (String)session.getAttribute("lname");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Set character encoding and viewport -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Set the title of the page -->
        <title>CourseSphere - manage your courses efficiently</title>

        <!-- Set the favicon and page icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" type="image/png">
        <link rel="icon" href="${pageContext.request.contextPath}/resources/images/pageicon.png" type="image/png">

        <!-- Import Bulma CSS framework -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" 
              onerror="this.onerror=null;this.href='${pageContext.request.contextPath}/resources/css/bulma.min.css';">

        <!-- Import Bulma badge extension -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@creativebulma/bulma-badge@1.0.1/dist/bulma-badge.min.css" 
              onerror="this.onerror=null;this.href='${pageContext.request.contextPath}/resources/css/bulma-badge.min.css';">

        <!--Import the custom css file to modify Bulma styles-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css"> 
    </head>
    <body>
        <nav class="navbar is-light" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="is-flex is-align-items-center ml-3 mr-3" href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="34" height="34" alt="Logo">
                    <p class="has-text-dark has-text-weight-bold is-size-4">Course</p>
                    <p class="has-text-success-dark has-text-weight-bold">Sphere</p>
                </a>

                <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarMenu">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span></a>
            </div>

            <div id="navbarMenu" class="navbar-menu has-text-weight-semibold">
                <div class="navbar-start">
                    <a class="navbar-item">Home</a>
                    <a class="navbar-item">Courses</a>

                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">More</a>

                        <div class="navbar-dropdown is-boxed has-text-weight-medium">
                            <a class="navbar-item">FAQ</a>
                            <a class="navbar-item">About</a>                            
                            <a class="navbar-item">Contact</a>
                        </div>
                    </div>
                </div>

                <div class="navbar-end is-align-items-center">
                    <figure class="image is-32x32 mr-5">
                        <span class="badge is-danger">0</span>
                        <img src="${pageContext.request.contextPath}/resources/images/envelope.png">
                    </figure>

                    <div class="dropdown is-right">
                        <div class="dropdown-trigger">
                            <div class="card m-1" aria-haspopup="true" aria-controls="dropdown-menu">
                                <p class="has-text-centered has-text-light mt-1"><%= Character.toUpperCase(fname.charAt(0)) %><%= Character.toUpperCase(lname.charAt(0)) %></p>
                            </div>
                        </div>
                        <div class="dropdown-menu" id="dropdown-menu" role="menu">
                            <div class="dropdown-content has-text-weight-medium">
                                <p class="dropdown-item has-text-centered has-text-weight-semibold"><%= fname %> <%= lname %></p>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">Modifiers</a>
                                <a href="#" class="dropdown-item">Grid</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <section class="hero is-fullheight">
            <div class="hero-body">

            </div>
        </section>                          

        <!-- Include the JavaScript file for home page -->
        <script src="${pageContext.request.contextPath}/resources/js/homePage.js"></script>
    </body>
</html>
