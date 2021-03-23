<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
<jsp:useBean id="member" class="com.jweb.member.Member"/>
<jsp:setProperty property="name" name="member"/>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO2" scope="application"/>
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
			<!-- 자바코드 -->
			<% if(msg!=null){
				 if(msg.equals("0")) { 
					out.println("<h1>["+name+"]님의 정보가 수정되었습니다.</h1><a href='memberList.jsp' autofocus style='text-decoration: none;'>[회원목록]</a>");
				 } else if(msg.equals("1")) { 
					 out.println("<h1>회원 가입을 축하합니다.</h1><a href='memberList.jsp' autofocus style='text-decoration: none;'>[회원목록]</a>");
				} else if(msg.equals("2")) { 
					out.println("<h1>"+name+"님 환영합니다.</h1><a href='memberList.jsp' autofocus style='text-decoration: none;'>[회원목록]</a>");
				 }} else { %>
					<h1 class="msg">삭제되었습니다.</h1>
			<%   } %>
			
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>