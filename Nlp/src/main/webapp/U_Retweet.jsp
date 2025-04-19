
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Retweet Tweet</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script>
let warningShown = false;
let submitConfirmed = false;

function checkRetweetSentiment(event) {
    event.preventDefault();
    var retweetContent = document.getElementById("tcomment").value.trim();
    var sentimentInput = document.getElementById("sentiment");
    if (warningShown && submitConfirmed) {
        document.forms["form1"].submit();
        return true;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "NLPStrategies.jsp", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("warningMessage").innerHTML = "";
            document.getElementById("guidanceMessage").innerHTML = "";

            const parser = new DOMParser();
            const responseHTML = parser.parseFromString(xhr.responseText, "text/html");
            const warningDiv = responseHTML.querySelector(".warning");
            const guidanceDiv = responseHTML.querySelector(".guidance");
            const sentimentDiv = responseHTML.querySelector(".sentiment"); 
            const submitButton = document.querySelector("input[name='Submit']");
            if (sentimentDiv) {
                sentimentInput.value = sentimentDiv.innerHTML.trim(); // Store sentiment
            }
            if (guidanceDiv) {
                document.getElementById("guidanceMessage").innerHTML = guidanceDiv.innerHTML;
                warningShown = false;
                submitConfirmed = false;
                return false;
            }

            if (warningDiv) {
                document.getElementById("warningMessage").innerHTML = warningDiv.innerHTML;
                warningShown = true;
                submitButton.value = "Submit Even Warning";
                submitConfirmed = true;
                return false;
            } else {
                document.forms["form1"].submit();
            }
        }
    };
    xhr.send("desc=" + encodeURIComponent(retweetContent));
    return false;
}
</script>
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
       <h2>Control Mechanism for Managing Information Spread in Online Social Networks</h2>
         </div>
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="body">
    <div class="body_resize">
      <div class="left">
        <div id="templatemo_content">
          <div class="left">
            <h2>Retweet Tweet</h2>
            <div class="cleaner_h40">
              <div class="tweet-container">
                <%
                String tname = request.getParameter("tname");
                String t_user = request.getParameter("t_user");
                String t_des = request.getParameter("t_des");
                session.setAttribute("tname", tname);
                session.setAttribute("t_user", t_user);
               session.setAttribute("t_desc", t_des);
                %>
                
                <!-- Original Tweet -->
                <div style="margin-bottom: 20px;">
                    <h3>Tweet</h3>
                    <p><strong><%=t_user%></strong></p>
                    <p><%=t_des%></p>
                </div>

<div class="retweet-list">
    <h4>Recent Retweets</h4>
    <%@ include file="connect.jsp" %>
    <%
    PreparedStatement pst=null;
    ResultSet rs=null;
    try {
    	  if (connection != null) {
        String retweetQuery = "SELECT * FROM retweets WHERE tname=? AND t_user=? ORDER BY date DESC";
        pst = connection.prepareStatement(retweetQuery);
        pst.setString(1, tname);
        pst.setString(2, t_user);
       rs = pst.executeQuery();
        
        boolean hasRetweets = false;
        while(rs.next()) {
            hasRetweets = true;
            %>
            <div style="border-bottom: 1px solid #eee; padding: 10px 0;">
                <p><strong>Retweeted by: <%=rs.getString("r_user")%></strong>
                <span style="color: #666; font-size: 12px;"> - <%=rs.getString("date")%></span></p>
                <p style="margin-top: 5px;"><%=rs.getString("r_tweet")%></p>
            </div>
            <%
        }
        if(!hasRetweets) {
            %>
            <p style="color: #666; text-align: center;">No retweets yet</p>
            <%
        } }else {
            out.println("<p style='color: red;'>Database connection is not established.</p>");
        }
    } catch(Exception e) {
        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
    }finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</div>

                <!-- Retweet Form -->
               <div style="margin-top: 20px;">
    <form id="form1" name="form1" method="post" action="U_RetweetIns.jsp" 
    onsubmit="return checkRetweetSentiment(event)">
        <input type="hidden" id="sentiment" name="sentiment" value="neutral">
    
        <div class="form-group">
            <label for="tcomment"><strong>Add your comment</strong></label>
            <textarea id="tcomment" name="tcomment" rows="3" class="text"></textarea>
        </div>
<div id="warningMessage" style="color:red;"></div>
              <div id="guidanceMessage" style="color:blue;"></div>
        <div class="form-actions">
            <input type="submit" name="Submit" value="Retweet" style="width:auto;" class="submit-btn" />
        </div>
    </form>
</div>

           
            </div>
            
          </div>
        </div>
      </div> <p align="right"><a href="U_Main.jsp" class="style2">Back</a></p>
      </div>
        
      <div class="right">
                  <h2 align="justify">&nbsp;</h2>
      
        <h2>Sidebar Menu</h2>
        <ul>
          <li><a href="U_Main.jsp">Home</a></li>
          <li><a href="Logout.jsp">Logout </a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>