<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>core 예제</title>
<style type="text/css">
	*{text-align: center;}
</style>
</head>
<body>
	<!-- 변수 설정 -->
	<c:set var="num" value="${param.nubmer}"/>
	<c:if test="${num%2 == 0}"> 
		${num}은 짝수입니다.
	</c:if>
	<c:if test="${num%2 != 0}"> 
		${num}은 홀수입니다.
	</c:if>
	<p><a href="${pageContext.request.contextPath }/core02.jsp">[돌아가기]</a></p>
</body>
</html>