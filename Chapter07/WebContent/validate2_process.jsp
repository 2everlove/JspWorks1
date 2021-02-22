<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 폼</title>

</head>
<body>
	<%
		String id = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
	%>
	<p>아이디 : <%=id %>
	<p>비밀번호 : <%=pwd %>
	
</body>
</html>