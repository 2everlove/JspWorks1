<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:useBean id="board" class="com.jweb.board.Board"/>
<!-- 자료 수집 -->
<jsp:setProperty property="*" name="board"/>
<%-- <jsp:setProperty property="bnum" name="board"/>
<jsp:setProperty property="title" name="board"/>
<jsp:setProperty property="content" name="board"/>
 --%>
<jsp:useBean id="boardDAO" class="com.jweb.board.BoardDAO" scope="application"/>
<%
	//게시글 수정 메서드 호출
	/* String title = request.getParameter("title");
	String content = request.getParameter("content");
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content); */
	int bnum = board.getBnum();
	
	/* update */
	boardDAO.updateBoard(board);
	
	//게시글 상세페이지 이동
	out.println("<script>");
	out.println("alert('게시글이 수정되었습니다.')");
	out.println("location.href='boardView.jsp?bnum="+bnum+"'");
	out.println("</script>");
%>
</head>
<body>
</body>
</html>