<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Search Users</title>
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
          <li><a href="A_Logout.jsp"  class="active"><span>Admin Server</span></a></li>
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
        <h2 class="style5">Search Users</h2>

        <form action="A_UserOfDetails.jsp" method="get" class="form-group">
          <label for="username">Search User</label>
          <input type="text" name="username" class="text" placeholder="Enter username" required />
          <input type="submit" name="Submit" value="Search" />
        </form>

        <p align="right"><a href="A_Main.jsp" class="style2">Back</a></p>
      </div>
      <div class="right">
                  <p class="star">&nbsp;</p>
        <h2>Sidebar Menu</h2>
        <ul>
          <p><a href="A_Main.jsp">Home</a> </p>
                  <p><a href="A_Logout.jsp">Logout </a> </p>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="clr"></div>
  </div>
</div>
<div align=center></div>
</body>
</html>
