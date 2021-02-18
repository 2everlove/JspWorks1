<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form Processing</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String mail = request.getParameter("mail");
	%>
	
	<p>아이디 : <%=name %><br>
		주소 : <%=address %><br>
		이메일 : <%=mail %></p>
</body>
</html>