<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All negative tweets...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>



</head>

<%@ include file="connect.jsp"%>

<body>
	<div class="main">
		<div class="header">
			<div class=top-line></div>
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

					<h2>All Negative Retweets Details</h2>




					<%
					String s1 = "", s7 = "";
					int count = 0, positiveCount = 0, negativeCount = 0;
							Statement st3=null;
							ResultSet rs3=null;
							Statement st=null;
							ResultSet rs=null;
							
					try {
						String sql3 = "select tname,tweeter from tweets";
						 st3 = connection.createStatement();
						 rs3 = st3.executeQuery(sql3);
						while (rs3.next()) {
							s1 = rs3.getString(1);
							s7 = rs3.getString(2);
							count = 0;
							positiveCount = 0;
							negativeCount = 0;

				            String query = "SELECT r_user, r_tweet, date FROM retweets WHERE tname='" + s1 + "' AND `sentiment`='Negative'";
							 st = connection.createStatement();

							 rs = st.executeQuery(query);
							boolean hasRetweets = false;
							if (rs.isBeforeFirst()) {
						hasRetweets = true;
					%>

					<strong style="margin-left: 10px">Retweets of: </strong>
					<%=s1%>
					by <a href="A_UserProfile.jsp?value=<%=s7%>&type=negative"
						class="link-style" style="color: #00A8CC;"> <%=s7%>
					</a> <a href="details.jsp?tname=<%=s1%>&type=negative"
						class="link-style"><strong>&nbsp;ViewTweet&nbsp;</strong></a>

					<table class="table-style">
						<tr class="table-header">
							<th>Commented User</th>
							<th>Comment</th>
							<th>Date</th>

						</tr>

						<%
						while (rs.next()) {
							String commentedUser = rs.getString("r_user");
							String comment = rs.getString("r_tweet");
							String date = rs.getString("date");

							count++;

						%>
						<tr>
							<td class="positive-user"><a
								href="A_UserProfile.jsp?value=<%=commentedUser%>&type=positive"
								class="link-style"> <%=commentedUser%>
							</a></td>
							<td class="positive-comment"><%=comment%></td>
							<td class="positive-date"><%=date%></td>

						</tr>

						<%
						
						}
						%>
					</table>
					<p>&nbsp;</p>

					<%
					}
					}

					connection.close();
					} catch (Exception e) {
					out.println(e.getMessage());
					}
					finally {
					    try {
					        if (rs3 != null) rs3.close();
					        if (st3 != null) st3.close();
					        if (rs != null) rs.close();
					        if (st != null) st.close();
					        if (connection != null) connection.close();
					    } catch (SQLException e) {
					        e.printStackTrace();
					    }
					}
							
					%>

					<p align="right">
						<a href="A_Main.jsp" class="style2">Back</a>
					</p>


				</div>
			
			<div class="right">
									<p class="star">&nbsp;</p>
			
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
	</div></div>

	</div>
	<div align=center></div>
</body>
</html>
