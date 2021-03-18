<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:useBean id="board" class="com.jweb.board.Board"/>
<jsp:setProperty property="bnum" name="board"/>
<jsp:setProperty property="title" name="board"/>
<jsp:setProperty property="content" name="board"/>
<jsp:setProperty property="regDate" name="board"/>
<jsp:setProperty property="memberId" name="board"/>

<jsp:useBean id="boardDAO" class="com.jweb.board.BoardDAO" scope="application"/>
<%
	//게시글 추가 메서드 호출
	/* String title = request.getParameter("title");
	String content = request.getParameter("content");
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setMemberId(sessionId); */
	
	String sessionId = (String)session.getAttribute("sessionId");
	board.setMemberId(sessionId);
	boardDAO.insertBoard(board);
	response.sendRedirect("boardList.jsp");
%>
</head>
<body>
</body>
</html>