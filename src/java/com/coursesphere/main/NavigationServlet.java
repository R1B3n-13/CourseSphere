package com.coursesphere.main;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Sadik Al Barid
 */
@WebServlet(name = "NavigationServlet", urlPatterns = {"", "/home", "/courses"})
public class NavigationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the requested url
        String url = request.getServletPath();
        // Initialize a session object
        HttpSession session = request.getSession();

        // Set the session attribute according to the url
        if (url.equals("") || url.equals("/home")) {
            session.setAttribute("section", "home");
        }else if (url.equals("/courses")) {
            session.setAttribute("section", "courses");
        }
        // Send response to home.jsp
        response.sendRedirect("protected/home.jsp");
    }
}
