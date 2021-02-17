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
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("userid");
		String psw = request.getParameter("psw");
		
		final String ID = "admin";
		final String PW = "0000";
		
		if(id.equals(ID)&&psw.equals(PW))
			response.sendRedirect("Sucess.jsp");
		else
			response.sendRedirect("Fail.jsp");
	%>
	<p>아이디 : <%=id %>
	<p>비밀번호 : <%=psw %>
</body>
</html>