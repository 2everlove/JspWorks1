<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Action Tag</title>
</head>
<body>
	<%-- <%!
		public int calculate(int x) {
			return (x*x*x);
		}
	%> --%>
	<!-- 위 선언은 너무 복잡해서 useBean으로 java파일의 method불러옴 -->
	<h2>세제곱 계산하기</h2>
	<jsp:useBean id="calc" class="com.bean.CalcBean" scope="page" />
	<!-- calc는 new CalcBean()의 인스턴스와 같다. -->
	<%
		int num = 4;
	%>
	<p><%= num+"의 세제곱 : "+calc.calculate(num) %></p>
</body>
</html>