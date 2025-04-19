<title>Authentication</title>
<%@ include file="connect.jsp"%>

<%
String type = request.getParameter("type");
session.setAttribute("type", type);

String username = request.getParameter("userid");
String password = request.getParameter("pass");
PreparedStatement stmt=null;
PreparedStatement stmt1=null;

ResultSet rs =null;
try {
    if ("user".equalsIgnoreCase(type)) {
        String sql = "SELECT * FROM user WHERE username=? AND password=?";
       stmt = connection.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
      rs = stmt.executeQuery();

        if (rs.next()) {
            String status = rs.getString("status");

            if ("Authorized".equalsIgnoreCase(status)) {
                session.setAttribute("user", username);
                response.sendRedirect("U_Main.jsp");
            } else if ("Blocked".equalsIgnoreCase(status)) {
                response.sendRedirect("U_Login.jsp?blocked=true");
            } else {
                response.sendRedirect("U_Login.jsp?unauthorized=true");
            }
        } else {
            // Invalid credentials, redirect with invalid message
            response.sendRedirect("U_Login.jsp?invalid=true");
        }
    } 

    else if ("server".equalsIgnoreCase(type)) {
        String sql = "SELECT * FROM server WHERE username=? AND password=?";
        stmt = connection.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
      rs = stmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("server", username);
            response.sendRedirect("A_Main.jsp");
        } else {
            response.sendRedirect("A_Wrong_Login.jsp");
        }
    } 

    else if ("userstatus".equalsIgnoreCase(type)) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql1 = "UPDATE user SET status='Authorized' WHERE id=?";
        stmt1 = connection.prepareStatement(sql1);
        stmt1.setInt(1, id);
        int k = stmt1.executeUpdate();

        if (k > 0) {
            response.sendRedirect("A_AllUsers.jsp");
        } else {
%>
            <p align="center" class="style3">Permission Not Granted. Please Try Again.</p>
            <p align="center"><a href="A_UserDetails.jsp" class="style2">Back</a></p>
<%
        }
    }
} catch (Exception e) {
    out.print("Error: " + e.getMessage());
}
finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
