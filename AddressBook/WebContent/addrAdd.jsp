<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href=css/address.css>
</head>
<body>
	<jsp:useBean id="addrBook" class="com.dao.AddrBook"/>
	<jsp:setProperty property="username" name="addrBook"/>
	<jsp:setProperty property="tel" name="addrBook"/>
	<jsp:setProperty property="email" name="addrBook"/>
	<jsp:setProperty property="gender" name="addrBook"/>
	
	<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
	<!-- application 다른 페이지에서도 쓸 수 있게 해줌 (static 기능) -->
	<%
		abDAO.addAddress(addrBook);
	%>
	<div id="container">
		<h2>등록 내용</h2>
		<hr>
		<p> 이름 : <%=addrBook.getUsername() %>
		<p> 연락처 : <%=addrBook.getTel() %>
		<p> 이메일 : <%=addrBook.getEmail() %>
		<p> 성별 : <%=addrBook.getGender() %>
		<hr>
		<p><a href="addrList.jsp">목록 보기</a>
	</div>
	
</body>
</html>