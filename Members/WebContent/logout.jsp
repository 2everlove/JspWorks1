<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<%
	out.println("<script>");
	out.println("alert('["+(String)session.getAttribute("sessionId")+"]님 로그아웃 되었습니다.')");
	out.println("location.href='main.jsp'");
	out.println("</script>");
	session.invalidate(); //세션해제
%>
</head>
<body>

</body>
</html>