<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Add Tweets</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
    <div class="clr"></div>
  </div>
  <div class="body">
    <div class="body_resize">
      <div class="left">
       <h2> Adding Tweets</h2>
       <p><img src="images/user1.jpg" width="205" height="124" /></p>

<div class="tweet-card">
    <form name="s" action="U_AddTweetsIns.jsp" method="post" enctype="multipart/form-data" target="_top" 
          onsubmit="return checkSentiment(event)">
    <input type="hidden" id="sentiment" name="sentiment" value="neutral">

        <div class="form-group">
            <label for="name">Title</label>
            <input type="text" id="name" name="tname" class="text" required />
        </div>

        <div class="form-group">
            <label for="pic">Image</label>
            <input type="file" id="pic" name="pic" class="text" accept="image/*" required />
        </div>

        <div id="warningMessage" class="warning-message"></div>
        <div id="guidanceMessage" class="guidance-message"></div>

        <div class="form-group">
            <label for="desc">Description</label>
            <textarea id="desc" name="desc" rows="3" class="text"></textarea>
        </div>

        <div class="form-actions">
            <input name="submitbutton" type="submit" value="Post"  style="width:auto" class="submit-btn" />
        </div>
    </form>
</div>

    <p align="right">
        <a href="U_Main.jsp" class="style4">Back</a>
    </p>

<script>
let warningShown = false;
let submitConfirmed = false;

function checkSentiment(event) {
    event.preventDefault(); // Prevent immediate form submission

    var tweetTitle = document.getElementById("name").value.trim();
    var tweetContent = document.getElementById("desc").value.trim();
    var sentimentInput = document.getElementById("sentiment");
    // Second click condition for submission after warning
    if (warningShown && submitConfirmed) {
        document.forms["s"].submit();
        return true;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "NLPStrategies.jsp", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Clear previous messages
            document.getElementById("warningMessage").innerHTML = "";
            document.getElementById("guidanceMessage").innerHTML = "";

            const parser = new DOMParser();
            const responseHTML = parser.parseFromString(xhr.responseText, "text/html");

            const warningDiv = responseHTML.querySelector(".warning");
            const guidanceDiv = responseHTML.querySelector(".guidance");
            const sentimentDiv = responseHTML.querySelector(".sentiment"); 
            const submitButton = document.querySelector("input[name='submitbutton']");
            if (sentimentDiv) {
                sentimentInput.value = sentimentDiv.innerHTML.trim(); // Store sentiment
            }
            if (guidanceDiv) {
                document.getElementById("guidanceMessage").innerHTML = guidanceDiv.innerHTML;
                warningShown = false; // Clear warning state if guidance is shown
               
                submitConfirmed = false;
                return false; // Prevents immediate submission when guidance is shown
            }

            if (warningDiv) {
                document.getElementById("warningMessage").innerHTML = warningDiv.innerHTML;
                warningShown = true;
                submitButton.value = "Submit Even Warning"; // Change button text
                submitConfirmed = true;
                return false; // Prevents first attempt submission
            } else {
                // No warning or guidance, submit immediately
                document.forms["s"].submit();
            }
        }
    };

    if (tweetTitle && tweetContent) {
        xhr.send("title=" + encodeURIComponent(tweetTitle) + "&desc=" + encodeURIComponent(tweetContent));
    } else {
        console.error("Error: Title or Content is missing.");
    }
 
  
    return false; // Prevents automatic submission until confirmation
}

</script>



      </div>
      <div class="right">
                  <h2 align="justify">&nbsp;</h2>
      
        <h2>Sidebar Menu</h2>
        <ul>
          <li><a href="U_Main.jsp">Home</a></li>
           <li><a href="Logout.jsp">Logout </a></li>
          <li></li>
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
