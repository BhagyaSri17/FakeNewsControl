<%@page import="edu.stanford.nlp.pipeline.StanfordCoreNLP"%>
<%@page import="edu.stanford.nlp.pipeline.CoreSentence"%>
<%@page import="edu.stanford.nlp.pipeline.CoreDocument"%>
<%@page import="edu.stanford.nlp.sentiment.SentimentModel"%>
<%@ include file="connect.jsp" %>
<%@ page import="opennlp.tools.sentdetect.SentenceDetectorME" %>
<%@ page import="opennlp.tools.sentdetect.SentenceModel" %>
<%@ page import="opennlp.tools.tokenize.TokenizerME" %>
<%@ page import="opennlp.tools.tokenize.TokenizerModel" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ include file="NLPmodel.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Server Main</title>
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
       <h2>Control Mechanism for Managing Information Spread in Online Social Networks</h2>
         </div>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
  <style type="text/css">
  .analytics-dashboard {
      background: #fff;
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }
  
  .stat-container {
      display: flex;
      justify-content: space-between;
      margin: 15px 0;
  }
  
  .stat-box {
      flex: 1;
      margin: 0 10px;
      padding: 15px;
      border-radius: 6px;
      text-align: center;
      color: white;
  }
  
  .stat-box h3 { margin: 0 0 10px 0; }
  .stat-box p { margin: 5px 0; }
  .positive { background: #4CAF50; }
  .negative { background: #f44336; }
  .neutral { background: #2196F3; }
  
  .recent-alerts {
      margin-top: 15px;
      padding: 10px;
      background: #b2f1ff;
      border-radius: 6px;
  }
  </style>
  <div align=center></div>      <div class="body">

    <div class="body_resize">
      <div class="left">
        <h2 align="justify">&nbsp;</h2>
                
    <%String server=(String)session.getAttribute("server");
if (server == null) {
    response.sendRedirect("A_Logout.jsp"); // Redirect if session is lost
}%>
        <h2>Welcome to <%=server%></h2>
        
        <div class="analytics-dashboard">
            <h2>Content Analysis Dashboard</h2>
             <%
             ResultSet rs=null;
             PreparedStatement stmt=null;
                try {
                    // Load OpenNLP Sentiment Model
String query = "SELECT COUNT(*) AS total, " +
               "SUM(CASE WHEN sentiment = 'Positive' THEN 1 ELSE 0 END) AS positive, " +
               "SUM(CASE WHEN sentiment = 'Negative' THEN 1 ELSE 0 END) AS negative, " +
               "SUM(CASE WHEN sentiment = 'Neutral' THEN 1 ELSE 0 END) AS neutral " +
               "FROM tweets";

stmt = connection.prepareStatement(query);
rs = stmt.executeQuery();

int total = 0, positive = 0, negative = 0, neutral = 0;
if (rs.next()) {
    total = rs.getInt("total");
    positive = rs.getInt("positive");
    negative = rs.getInt("negative");
    neutral = rs.getInt("neutral");
}
            %>
            
                        <div class="stat-container">
                            <div class="stat-box positive">
                                <h3>Positive Content</h3>
                                <p><%=positive%> tweets</p>
                                <p><%=String.format("%.1f", (positive * 100.0 / total))%>%</p>
                            </div>
                            
                            <div class="stat-box negative">
                                <h3>Negative Content</h3>
                                <p><%=negative%> tweets</p>
                                <p><%=String.format("%.1f", (negative * 100.0 / total))%>%</p>
                            </div>
                            
                            <div class="stat-box neutral">
                                <h3>Neutral Content</h3>
                                <p><%=neutral%> tweets</p>
                                <p><%=String.format("%.1f", (neutral * 100.0 / total))%>%</p>
                            </div>
                        </div>
           
        </div>
         <div class="recent-alerts">
            <h3  >Recent Alerts</h3>
            <%
                String alertQuery =  "SELECT * FROM tweets ORDER BY STR_TO_DATE(date, '%d/%m/%Y %H:%i:%s') DESC LIMIT 3;";
            

                rs = stmt.executeQuery(alertQuery);
                while(rs.next()) {
               
                
            %>
                 <div style="margin: 10px 0; padding: 8px; background: #fff; border-left: 3px solid #00A8CC;">
                    <small style="color: #666;"><%=rs.getString("tweeter")%></small>
                    <p style="margin: 5px 0;"><%=rs.getString("tname")%></p>
                          
                </div> 
            <%
                }
            %>
        </div>
         <%
                    rs.close();
                    stmt.close();
            %>
        <%
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            		
        %>
             <p class="star">&nbsp;</p>
      </div>
   
           <h2 align="justify">&nbsp;</h2>
      <div class="right">
           

      
        <h2>Server Menu</h2>
        <ul>
         <div class="gadget">
                  <p><a href="A_AllUsers.jsp">View Users and Authorize </a> </p>
                  <p><a href="A_AllFrdReqResp.jsp">Friends Requests & Responses </a> </p>
				  <p><a href="A_ViewTweets.jsp">View All Tweets Details</a> </p>
                  <p><a href="A_PossitiveFilter.jsp">View Positive Retweets </a>   </p>
                  <p><a href="A_NegativeFilter.jsp">View Negative Retweets  </a></p>
                  <p><a href="A_SearchUsers.jsp">Block Users</a></p>
                  <p><a href="A_AllSearchHist.jsp">Search History</a> </p>
				  <p><a href="A_Results.jsp">Graph Analysis</a> </p>
                  <p><a href="A_Logout.jsp">Logout</a></p>
                  <p>&nbsp; </p>
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