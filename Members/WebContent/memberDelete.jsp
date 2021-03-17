<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>
<%
	
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String) session.getAttribute("sessionId");
		String memId = request.getParameter("memberId");
		memDAO.deleteMember(memId);
		response.sendRedirect("logout.jsp?msg=0");
	} else {
		out.println("<script>");
		out.println("alert('로그인을 해주세요.')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
%>
</head>
<body>

</body>
</html>