<%@ page import="com.bean.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Action Tag</title>
</head>
<body>
	<%
		MemberBean member = new MemberBean();
	%>
	<!-- useBean 태그를 사용하지 않고 클래스를 import해서 사용 -->
	<p>아이디 : <%=member.getId() %>
	<p>이 름 : <%=member.getName() %>
</body>
</html>