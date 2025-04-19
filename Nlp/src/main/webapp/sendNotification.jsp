<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("userId");
    String message = request.getParameter("message");
    
    Connection conn = null;
    PreparedStatement pst=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/dsbssn", "root", "root");
        
        String sql = "INSERT INTO notifications (user_id, message) VALUES (?, ?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, userId);
        pst.setString(2, message);
        pst.executeUpdate();
        
        response.sendRedirect("notifications.jsp");
        
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(conn != null) conn.close();
        if(pst!= null) pst.close();
    }
%>