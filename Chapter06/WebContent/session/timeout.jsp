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
	<h3>== 세션 유효시간 변경전 ==</h3>
	<%
		int time = session.getMaxInactiveInterval() / 60;
	
		out.println(session.getMaxInactiveInterval() + "초<br>");
		out.println("세션 유효 시간 : "+time+"분<br>");
	%>
	
	<h3>== 세션 유효시간 변경후 ==</h3>
	<%
		/* session.setMaxInactiveInterval(10*60); //600초 = 10분
		
		time = session.getMaxInactiveInterval() /60; */
		
		out.println(session.getMaxInactiveInterval() + "초<br>");
		out.println("세션 유효 시간 : "+time+"분<br>");
	%>
</body>
</html>