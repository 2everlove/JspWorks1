<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 선언 태그 Ex</title>
</head>
<body>
	<!-- 선언문 태그(전역 변수) -->
	<%!
		int num1 = 10;
		int num2 = 20;
		String str = "ABCD";
		int avg = (num1+num2)/2;
	%>
	<!-- 스크립트릿 태크 -->
	<%	
		out.println("sum : "+ (num1+num2)+"<br>");
		out.println("avg : "+avg+"<br>");
		out.println("str : "+str+"<br>");
	%>
</body>
</html>