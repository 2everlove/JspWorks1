<%@page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<style type="text/css">
	#container{width: 100%; margin: 0 auto; text-align: center;}
</style>
</head>
<jsp:useBean id="product" class="com.bean.Product"/>
<body>
	<div id="container">
		<h2>상품 목록</h2>
		<hr>
		<form action="productSel.jsp" method="get">
			<select name="select">
			
				<%-- <%
				/* Product product = new Product(); */
				for(String item : product.getList()) {
					out.println("<option>"+item+"</option>");
				}
				%> --%>
				<c:forEach var="product" items="${product.list}">
					<option>${product}</option>
				</c:forEach>
			</select>
			<input type="submit" value="선택">
		</form>
	</div>
	
</body>
</html>