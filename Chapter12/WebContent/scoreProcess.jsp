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
	<h3>
	<c:set var="score" value="${param.score}"/>
		${score}점은 
	<c:choose>
		<c:when test="${score ge 90 and score <= 100}">
			A
		</c:when>
		<c:when test="${score>=80 && score lt 90}">
			B
		</c:when>
		<c:when test="${score>=70 and score lt 80}">
			C
		</c:when>
		<c:when test="${score >= 60 and score < 70}">
			D
		</c:when>
		<c:when test="${score >= 0 and score < 60}">
			F
		</c:when>
		<c:otherwise>
			<c:redirect url="scoreForm.jsp"></c:redirect>
		</c:otherwise>
	</c:choose>
		학점입니다.</h3>
	<p><a href="${pageContext.request.contextPath }/scoreForm.jsp">[돌아가기]</a></p>
</body>
</html>