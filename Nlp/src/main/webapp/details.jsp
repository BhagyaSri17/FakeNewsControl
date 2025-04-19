<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Details...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>



</head>

<%@ include file="connect.jsp" %>

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
         <p align="right">&nbsp;</p> 
      <div class="left">
				
					<%
							//String s12=(String)application.getAttribute("name1");
						String tname=request.getParameter("tname");
						
						String s1,s2,s3,s4;
						int i=0;
					   	Statement st=null;
					 	ResultSet rs=null;
						try 
						{
						   	String query="select * from tweets where tname='"+tname+"'"; 
						   st=connection.createStatement();
						    rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(3);
								s2=rs.getString(5);
								s3=rs.getString(6);
								s4=rs.getString(7);
						
					%>
	<div class="profile-card">
    <div class="profile-image">
   <img src="Tweet_pic.jsp?tweet_id=<%=i%>" alt="Tweet Image" class="tweet-image" />
    </div>
    <div class="profile-details">
        <h2>Tweet Details</h2>
        <div class="detail"><strong>Tweet Name:</strong> <%= s1 %></div>
        <div class="detail"><strong>Description:</strong> <%= s2 %></div>
        <div class="detail"><strong>Tweet Date:</strong> <%= s3 %></div>
        <div class="detail"><strong>Retweets Count:</strong> <%= s4 %></div>
    </div>
</div>
			  <%
			    }connection.close();
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

			<% String type=request.getParameter("type");
			if(type.equalsIgnoreCase("positive")){%>
            <p align="right"><a href="A_PossitiveFilter.jsp" class="style4">Back</a></p>
			<%}else if(type.equalsIgnoreCase("negative")){%>
            <p align="right"><a href="A_NegativeFilter.jsp" class="style4">Back</a></p>
			<%}else{%>
            <p align="right"><a href="A_StressedFilter.jsp?s12" class="style4">Back</a></p>
			<%}
			%>
			
		
		
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
</div>
<div align=center></div></body>
</html>
