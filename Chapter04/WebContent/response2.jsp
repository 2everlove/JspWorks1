<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Response</title>
</head>
<body>
	<p>이 페이지는 5초 마다 새로고침 됩니다.</p>
	<%
		request.setCharacterEncoding("utf-8");
	
		response.setIntHeader("Refresh", 5);
	%>
	<%=Calendar.getInstance().getTime() %>
</body>
</html>