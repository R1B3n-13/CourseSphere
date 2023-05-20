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

    // ArrayList for course infos, teacher infos and student infos
    static List<CourseInfo> courseInfos;
    static List<TeacherInfo> teacherInfos;
    static List<StudentInfo> studentInfos;

    // Database credentials
    static String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
    static String user = "postgres";
    static String password = "1234";

    // Initialize database connection and prepared statement
    static Connection conn = null;
    static PreparedStatement stmt = null;

    // Method to get the course details
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
                stmt = conn.prepareStatement("SELECT * FROM users u JOIN teachers t ON u.uname = t.uname "
                        + "JOIN courses c ON t.teacher_id = c.teacher_id;");
            } else if (role.equals("teacher")) {
                stmt = conn.prepareStatement("SELECT * FROM users u JOIN teachers t ON u.uname = t.uname "
                        + "JOIN courses c ON t.teacher_id = c.teacher_id WHERE u.uname = ?;");
                stmt.setString(1, uname);
            } else if (role.equals("student")) {
                stmt = conn.prepareStatement("SELECT * FROM users u JOIN teachers t ON u.uname = t.uname "
                        + "JOIN courses c ON t.teacher_id = c.teacher_id "
                        + "JOIN course_students cs ON c.course_id = cs.course_id "
                        + "JOIN students s ON cs.student_id = s.student_id WHERE s.uname = ?;");
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
                ci.teacher_uname = rs.getString("uname");
                ci.teacher_mail = rs.getString("email");
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

    // Method to get the teachers' details
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

    // Method to get the corresponding student id
    static public int getStudentId(String uname) throws ClassNotFoundException, SQLException {

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for selecting the student's id
            stmt = conn.prepareStatement("SELECT student_id FROM students WHERE uname = ?;");
            stmt.setString(1, uname);

            // Execute the SQL statement and get the result set
            ResultSet rs = stmt.executeQuery();
            rs.next();

            // Return the student id
            return rs.getInt("student_id");
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
        return 0;
    }

    // Method to get the student' details of the corresponding course
    static public List<StudentInfo> getStudentInfos(int course_id) throws ClassNotFoundException, SQLException {

        try {
            // Initialize new array list object
            studentInfos = new ArrayList<>();

            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Create a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL statement for selecting the students of corresponding course
            stmt = conn.prepareStatement("SELECT * FROM users u JOIN students s ON u.uname = s.uname "
                    + "JOIN course_students cs ON s.student_id = cs.student_id "
                    + "JOIN courses c ON cs.course_id = c.course_id WHERE c.course_id = ?;");
            stmt.setInt(1, course_id);

            // Execute the SQL statement and get the result set
            ResultSet rs = stmt.executeQuery();

            // Push the data from resultset to the list
            while (rs.next()) {
                StudentInfo si = new StudentInfo();
                si.fname = rs.getString("fname");
                si.lname = rs.getString("lname");
                si.uname = rs.getString("uname");
                si.mail = rs.getString("email");
                studentInfos.add(si);
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
        return studentInfos;
    }
}
