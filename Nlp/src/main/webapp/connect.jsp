<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
    Connection connection = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");    
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dsbssn", "root", "root");

        // Store the connection in the application scope for global access
        application.setAttribute("connection", connection);

    } catch(Exception e) {
        e.printStackTrace();
        out.println("Database Connection Error: " + e.getMessage());
    }
%>
