<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Action Tag</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
	%>
	<h3><%=URLDecoder.decode(title) %></h3>
	<p>오늘의 날씨 : <%=request.getParameter("date") %></p>
	
</body>
</html>