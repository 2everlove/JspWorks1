<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%
	String message = (String)request.getAttribute("msg");
	out.println("<p>"+message+"</p>");
%>
	<p>${msg}</p>
	<p>${name[0]}</p>
</body>
</html>