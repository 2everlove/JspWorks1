<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주소 삭제</title>
</head>
<body>
	<jsp:useBean id="addrBook" class="com.dao.AddrBook"/>
	<jsp:setProperty property="username" name="addrBook"/>
	<jsp:setProperty property="tel" name="addrBook"/>
	<jsp:setProperty property="email" name="addrBook"/>
	<jsp:setProperty property="gender" name="addrBook"/>
	
	<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
	<%
		String username = request.getParameter("username");
		abDAO.removeAddress(username);
		response.sendRedirect("addrList.jsp");
	%>
</body>
</html>