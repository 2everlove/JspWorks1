<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:useBean id="memDAO" class="com.jweb.MemberDAO" scope="application"/>
<%
	String memId = request.getParameter("memberId");
	memDAO.deleteMember(memId);
	response.sendRedirect("memberList.jsp");
%>
</head>
<body>

</body>
</html>