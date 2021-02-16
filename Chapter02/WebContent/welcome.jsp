<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{box-sizing: border-box;}
	body{
		text-align: center;
	}
	h3{
		font-family: "맑은 고딕";
	}
</style>
</head>
<body>
	<%!
		String greeting = "Welcome to Shopping Mall";
		String title = "Welcome to web Market!";
	%>
	<h1><%=greeting %></h1>
	<h3><%=title %></h3>
</body>
</html>