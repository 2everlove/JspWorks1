<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MVC 예제</title>
</head>
<%
	pageContext.setAttribute("fruit", "사과");
%>
<body>
	<p>${lotto[0]},${lotto[1]},${lotto[2]}</p>
	<p>${empty param.num ? '값이 비어있습니다.' : param.num}</p>
	
	<p>차이름 : ${car.brand}<br>CC: ${car.cc}<br>${car}</p>
	<p>${fruit }</p>
	<p>${header.accept } <!-- 헤더 정보 -->
</body>
</html>