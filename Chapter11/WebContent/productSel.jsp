<%@page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<style type="text/css">
	#container{width: 100%; margin: 0 auto; text-align: center;}
</style>
<jsp:useBean id="product" class="com.bean.Product"/>
</head>
<body>
	<div id="container">
		<h2>상품 목록</h2>
		<hr>
		<p> 1.선택한 상품은 : ${param.select} <!-- param은 다른 페이지에서 받는 명령어(request) -->
		<p> 2. num1+num2 : ${product.num1} + ${product.num2} <!-- 할당된 key값으로 부르려면 useBean 써야함 -->
	</div>
	
</body>
</html>