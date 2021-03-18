<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>

<body>
	<nav id="navbar">
	<c:choose>
		<c:when test="${empty sessionId}">
		<ul>
			<li><a href="main.jsp">Home</a></li>
			<li><a href="memberForm.do">회원 가입</a></li>
			<li><a href="boardList.jsp">게시판</a></li>
			<li><a href="loginForm.do">로그인</a></li>
		</ul>
		</c:when>
		<c:otherwise>
		<ul>
			<li><a href="main.jsp">Home</a></li>
			<li><a href="memberView.do">회원 수정</a></li>
			<li><a href="boardList.jsp">게시판</a></li>
			<li><a href="logout.do">로그아웃 [<span style="color: blue;">${sessionId}</span>님]</a></li>
		</ul>
		</c:otherwise>
	</c:choose>
	</nav>
</body>
</html>