<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<jsp:useBean id="boardDAO" class="com.jweb.board.BoardDAO" scope="application"/>
<%
	//자료 수집
	int bnum = Integer.parseInt(request.getParameter("bnum"));

	//dao - delete()
	boardDAO.deleteBoard(bnum);
	
	//게시판 목록으로 이동
	out.println("<script>");
	out.println("alert('게시글이 삭제 되었습니다.')");
	out.println("location.href='memberResult.jsp'");
	out.println("</script>");
%>
<body>
</body>
</html>