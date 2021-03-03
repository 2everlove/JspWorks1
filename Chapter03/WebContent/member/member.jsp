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
	<h2></h2>
	<jsp:useBean id="member" class="com.beans.MemberBean" scope="request" />
	<%-- <p><%= "이름 : "+ member.getName()+"<br>사원번호 : "+member.getId() %></p> --%>
	<p>아이디 : <%=member.getId() %>
	<p>이 름 : <%=member.getName() %>
</body>
</html>