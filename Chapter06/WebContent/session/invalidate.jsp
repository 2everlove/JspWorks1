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
	<h3>== 세션을 모두 삭제 ==</h3>
	<%
	
		String id = (String)session.getAttribute("userID");
		String pw = (String)session.getAttribute("userPW");
		
		out.println("설정된 세션의 설정값(1) "+id+"<br>");
		out.println("설정된 세션의 설정값(2) "+pw+"<br>");
		
		//모든 세션 삭제
		session.invalidate();
		
		response.sendRedirect("session2.jsp");
	%>
</body>
</html>