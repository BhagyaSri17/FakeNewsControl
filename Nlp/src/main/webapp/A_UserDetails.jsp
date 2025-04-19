<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Users Details</title>
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
          <li><a href="Logout.jsp"><span>OSN User</span></a></li>
          <li><a href="A_Logout.jsp" class="active"><span>Admin Server</span></a></li>
         
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
        <div id="templatemo_content">
<%String id = request.getParameter("mid");%>
        <h2 class="style7"><em>User Profile</em></h2>
             
            
            
            <div class="cleaner_h40">
			<p>  <title>User Profile</title>	
<%@ include file="connect.jsp" %>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>

					<%
						
					//	String user=(String )application.getAttribute("user");
						
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						Statement st=null;
						ResultSet rs=null;
						try 
						{
						   	String query="select * from user where id='"+id+"'"; 
						   	st=connection.createStatement();
						  rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(8);
                                s6=rs.getString(11);
					%>
					<tr>
					 <div class="profile-card">
        <div class="profile-image">
            <img src="profile_pic.jsp?id=<%=i%>&type=<%="user"%>" alt="Profile Picture">
        </div>
        <div class="profile-details">
            <h2><%= s1 %></h2>
            <div class="detail"><strong>Email:</strong> <%= s2 %></div>
            <div class="detail"><strong>Mobile:</strong> <%= s3 %></div>
            <div class="detail"><strong>Date of Birth:</strong> <%= s4 %></div>
            <div class="detail"><strong>Address:</strong> <%= s5 %></div>
            <div class="detail"><strong>Status:</strong> 
                <% if (s6.equalsIgnoreCase("waiting")) { %>
                    <a href="authentication.jsp?type=<%="userstatus"%>&id=<%= i %>">Waiting</a>
                <% } else { %>
                    <%= s6 %>
                <% } %>
            </div>
        </div>
    </div>
					 
				<%
					
						}
						connection.close();
					}
					catch(Exception e)
					{
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

				
				</p>
            
 
            <p align="right"><a href="A_AllUsers.jsp" class="style2">Back</a></p>
			
        </div>
	</div>
	  </div>
      <div class="right">
           <p align="right">&nbsp;</p>
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
