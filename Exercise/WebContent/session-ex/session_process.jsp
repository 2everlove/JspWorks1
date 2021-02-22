<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.catalina.filters.SetCharacterEncodingFilter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		//로그인 체크
		if(id.equals("admin") && pwd.equals("0000")){
			session.setAttribute("userID", id);
			response.sendRedirect("welcome.jsp");
		} else {
			out.println("<script>");
			out.println("alert('아이디나 비밀번호 일치하지 않습니다')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
			
	%>
</body>
</html>