
    <%@page import="java.awt.Checkbox"%>
<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="package1.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<script type="text/javascript">
	        function preventBack() { window.history.forward(); }
			      	 setTimeout("preventBack()", 0);
			      	 window.onunload = function () { null };
		 </script> 
</head>
	<body style="background-color: #f2e9e4 ; color: #262626">

<%
			String search=request.getParameter("search_id");
			session.setAttribute("search", search);
			Cookie CK=new Cookie("search",String.valueOf(search));
			response.addCookie(CK);
			RequestDispatcher rd=request.getRequestDispatcher("/searchpage.jsp");
			rd.forward(request, response);
%>

</body>
</html>