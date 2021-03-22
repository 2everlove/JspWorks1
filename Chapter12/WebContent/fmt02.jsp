<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- el언어는 jstl-1.2.jar라는 파일이 web-inf>lib>에 포함되어야함 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>format 태그</title>
</head>
<jsp:useBean id="now" class="java.util.Date"/>
<body>
	<h2>날짜를 다양한 형식으로 표기하기</h2>
	<p>현재 날짜 및 시간 : ${now}
	<p>날짜 : <fmt:formatDate value="${now}" type="date"/>
	<p>시간 : <fmt:formatDate value="${now}" type="time"/>
	<p>날짜 : <fmt:formatDate value="${now}" pattern="yyyy/MM/dd"/>
	<p>날짜 및 시간 : <fmt:formatDate value="${now}" pattern="yyyy/MM/dd a hh:mm:ss"/>
	
	<p>==타임존 출력 == </p>
	<p><fmt:timeZone value="Europe/London">
		런던 : <fmt:formatDate value="${now}" type="both"/>
	</fmt:timeZone>
	<p><fmt:timeZone value="America/New_York">
		뉴욕 : <fmt:formatDate value="${now}" type="both"/>
	</fmt:timeZone>
</body>
</html>