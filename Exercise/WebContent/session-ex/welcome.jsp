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
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String)session.getAttribute("userID");
			
		} else {
			response.sendRedirect("session_out.jsp");
		}
			
	%>
	<h3><%=session.getAttribute("userID") %>님 반갑습니다.</h3>
	<a href="session_out.jsp" onclick="alert('로그아웃되었습니다.')">로그아웃</a>
</body>
</html>