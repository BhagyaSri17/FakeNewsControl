<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if (session != null) {
        session.invalidate(); // Destroys the session
    }
    response.sendRedirect("U_Login.jsp"); // Redirect to login page
%>
