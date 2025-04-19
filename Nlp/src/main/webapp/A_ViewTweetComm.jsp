<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All tweets comment ...</title>
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
     <h2>Control Mechanism for Managing Information Spread in Online Social Networks</h2>
            </div>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="body">
    <div class="body_resize">
      <div class="left">
 
            <div class="cleaner_h40">
			<p>     <h2>Tweet Detail</h2>
			
<%@ include file="connect.jsp" %>


					<%
						
					
					String tname=request.getParameter("tname");
						
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						Statement st1=null;
						ResultSet rs1=null;
						try 
						{
						   	String query="select * from tweets where tname='"+tname+"'"; 
						  st1=connection.createStatement();
						   rs1=st1.executeQuery(query);
					   		while ( rs1.next() )
					   		{
								i=rs1.getInt(1);
								String tn=rs1.getString(3);
								String c_user=rs1.getString(2);
								String cmt=rs1.getString(4);
								String dt=rs1.getString(5);
							
							
					%>
		
<div class="post-card">
    <div class="post-image">
   <img src="Tweet_pic.jsp?tweet_id=<%=i%>" alt="Tweet Image" class="tweet-image" />
    </div>
    <div class="post-details">
        <div class="top-row">
            <div class="post-info"><strong>Title:</strong> <% out.println(tn); %></div>
                    <div class="post-info"><strong>Description</strong> <% out.println(cmt); %></div>
            
        </div>
        <div class="bottom-row">
            <div class="post-info"><strong>Date:</strong> <% out.println(dt); %></div>
                        <div class="post-info"><strong>By:</strong> <a href="A_UserProfile.jsp?value=<%=c_user%>&type=<%="tweets"%>" style="color:#00A8CC;"> <%= c_user %></a></div>
            
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
					}finally {
				        try {
				            if (rs1 != null) rs1.close();
				            if (st1 != null) st1.close();
				            if (connection != null) connection.close();
				        } catch (SQLException e) {
				            e.printStackTrace();
				        }
				    }
					%>


			
				</p>
            
			<p align="right"><a href="A_ViewTweets.jsp" class="style2">Back</a></p>
			
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
