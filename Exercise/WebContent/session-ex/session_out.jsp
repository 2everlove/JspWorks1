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
		/* out.println("<script>");
		out.println("alert('로그아웃되었습니다.')");
		out.println("</script>"); */
		
		session.invalidate(); //모든 세션 삭제
		
		
		response.sendRedirect("session.jsp");
	%>
</body>
</html>