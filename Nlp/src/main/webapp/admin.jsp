<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All tweets</title>
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
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1"></a></h1>
      </div>
      <div class="menu">
        <ul>
          <li><a href="index.html" class="active"><span>Home</span></a></li>
          <li><a href="Logout.jsp"><span>OSN User</span></a></li>
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
            <div class="cleaner_h40">
			 <table width="595" height="132" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
					<tr>
					  <td  width="107" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong>Tweet Image </strong></div></td>
					  <td  width="105" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><b>Tweeter Name</b></div></td>
					  <td  width="105" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><b>Tweet Name</b></div></td>
  					
					  <td   width="139" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong>Description</strong></div></td>
					  <td  width="114" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Date</strong></div></td>
					  <td  width="114" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong>Rank</strong></div></td>
					</tr>
					
					<%
String s1,s2,s3,s4,s6,s7,s8,s9;
int i=0;
Statement st=null;
ResultSet rs=null;
try 
{
	String query="select * from tweets"; 
	st=connection.createStatement();
	 rs=st.executeQuery(query);
	while ( rs.next() )
	{
		i=rs.getInt(1);
		s1=rs.getString(2);
		s2=rs.getString(3);
		s3=rs.getString(5);
        s4=rs.getString(6);
		int s5=rs.getInt(7);
		//s6=rs.getString(8);
		//s7=rs.getString(9);
		//s8=rs.getString(8);%>
					
							<tr>
						
							<td width="107" ><input  name="image" type="image" style="width:100px; height:100px;" src="profile_pic.jsp?id=<%=i%>&type=<%="server"%>"  /></td>
							  <td  width="105" valign="baseline" height="110" style="color:#000000;">
							    <div align="center">
							      <%out.println(s1);%>
					          </div></td>	
								<td  width="139" valign="baseline" height="110">
							  
						          <div align="center">
						            <%out.println(s2);%>
			                      </div></td>
								<td  width="114" valign="baseline"><div align="center">
                                  <%out.println(s3);%>
                                </div></td>
								<td  width="114" valign="baseline" height="110">
							      <div align="center">
							        <%out.println(s4);%>	
					          </div></td>
							  <td  width="114" valign="baseline" height="110">
							      <div align="center">
							        <%out.println(s5);%>	
					          </div></td>
					</tr>
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
		</table>
            
            <p align="right">&nbsp;</p>
			<p align="right"><a href="A_Main.jsp" class="style2">Back</a></p>
			
	</div>
	  </div>
      <div class="right">
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
