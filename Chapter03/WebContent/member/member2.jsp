<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Action Tag</title>
</head>
<body>
	<h2>다른 방법 (major)</h2>
	<jsp:useBean id="member" class="com.beans.MemberBean" scope="request" />
	<%-- <jsp:setProperty property="id" name="member"/>
	<jsp:setProperty property="name" name="member"/> --%>
	<!-- 변수 전체가 아래처럼 다 나오면 생략가능 -->
	
	<p>아이디 : <jsp:getProperty property="id" name="member"/>
	<p>이 름 : <jsp:getProperty property="name" name="member"/>
</body>
</html>