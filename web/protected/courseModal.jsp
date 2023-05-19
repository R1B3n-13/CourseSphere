<%-- 
    Document   : courseModal
    Created on : May 14, 2023, 8:02:03 PM
    Author     : nebir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
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
    </head>
    <body>
        <!-- The modal for the course card -->
        <div id="course-card" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card">
                <!-- The main content section of the modal -->
                <section class="modal-card-body course-modal">
                    <!-- Close button and the title -->
                    <a id="close-course-card" class="delete is-rounded is-pulled-right" aria-label="close"></a>
                    <p id="course-card-title" class="modal-card-title has-text-light has-text-weight-bold"></p>

                    <!-- Tabs -->
                    <div class="tabs is-centered mt-4">
                        <ul>
                            <li class="tab is-active" onclick='toggleTabs(event, "details")'><a class="has-text-white">Details</a></li>
                            <li class="tab" onclick='toggleTabs(event, "instructor")'><a class="has-text-white">Instructor</a></li>
                            <li class="tab" onclick='toggleTabs(event, "students")'><a class="has-text-white">Students</a></li>
                        </ul>
                    </div>                    

                    <!-- Load the loren ipsum placeholder using java string builder -->
                    <%
                        String filePath = request.getServletContext().getRealPath("/") + "/resources/placeholder/loren_ipsum.txt";
                        StringBuilder content = new StringBuilder();

                        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
                            String line;
                            while ((line = reader.readLine()) != null) {
                                content.append(line).append("<br>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    
                    <!-- The details part -->  
                    <p id="details" class="tab-content container is-fluid has-text-light loren-ipsum"> <%= content.toString() %></p>
                    
                    <!-- The instructor part -->
                    <div id="instructor" class="tab-content" style="display: none;">
                        <!-- Show instructor data using table -->
                        <table class="table custom-table is-bordered mx-auto my-6">
                            <tbody>                                
                                <tr>
                                    <td class='has-text-weight-bold'> Name </td>
                                    <td id="instructor-name"></td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Username </td>
                                    <td id="instructor-uname"></td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> E-mail </td>
                                    <td id="instructor-mail"></td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Phone </td>
                                    <td>0519 3800056 (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Country </td>
                                    <td>United Kingdom (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> State </td>
                                    <td>Alfieshire (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> City </td>
                                    <td>North Craig (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Address </td>
                                    <td>752 Stewart Valleys (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Zip Code </td>
                                    <td>SG6 1PR (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Gender </td>
                                    <td>Male (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Blood Group </td>
                                    <td>O+ve (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Age </td>
                                    <td>31 (dummy)</td>
                                </tr>
                                <tr>
                                    <td class='has-text-weight-bold'> Date of Birth </td>
                                    <td>8-11-1991 (dummy)</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- The students part -->
                    <p id="students" class="tab-content container is-fluid has-text-light loren-ipsum" style="display: none;"> Students </p>
                </section>                  
            </div>
        </div>
    </body>
</html>
