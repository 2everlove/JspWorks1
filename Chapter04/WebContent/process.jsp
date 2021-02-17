<%@page import="org.eclipse.jdt.internal.compiler.apt.dispatch.BaseProcessingEnvImpl"%>
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
	<%
		/* 한글 인코딩 처링 */
		request.setCharacterEncoding("utf-8");
	
		/* 촘에서 넘어온 name 매개변수 전달 */
		String name = request.getParameter("name");
		out.println("이름 : "+name);
	%>
	
	<p>요청 정보 길이 : <%=request.getContentLength() %>
	<p>클라이언트 IP : <%=request.getRemoteAddr() %>
	<p>클라이언트 전송방식 : <%=request.getMethod() %>
	<p>요청 URI : <%=request.getRequestURI() %>
	<p>서버 이름 : <%=request.getServerName() %>
	<p>서버 포트 : <%=request.getServerPort() %>
</body>
</html>