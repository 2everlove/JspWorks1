<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>session</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("userID");
		String pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션의 설정값(1) "+id+"<br>");
		out.println("설정된 세션의 설정값(2) "+pw+"<br>");
	%>
	<p><a href="session3.jsp">세션 삭제</a>
	<p><a href="invalidate.jsp">로그아웃</a>
</body>
</html>