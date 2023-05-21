<%-- 
    Document   : newCourseForm
    Created on : May 10, 2023, 11:07:05 PM
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
        <!-- The modal for the join course form -->
        <div id="enroll-form" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card form-bg" style="border-radius:10px;">
                <!-- The header section of the modal -->
                <header class="modal-card-head form-bg">
                    <p class="modal-card-title has-text-grey-lighter has-text-weight-semibold">Join course</p>
                </header>

                <!-- create enrollment form -->
                <form id="enroll-course-form" method="post" action="${pageContext.request.contextPath}/join">
                    <!-- The main content section of the modal -->
                    <section class="modal-card-body form-bg"> 
                        <!-- Hidden input field for the student id -->
                        <input type="text" name="student_id" value="<%= student_id %>" hidden>

                        <!--Course select option-->
                        <select id="course-select" name="course_id"
                                required oninvalid="this.setCustomValidity('Please select a course')" oninput="this.setCustomValidity('')">
                            <option value=""></option>
                            <% for (CourseInfo ci : courseInfos1) { %>
                            <option value="<%= ci.id %>"><%= ci.title %></option>
                            <% } %>
                        </select>
                    </section>                  

                    <!-- The footer section of the modal with cancel and submit button -->
                    <footer class="modal-card-foot is-flex-direction-row-reverse form-bg">
                        <button class="button is-link is-small is-rounded has-text-grey-lighter has-text-weight-medium" type="submit">Join</button>
                        <button id="close-enroll-form" class="button is-danger is-small is-rounded has-text-grey-lighter has-text-weight-medium mr-3" type="button">Cancel</button>                        
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
