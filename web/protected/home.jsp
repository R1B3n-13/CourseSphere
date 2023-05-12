<%-- 
    Document   : index
    Created on : Apr 11, 2023, 5:19:15 AM
    Author     : Sadik Al Barid
--%>

<%@ page import="com.coursesphere.main.CourseInfo" %>
<%@ page import="com.coursesphere.main.FetchCourseDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<% 
    String uname = (String)session.getAttribute("uname");
    String fname = (String)session.getAttribute("fname");
    String lname = (String)session.getAttribute("lname");
    String role = (String)session.getAttribute("role");
  
    List<CourseInfo> courseInfos = new ArrayList<>();
    if(role.equals("admin")) {
        courseInfos = FetchCourseDetails.getCourseInfos();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="newCourseForm.jsp" %>
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

        <!--Include the fontawesome cdn-->
        <script src="https://kit.fontawesome.com/75e766e3de.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar is-light" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="is-flex is-align-items-center ml-3 mr-3" href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="34" height="34" alt="Logo">
                    <p class="has-text-dark has-text-weight-bold is-size-4">Course</p>
                    <p class="has-text-success-dark has-text-weight-bold">Sphere</p>
                </a>

                <a role="button" class="navbar-burger has-text-left" aria-label="menu" aria-expanded="false" data-target="navbarMenu">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarMenu" class="navbar-menu has-text-weight-semibold">
                <div class="navbar-start">
                    <a class="navbar-item">Home</a>
                    <a class="navbar-item">Courses</a>

                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">More</a>

                        <div class="navbar-dropdown is-boxed has-text-weight-medium">
                            <a class="navbar-item">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-clipboard-question"></i>
                                </span>
                                FAQ
                            </a>
                            <a class="navbar-item">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-circle-info"></i>
                                </span>
                                About
                            </a>                            
                            <a class="navbar-item">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-address-card"></i>
                                </span>
                                Contact
                            </a>
                        </div>
                    </div>
                </div>

                <div class="navbar-end is-align-items-center">
                    <div class="dropdown is-right">
                        <div class="dropdown-trigger">
                            <div class="image is-32x32 mr-5" style="cursor: pointer;" aria-haspopup="true" aria-controls="dropdown-menu">
                                <img src="${pageContext.request.contextPath}/resources/images/plus.png">
                            </div>
                        </div>

                        <div class="dropdown-menu" id="dropdown-menu" role="menu">
                            <div class="dropdown-content has-text-weight-medium">
                                <a id="open-course-form" class="dropdown-item m-1">
                                    <span class="icon is-small mr-1">
                                        <i class="fas fa-plus"></i>
                                    </span>
                                    Create course
                                </a>
                            </div>
                        </div>
                    </div>

                    <figure class="image is-32x32 mr-5" style="cursor: pointer;">
                        <span class="badge is-danger">0</span>
                        <img src="${pageContext.request.contextPath}/resources/images/envelope.png">
                    </figure>

                    <div class="dropdown is-right">
                        <div class="dropdown-trigger">
                            <div class="card m-1" style="cursor: pointer;" aria-haspopup="true" aria-controls="dropdown-menu">
                                <p class="has-text-centered has-text-light is-size-5">
                                    <%= Character.toUpperCase(fname.charAt(0)) %>
                                </p>
                            </div>
                        </div>

                        <div class="dropdown-menu" id="dropdown-menu" role="menu">
                            <div class="dropdown-content has-text-weight-medium">
                                <label class="dropdown-item has-text-centered has-text-weight-semibold has-text-link-dark">
                                    <%= fname %> <%= lname %>
                                </label>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item m-1">
                                    <span class="icon is-small mr-1">
                                        <i class="fas fa-gear"></i>
                                    </span>
                                    Settings
                                </a>
                                <a href="#" class="dropdown-item m-1">
                                    <span class="icon is-small mr-1">
                                        <i class="fas fa-arrow-right-from-bracket"></i>
                                    </span>
                                    Sign out
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <section class="hero is-fullheight">
            <div class="hero-body is-align-items-stretch">
                <div class="container is-fluid m-0">
                    <div class="columns is-multiline">
                        <% for (CourseInfo ci : courseInfos) { %>

                        <div class="column is-one-fifth">
                            <div class="card custom-card has-text-centered mr-5 mb-5">
                                <div class="card-content has-text-white p-1">
                                    <div class="content" title="<%= ci.title %>">
                                        <p class="has-text-weight-semibold"> <%= ci.title %> </p>
                                    </div>
                                </div>

                                <div class="card-content has-text-white p-1">                        
                                    <div class="content" title="<%= ci.subject %>">
                                        <p class="is-size-7">  <%= ci.subject %> </p>
                                    </div>
                                </div>

                                <div class="card-content has-text-white p-0">                        
                                    <div class="content" title="<%= ci.teacher %>">
                                        <p class="is-size-6">  <%= ci.teacher %> </p>
                                    </div>
                                </div>

                                <div class="card-image">
                                    <figure class="image is-3by2">
                                        <img src="${pageContext.request.contextPath}/resources/images/courseCard.jpg" alt="card image">
                                    </figure>
                                </div>
                            </div>
                        </div>

                        <% } %>
                    </div>
                </div>
            </div>
        </section>                          

        <!-- Include the JavaScript file for home page -->
        <script src="${pageContext.request.contextPath}/resources/js/homePage.js"></script>
    </body>
</html>
