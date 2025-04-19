<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View All Friends...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 16px}
.style5 {color: #FF00FF}
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
	 <h2 class="style5"> Friend Profile         </h2>
					<%@ include file="connect.jsp" %>
					<% String user = (String) session.getAttribute("user");
					if (user== null) {
					    response.sendRedirect("Logout.jsp"); // Redirect if session is lost
					}
					  
						//int id = Integer.parseInt(request.getParameter("id"));
						
						String user1=request.getParameter("type1");
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						Statement st=null;
						ResultSet rs=null;
						try 
						{
						   	String query="select * from user where username='"+user1+"'"; 
						    st=connection.createStatement();
						   	 rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								s6=rs.getString(8);
								//s7=rs.getString(9);
								//s8=rs.getString(8);
					%>
			<div class="profile-card">
    <div class="profile-image">
        <img src="profile_pic.jsp?id=<%=i%>&type=<%="user"%>" alt="Profile Picture">
    </div>

    <div class="profile-details">
        <h2><%= s1 %></h2>

        <div class="detail">
            <strong>Email:</strong> <span><%= s2 %></span>
        </div>

        <div class="detail">
            <strong>Mobile:</strong> <span><%= s3 %></span>
        </div>

        <div class="detail">
            <strong>Date of Birth:</strong> <span><%= s4 %></span>
        </div>
        <div class="detail">
            <strong>Gender:</strong> <span><%= s5 %></span>
        </div>
        <div class="detail">
            <strong>Address:</strong> <span><%= s6 %></span>
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

     
            
            <div class="cleaner_h40">
          
                <p align="right"><a href="U_AllFriends.jsp" class="style2">Back</a></p>
              </div>
            </div>
            
            <div id="div">
              <h2>&nbsp;</h2>
        </div>
            <h2>&nbsp;</h2>
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
          <li></li>
        </ul>
        <ul class="sponsors">
          <li class="sponsors"></li>
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
<div align=center></div></body>
</html>
