<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View All Friends...</title>
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
					<h2 class="style5">&nbsp;</h2>

<div id="templatemo_content">
    <h2 class="style5">All Friends</h2>

    <%@ include file="connect.jsp"%>
    <%
    String user = (String) session.getAttribute("user");
	if (user== null) {
	    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
	}
	 ResultSet rs2=null;
	Statement st2=null;
    int i = 0;
    try {
        String sql1 = "select * from req_res where (requestfrom='" + user + "'||requestto='" + user + "')&& status='Accepted'";
         st2 = connection.createStatement();
         rs2 = st2.executeQuery(sql1);

        if (!rs2.isBeforeFirst()) { // Check if result set is empty
    %>
        <p class="no-results">No Friends Found</p>
    <%
        } else {
            while (rs2.next()) {
                i = rs2.getInt(1);
                String rf = rs2.getString(2);
                String rt = rs2.getString(3);
                String friendName = rf.equalsIgnoreCase(user) ? rt : rf;
    %>
    <div class="friend-card">
        <p class="friend-name"><strong>Username:</strong> <%= friendName %></p>
        <p class="friend-info">
            <a href="U_FriendProfile.jsp?type1=<%= friendName %>" class="view-btn">View Profile</a>
        </p>
    </div>
    <%
            }
        }
        connection.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    } finally {
        try {
            if (rs2!= null) rs2.close();
            if (st2 != null) st2.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>


				
						<div class="cleaner_h40">
						
								<p align="right">
									<a href="U_Main.jsp" class="style2">Back</a>
								</p>
							</div>
						</div>

						<div class="col c1">
							<h2>&nbsp;</h2>
						</div>
					</div>
			
				<div class="right">
					<h2 align="justify">&nbsp;</h2>

					<h2>Sidebar Menu</h2>
					<ul>
						<li><a href="U_Main.jsp">Home</a></li>
				<li><a href="Logout.jsp">Logout </a></li>

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
