<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<!-- java -->
	<jsp:useBean id="addrBook" class="com.beans.AddrBook"/>
	<!-- set  -->
	<jsp:setProperty property="num" name="addrBook"/>
	<jsp:setProperty property="username" name="addrBook"/>
	<jsp:setProperty property="tel" name="addrBook"/>
	<jsp:setProperty property="email" name="addrBook"/>
	<jsp:setProperty property="gender" name="addrBook"/>
	<%-- <!-- get  -->
	<jsp:getProperty property="num" name="addrBook"/>
	<jsp:getProperty property="username" name="addrBook"/>
	<jsp:getProperty property="tel" name="addrBook"/>
	<jsp:getProperty property="email" name="addrBook"/>
	<jsp:getProperty property="gender" name="addrBook"/>
	<jsp:getProperty property="joinDate" name="addrBook"/> --%>
	<!-- java(DAO) -->
	<jsp:useBean id="abDAO" class="com.beans.AddrBookDAO" scope="application"/>
	
	<%
		abDAO.updateAddr(addrBook);
		response.sendRedirect("addrList.jsp");
	%>
	
	
</body>
</html>