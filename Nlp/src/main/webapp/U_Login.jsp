<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Login</title>
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
       <h2 align="justify">&nbsp;</h2>
        <h2> Welcome to User Login        </h2>
		   <%
            String unauthorizedMessage = request.getParameter("unauthorized");
            String blockedMessage = request.getParameter("blocked");
            String invalidMessage = request.getParameter("invalid");

            if ("true".equals(unauthorizedMessage)) {
        %>
            <p align="center" class="style3">You are not authorized by the admin. Please wait for authorization.</p>
        <%
            } else if ("true".equals(blockedMessage)) {
        %>
<p align="center" class="style3">
    Your account is <b>Blocked</b>.<br>
    Please contact the admin at <b style="color:#00A8CC;">addmin.controller@gmail.com</b>.
</p>
        <%
            } else if ("true".equals(invalidMessage)) {
        %>
            <p align="center" class="style3">Invalid credentials. Please check your username and password.</p>
        <%
            }
        %>
		<form id="form1" name="form1" method="post" action="authentication.jsp?type=<%="user"%>">
        
<div class="form-group">
    <label for="name">User Name</label>
    <input id="name" name="userid" class="text" required />
</div>

<div class="form-group">
    <label for="password">Password</label>
    <input type="password" id="password" name="pass" class="text" required />
</div>


    <div class="button-group">
        <input type="submit" class="button" value="Login" />
        <input type="reset" class="button" value="Reset" />
    </div>

    <div class="new-user">
        New user? <a href="U_Register.jsp">Register</a>
    </div>
        </form>
		
      </div>
      <div class="right">
             <h2 align="justify">&nbsp;</h2>
        <h2>Sidebar Menu</h2>
        <ul>
          <li><a href="index.html">Home</a></li>
           <li><a href="Logout.jsp">OSN User </a></li>
          <li><a href="A_Logout.jsp">Admin Server </a></li>
         
          <li></li>
        </ul>
        <ul class="sponsors">
          <li class="sponsors"></li>
        </ul>
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
