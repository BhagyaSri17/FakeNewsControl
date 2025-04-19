<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Friend Request...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 16px}
.style5 {color: #FF00FF}
.style6 {font-size: 36px}
-->
</style>
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
        <h2 class="style5">All Friend Requests</h2>
		
		<div id="templatemo_content">
	  <p class="style5 style5">&nbsp;</p>
	 
	  
        <%@ include file="connect.jsp" %>
        <%
        String user = (String) session.getAttribute("user");
		if (user== null) {
		    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
		}
		  
						
						String s1,s2,s3,s4,s5,s6;
						int i=0;
						  boolean hasRequests = false;
						  Statement st=null;
							ResultSet rs=null;
						try 
						{
							String query="select * from req_res where (requestto='"+user+"')"; 	   					
							st=connection.createStatement();
						   	 rs=st.executeQuery(query);
					   		while ( rs.next())
					   		{   hasRequests = true;
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(3);
								s3=rs.getString(4);
							
							
							
								
					%>
      
        
             <div class="profile-card">
    <div class="profile-image">
        <img src="profile_pic.jsp?id=<%=i%>&type=user&name=<%=s1%>" alt="Profile Picture">
    </div>
    <div class="profile-details">
        <h2><%= s1 %></h2>
        <p class="detail"><strong>Status:</strong> 
            <% if(s3.equalsIgnoreCase("waiting")) { %>
                <a href="U_UpdateReq.jsp?id=<%=i%>" class="view-btn">Waiting</a>
            <% } else { %>
                <span class="status"><%= s3 %></span>
            <% } %>
        </p>
    </div>
</div>
        
        <%				}     		if (!hasRequests) { 
            %> 
            <p>No friend requests available.</p>
            <%
        }

						
						connection.close();
					}
					catch(Exception e)
					{
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
      

      
             
            
            
            <div class="cleaner_h40">
          

                <p align="right"><a href="U_FriendSearchFrdReq.jsp" class="style2">Back</a></p>
              </div>
            </div>
            
          
	</div>
     
      <div class="right">
                  <h2 align="justify">&nbsp;</h2>
      
        <h2>Sidebar Menu</h2>
        <ul>
          <li><a href="U_Main.jsp">Home</a></li>
<li><a href="Logout.jsp">Logout </a></li>        </ul>
        <ul class="sponsors">
          <li class="sponsors"></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div> </div>
 
  <div class="footer">
    <div class="clr"></div>
  </div>
</div>
<div align=center></div></body>
</html>
