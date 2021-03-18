<%@page import="com.bean.LoginBean"%>
<%@ page import="com.beans.LoginBean" %>
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
		LoginBean login = new LoginBean();
	
		String userid = request.getParameter("userid");
		String psw = request.getParameter("psw");
		
		login.setUserid(userid);
		login.setPsw(psw);
		/* login.setUserid(request.getParameter("userid"));
		login.setPsw(request.getParameter("psw")); */
		if(login.checkUser())
			out.println("<h3>로그인 성공</h3><p>아이디 : "+login.getUserid()+"<br>비밀번호 : "+login.getPsw());
		else
			out.println("<h3>로그인 실패</h3><br><a href='loginForm.html'>이전화면 돌아가기</a>");
	%>
<%-- 	<p>아이디 : <%=login.getUserid() %>
	<p>비밀번호 : <%=login.getPsw() %> --%>
</body>
</html>