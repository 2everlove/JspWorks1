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
	<p> -- 기본 로케일(Locale) --
	<fmt:setLocale value="ko"/>
	<fmt:setBundle basename="com.bundle.message"/>
	<p>제목 : <fmt:message key="title"/>
	<p>이름 : <fmt:message key="username"/>
	
	<p> -- 영어 로케일(Locale) --
	<fmt:setLocale value="en"/>
	<fmt:setBundle basename="com.bundle.message_en"/>
	<p>제목 : <fmt:message key="title"/>
	<p>이름 : <fmt:message key="username"/>
</body>
</html>