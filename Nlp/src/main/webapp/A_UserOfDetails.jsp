<%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>User Details</title>
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
  <li><a href="A_Main.jsp"><span>Home</span></a></li>     
       <li><a href="Logout.jsp"><span>OSN User</span></a></li>
          <li><a href="A_Logout.jsp"  class="active"><span>Admin Server</span></a></li>
                </ul>
            </div>
                  <div class="clr"></div>
            
        </div>
        <div class="headert_text_resize">
            <img src="images/text_area_img.jpg" alt="Banner" width="395" height="396" />
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
                <h2>User Details</h2>

                <!-- Display Success or Error Message -->
                <%
                    String message = request.getParameter("message");
                    if (message != null && !message.trim().isEmpty()) {
                        out.println("<p style='color:green;'>" + message + "</p>");
                    }
                %>

                <%
                PreparedStatement ps=null;
                ResultSet rs=null;
                connection = (Connection) application.getAttribute("connection");
                if (connection == null) {
                    out.println("<p style='color:red;'>Database Connection is not available.</p>");
                } else {
                    String username = request.getParameter("username");
                    if (username != null && !username.trim().isEmpty()) {
                        try {
                             ps = connection.prepareStatement(
                                "SELECT id, username, email, mobile, status FROM user WHERE username = ?");
                            ps.setString(1, username);
                             rs = ps.executeQuery();
                %>

                <div class="profile-cards">
                    <%
                    boolean hasRecords = false;
                    while (rs.next()) {
                        hasRecords = true;
                        String status = rs.getString("status");
                       
                        int userId = rs.getInt("id");
                    %>
                    <div class="profile-card">
                        <div class="profile-image">
                            <img src="profile_pic.jsp?id=<%= userId %>&type=user" alt="Profile Picture">
                        </div>
                        <div class="profile-details">
                            <h3><%= rs.getString("username") %></h3>
                            <p>Email: <%= rs.getString("email") %></p>
                            <p>Mobile: <%= rs.getString("mobile") %></p>
                            <p>Status: <%= status %></p>
                        </div>
                        <div class="profile-action">
                            <% if ("blocked".equalsIgnoreCase(status)) { %>
                                <!-- Unblock User -->
                                <div class="blockform">
                                <form action="A_UnblockUserAction.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="userId" value="<%= userId %>" />
                                    <input type="submit" value="Unblock" class="unblock-btn" />
                                </form>
                                </div>
                            <% } else { %>
                                <!-- Block User -->
                                <div class=blockform>
                                <form action="A_BlockUserAction.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="userId" value="<%= userId %>" />
                                    <input type="submit" value="Block" class="block-btn" />
                                </form>
                                </div>
                            <% } %>
                        </div>
                    </div>
                    <%
                    }
                    if (!hasRecords) {
                        out.println("<p style='color:red;'>No user found.</p>");
                    }
                    rs.close();
                    ps.close();
                    %>
                </div>

            <%
    // Fetch tweet details
    ps = connection.prepareStatement("SELECT SUM(CASE WHEN sentiment='positive' THEN 1 ELSE 0 END) AS positive_tweets, "
                                    + "SUM(CASE WHEN sentiment='negative' THEN 1 ELSE 0 END) AS negative_tweets "
                                    + "FROM tweets WHERE tweeter=?");
    ps.setString(1, username);
    rs = ps.executeQuery();

    int positiveTweets = 0;
    int negativeTweets = 0;
    if(rs.next()) {
       

        positiveTweets = rs.getInt("positive_tweets");
        negativeTweets = rs.getInt("negative_tweets");
    }

    // Fetch positive retweets count
    ps = connection.prepareStatement("SELECT SUM(CASE WHEN sentiment='positive' THEN 1 ELSE 0 END) AS positive_retweets, "
            + "SUM(CASE WHEN sentiment='negative' THEN 1 ELSE 0 END) AS negative_retweets "
            + "FROM retweets WHERE r_user=?");
    ps.setString(1, username);
    rs = ps.executeQuery();

    int positiveRetweets = 0;

    int negativeRetweets = 0;
    if(rs.next()) {
    	
        positiveRetweets = rs.getInt("positive_retweets");
    
        negativeRetweets = rs.getInt("negative_retweets");
    }
%>
  <div class="detail">

        <h3>Tweets Count:</h3>
<p style="margin-top:10px;">Positive - <%= positiveTweets %> &nbsp; Negative - <%= negativeTweets %></p>

     
            <h3> Retweets count: </h3> <p style="margin-top:10px;"> Positive - <%= positiveRetweets %>&nbsp; Negative - <%= negativeRetweets %></p>
        
</div>
                <!-- Display Positive Tweets -->
                <h3>Positive Tweets</h3>
                
    <%              ps = connection.prepareStatement("SELECT  tname,description FROM tweets WHERE tweeter=? AND sentiment='positive'");
                    ps.setString(1, username);
                    rs = ps.executeQuery();

                    if(!rs.isBeforeFirst()) { %>
                    <p>No Positive Tweets.</p>
    <%              } else { %>
                <table border="1">
                    <tr>
                        <th>Tweet ID</th>
                        <th>Content</th>
                    </tr>
    <%              while(rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("tname") %></td>
                                                <td><%= rs.getString("description") %></td>
                        
                    </tr>
    <%              } %>
                </table>
    <%              } %>

                <!-- Display Negative Tweets -->
                <h3>Negative Tweets</h3>
    <%              ps = connection.prepareStatement("SELECT  tname,description FROM tweets WHERE tweeter=? AND sentiment='negative'");
                    ps.setString(1, username);
                    rs = ps.executeQuery();
                    if(!rs.isBeforeFirst()) { %>
                    <p>No Negative Tweets.</p>
    <%              } else { %>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                    </tr>
    <%              while(rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("tname") %></td>
                        
                        <td><%= rs.getString("description") %></td>
                    </tr>
    <%              } %>
                </table>
    <%              } %>

                <!-- Display Positive Retweets -->
                <h3>Positive Retweets</h3>
    <%              ps = connection.prepareStatement("SELECT tname, r_tweet FROM retweets WHERE r_user=? AND sentiment='positive'");
                    ps.setString(1, username);
                    rs = ps.executeQuery();
                    if(!rs.isBeforeFirst()) { %>
                    <p>No Positive Retweets.</p>
    <%              } else { %>
                <table border="1">
                    <tr>
                        <th>Tweet Title</th>
                        <th>Retweet</th>
                    </tr>
    <%              while(rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("tname") %></td>
                        <td><%= rs.getString("r_tweet") %></td>
                    </tr>
    <%              } %>
                </table>
    <%              } %>

                <!-- Display Negative Retweets -->
                <h3>Negative Retweets</h3>
    <%              ps = connection.prepareStatement("SELECT tname, r_tweet FROM retweets WHERE r_user=? AND sentiment='Negative'");
                    ps.setString(1, username);
                    rs = ps.executeQuery();
                    if(!rs.isBeforeFirst()) { %>
                    <p>No Negative Retweets.</p>
    <%              } else { %>
                <table border="1">
                    <tr>
                        <th>Tweet Title</th>
                        <th>Retweet</th>
                    </tr>
    <%              while(rs.next()) { %>
                    <tr>
                                  <td><%= rs.getString("tname") %></td>
                        <td><%= rs.getString("r_tweet") %></td>
                    </tr>
    <%              } %>
                </table>
    <%              } 
                       
            } catch(Exception e) {
                e.printStackTrace();
    %>
                <p>Error fetching user details.</p>
    <%      } finally {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(connection != null) connection.close();
            }
        }  else { %>
        <p>No user found with this username.</p>
<%          }
                }
    %>


                <p align="right"><a href="A_SearchUsers.jsp" class="style2">Back</a></p>
            </div>

            <div class="right">
            <P>&nbsp;</P>
                <h2>Sidebar Menu</h2>
                <ul>
                    <li><a href="A_Main.jsp">Home</a></li>
                    <li><a href="A_Logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
