<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	*{box-sizing: border-box;}
	#container{
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="container">
		<h2>계산하기</h2>
		<hr>
		<%
			//세션 유지
			ArrayList<String> cartList = (ArrayList)session.getAttribute("cartList");
			
			//상품 목록 출력
			for(String cart : cartList)
				out.println(cart + "<br>");
		%>
	</div>
	<p><input type="submit" value="처음으로" onclick="location.href='loginForm.jsp'">
</body>
</html>