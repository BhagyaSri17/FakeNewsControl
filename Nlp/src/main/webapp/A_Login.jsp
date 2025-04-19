<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin server Login...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">

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
        <h2 align="justify">&nbsp;</h2>
		
		<h2>Welcome to Server Login        </h2>
		
		<form class="login-form" id="form1" name="form1" method="post" action="authentication.jsp?type=<%="server"%>">
          <div class="form-group">
            <label for="name">User Name</label>
            <input id="name" name="userid" class="text" required />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="pass" class="text" required />
        </div>
        <div class="button-group">
            <input name="imageField" type="submit" class="button" id="imageField" value="Login" />
            <input name="Reset" type="reset" class="button" value="Reset" />
  
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
      </div>
      <div class="clr"></div>
    </div>
  </div>

</div>
<div align=center></div></body>
</html>
