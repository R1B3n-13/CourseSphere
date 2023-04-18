<%-- 
    Document   : checkUsername
    Created on : Apr 18, 2023, 3:32:52 PM
    Author     : Sadik Al Barid
--%>

<%@page import="java.sql.*" %>
<%@page contentType="application/json" %>

<%
  try {
    // Get the username parameter from the AJAX GET request
    String username = request.getParameter("username");

    // Load PostgreSQL JDBC driver
    Class.forName("org.postgresql.Driver");

    // Connect to the PostgreSQL database
    String url = "jdbc:postgresql://localhost:5432/CourseSphereDB";
    String user = "postgres";
    String password = "1234";
    Connection conn = DriverManager.getConnection(url, user, password);

    // Query the database to check if the username already exists
    PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE uname = ?");
    stmt.setString(1, username);
    ResultSet rs = stmt.executeQuery();
    rs.next();
    int count = rs.getInt("count");

    // Close the database connection and resources
    rs.close();
    stmt.close();
    conn.close();

    // Return the result as a JSON response
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write("{\"count\": " + count + "}");
  } catch (ClassNotFoundException | SQLException e) {
    // Handle any exceptions that occur
    e.printStackTrace();
  }
%>