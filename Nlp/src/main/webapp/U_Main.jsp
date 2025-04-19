<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Main Page</title>
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
            <h1><a href="index.html" class="style1"></a></h1>
          </div>
          <div class="menu">
            <ul>
              <li><a href="index.html"><span>Home</span></a></li>
              <li><a href="Logout.jsp" class="active"><span>OSN User</span></a></li>
              <li><a href="A_Logout.jsp"><span>Admin Server</span></a></li>
             
            </ul>
          </div>
          <div class="clr"></div>
        </div>
        <div class="headert_text_resize"> <img src="images/text_area_img.jpg" alt="" width="395" height="396" />
          <div class="textarea">
            <h2> Control Mechanism for Managing Information Spread in Online Social Networks</h2>
           </div>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
      </div>
      <div class="body">
        <div class="body_resize">
          <div class="left">
            <h2 align="justify">&nbsp;</h2><%
            String user = (String) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
}
          %>  <h2> Welcome <%=(String)session.getAttribute("user")%> </h2>
  		<p><img src="images/User.jpg" width="660" height="211" /></p>
  		<p>&nbsp;</p>
        </div>
        <%@ include file="connect.jsp" %>
                    <%
                        String currentUser = (String)session.getAttribute("user");
                        int notificationCount = 0;
                        PreparedStatement pst=null;
                        ResultSet rs=null;
                        try {
                            String countSql = "SELECT " +
                                "(SELECT COUNT(*) FROM req_res WHERE requestto=? AND status='waiting') + " +
                                "(SELECT COUNT(*) FROM tweet_notifications WHERE to_user=? AND status='unread' AND notification_type='like') + " +
                                "(SELECT COUNT(*) FROM tweets t WHERE t.tweeter IN " +
                                "(SELECT requestfrom FROM req_res WHERE requestto=? AND status='Accepted' " +
                                "UNION SELECT requestto FROM req_res WHERE requestfrom=? AND status='Accepted') " +
                                "AND t.tweet_status='Posted' AND t.is_notified='No') as total_count";
                            pst = connection.prepareStatement(countSql);
                            pst.setString(1, currentUser);
                            pst.setString(2, currentUser);
                            pst.setString(3, currentUser);
                            pst.setString(4, currentUser);
                        rs = pst.executeQuery();
                            
                            if(rs.next()) {
                                notificationCount = rs.getInt("total_count");
                            }
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }finally {
					        try {
					            if (rs != null) rs.close();
					            if (pst != null) pst.close();
					            if (connection != null) connection.close();
					        } catch (SQLException e) {
					            e.printStackTrace();
					        }
					    }
                    %>
       
        <div class="right">
          <h2 align="justify">&nbsp;</h2>
            <h2>Sidebar Menu</h2>
            <ul>
                <div class="gadget">
                <p>
                        <a href="notifications.jsp" style="position: relative; display: inline-block;">
                            Notifications
                            <% if(notificationCount > 0) { %>
                                <span class="notification-badge"><%= notificationCount %></span>
                            <% } %>
                        </a>
                    </p>
                    <p><a href="U_Profile.jsp">View Profile</a></p>
                    <p><a href="U_FriendSearchFrdReq.jsp">Friend Search & Requests</a></p>
                    <p><a href="U_AllFriends.jsp">View All Friends</a></p>
                    <p><a href="U_AddTweets.jsp">Create Tweet</a></p>
                    <p><a href="U_ViewTweets.jsp">View all My created Tweets</a></p>
                    <p><a href="U_AllFriendsComm.jsp">Friends' Tweets</a></p>
                    <li><a href="Logout.jsp">Logout </a></li>
                </div>
            </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
 
</div>
<div align=center></div></body>
</html>