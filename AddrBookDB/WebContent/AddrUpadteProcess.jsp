<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정처리</title>
</head>
<body>
	<jsp:useBean id="addrBook" class="com.beans.AddrBook"/>
	<jsp:setProperty property="num" name="addrBook"/>
	<jsp:setProperty property="username" name="addrBook"/>
	<jsp:setProperty property="tel" name="addrBook"/>
	<jsp:setProperty property="email" name="addrBook"/>
	<jsp:setProperty property="gender" name="addrBook"/>
	<jsp:useBean id="abDAO" class="com.beans.AddrBookDAO" scope="application"/>
	
	<%
		abDAO.updateAddr(addrBook);
		out.println("<script>");
		out.println("alert('주소록을 수정하였습니다.')");
		out.println("location.href='addrList.jsp'");
		out.println("</script>");
	%>
</body>
</html>