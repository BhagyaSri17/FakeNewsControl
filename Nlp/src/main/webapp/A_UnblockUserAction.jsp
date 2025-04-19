<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%
    // Retrieve connection from the application scope
    connection = (Connection) application.getAttribute("connection");

    // Check if connection is null
    if (connection == null) {
        out.println("<p style='color:red;'>Database Connection is not available.</p>");
    } else {
        String userId = request.getParameter("userId");

        // Check if userId parameter is present
        if (userId != null && !userId.trim().isEmpty()) {
        	PreparedStatement ps =null;
            try {
                // Prepare the SQL query to unblock the user
              ps = connection.prepareStatement(
                    "UPDATE user SET status = 'Authorized' WHERE id = ?");
                ps.setInt(1, Integer.parseInt(userId));

                // Execute the query
                int rowsUpdated = ps.executeUpdate();

                ps.close();

                // After the unblock action is completed, redirect to the search page to reload the list
                if (rowsUpdated > 0) {
                    // Optionally, URL-encode the message to prevent any unwanted characters
                    String message = "User unblocked successfully.";
                    response.sendRedirect("A_SearchUsers.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
                } else {
                    response.sendRedirect("A_SearchUsers.jsp?message=Error unblocking user.");
                }

            } catch (SQLException e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
            finally {
                try {
                    if (ps!= null) ps.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>
