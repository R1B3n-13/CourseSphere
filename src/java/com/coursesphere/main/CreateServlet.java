package com.coursesphere.main;

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

/**
 *
 * @author Sadik Al Barid
 */
@WebServlet(name = "CreateServlet", urlPatterns = {"/create"})
public class CreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String title = request.getParameter("course-title");
        String subject = request.getParameter("subject");

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

            // Prepare the SQL statement for inserting title and subject name
            stmt = conn.prepareStatement("INSERT INTO courses(title, subject) VALUES (?, ?)");
            stmt.setString(1, title);
            stmt.setString(2, subject);

            // Execute the query
            stmt.execute();

            //redirect to the home page
            response.sendRedirect("protected/home.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            // Log the error and display an error message
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);

            //redirect to the home page
            response.sendRedirect("protected/home.jsp");
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
                Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            }
        }
    }
}
