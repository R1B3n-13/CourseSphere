<%-- 
    Document   : home
    Created on : Apr 11, 2023, 5:19:15 AM
    Author     : Sadik Al Barid
--%>

<!-- Imports -->
<%@ page import="com.coursesphere.main.CourseInfo" %>
<%@ page import="com.coursesphere.main.TeacherInfo" %>
<%@ page import="com.coursesphere.main.StudentInfo" %>
<%@ page import="com.coursesphere.main.FetchCourseDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<% 
    // Get the session attributes
    String uname = (String)session.getAttribute("uname");
    String fname = (String)session.getAttribute("fname");
    String lname = (String)session.getAttribute("lname");
    String role = (String)session.getAttribute("role");
    
    // Get course info for courses page
    List<CourseInfo> courseInfos1 = new ArrayList<>();
    courseInfos1 = FetchCourseDetails.getCourseInfos("admin", uname);
    
    // Get course info for dashboard
    List<CourseInfo> courseInfos2 = new ArrayList<>();
    courseInfos2 = FetchCourseDetails.getCourseInfos(role, uname);
    
    // Fetch the student's id
    int student_id = 0;
    if(role.equals("student")) {
        student_id = FetchCourseDetails.getStudentId(uname);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="newCourseForm.jsp" %>
<%@ include file="joinCourseForm.jsp" %>
<%@ include file="courseModal.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Set character encoding and viewport -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Set the title of the page -->
        <title>CourseSphere - learn with efficiency</title>

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
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="is-flex is-align-items-center ml-3 mr-3" href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="34" height="34" alt="Logo">
                    <p class="has-text-light has-text-weight-bold is-size-4">Course</p>
                    <p class="has-text-success has-text-weight-bold">Sphere</p>
                </a>

                <a role="button" class="navbar-burger has-text-light has-text-left" aria-label="menu" aria-expanded="false" data-target="navbarMenu">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarMenu" class="navbar-menu has-text-weight-semibold">
                <div class="navbar-start">
                    <a href="${pageContext.request.contextPath}/home" class="navbar-item has-text-grey-light">
                        <span class="icon is-small mr-1">
                            <i class="fas fa-house-user"></i>
                        </span>
                        Home
                    </a>
                    <a href="${pageContext.request.contextPath}/courses" class="navbar-item has-text-grey-light">
                        <span class="icon is-small mr-1">
                            <i class="fas fa-book"></i>
                        </span>
                        Courses
                    </a>
                    <a href="${pageContext.request.contextPath}/dashboard" class="navbar-item has-text-grey-light">
                        <span class="icon is-small mr-1">
                            <i class="fas fa-clipboard"></i>
                        </span>
                        Dashboard
                    </a>

                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link has-text-grey-light">
                            <span class="icon is-small mr-1">
                                <i class="fas fa-circle-plus"></i>
                            </span>
                            More
                        </a>

                        <div class="navbar-dropdown is-boxed has-text-weight-medium">
                            <a class="navbar-item has-text-grey-light">
                                <span class="icon is-small mr-1">
                                    <i class="fas fa-circle-info"></i>
                                </span>
                                About
                            </a>
                            <a class="navbar-item has-text-grey-light">
                                <span class="icon is-small mr-1">
                                    <i class="fas fa-blog"></i>
                                </span>
                                Blog
                            </a>

                            <a class="navbar-item has-text-grey-light">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-clipboard-question"></i>
                                </span>
                                FAQ
                            </a>
                            <a class="navbar-item has-text-grey-light">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-star"></i>
                                </span>
                                Reviews
                            </a> 
                            <a class="navbar-item has-text-grey-light">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-user-tie"></i>
                                </span>
                                Staff
                            </a>                            
                            <a class="navbar-item has-text-grey-light">                                    
                                <span class="icon is-small mr-2">
                                    <i class="fas fa-address-card"></i>
                                </span>
                                Contact
                            </a>
                        </div>
                    </div>
                </div>

                <div class="navbar-end is-align-items-center">

                    <c:if test="${!role.equals('teacher')}">
                        <div class="dropdown is-right">
                            <div class="dropdown-trigger">
                                <div class="image is-32x32 mr-5" style="cursor: pointer;" aria-haspopup="true" aria-controls="dropdown-menu">
                                    <img src="${pageContext.request.contextPath}/resources/images/plus.png">
                                </div>
                            </div>

                            <div class="dropdown-menu" id="dropdown-menu-plus" role="menu">
                                <div class="dropdown-content has-text-weight-medium">
                                    <c:if test="${role.equals('admin')}">
                                        <a id="open-course-form" class="dropdown-item has-text-centered has-text-grey-lighter mt-1">
                                            <span class="icon is-small mr-1">
                                                <i class="fas fa-plus"></i>
                                            </span>
                                            Create course
                                        </a>
                                    </c:if>
                                    <c:if test="${role.equals('student')}">
                                        <a id="open-enroll-form" class="dropdown-item has-text-centered has-text-grey-lighter mt-1">
                                            <span class="icon is-small mr-1">
                                                <i class="fas fa-plus"></i>
                                            </span>
                                            Join course
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <figure class="image is-32x32 mr-5" style="cursor: pointer;">
                        <span class="badge is-danger">0</span>
                        <img src="${pageContext.request.contextPath}/resources/images/bell.png">
                    </figure>

                    <div class="dropdown is-right">
                        <div class="dropdown-trigger">
                            <div class="card m-1" style="cursor: pointer;" aria-haspopup="true" aria-controls="dropdown-menu">
                                <p class="has-text-centered has-text-light is-size-5">
                                    <%= Character.toUpperCase(fname.charAt(0)) %>
                                </p>
                            </div>
                        </div>

                        <div class="dropdown-menu" id="dropdown-menu-exit" role="menu">
                            <div class="dropdown-content has-text-weight-medium">
                                <label class="dropdown-item has-text-centered has-text-weight-semibold has-text-primary">
                                    <%= fname %> <%= lname %>
                                </label>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item has-text-grey-lighter mt-1">
                                    <span class="icon is-small mr-1">
                                        <i class="fas fa-gear"></i>
                                    </span>
                                    Settings
                                </a>
                                <a href="#" onclick="confirmSignOut()" class="dropdown-item has-text-grey-lighter mt-1">
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

        <c:if test="${sessionScope.section == 'home'}">
            <section id="home" class="hero is-fullheight">
                <div class="hero-body">
                    <a href="${pageContext.request.contextPath}/courses" class="button explore-button is-success is-rounded is-size-5 has-text-weight-bold">Explore our courses</a>
                </div>
            </section>
        </c:if>

        <c:if test="${sessionScope.section == 'courses' or sessionScope.section == 'dashboard'}">
            <section id="courses" class="hero home-bg is-fullheight">
                <div class="hero-body is-align-items-stretch">
                    <div class="container is-fluid m-0">
                        <div class="columns is-multiline">

                            <% List<CourseInfo> courseInfos = new ArrayList<>(); %>
                            <c:choose>
                                <c:when test="${sessionScope.section == 'courses'}">
                                    <% courseInfos = courseInfos1; %>
                                </c:when>    
                                <c:when test="${sessionScope.section == 'dashboard'}">
                                    <% courseInfos = courseInfos2; %>
                                </c:when>
                            </c:choose>

                            <%
                                String baseImageUrl = request.getContextPath() + "/resources/images/card-images/";
                                String[] files = { "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg" };
                                String[] colors = { "#56837E", "#9A4B36", "#60504A", "#4E5C62", "#254266", "#486352", "#4A5051", "#985959" };
                            %>

                            <% for (CourseInfo ci : courseInfos) { %>
                            <%                                
                                String selectedFileName = files[ci.id % 8];
                                String selectedColor = colors[ci.id % 8];
                                String selectedImagePath = baseImageUrl + selectedFileName;
                            %>

                            <div class="column is-one-fifth" onclick="shareCourseData('<%= ci.id %>', '<%= ci.title %>', '<%= ci.subject %>',
                                            '<%= ci.teacher %>', '<%= ci.teacher_uname %>', '<%= ci.teacher_mail %>')">
                                <div class="card open-course-card custom-card has-text-centered mr-5 mb-5">
                                    <div class="card-content has-text-white p-1" style="background: <%= selectedColor %>;">
                                        <div class="content" title="<%= ci.title %>">
                                            <p class="has-text-white has-text-weight-medium"> <%= ci.title %> </p>
                                        </div>
                                    </div>

                                    <div class="card-content has-text-white p-1" style="background: <%= selectedColor %>;">                        
                                        <div class="content" title="<%= ci.subject %>">
                                            <p class="has-text-grey-lighter is-size-7">  <%= ci.subject %> </p>
                                        </div>
                                    </div>

                                    <div class="card-content has-text-white p-0" style="background: <%= selectedColor %>;">                        
                                        <div class="content" title="<%= ci.teacher %>">
                                            <p class="has-text-grey-lighter is-size-7">  <%= ci.teacher %> </p>
                                        </div>
                                    </div>

                                    <div class="card-image">
                                        <figure class="image is-3by2">
                                            <img src="<%= selectedImagePath %>" alt="card image">
                                        </figure>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <!--Div tag for passing the section data stored in the session scope to the script-->
        <div id="data" data-param1="${sessionScope.section}"></div>

        <!-- Include the JavaScript file for home page -->
        <script src="${pageContext.request.contextPath}/resources/js/homePage.js"></script>
    </body>
</html>
