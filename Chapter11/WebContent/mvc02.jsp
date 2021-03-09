<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MVC 예제</title>
<!-- http://localhost:8081/Chapter11/mvc02.jsp?num=2 테스트 할 때 -->
</head>
<body>
	<!-- 모델 model - 데이터 -->
	<p><%=request.getAttribute("result") %> 입니다.</p>
	<p>${result}</p>
</body>
</html>