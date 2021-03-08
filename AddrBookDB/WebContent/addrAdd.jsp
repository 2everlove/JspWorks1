<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="css/address.css">
</head>
<body>
	<!-- java -->
	<jsp:useBean id="addrBook" class="com.beans.AddrBook"/>
	<!-- set // AddrBook addrBook = new AddrBook();  -->
	<jsp:setProperty property="num" name="addrBook"/>
	<jsp:setProperty property="username" name="addrBook"/>
	<jsp:setProperty property="tel" name="addrBook"/>
	<jsp:setProperty property="email" name="addrBook"/>
	<jsp:setProperty property="gender" name="addrBook"/>
	<jsp:setProperty property="joinDate" name="addrBook"/>
	<jsp:useBean id="abDAO" class="com.beans.AddrBookDAO" scope="application"/>
	
	<%
		abDAO.addAddress(addrBook);
	
		String email = request.getParameter("email");
		boolean result = abDAO.checkLogin(email);	
		
		if(result)
			session.setAttribute("sessionId", email); //다른 페이지 갈 수 있는 권한 설정		
		else{
		out.println("<script>");
		out.println("alert('이메일이 일치하지 않습니다.')");
		out.println("history.go(-1)"); //로그인 페이지로 돌아감  <--(-1) 이전페이지-->
		out.println("</script>");
		}
	%>
	
	<div id="container">
		<h2> <%=addrBook.getUsername() %>님이 등록되었습니다.</h2>
		<a href="addrList.jsp">목록 보기</a>
		
		
	</div>
	
	
</body>
</html>