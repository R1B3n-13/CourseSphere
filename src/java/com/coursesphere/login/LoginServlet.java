package com.coursesphere.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import java.util.UUID;

/**
 *
 * @author Sadik Al Barid
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String uname = request.getParameter("username");
        String pwd = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        // Database credentials
        String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
        String user = "postgres";
        String password = "1234";

        // Initialize database connection, prepared statement and session
        Connection conn = null;
        PreparedStatement stmt = null;
        HttpSession session = null;

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for checking whether the username and passward inserted is valid
            stmt = conn.prepareStatement("SELECT * FROM users WHERE uname = ? and pwd = ?");
            stmt.setString(1, uname);
            stmt.setString(2, pwd);

            // Execute the SQL statement and get the result set
            ResultSet rs = stmt.executeQuery();

            // Create session, set status message and forward the request to the index page
            if (rs.next()) {
                // Get the login token from the database
                stmt = conn.prepareStatement("SELECT utoken FROM login_tokens WHERE uname = ?");
                stmt.setString(1, uname);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    // Get the token value from the result set
                    String token = rs.getString("utoken");

                    // Concatenate the user name and the token into a string
                    String cookieValue = uname + "," + token;

                    // Encode the concatenated string using Base64 encoding
                    String encodedCookieValue = Base64.getEncoder().encodeToString(cookieValue.getBytes());

                    // Save the token in a cookie
                    Cookie cookie = new Cookie("loginToken", encodedCookieValue);

                    if (rememberMe == null) {
                        cookie.setMaxAge(-1); // as long as the browsing session lasts
                    } else {
                        cookie.setMaxAge(30 * 24 * 60 * 60); // 30 days in seconds
                    }
                    response.addCookie(cookie);

                    // Send response to home.jsp
                    response.sendRedirect("protected/home.jsp");
                } else {
                    // Send response to login.jsp
                    response.sendRedirect("login.jsp");
                }
            } else {
                // Get the current session
                session = request.getSession(false);
                // If the session is not null, invalidate it
                if (session != null) {
                    session.invalidate();
                }

                // Delete the login token cookie
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("loginToken")) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                            break;
                        }
                    }
                }

                // Send response to login.jsp
                response.sendRedirect("login.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            // Log the error and display an error message
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            request.setAttribute("status", "error");
//            request.getRequestDispatcher("register.jsp").forward(request, response);

        } finally {
            // Close the database connection and prepared statement
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            }
        }
    }
}
