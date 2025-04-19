<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All Search History</title>
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
          <li><a href="index.html" ><span>Home</span></a></li>
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
        <h2>All Search History Details</h2>
		
	   <%
	   int count=0,count1=0,count2=0,count3=0;
	   %>
	<table class="styled-table">
    <tr>
        <th>ID</th>
        <th>User</th>
        <th>Keyword</th>
        <th>Date</th>
    </tr>

				  
		<%
		   			  
	String s1="",s2="",s3="",s4="",s5="",s6="" ;
	int i=0;
	Statement st=null;
	  ResultSet rs=null;
	try
	{
			String sql="select * from friend_search";
			st=connection.createStatement();
			 rs=st.executeQuery(sql);
			while ( rs.next() )
			   {
			   		i=rs.getInt(1);
					s1=rs.getString(2);
					s2=rs.getString(3);
					s3=rs.getString(4);
					
			%>
			
			                     <tr>
        <td><%= i %></td>
        <td><%= s1 %></td>
        <td><%= s2 %></td>
        <td><%= s3 %></td>
    </tr>
	    <%
					 
					 
			}
					

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
			</table>
		
		<p align="right"><a href="A_Main.jsp"> Back </a></p>
		
	</div>
	
      <div class="right">
      <p>&nbsp;</p>
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
