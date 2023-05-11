package com.coursesphere.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sadik Al Barid
 */
public class FetchCourseDetails {

    // ArrayList for course title and subject name
    static List<CourseInfo> courseInfos;

    // Database credentials
    static String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
    static String user = "postgres";
    static String password = "1234";

    // Initialize database connection and prepared statement
    static Connection conn = null;
    static PreparedStatement stmt = null;

    static public List<CourseInfo> getCourseNames() throws ClassNotFoundException, SQLException {

        try {
            // Initialize new array list object
            courseInfos = new ArrayList<>();
            
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for checking whether the username and passward inserted is valid
            stmt = conn.prepareStatement("SELECT * FROM courses");

            // Execute the SQL statement and get the result set
            ResultSet rs = stmt.executeQuery();

            // Push the data from resultset to the list
            while (rs.next()) {
                CourseInfo ci = new CourseInfo();
                ci.title = rs.getString("title");
                ci.subject = rs.getString("subject");
                courseInfos.add(ci);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Log the error and display an error message
            Logger.getLogger(FetchCourseDetails.class.getName()).log(Level.SEVERE, e.getMessage(), e);
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
                Logger.getLogger(FetchCourseDetails.class.getName()).log(Level.SEVERE, e.getMessage(), e);
            }
        }

        // Return the array list
        return courseInfos;
    }
}
