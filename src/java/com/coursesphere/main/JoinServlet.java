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
@WebServlet(name = "JoinServlet", urlPatterns = {"/join"})
public class JoinServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        int student_id = Integer.parseInt(request.getParameter("student_id"));

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
            stmt = conn.prepareStatement("INSERT INTO course_students(course_id, student_id) SELECT ?, ? "
                    + "WHERE NOT EXISTS (SELECT 1 FROM course_students WHERE course_id = ? AND student_id = ?);");
            stmt.setInt(1, course_id);
            stmt.setInt(2, student_id);
            stmt.setInt(3, course_id);
            stmt.setInt(4, student_id);

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
