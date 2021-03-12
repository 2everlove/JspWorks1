<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>

<%
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String) session.getAttribute("sessionId");
	}
%>
<body>
	<nav>
	<%
		if(sessionId==null){
	%>
		<ul>
			<li><a href="main.jsp">Home</a></li>
			<li><a href="loginForm.jsp">로그인</a></li>
			<li><a href="memberForm.jsp">회원 가입</a></li>
			<li><a href="boardList.jsp">게시판</a></li>
		</ul>
	<% } else { %> <!-- (sessionId !=) 로그인 되었다면 -->
		<ul>
			<li><a href="main.jsp">Home</a></li>
			<li><a href="logout.jsp">로그아웃</a></li>
			<li><a href="memberList.jsp">회원 목록</a></li>
			<li><a href="boardList.jsp">게시판</a></li>
		</ul>
	<%	} %>
	</nav>
</body>
</html>