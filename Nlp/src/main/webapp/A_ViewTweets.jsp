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
        <h1><a href="index.html" class="style1"></a></h1>
      </div>
      <div class="menu">
        <ul>
          <li><a href="index.html" ><span>Home</span></a></li>
          <li><a href="Logout.jsp"><span>OSN User</span></a></li>
          <li><a href="A_Logout.jsp" class="active"><span>Admin Server</span></a></li>
         
        </ul>
      </div>
      <div class="clr"></div>
    </div>
    <div class="headert_text_resize"> <img src="images/text_area_img.jpg" alt="" width="395" height="396" />
      <div class="textarea">
        <h2>Control Mechanism for Managing Information Spread in Online Social Networks</h2>
         </div>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="body">
    <div class="body_resize">
      <div class="left">
      
      <h2>All Tweets Details</h2>
                  <div class="cleaner_h40">
            <p>
			
<%@ include file="connect.jsp" %>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>

					<%
			int i=0;
        		Statement st = null;
        		ResultSet rs = null;
						try 
						{     if (connection != null) {
							String sql="select * from tweets";
							 st=connection.createStatement();
						 rs=st.executeQuery(sql);
					   		while ( rs.next() )
					   		{
								i=rs.getInt(1);
								String tn=rs.getString(3);
								String desc=rs.getString(4);
								String dt=rs.getString(5);
					
						
					%>
			
			

<div class="post-card">
    <div class="post-image">
   <img src="Tweet_pic.jsp?tweet_id=<%=i%>" alt="Tweet Image" class="tweet-image" />
    </div>
    <div class="post-details">
        <div class="top-row">
            <div class="post-info"><strong>Tweet Name:</strong> <%= tn %></div>
           <div class="post-info"><strong>Description:</strong> <%= desc %></div>
        </div>
        <div class="bottom-row">
           <div class="post-info"><strong>Date:</strong> <%= dt.split(" ")[0] %></div>
           
            <div>
                <a href="A_ViewTweetComm.jsp?tname=<%= tn %>"  class="view-btn"><strong>Tweet Details</strong></a>
            </div>
            <div>
                <a href="A_ViewTweetRecom.jsp?tname=<%= tn %>" class="view-btn"><strong>Re-Tweet Details</strong></a>
            </div>
        </div>
    </div>
</div>
<%
        }
    } else {
        //out.println("Database Connection Error: Failed to establish a connection.");
    }
} catch (SQLException e) {
    out.println(" Connection Error: " + e.getMessage());
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    if (st != null) try { st.close(); } catch (SQLException ignore) {}
    if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
}
%>


			
				</p>
       
			<p align="right"><a href="A_Main.jsp" class="style2">Back</a></p>
			
	</div>
	  </div>
      <div class="right">
      <h2>&nbsp</h2>
        <h2>Server Menu</h2>
        <ul>
         <div class="gadget">
                  <p><a href="A_Main.jsp">Home</a> </p>
                  <p><a href="A_Logout.jsp">Logout </a> </p>
                  <p>&nbsp;</p>
                  <p class="star">&nbsp;</p>
          </div>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
</div>
<div align=center></div></body>
</html>
