<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%
    String userId = request.getParameter("userId");

    if (userId == null || userId.trim().isEmpty()) {
        out.println("<p style='color:red;'>Error: Invalid User ID.</p>");
    } else {
   
        PreparedStatement pst = null;

        try {
       

            String sql = "UPDATE user SET status = 'Blocked' WHERE id = ?";
            pst = connection.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(userId));  // Convert userId to int

            int updatedRows = pst.executeUpdate();

            if (updatedRows > 0) {
                out.println("<p style='color:green;'>User blocked successfully.</p>");
            } else {
                out.println("<p style='color:red;'>Error: Unable to block user.</p>");
            }

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (pst != null) pst.close();
                if (connection != null) connection.close();
            } catch (SQLException ignored) {}
        }
    }
%>
<a href="A_SearchUsers.jsp">Go Back</a>
