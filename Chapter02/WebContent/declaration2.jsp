<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 선언 태그 Ex</title>
</head>
<body>
	<!-- 선언문 태그 (전역 메서드) -->
	<%!
		//두 수의 합을 구하는 메서드
		int add(int a, int b){
			return a+b;
		}
		String sayHello(String name){
			return "Hello~ "+name;
		}
	%>
	
	<%
		out.println("두 수의 합 : "+add(5,10)+"<br>");
		out.println(sayHello("mika")+"<br>");
	%>
	
	<!-- 표현문 태그 out.println()과 같은 역할 -->
	<%="두 수의 합 : "+add(7,10)+"<br>"+sayHello("Mika")%>
</body>
</html>