<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
<jsp:useBean id="member" class="com.jweb.member.Member"/>
<jsp:setProperty property="name" name="member"/>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>
<%
	
	String sessionId = null;
	if(session.getAttribute("sessionId")!=null){
		sessionId = (String) session.getAttribute("sessionId");
	}
	String name = memDAO.getLoginNameById(sessionId);
	
	//msg 받기
	String msg = request.getParameter("msg");
	/* int msg = Integer.parseInt(request.getParameter("msg")); */
%>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>회원정보</h1>
		</div>
		<div class="msg">
			<c:choose>
				<c:when test="${msg eq 'join}">
					<h1>회원 가입을 축하합니다.</h1>
				</c:when>
			</c:choose>
			
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>