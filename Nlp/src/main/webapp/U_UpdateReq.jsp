<%@ page import="java.sql.*,java.util.Random" %>
<%@ include file="connect.jsp" %>
<html><title> user status changing</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		int id =Integer.parseInt(request.getParameter("id"));
	Statement st1=null;
   		try {
	   		Random rr = new Random();
	   		String str = "Accepted";
				 st1 = connection.createStatement();
       		String query1 ="update req_res set status='"+str+"' where id="+id+" ";
	   		st1.executeUpdate (query1);
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}finally {
	        try {
	            if (st1 != null) st1.close();
	            if (connection != null) connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }	response.sendRedirect("U_FriendReq.jsp");  
	%>
</body>
</html>

