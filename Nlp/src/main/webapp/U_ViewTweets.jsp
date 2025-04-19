<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View your Tweets...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">

</style>
</head>
<%@ include file="connect.jsp"%>
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
					<h2> Control Mechanism for Managing Information Spread
						in Online Social Networks</h2>
				</div>
				<div class="clr"></div>
			</div>
			<div class="clr"></div>
		</div>
		<div class="body">
			<div class="body_resize">
				<div class="left">
					<h2 class="style5">&nbsp;</h2>

					<div id="templatemo_content">
						<div class="left">

							<h2>All Tweets Details</h2>
						

								<%
								String user = (String) session.getAttribute("user");
								if (user == null) {
								    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
								}
								String s1, s2, s3, s4, s5, s6, s7, s8, s9, neg = "negative", pos = "positive", str = "stress";
								int i = 0;
								Statement st =null;
								ResultSet rs =null;
								try {
									String query = "select * from tweets where tweeter='" + user + "' ";
								st = connection.createStatement();
									 rs = st.executeQuery(query);
									while (rs.next()) {
										i = rs.getInt(1);
										s1 = rs.getString(3);
										s2 = rs.getString(4);
										s3 = rs.getString(5);
										s4 = rs.getString(6);
								%><div class="post-card">
									<div class="post-image">
			<img src="Tweet_pic.jsp?tweet_id=<%=i%>" alt="Tweet Image" class="tweet-image" />

									</div>
	<div class="post-details">     
										<div class="top-row">
											<p class="post-info">
												<strong>Title:</strong>
												<%=s1%></p>
											<p class="post-info">
												<strong>Content:</strong>
												<%=s2%></p>
										</div>

										<div class="bottom-row">
											<p class="post-info">
												<strong>Post Date:</strong>
												<%=s3%></p>
											<p class="post-info">
												<strong>Retweet count:</strong>
												<%=s4%></p>
										</div>

										<div class="actions">
											<a href="U_ViewTweetsDetail.jsp?tname=<%=s1%>"
												class="view-btn">View Retweets</a>
										</div>
									</div>
								</div>

								<%
								}

								} catch (Exception e) {
								out.println(e.getMessage());
								}
								finally {
							        try {
							            if (rs != null) rs.close();
							            if (st != null) st.close();
							            if (connection != null) connection.close();
							        } catch (SQLException e) {
							            e.printStackTrace();
							        }
							    }
								%>

						</div>
						<p align="right">
							<a href="U_Main.jsp" class="style2">Back</a>
						</p>
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
			</div>
			<div class="clr"></div>
		</div>
	</div>
	</div>
	<div class="footer">
		<div class="clr"></div>
	</div>
	</div>
	<div align=center></div>
</body>
</html>
