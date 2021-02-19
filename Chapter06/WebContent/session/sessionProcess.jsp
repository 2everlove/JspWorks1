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
		String userID= request.getParameter("id");
		String userPW= request.getParameter("passwd");
		
		if(userID.equals("corona")&&userPW.equals("2019")){
			session.setAttribute("userID", userID); //세션 이름, 세션 값
			session.setAttribute("userPW", userPW);
			out.println("세션 설정이 성공했습니다.");
			
		} else {
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
			out.println("history.go(-1)"); //이전(실행된) 페이지로 이동 / history.back도 가능
			out.println("</script>");
		}
	%>
	
	<p><%=session.getAttribute("userID") %>님이 로그인하셨습니다.
	<p><a href="session2.jsp">세션 확인</a>
</body>
</html>