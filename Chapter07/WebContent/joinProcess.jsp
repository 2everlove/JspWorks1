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
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
	%>
	<p>아이디 : <%=id %>
	<p>비밀번호 : <%=pwd %>
	<p>이름 : <%=name %>
	<p>연락처 : <%=phone1+"-"+phone2+"-"+phone3 %>
	
</body>
</html>