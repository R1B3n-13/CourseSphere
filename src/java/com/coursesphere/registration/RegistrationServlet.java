package com.coursesphere.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve form data from the request
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        // Database credentials
        String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
        String user = "postgres";
        String password = "1234";

        // Initialize database connection and prepared statement
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for inserting a new user into the database
            stmt = conn.prepareStatement("INSERT INTO users(fname, lname, uname, email, pwd) VALUES (?, ?, ?, ?, ?)");
            stmt.setString(1, fname);
            stmt.setString(2, lname);
            stmt.setString(3, uname);
            stmt.setString(4, email);
            stmt.setString(5, pwd);

            // Execute the SQL statement and get the number of rows affected
            int rowsAffected = stmt.executeUpdate();

            // Set status message and forward the request to the login page
            String statusMessage;
            if (rowsAffected > 0) {
                statusMessage = "success";
            } else {
                statusMessage = "failed";
            }
            request.setAttribute("status", statusMessage);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            // Log the error and display an error message
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            request.setAttribute("status", "error");
            request.getRequestDispatcher("register.jsp").forward(request, response);

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
                Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            }
        }
    }
}
