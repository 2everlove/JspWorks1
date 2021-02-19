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
	<h3>== 세션을 삭제하기 전 ==</h3>
	<%
		String id = (String)session.getAttribute("userID");
		String pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션의 설정값(1) "+id+"<br>");
		out.println("설정된 세션의 설정값(2) "+pw+"<br>");
		
		//특정 세션 삭제
		session.removeAttribute("userID");
	%>
	<h3>== 세션을 삭제한 후 ==</h3>
	<%
		id = (String)session.getAttribute("userID");
		pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션의 설정값(1) "+id+"<br>");
		out.println("설정된 세션의 설정값(2) "+pw+"<br>");
	%>
	
	<a href="session2.jsp">이전화면</a>
	
</body>
</html>