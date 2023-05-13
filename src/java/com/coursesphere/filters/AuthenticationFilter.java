package com.coursesphere.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sadik Al Barid
 */
public class AuthenticationFilter implements Filter {

    // Database credentials
    String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
    String user = "postgres";
    String password = "1234";

    // Session object
    HttpSession session;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String token = null;
        String username = null;
        Cookie[] cookies = httpRequest.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("loginToken")) {
                    String encodedCookieValue = cookie.getValue();
                    String decodedCookieValue = new String(Base64.getDecoder().decode(encodedCookieValue));
                    // Split the decoded value into an array using the comma delimiter
                    String[] parts = decodedCookieValue.split(",");

                    // Retrieve the username and unique ID from the array using their respective indexes
                    username = parts[0];
                    token = parts[1];
                    try {
                        // Perform database lookup to check if token is valid
                        if (!isValidToken(username, token, httpRequest)) {
                            username = null;
                            token = null;
                        }
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(AuthenticationFilter.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                }
            }
        }

        // If the user is not authenticated, redirect to the login page
        if (username == null || token == null) {
            // Get the current session
            session = httpRequest.getSession(false);
            // If the session is not null, invalidate it
            if (session != null) {
                session.invalidate();
            }
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
            return;
        }

        // If the user is authenticated, pass the request through to the requested JSP page
        chain.doFilter(request, response);
    }

    // Function to match the token againts the database
    private boolean isValidToken(String username, String token, HttpServletRequest httpRequest) throws ClassNotFoundException {
        // Retrieve the token from the database based on the user ID
        String storedToken = getTokenFromDatabase(username, httpRequest);

        // Compare the stored token with the provided token
        if (storedToken != null && storedToken.equals(token)) {
            return true;
        }
        return false;
    }

    // Function to get the token from the database
    private String getTokenFromDatabase(String username, HttpServletRequest httpRequest) throws ClassNotFoundException {
        String token = null;

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "SELECT uname, utoken FROM login_tokens WHERE uname = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                token = rs.getString("utoken");

                // Create session and set the "uname" session attribute
                session = httpRequest.getSession(true);
                session.setAttribute("uname", rs.getString("uname"));

                // Get first name, last name and the role of the user
                query = "SELECT fname, lname, role FROM users WHERE uname = ?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, username);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    // set the "fname", "lname" and "role" session attribute
                    session.setAttribute("fname", rs.getString("fname"));
                    session.setAttribute("lname", rs.getString("lname"));
                    session.setAttribute("role", rs.getString("role"));
                }

                // Set the section attribute to home
                if (session.getAttribute("section") == null) {
                    session.setAttribute("section", "home");
                }
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return token;
    }
}
