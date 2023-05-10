<%-- 
    Document   : newCourseForm
    Created on : May 10, 2023, 11:07:05 PM
    Author     : nebir
--%>

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
    </head>

    <body>
        <!-- The modal for the new course form -->
        <div id="course-form" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card regform-bg" style="border-radius:17px;">
                <!-- The header section of the modal -->
                <header class="modal-card-head regform-bg">
                    <p class="modal-card-title has-text-weight-semibold">Create Course</p>
                    <a id="close-course-form" class="tag is-delete is-rounded" aria-label="close"></a>
                </header>

                <!-- create course form -->
                <form method="post" action="create">
                    <!-- The main content section of the modal -->
                    <section class="modal-card-body regform-bg">                    

                        <!-- The input field for course title -->
                        <div class="field">
                            <input class="input" type="text" name="course-title" id="course-title" placeholder="Course title">
                        </div>

                        <!-- The input field for subject name -->
                        <div class="field">
                            <input class="input" type="text" name="subject" id="subject" placeholder="Subject">
                        </div>                        
                    </section>                  

                    <!-- The footer section of the modal with sign up button -->
                    <footer class="modal-card-foot regform-bg">
                        <button class="button is-block is-link is-medium is-fullwidth">Submit</button>
                    </footer>
                </form>
            </div>
        </div>
    </body>
</html>
