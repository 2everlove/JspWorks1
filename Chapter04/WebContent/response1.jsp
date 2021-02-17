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
	<h2>response 객체</h2>
	<%
		response.sendRedirect("http://www.naver.com");
		response.sendRedirect("request1.jsp");
	%>
	<!-- 내외부 문서 모두 강제 이동 시킴 -->
</body>
</html>