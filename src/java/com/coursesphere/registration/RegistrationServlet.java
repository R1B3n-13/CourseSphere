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
import java.util.UUID;

/**
 *
 * @author Sadik Al Barid
 */
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
        String role = request.getParameter("role");

        // Database credentials
        String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
        String user = "postgres";
        String password = "1234";

        // Initialize database connection and prepared statement
        Connection conn = null;
        PreparedStatement stmt1 = null, stmt2 = null, stmt3 = null;

        try {
            // Generate a unique token for the user
            String token = UUID.randomUUID().toString();

            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for inserting a new user into the database
            stmt1 = conn.prepareStatement("INSERT INTO users(fname, lname, uname, email, pwd, role) VALUES (?, ?, ?, ?, ?, ?)");
            stmt1.setString(1, fname);
            stmt1.setString(2, lname);
            stmt1.setString(3, uname);
            stmt1.setString(4, email);
            stmt1.setString(5, pwd);
            stmt1.setString(6, role);

            // Prepare the SQL statement for inserting a new login token into the database
            stmt2 = conn.prepareStatement("INSERT INTO login_tokens (uname, utoken) VALUES (?, ?)");
            stmt2.setString(1, uname);
            stmt2.setString(2, token);

            // Prepare the SQL statement for inserting either in teachers or students table
            stmt3 = conn.prepareStatement("INSERT INTO " + role + "s" + " (uname) VALUES (?)");
            stmt3.setString(1, uname);

            // Batch update
            conn.setAutoCommit(false);
            stmt1.execute();
            stmt2.execute();
            stmt3.execute();
            conn.commit();

            // Send the response back to the login page
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            // Log the error, rollback the changes and display an error message
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
                }
            }
//            request.getRequestDispatcher("register.jsp").forward(request, response);

        } finally {
            // Close the database connection and prepared statement
            try {
                if (stmt1 != null) {
                    stmt1.close();
                }
                if (stmt2 != null) {
                    stmt2.close();
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
