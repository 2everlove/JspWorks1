<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>functions 태그</title>
</head>
<body>
	<p>문자열 검색
	<p>Hello, Java Server Page = > ${fn:contains("Hello, Java Server Page", "java")}
	<!-- contains() 대소문자 구분함 -->
	<p>Hello, Java Server Page = > ${fn:containsIgnoreCase("Hello, Java Server Page", "java")}
	<!-- containsIgnoreCase() 대소문자 구분하지 않음 -->
</body>
</html>