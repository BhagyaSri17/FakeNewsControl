<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View your Friends Tweets comment ...</title>
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
							<div class="tweets-container">



								<%@ include file="connect.jsp"%>
								<%@ page import="org.bouncycastle.util.encoders.Base64"%>
								<%@ page import="java.sql.*"%>

								<%
									 String uname = (String) session.getAttribute("user");
									if (uname== null) {
									    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
									}
									  
									
									  String s1="", s2="", s3="", s4="", s5="";
					                    int i=0, likeCount=0;
					                    PreparedStatement pst=null, likePst=null, checkLikePst=null;
					                    ResultSet rs=null, likeRs=null, checkLikeRs=null;
					                    boolean hasLiked = false;
					                    try 
					                    {
					                     
					                        String sql = "SELECT t.* FROM tweets t " +
					                                   "WHERE t.tweeter IN " +
					                                   "(SELECT requestfrom FROM req_res WHERE requestto=? AND status='Accepted' " +
					                                   "UNION " +
					                                   "SELECT requestto FROM req_res WHERE requestfrom=? AND status='Accepted') " +
					                                   "ORDER BY t.date DESC";

					                  

					                        pst = connection.prepareStatement(sql);
					                       
					                            pst.setString(1, uname);
					                            pst.setString(2, uname);
					                        
					                        
					                        rs = pst.executeQuery();
					                        while(rs.next())
					                        {
					                            i=rs.getInt(1);
					                            s1=rs.getString(2);
					                            s2=rs.getString(3);
					                            s3=rs.getString(5);
					                            s4=rs.getString(6);
					                            s5=rs.getString(7);

					                            // Get like count
					                            likePst = connection.prepareStatement("SELECT COUNT(*) FROM tweet_likes WHERE tweet_id=?");
					                            likePst.setInt(1, i);
					                            likeRs = likePst.executeQuery();
					                            likeCount = likeRs.next() ? likeRs.getInt(1) : 0;
					                            
					                            // Check if current user liked
					                            checkLikePst = connection.prepareStatement("SELECT * FROM tweet_likes WHERE tweet_id=? AND user_name=?");
					                            checkLikePst.setInt(1, i);
					                            checkLikePst.setString(2, uname);
					                            checkLikeRs = checkLikePst.executeQuery();
					                            hasLiked = checkLikeRs.next();
					                  %>
								


								<div class="post-card">
									<div class="post-image">
										                                    <img src="Tweet_pic.jsp?tweet_id=<%=i%>" alt="Tweet Image" class="tweet-image" />

									</div>
									<div class="post-info">
										<p>
											<strong>Title:</strong>
											<%out.println(s2);%>
										</p>
										<p>
											<strong>Description:</strong>
											<%out.println(s3);%>
										</p>
										<p>
											<strong>Posted by:</strong> <a
												href="U_UserProfile.jsp?value=<%=s1%>&type=<%="user"%>">
												<%out.println(s1);%>
											</a>
										</p>
									</div>
									<div class="tweet-action">
										<a
											href="U_Retweet.jsp?tname=<%=s2%>&t_user=<%=s1%>&t_des=<%=s3%>"
											class="view-btn">Retweet</a>
									</div>
								
									<div class="like-section">
    <a href="U_LikeTweet.jsp?tweet_id=<%=i%>" class="view-btn" style="width:auto;">
         <%= hasLiked ? "Unlike" : "Like" %>
    </a>
    <span class="like-count"><%=likeCount%>&nbsp;Like</span>
</div>
									
								</div>
								<%
								}   		
												     if(likePst != null) likePst.close();
									                            if(checkLikePst != null) checkLikePst.close();
															
														}
														catch(Exception e)
									{
										out.println(e.getMessage());
									}finally
									{
										try {
									if (rs != null)
										rs.close();
									if (pst != null)
										pst.close();
									if (connection != null)
										connection.close();
										} catch (Exception e) {
									out.println("Error closing resources: " + e.getMessage());
										}
									}
								%>




								</p>

								<p align="right">
									<a href="U_Main.jsp" class="style2">Back</a>
								</p>

							</div>
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
