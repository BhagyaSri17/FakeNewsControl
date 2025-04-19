<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User search Friends</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

</head>
<body>
	<div class="main">
		<div class="header">
			<div class="top-line"></div>

			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.html" class="style1"></a>
					</h1>
				</div>
				<div class="menu">
					<ul>
						<li><a href="U_Main.jsp"><span>Home</span></a></li>
						<li><a href="Logout.jsp" class="active"><span>OSN
									User</span></a></li>
						<li><a href="A_Logout.jsp"><span>Admin Server</span></a></li>

					</ul>
				</div>
				<div class="clr"></div>
			</div>
			<div class="headert_text_resize">
				<img src="images/text_area_img.jpg" alt="" width="395" height="396" />
				<div class="textarea">
					<h2>Control Mechanism for Managing Information Spread
						in Online Social Networks</h2>
				</div>
				<div class="clr"></div>
			</div>
			<div class="clr"></div>
		</div>
		<div class="body">
			<div class="body_resize">
				<div class="left">
					<h2 class="style5 style6 style5">Search Results:</h2>

					<div id="templatemo_content">
					
						<p>&nbsp;</p>

						<%@ include file="connect.jsp"%>
						<%@ page import="java.util.Date,java.lang.*"%>
						<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
						<%
	
    
						String s1,s2,s3,s4;
						int i=0;
						String keyword=request.getParameter("keyword");
						String user = (String) session.getAttribute("user");
						if (user == null) {
						    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
						}

						Statement st=null;
						ResultSet rs=null;
						Statement st7=null;
						ResultSet rs7=null;
						try 
						{  
							String status1=null;
						   	String status=null;
						   	String query="select * from user where username LIKE '%"+keyword+"%'"; 
						   st=connection.createStatement();
						   	rs=st.executeQuery(query);
						    boolean hasResults = false;
					   		while(rs.next()==true)
					   		{    hasResults = true; 
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								//s8=rs.getString(8);
								status ="request";
								if(s1.equalsIgnoreCase(user)){}
								else
								{
								
									String query7="select * from req_res where (requestfrom='"+user+"'||requestto='"+user+"')" ; 
									st7=connection.createStatement();
									rs7=st7.executeQuery(query7);
									while(rs7.next())
									{
										String rfrom =rs7.getString(2);
										String rto =rs7.getString(3);
										status1 = rs7.getString(4);
										
										if((!status1.equalsIgnoreCase("Accepted"))&&(rfrom.equalsIgnoreCase(s1)||(rto.equalsIgnoreCase(s1))))
										{
											status="sent";
										}
										else if((status1.equalsIgnoreCase("Accepted"))&&(rfrom.equalsIgnoreCase(s1)||(rto.equalsIgnoreCase(s1))))
										{
											status="Already Friend";
										}
										
									}	
								%>

						<div class="profile-card">
							<div class="profile-image">
								<img src="profile_pic.jsp?id=<%=i%>&type=user&name=<%=s1%>"
									alt="Profile Picture">
							</div>
							<div class="profile-details">
								<h2><%= s1 %></h2>
								<p class="detail">
									<strong>Status:</strong>
									<% 	if(status.equals("Already Friend")) { %>
									<%=status %>
									<% }else if(status.equals("sent")){
	%>
					<%=status %>
									<%
				}else{
				
				%>
								<a
										href="U_UpdateStatus.jsp?username=<%=s1%>&id=<%=i%>"><%=status %>&nbsp;</a>
									<%}
				%>

								</p>
								
							</div>
						</div>
						<%
					
						}
					
				
 	    					
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
				
						String sql="insert into friend_search(username,keyword,date)values('"+user+"','"+keyword+"','"+dt+"')";
						Statement st1=connection.createStatement();
						st1.executeUpdate(sql);
							
					}		
					   	    if (connection != null) {
					   	        connection.close();
					   	    }
					
			   		if (!hasResults) {
						%>
						    <p class="no-results">No Friends Found</p>
					
						<%
			   		}
						}
					
					catch(Exception e)
					{
						out.println(e.getMessage());
					}finally {
				        try {
				            if (rs != null) rs.close();
				            if (st != null) st.close();
				            if (rs7 != null) rs7.close();
				            if (st7 != null) st7.close();
				            if (connection != null) connection.close();
				        } catch (SQLException e) {
				            e.printStackTrace();
				        }
				    }
					%>

			
						<div class="cleaner_h40">
						
								<p align="right">
									<a href="U_SearchFrd.jsp" class="style2">Back</a>
								</p>
							</div>
						</div>
					</div>
				
				<div class="right">
					<h2 align="justify">&nbsp;</h2>

					<h2>Sidebar Menu</h2>
					<ul>
						<li><a href="U_Main.jsp">Home</a></li>
			<li><a href="Logout.jsp">Logout </a></li>
						<li></li>
					</ul>
					<ul class="sponsors">
						<li class="sponsors"></li>
					</ul>
				</div>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	
		<div class="footer">
			<div class="clr"></div>
		</div>
	</div>
	<div align=center></div>
</body>
</html>
