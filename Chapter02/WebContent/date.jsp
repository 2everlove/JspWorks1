<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Tag</title>
</head>
<body>
	<p>Today's Date : <%= new java.util.Date() %></p>
	<%
		Date date = new Date();
		/* String time = date.toLocaleString(); */
	%>
	<!-- 밑줄 의미 : 곧 사라질거같다 -->
	<%= "Today's Date : "+new Date().toLocaleString() %>
</body>
</html>