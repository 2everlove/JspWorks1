<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>Welcome to World Job Friends</h1>
		</div>
		<div>
			<img alt="world job Friends" src="resources/images/worldjobfriends.png" width="200" height="100">
			<p>
			<% 
				Calendar date = new GregorianCalendar();
				int hour = date.get(Calendar.HOUR);
				int minute = date.get(Calendar.MINUTE);
				int second = date.get(Calendar.SECOND);
				String ct = "";
				if(second<10)
					ct = hour + ":" + minute + ":0" + second;
				else
					ct = hour + ":" + minute + ":" + second;
				out.println("현재 접속 시각 : "+ct);
				response.setIntHeader("Refresh", 5);
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>