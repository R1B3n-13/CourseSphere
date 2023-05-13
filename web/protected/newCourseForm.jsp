<%-- 
    Document   : newCourseForm
    Created on : May 10, 2023, 11:07:05 PM
    Author     : nebir
--%>

<%@ page import="com.coursesphere.main.TeacherInfo" %>
<%@ page import="com.coursesphere.main.FetchCourseDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<% 
    List<TeacherInfo> teacherInfos = new ArrayList<>();
    if(role.equals("admin")) {
        teacherInfos = FetchCourseDetails.getTeacherInfos();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!--Import select2 CSS-->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"
              onerror="this.onerror=null;this.href='${pageContext.request.contextPath}/resources/css/select2.min.css';">
    </head>

    <body>
        <!-- The modal for the new course form -->
        <div id="course-form" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card form-bg" style="border-radius:17px;">
                <!-- The header section of the modal -->
                <header class="modal-card-head form-bg">
                    <p class="modal-card-title has-text-weight-semibold">Create course</p>
                </header>

                <!-- create course form -->
                <form id="create-course-form" method="post" action="${pageContext.request.contextPath}/create">
                    <!-- The main content section of the modal -->
                    <section class="modal-card-body form-bg">                    

                        <!-- The input field for course title -->
                        <div class="field">
                            <input class="input" type="text" name="course-title" id="course-title" placeholder="Course title"
                                   required oninvalid="this.setCustomValidity('Please enter course title')" oninput="this.setCustomValidity('')">
                        </div>

                        <!-- The input field for subject name -->
                        <div class="field">
                            <input class="input" type="text" name="subject" id="subject" placeholder="Subject"
                                   required oninvalid="this.setCustomValidity('Please enter subject name')" oninput="this.setCustomValidity('')">
                        </div>

                        <!--Teacher select option-->
                        <select id="teacher-select" name="teacher_id" 
                                required oninvalid="this.setCustomValidity('Please assign a teacher')" oninput="this.setCustomValidity('')">
                            <option value=""></option>
                            <% for (TeacherInfo ti : teacherInfos) { %>
                            <option value="<%= ti.id %>"><%= ti.name %></option>
                            <% } %>
                        </select>
                    </section>                  

                    <!-- The footer section of the modal with sign up button -->
                    <footer class="modal-card-foot is-flex-direction-row-reverse form-bg">
                        <button class="button is-small has-text-info-dark has-text-weight-medium" type="submit">Create</button>
                        <button id="close-course-form" class="button is-small has-text-grey has-text-weight-medium mr-3" type="button">Cancel</button>                        
                    </footer>
                </form>
            </div>
        </div>
        <!--Link the jquery JS script-->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

        <!--Link the select2 JS script-->
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>       
    </body>
</html>
