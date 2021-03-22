<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>function 태그</title>
</head>
<body>
	<h2>문자열 분리</h2>
	<p>Hello, Java Server Page! =>
	<c:set var="text" value="${fn:split('Hello, Java Server Page!', ' ')}"></c:set>
	<p>text[0] = ${text[0]}
	<p>text[1] = ${text[1]}
	<p>문자열 개수 : ${fn:length(text)}
	<c:forEach var="i" begin="0" end="${fn:length(text)-1}">
		<p>text[${i}] = ${text[i]}
	</c:forEach>
	
	<p>문자열 연결 - 구분 기호(문자)로 연결
	<p>${fn:join(text, "-")}
		
</body>
</html>