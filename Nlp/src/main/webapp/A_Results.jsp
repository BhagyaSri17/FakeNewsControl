<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>All tweets Results </title>
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
          <p>&nbsp;</p>
		<h3>Graph Analysis </h3>
      
     <!-- Line Graph: Negative Tweets Over Time -->
    <div>
        <h3>Negative Tweets Over Time</h3>
        <iframe src="graphs/LineGraph.jsp" width="100%" height="400px" style="border: none;"></iframe>
    </div>

    <!-- Stacked Bar Graph: Positive vs. Negative Tweets and Retweets -->
    <div>
        <h3>Positive vs. Negative Tweets and Retweets</h3>
        <iframe src="graphs/StackedBarGraph.jsp" width="100%" height="400px" style="border: none;"></iframe>
    </div>

    <!-- User-Based Bar Graph: Top Negative Posters -->
    <div>
        <h3>Top Users with Negative Tweets</h3>
        <iframe src="graphs/UserBarGraph.jsp" width="100%" height="400px" style="border: none;"></iframe>
    </div>
            
             <p align="right" class="style2"><a href="A_Main.jsp">Back</a></p>
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
