<%@page import="java.util.Enumeration"%>
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
	<!-- request로 모든 Header(HTTP) 정보 가져오기 -->
	
	<%
		Enumeration<String> en = request.getHeaderNames();
		while(en.hasMoreElements()){ //헤더 네임을 가지고 있다면
			String headerName =  en.nextElement(); //1개씩 가져와서 헤더네임에 저장
			String headerValue = request.getHeader(headerName); // 헤더네임을 이용해서 헤더값을 가져옴
			out.println(headerName+"<br>");
			
			/* out.println(headerName+" : "+headerValue); */
	%>
		<%=headerName %> : <%=headerValue %>
	<%
		}
	%>
	
</body>
</html>