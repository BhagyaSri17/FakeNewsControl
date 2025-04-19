<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>View your Retweets Details</title>
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
                        <li><a href="Logout.jsp" class="active"><span>OSN User</span></a></li>
                        <li><a href="A_Logout.jsp"><span>Admin Server</span></a></li>
                    </ul>
                </div>
                <div class="clr"></div>
            </div>

            <div class="headert_text_resize">
                <img src="images/text_area_img.jpg" alt="" width="395" height="396" />
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
                    <h2 class="style5">&nbsp;</h2>

                    <div id="templatemo_content">
                        <div class="left">
                            <h2>All Retweets Details</h2>

                            <%
                                String user = (String) session.getAttribute("user");
                                if (user == null) {
                                    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
                                }

                                String tname = request.getParameter("tname");
                                String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", pos = "positive";
                                int i = 0, count = 0, count1 = 0, poscnt = 0, negcnt = 0, strcnt = 0;
                                Statement st3,st =null;
                                ResultSet rs3,rs=null;
                                try {
                                    String sql3 = "SELECT tname FROM tweets WHERE tweeter='" + user + "' AND tname='" + tname + "'";
                                    st3 = connection.createStatement();
                                    rs3 = st3.executeQuery(sql3);

                                    if (rs3.next()) {
                                        String s10 = rs3.getString(1);
                            %>

                            <div style="max-width: 600px;">
                                <h2>Positive Retweets of: <%= s10 %></h2>

                         
                                <%
                                    String query = "SELECT r_user, r_tweet, date FROM retweets WHERE tname='" + s10 + "' AND `sentiment`='Positive'";
                                    st = connection.createStatement();
                                    rs = st.executeQuery(query);
                                %>

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
                                        <td class="positive-user">
                                                <%= commentedUser %>

                                        </td>
                                        <td class="positive-comment"><%= comment %></td>
                                        <td class="positive-date"><%= date %></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                            <p>&nbsp;</p>

                        </div>

                            <div style="max-width: 600px;">
                                <h2>Negative Retweets of: <%= s10 %></h2>

                         
                                <%
                                    String query1 = "SELECT r_user, r_tweet, date FROM retweets WHERE tname='" + s10 + "' AND `sentiment`='Negative'";
                                    Statement st1 = connection.createStatement();
                                    ResultSet rs1 = st1.executeQuery(query1);
                                %>

                                <table class="table-style">
                                    <tr class="table-header">
                                        <th>Commented User</th>
                                        <th>Comment</th>
                                        <th>Date</th>
                                    </tr>

                                    <%
                                    while (rs.next()) {
                                        String commentedUser = rs1.getString("r_user");
                                        String comment = rs1.getString("r_tweet");
                                        String date = rs1.getString("date");
                                        count++;
                                    %>
                                    <tr>
                                        <td class="positive-user">
                                          
                                                <%= commentedUser %>
                                           
                                        </td>
                                        <td class="positive-comment"><%= comment %></td>
                                        <td class="positive-date"><%= date %></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                            <p>&nbsp;</p>

                            <%
                                }
                            } catch (Exception e) {
                                out.println(e.getMessage());
                            }finally {
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
                            <a href="U_ViewTweets.jsp" class="style2">Back</a>
                        </p>
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
    <div align="center"></div>
</body>
</html>
