<%-- <%@page import="com.jweb.board.Board"%> --%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<%
	String sessionId =null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String)session.getAttribute("sessionId");
	} 
%>
	<jsp:include page="menu.jsp"/>
	<jsp:useBean id="board" class="com.jweb.board.Board"/>
	<jsp:useBean id="boardDAO" class="com.jweb.board.BoardDAO" scope="application"/>
<body>
	<div id="container">
		<div class="title">
			<h1>게시글 목록</h1>
		</div>
		<table id="table__board">
			<tr>
				<th style="width: 60px">번호</th>
				<th style="width: 300px">제목</th>
				<th style="width: 110px">작성자</th>
				<th style="width: 115px">등록일</th>
			</tr>
			<% 
				 for(int i=0;i<boardDAO.getBoardList().size();i++){
					board = boardDAO.getBoardList().get(i);
				/* for(Board board : boardDAO.getAllList()){ */
			%>
			<tr class="table__board-tr">
				<td class="table__board-tr"><%=board.getBnum() %></td>
				<td class="table__board-tr"><a href="boardView.jsp?bnum=<%=board.getBnum()%>" style="text-decoration: none; color: black;"><%=board.getTitle() %></a></td>
				<td class="table__board-tr"><%=board.getMemberId()%></td>
				<td class="table__board-tr"><%=board.getRegDate() %></td>
			</tr>
			<% } %>
			<tr>
				<td colspan="4"><a href="boardWriteForm.jsp"><input type="button" value="글쓰기"></a></td>
			</tr>
		</table>
	</div>
</body>
</html>