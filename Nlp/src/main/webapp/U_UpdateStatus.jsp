<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<title> User Information adding page</title>

<%	Statement stmt3=null;
ResultSet rs2=null;
	try{
		String requestto = request.getParameter("username");
	//	int id=Integer.parseInt(request.getParameter("id"));
		String requestfrom = (String) session.getAttribute("user");
		if (requestfrom == null) {
		    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
		}

	
 		String sql3="select * from req_res where (requestfrom='"+requestto+"' && requestto='"+requestfrom+"')||(requestfrom='"+requestfrom+"' && requestto='"+requestto+"')";
       	 stmt3 = connection.createStatement();
	    rs2=stmt3.executeQuery(sql3);
		if(rs2.next()){
				response.sendRedirect("U_SearchFrd.jsp" );
		}
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						String status = "waiting";
						
	   	String sql="insert into req_res(requestfrom,requestto,status,dt) values ('"+requestfrom+"','"+requestto+"','"+status+"','"+dt+"')";
       	Statement stmt = connection.createStatement();
	   	int n =stmt.executeUpdate(sql);
		out.println(n);
	   	if(n>0)
	   	{
			
			response.sendRedirect("U_SearchFrd.jsp" );
	    
     	}
	    else
	    {	
			request.setAttribute("msg","Failure in Recommendation");
				response.sendRedirect("U_SearchFrd.jsp" );
			
      	}
		connection.close();
	}catch(Exception e)
	{
		out.print(e);
	}finally {
        try {
            if (rs2 != null) rs2.close();
            if (stmt3 != null) stmt3.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>


			
			
			
			
			
			
			
			
			
			
			
			
			
		