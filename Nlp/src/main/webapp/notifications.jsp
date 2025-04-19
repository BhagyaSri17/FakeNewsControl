<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Notifications</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link href="style.css" rel="stylesheet" type="text/css" />

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
                        <li><a href="U_Main.jsp"><span>Home</span></a></li>
                        <li><a href="Logout.jsp" class="active"><span>OSN User</span></a></li>
                        <li><a href="A_Logout.jsp"><span>Admin Server</span></a></li>
                    </ul>
                </div>
                <div class="clr"></div>
            </div>
        </div>
        <div class="headert_text_resize"> <img src="images/text_area_img.jpg" alt="" width="395" height="396" />
      <div class="textarea">
                <h2>Control Mechanism for Managing Information Spread in Online Social Networks</h2>
            </div>
        </div>
    </div>
    
    <div class="body">
        <div class="body_resize">
            <div class="left">
                <h2>Your Notifications</h2>
                <%
                    String currentUser = (String)session.getAttribute("user");
                    if(currentUser != null) {
                    	 PreparedStatement frPst=null;
                    	 ResultSet frRs =null;
                    	 PreparedStatement likePst=null;
                    	 ResultSet likeRs=null;
                    	 PreparedStatement tweetPst=null;
                    	  ResultSet tweetRs=null;
                          PreparedStatement  updatePst=null;
                          PreparedStatement updateLikePst =null;
                        try {
                            // Get friend request notifications
                            String frSql = "SELECT r.*, u.username as from_user FROM req_res r " +
                                         "JOIN user u ON r.requestfrom = u.username " +
                                         "WHERE r.requestto=? AND r.status='waiting'";
                            frPst = connection.prepareStatement(frSql);
                            frPst.setString(1, currentUser);
                           frRs = frPst.executeQuery();
                            
                            boolean hasNotifications = false;
                            while(frRs.next()) {
                                hasNotifications = true;
                                %>
                                <div class="notification unread">
                                    <p>Friend request from <%= frRs.getString("from_user") %></p>
                                    <div>
                                        <a href="U_UpdateReq.jsp?id=<%=frRs.getInt("id")%>" class="accept-btn">Accept</a>
                                    </div>
                                </div>
                                <%
                            }

                            // Get like notifications
                            String likeSql = "SELECT n.*, t.tname, n.from_user FROM tweet_notifications n " +
                                           "JOIN tweets t ON n.tweet_id = t.id " +
                                           "WHERE n.to_user=? AND n.status='unread' AND n.notification_type='like' " +
                                           "ORDER BY n.created_date DESC";
                             likePst = connection.prepareStatement(likeSql);
                            likePst.setString(1, currentUser);
                           likeRs = likePst.executeQuery();
                            
                            while(likeRs.next()) {
                                hasNotifications = true;
                                %>
                                <div class="notification unread">
                                    <p><%= likeRs.getString("from_user") %> liked your tweet "<%= likeRs.getString("tname") %>"</p>
                                    <div>
                                        <a href="U_AllFriendsComm.jsp?tweet_id=<%=likeRs.getInt("tweet_id")%>" class="view-btn">View Tweet</a>
                                    </div>
                                </div>
                                <%
                                // Mark like notification as read
                                String updateLikeSql = "UPDATE tweet_notifications SET status='read' WHERE tweet_id=? AND to_user=? AND notification_type='like'";
                                updateLikePst = connection.prepareStatement(updateLikeSql);
                                updateLikePst.setInt(1, likeRs.getInt("tweet_id"));
                                updateLikePst.setString(2, currentUser);
                                updateLikePst.executeUpdate();
                            }

                            // Get tweet notifications
                            String tweetSql = "SELECT t.* FROM tweets t " +
                                            "WHERE t.tweeter IN " +
                                            "(SELECT requestfrom FROM req_res WHERE requestto=? AND status='Accepted' " +
                                            "UNION SELECT requestto FROM req_res WHERE requestfrom=? AND status='Accepted') " +
                                            "AND t.tweet_status='Posted' AND t.is_notified='No' " +
                                            "ORDER BY t.date DESC";
                             tweetPst = connection.prepareStatement(tweetSql);
                            tweetPst.setString(1, currentUser);
                            tweetPst.setString(2, currentUser);
                         tweetRs = tweetPst.executeQuery();
                            
                            while(tweetRs.next()) {
                                hasNotifications = true;
                                %>
                                <div class="notification unread">
                                    <p>New tweet by <%= tweetRs.getString("tweeter") %></p>
                                    <p><strong>Tweet: </strong><%= tweetRs.getString("tname") %></p>
                                    <p><em>Posted on: <%= tweetRs.getString("date") %></em></p>
                                    <div>
                                        <a href="U_AllFriendsComm.jsp?tweet_id=<%=tweetRs.getInt("id")%>" class="view-btn">View Tweet</a>
                                    </div>
                                </div>
                                <%
                                // Mark tweet notification as read
                                String updateSql = "UPDATE tweets SET is_notified='Yes' WHERE id=?";
                                 updatePst = connection.prepareStatement(updateSql);
                                updatePst.setInt(1, tweetRs.getInt("id"));
                                updatePst.executeUpdate();
                            }
                            if(!hasNotifications) {
                                %>
                                <div class="notification">
                                    <p>No new notifications.</p>
                                </div>
                                <%
                            }
                        } catch(Exception e) {
                            out.println("Error: " + e.getMessage());
                        }finally {
                            try {
                                if (frRs != null) frRs.close();
                                if (frPst != null) frPst.close();

                                if (likeRs != null) likeRs.close();
                                if (likePst != null) likePst.close();

                                if (tweetRs != null) tweetRs.close();
                                if (tweetPst != null) tweetPst.close();

                                if (updatePst != null) updatePst.close();
                                if (updateLikePst != null) updateLikePst.close();

                                if (connection != null) connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }

                    } else {
                        response.sendRedirect("U_Login.jsp");
                    }
                %>
            </div>
            
            <div class="right">
             <h2 align="justify">&nbsp;</h2>
                <h2>Sidebar Menu</h2>
                <ul>
                    <li><a href="U_Main.jsp">Home</a></li>
                    <li><a href="U_Login.jsp">Logout</a></li>
                </ul>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    
   </body>
</html>