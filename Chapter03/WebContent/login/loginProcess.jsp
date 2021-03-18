<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="login" class="com.bean.LoginBean" scope="request" />
	<!-- 페이지<->페이지는 request, 전체 이동은 application -->
<%-- 	<jsp:setProperty property="userid" name="login"/>
	<jsp:setProperty property="userid" name="login"/> --%>
	<jsp:setProperty property="*" name="login"/><!-- *은 전체 설정 -->
	
	<%
		if(login.checkUser())
			out.println("로그인 성공!");
		else
			out.println("로그인 실패!");
	%>
	<p>아이디 : <jsp:getProperty property="userid" name="login"/>
	<p>비밀번호 : <jsp:getProperty property="psw" name="login"/>
</body>
</html>