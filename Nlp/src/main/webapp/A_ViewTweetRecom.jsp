<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All tweets...</title>
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
						<li><a href="index.html"><span>Home</span></a></li>
						<li><a href="Logout.jsp"><span>OSN User</span></a></li>
						<li><a href="A_Logout.jsp" class="active"><span>Admin
									Server</span></a></li>

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
					<div class="cleaner_h40">
						<p>

							<%@ include file="connect.jsp"%>
							<p align="right">&nbsp;</p>
		
					 
								

							<%
							String tname = request.getParameter("tname");

							int i = 0;
							Statement st2=null;
							ResultSet rs2=null;
							try {

								String query1 = "select * from retweets where tname='" + tname + "'";
								st2 = connection.createStatement();
							 rs2 = st2.executeQuery(query1);

							    boolean hasRetweets = false;
								if (rs2.next()) {
									 hasRetweets = true; 
									String t_user = rs2.getString(3);
									String t_cmt = rs2.getString(4);
							%>
							 <div class="info-row">
							<div style="color: white;" class="post-info">
				<strong>Title:</strong>
								<%=request.getParameter("tname")%></div>
        <div style="color: white;"  class="post-info">
            <strong>Tweet By:</strong>
            <a href="A_UserProfile.jsp?value=<%= t_user %>&type=retweets" style="color: white;" ><%= t_user %></a>
        </div>
        <div style="color: white;" class="post-info">
            <strong>Comment:</strong> <%= t_cmt %>
        </div>
    </div>
						<%
						}
						%>
						<%
						while (rs2.next()) {
							 hasRetweets = true; 
							i = rs2.getInt(1);
							String tn = rs2.getString(2);

							String r_user = rs2.getString(5);
							String r_cmt = rs2.getString(6);
							String dt = rs2.getString(7).split(" ")[0];
						%>

						<div class="post-card">


							<div class="post-details">
								<div class="top-row">


									<div class="post-info">
										<strong>ReTweet:</strong>
										<%=r_cmt%></div>

									<div class="post-info">
										<strong>ReTweet By:</strong> <a
											href="A_UserProfile.jsp?value=<%=r_user%>&type=retweets" style="color:#00A8CC;"><%=r_user%></a>
									</div>


									<div class="bottom-row">
										<div class="post-info">
											<strong>Date:</strong>
											<%=dt%></div>

									</div>
								</div>
							</div>
						</div>



						<%   } if (!hasRetweets) {
							%>
						    <div class="info-row">
						        <div  style="color:white;text-align:center" class="post-info">
						            <strong>No Retweets</strong>
						        </div>
						    </div>
						<%
						    }
					
						

						connection.close();
						} catch (Exception e) {
						out.println(e.getMessage());
						}
							finally {
						        try {
						            if (rs2 != null) rs2.close();
						            if (st2 != null) st2.close();
						            if (connection != null) connection.close();
						        } catch (SQLException e) {
						            e.printStackTrace();
						        }
						    }
						%>


						</p>

					</div>
						<p align="right">
							<a href="A_ViewTweets.jsp" class="style2">Back</a>
						</p>

				</div>
				
				<div class="right">
					<p align="right">&nbsp;</p>
					<h2>Server Menu</h2>
					<ul>
						<div class="gadget">
							<p>
								<a href="A_Main.jsp">Home</a>
							</p>
							<p>
								<a href="A_Logout.jsp">Logout </a>
							</p>
							<p>&nbsp;</p>
							<p class="star">&nbsp;</p>
						</div>
					</ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>
</div>
	</div>
	<div align=center></div>
</body>
</html>
