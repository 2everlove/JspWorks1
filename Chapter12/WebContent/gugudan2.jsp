<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>gugudan</title>
<style type="text/css">
	*{text-align: center;}
	table{width: 700px; margin: 0 auto;}
	table,td{border: 1px solid black; border-collapse: collapse;}
</style>
</head>
<body>
	<h2>구구단</h2>
	<table>
		<c:forEach var="i" begin="0" end="9" step="1" >
		
		<tr>
			<c:forEach var="j" begin="2" end="9" step="1">
				<c:if test="${i==0}"><td>${j}단</td></c:if>
				<c:if test="${i>0}"><td>${j}x${i}=${i*j}</td></c:if>
			</c:forEach>
		</tr>
		
		</c:forEach>
	</table>
</body>
</html>