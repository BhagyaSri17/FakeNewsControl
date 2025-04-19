<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All Friend Request and Responses</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">

</style>
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
					<div id="templatemo_content">
						<h2>All Request and Response Details</h2>


						<table class="table-style">
							<tr>
								<th>Username</th>
								<th>Request Sent To</th>
								<th>Status</th>
								<th>Date &amp; Time</th>
							</tr>
							<%@ include file="connect.jsp"%>
							<%
							String s1, s2, s3, s4;
							int i = 0;
							Statement st =null;
							ResultSet rs =null;
							try {
								String query = "select * from req_res";
								 st = connection.createStatement();
								 rs = st.executeQuery(query);
								while (rs.next()) {
									i = rs.getInt(1);
									s1 = rs.getString(2);
									s2 = rs.getString(3);
									s3 = rs.getString(4);
									s4 = rs.getString(5);
							%>
							<tr>
								<td>&nbsp;&nbsp;<%=s1%></td>
								<td>&nbsp;&nbsp;<%=s2%></td>
								<td>&nbsp;&nbsp;<%=s3%></td>
								<td>&nbsp;&nbsp;<%=s4%></td>

							</tr>
							<%
							}
							connection.close();
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
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>

					<p align="right">
						<a href="A_Main.jsp" class="style2">Back</a>
					</p>

				</div>

				<div class="right">
				<h2>&nbsp</h2>
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
	<div align=center></div>
</body>
</html>
