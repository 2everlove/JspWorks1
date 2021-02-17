<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>
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
	<h2>param 액션 태그</h2>
	<jsp:include page="param2_data.jsp">
		<jsp:param value='<%=URLEncoder.encode("오늘의 날짜와 시간") %>' name="title"/>
		<jsp:param value="<%=Calendar.getInstance().getTime() %>" name="date"/>
	</jsp:include>
</body>
</html>