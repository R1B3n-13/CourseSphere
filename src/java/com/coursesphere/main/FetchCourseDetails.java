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
    static List<TeacherInfo> teacherInfos;

    // Database credentials
    static String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
    static String user = "postgres";
    static String password = "1234";

    // Initialize database connection and prepared statement
    static Connection conn = null;
    static PreparedStatement stmt = null;

    static public List<CourseInfo> getCourseInfos(String role, String uname) throws ClassNotFoundException, SQLException {

        try {
            // Initialize new array list object
            courseInfos = new ArrayList<>();

            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for selecting from courses table
            if (role.equals("admin")) {
                stmt = conn.prepareStatement("SELECT * FROM users u JOIN teachers t ON u.uname = t.uname JOIN courses c ON t.teacher_id = c.teacher_id;");
            } else if (role.equals("teacher")) {
                stmt = conn.prepareStatement("SELECT * FROM users u JOIN teachers t ON u.uname = t.uname "
                        + "JOIN courses c ON t.teacher_id = c.teacher_id WHERE u.uname = ?");
                stmt.setString(1, uname);
            }

            // Execute the SQL statement and get the result set
            ResultSet rs = stmt.executeQuery();

            // Push the data from resultset to the list
            while (rs.next()) {
                CourseInfo ci = new CourseInfo();
                ci.id = rs.getInt("course_id");
                ci.title = rs.getString("title");
                ci.subject = rs.getString("subject");
                ci.teacher = rs.getString("fname") + " " + rs.getString("lname");
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

    static public List<TeacherInfo> getTeacherInfos() throws ClassNotFoundException, SQLException {

        try {
            // Initialize new array list object
            teacherInfos = new ArrayList<>();

            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for selecting the teacher's id, fname, lname
            stmt = conn.prepareStatement("SELECT t.teacher_id, u.fname, u.lname FROM users u JOIN teachers t ON u.uname = t.uname;");

            // Execute the SQL statement and get the result set
            ResultSet rs = stmt.executeQuery();

            // Push the data from resultset to the list
            while (rs.next()) {
                TeacherInfo ti = new TeacherInfo();
                ti.id = rs.getInt("teacher_id");
                ti.name = rs.getString("fname") + " " + rs.getString("lname");
                teacherInfos.add(ti);
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
        return teacherInfos;
    }
}
