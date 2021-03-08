<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="abDAO" class="com.beans.AddrBookDAO" scope="application"/>
	<%-- <jsp:setProperty property="email" name="abDAO"/> --%>
	<%
		String email = request.getParameter("email");
		boolean result = abDAO.checkLogin(email);
		String userName = abDAO.nameToEmail(email);
		
		if(result)
			session.setAttribute("sessionId", email); //다른 페이지 갈 수 있는 권한 설정		
		else{
		out.println("<script>");
		out.println("alert('이메일이 일치하지 않습니다.')");
		out.println("location.href='loginForm.jsp'");
		out.println("history.go(-1)"); //로그인 페이지로 돌아감  <--(-1) 이전페이지--> 단점: 로딩이 이루어져서 짧은 간격으로 정보가 보임*/
		out.println("</script>");
		}
	%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=session.getAttribute("sessionId") %></title> 
<link rel="stylesheet" href=css/address.css>
</head>
<body>

	<div id="container">
		<h2><%=userName +"("+ session.getAttribute("sessionId") +")" %>으로 로그인 되었습니다.</h2>
		<a href="addrList.jsp" autofocus="autofocus" style="cursor: pointer;">[목록 보기]</a>
	</div>
	
</body>
</html>