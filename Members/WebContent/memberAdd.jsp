<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<jsp:useBean id="member" class="com.jweb.Member"/>
<!-- Member member = new Member(); -->
<jsp:setProperty property="memberId" name="member"/>
<jsp:setProperty property="passwd" name="member"/>
<jsp:setProperty property="name" name="member"/>
<jsp:setProperty property="gender" name="member"/>

<jsp:useBean id="memDAO" class="com.jweb.MemberDAO" scope="application"/>
<%
	memDAO.addMember(member);
	response.sendRedirect("memberList.jsp");
%>
<body>

</body>
</html>