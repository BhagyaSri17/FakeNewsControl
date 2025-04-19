<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Home Page</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 16px}
.style4 {
	font-size: 18px;
	font-family: "Times New Roman", Times, serif;
	font-weight: bold;
}
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
        <h2 class="style5"> Welcome to Registration Form</h2>
		
		 <form action="U_RegIns.jsp" method="post" name="s" enctype="multipart/form-data" onSubmit="return valid()"  ons target="_top">
            <div class="form-group">
        <label for="name">User Name</label>
        <input id="name" name="userid" class="text" required />
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="pass" class="text" required />
    </div>

    <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" class="text" required />
    </div>

    <div class="form-group">
        <label for="mobile">Mobile Number</label>
        <input type="tel" id="mobile" name="mobile" class="text" pattern="\d{10}" required />
    </div>

    <div class="form-group">
        <label for="dob">Date of Birth</label>
        <input id="dob" name="dob" type="date" class="text" required />
    </div>

    <div class="form-group">
        <label for="gender">Gender</label>
        <select id="s1" name="gender" class="text" required>
            <option value="">Select</option>
            <option value="MALE">MALE</option>
            <option value="FEMALE">FEMALE</option>
        </select>
    </div>

    <div class="form-group">
        <label for="address">Address</label>
        <textarea id="address" name="address" rows="3" class="text"></textarea>
    </div>

    <div class="form-group">
        <label for="pincode">Enter Pincode</label>
        <input id="pincode" name="pincode" class="text" required />
    </div>

    <div class="form-group">
        <label for="network">Network</label>
        <select id="s2" name="network" class="text" required>
            <option value="">Select</option>
            <option value="FACEBOOK">FACEBOOK</option>
            <option value="TWITTER">TWITTER</option>
        </select>
    </div>

    <div class="form-group">
        <label for="pic">Profile Picture</label>
        <input type="file" id="pic" name="pic" class="text" required />
    
        
    </div>

    <div class="button-group">
        <input name="submit" type="submit" value="REGISTER" />
         <div class="new-user">
        <a href="U_Login.jsp" >Back to Login</a>
        </div>
    </div>
        </form>
		
      </div>
      <div class="right">
             <h2 align="justify">&nbsp;</h2>
        <h2>Sidebar Menu</h2>
        <ul>
          <li><a href="index.html">Home</a></li>
               <li><a href="U_Login.jsp">OSN User </a></li>
          <li><a href="A_Login.jsp">Admin Server </a></li>
     
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
