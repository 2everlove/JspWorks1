<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<h3>구구단 출력하기</h3>
	<jsp:useBean id="gugu" class="ch04.com.dao.GuGuDan"></jsp:useBean>
	<jsp:setProperty property="dan" name="gugu"/>
	<jsp:setProperty property="result" name="gugu"/>
	
	<% 
		gugu.setDan(6);
	 	gugu.gugudan();
	%>
	<p> <%=gugu.getResult() %>
<%-- 	<jsp:getProperty property="result" name="gugu"/> --%>
</body>
</html>