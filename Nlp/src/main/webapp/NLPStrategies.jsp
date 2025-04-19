<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="NLPmodel.jsp"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page session="true"%>
<%@ include file="connect.jsp"%>
<%@ page import="com.control.onnx.ONNXModelInference" %>

<%
String username = (String) session.getAttribute("user"); // Assuming username is stored in session
if (username == null) {
	response.sendRedirect("Logout.jsp"); // Redirect if session is lost
	return;
}

PreparedStatement ps = null;
ResultSet rs = null;

String sentiment = "Neutral";

int negativePostCount = 0;
try {
	ps = connection.prepareStatement("SELECT negativeCount FROM negative_post_tracker WHERE username = ?");
	ps.setString(1, username);
	rs = ps.executeQuery();
	if (rs.next()) {
		negativePostCount = rs.getInt("negativeCount");
	} else {
		// Insert new entry for the user if not found
		ps = connection.prepareStatement("INSERT INTO negative_post_tracker (username, negativeCount) VALUES (?, 0)");
		ps.setString(1, username);
		ps.executeUpdate();
	}
	 ServletContext context = request.getServletContext();
	String title = request.getParameter("title");
	String desc = request.getParameter("desc");
	//String titleSentiment = (title != null && !title.trim().isEmpty()) ? analyzeSentiment(title) : "Empty";
	//String descSentiment = (desc != null && !desc.trim().isEmpty()) ? analyzeSentiment(desc) : "Empty";
    String titleSentiment = "Empty";
    String descSentiment = "Empty";


    if (title != null && !title.trim().isEmpty()) {
        titleSentiment = ONNXModelInference.predict(context,title).equals("Real News") ? "Positive" : "Negative";
    }
    if (desc != null && !desc.trim().isEmpty()) {
        descSentiment = ONNXModelInference.predict(context,desc).equals("Real News") ? "Positive" : "Negative";
    }

	// Store sentiment as 'Negative' if either title or description is negative
if (titleSentiment.equalsIgnoreCase("Negative") || descSentiment.equalsIgnoreCase("Negative")) {
    sentiment = "Negative";  
} else if (descSentiment.equalsIgnoreCase("Positive") && (titleSentiment.equalsIgnoreCase("Neutral") || titleSentiment.equalsIgnoreCase("Empty"))) {
    sentiment = "Positive";  
} else if (titleSentiment.equalsIgnoreCase("Positive") && descSentiment.equalsIgnoreCase("Neutral")) {
    sentiment = "Neutral";  
} else if (titleSentiment.equalsIgnoreCase("Positive") && descSentiment.equalsIgnoreCase("Positive")) {
    sentiment = "Positive";  
} else {
    sentiment = "Neutral";  
}


%>
<div class="sentiment"><%=sentiment%></div>
<%
boolean isTitleNegative = titleSentiment.equalsIgnoreCase("Negative");
boolean isDescNegative = descSentiment.equalsIgnoreCase("Negative");
%>


<%
if (isTitleNegative || isDescNegative) {
	negativePostCount++;
} else {
	negativePostCount = 0; // Reset count if both are positive
}
session.setAttribute("negativeCount", negativePostCount);
ps = connection.prepareStatement("UPDATE negative_post_tracker SET negativeCount = ? WHERE username = ?");
ps.setInt(1, negativePostCount);
ps.setString(2, username);
ps.executeUpdate();

if (isTitleNegative) {
%>
<div class="warning">Warning: Your title may contain negative
	language. Consider rephrasing.</div>
<%
}
%>

<%
if (isDescNegative) {
%>
<div class="warning">Warning: Your description may contain
	negative language. Consider rephrasing.</div>
<%
}
%>

<%
if (negativePostCount >= 3) {
%>
<div class="guidance">Correction: Try adopting a more positive
	tone in your content for better engagement.</div>
<%
}

} catch (Exception e) {
    e.printStackTrace(); // Logs error in Tomcat console
%>
    <div style="color: red; font-weight: bold;">
        Error: <%= e.getMessage() %>
    </div>
<%
}
finally {
if (rs != null)
rs.close();
if (ps != null)
ps.close();
if (connection != null)
connection.close();
}
%>