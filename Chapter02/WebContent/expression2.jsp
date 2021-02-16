<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Tag</title>
</head>
<body>
	<h3>홀수/짝수를 판별하는 프로그램</h3>
	<%!
		int i = 20;
	%>
	<% 
		String str = "결과는 "+ (i%2==0?"짝수":"홀수")+"입니다.";
	%>
	<%= str %>
<!-- 	<script>
		const a = window.prompt();
	</script> -->
</body>
</html>