<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="addrBook" class="com.dao.AddrBook"/>
<jsp:setProperty property="username" name="addrBook"/>
<jsp:setProperty property="tel" name="addrBook"/>
<jsp:setProperty property="email" name="addrBook"/>
<jsp:setProperty property="gender" name="addrBook"/>

<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String username = request.getParameter("username");
	addrBook = abDAO.getAbByUserName(username);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=addrBook.getUsername() %>의 주소 상세 보기</title>
<link rel="stylesheet" href="css/address.css">
</head>
<body>
	
	<div id="container">
		<h2><%=addrBook.getUsername() %>님의 정보</h2>
			<hr>
		<table>
			<tr>
				<th>이름</th>
				<td><%=addrBook.getUsername() %></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%=addrBook.getTel() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=addrBook.getEmail() %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=addrBook.getGender() %></td>
			</tr>
		</table>
		<p><a href="addrList.jsp">목록 보기</a></p>
	</div>
</body>
</html>