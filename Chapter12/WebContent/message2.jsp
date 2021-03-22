<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다국어 처리</title>
</head>
<body>
	<h2>Java server Page</h2>
	<fmt:setLocale value="${param.language}"/>
	<fmt:setBundle basename="com.bundle.message"/>
	
	<a href="?language=ko">한국어</a> | <a href="?language=en">English</a> | <a href="?language=jp">日本語</a>
	<p><fmt:message key="title"/>
	<p><fmt:message key="username"/>
</body>
</html>