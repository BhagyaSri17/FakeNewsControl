<title>Insert tweets comments</title>
<%@page
	import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.Date"%>


<%
					String tname=(String)session.getAttribute("tname");
String user = (String) session.getAttribute("user");
if (user== null) {
    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
}
  
					String t_user=(String)session.getAttribute("t_user");
					String t_des=(String)session.getAttribute("t_desc");
					String r_tweet=request.getParameter("tcomment");
					String sentiment=request.getParameter("sentiment");
					 Statement st = null;
					 Statement st1 = null;
					    ResultSet rs = null;
					try {
						
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
         
    	
						
					PreparedStatement ps1=connection.prepareStatement("insert into retweets(tname,t_user,r_user,r_tweet,date,t_comment,sentiment) values(?,?,?,?,?,?,?)");
						ps1.setString(1,tname);
						ps1.setString(2,t_user);
						ps1.setString(3,user);
						ps1.setString(4,r_tweet);
						ps1.setString(5,dt);
						ps1.setString(6,t_des);
						ps1.setString(7,sentiment);
						ps1.executeUpdate();
						
						    request.setAttribute("msg","successfull");
							out.print("Your comment posted Successfully");
							String sql="select `rank` from tweets where tname='"+tname+"'";
						 st=connection.createStatement();
						 rs=st.executeQuery(sql);
							while(rs.next()){
							int rank=rs.getInt(1);
							int newrank=rank+1;
							String sql1="update tweets set `rank`='"+newrank+"' where tname='"+tname+"' ";
							 st1 = connection.createStatement();
							st1.executeUpdate(sql1);
							
							}
						
			%>
<p>
	<a href="U_AllFriendsComm.jsp">Back</a> <a href="U_Main.jsp">Home</a>
</p>


<%
					   
			   }
					catch (Exception e) 
					{
						out.println(e.getMessage());
						e.printStackTrace();
					}
				    finally {
				        // Close resources in reverse order
				        if (rs != null) try { rs.close(); } catch (SQLException e) {}
				        if (st != null) try { st.close(); } catch (SQLException e) {}
				        if (st1 != null) try { st1.close(); } catch (SQLException e) {}
				        if (connection != null) try { connection.close(); } catch (SQLException e) {}
				    }
					
				%>



