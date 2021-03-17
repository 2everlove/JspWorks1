<%-- <%@page import="com.jweb.board.Board"%> --%>
<!-- 작성자 클릭시 팝업 - 작성한 글 보기, 회원 정보 보기(같은 세션 아이디 일때) -->
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
<title>Board List</title>
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
				<th class="title__title" style="width: 60px">번호</th>
				<th class="title__title" style="width: 300px">제목</th>
				<th class="title__title" style="width: 110px">작성자</th>
				<th class="title__title" style="width: 115px">등록일</th>
				<th class="title__title" style="width: 120px">조회수</th>
			</tr>
			<% 
				 for(int i=0;i<boardDAO.getBoardList().size();i++){
					board = boardDAO.getBoardList().get(i);
				/* for(Board board : boardDAO.getAllList()){ */
			%>
			<tr class="table__board-tr">
				<td class="table__board-tr"><%=board.getBnum() %></td>
				<td class="table__board-tr"><a href="boardView.jsp?bnum=<%=board.getBnum()%>" style="text-decoration: none; color: black;"><%=board.getTitle() %></a></td>
				<td class="table__board-tr">
					<div class="dropdown"><button class="dropbtn"><%=board.getMemberId()%></button>
						<div class="dropdown-content" style="left:0; border: 1px solid black;">
							<a href="memberView.jsp?memberId=<%=board.getMemberId() %>"><%=board.getMemberId()%>님의<br>정보 보기</a>
							<a href="boardListOne.jsp?memberId=<%=board.getMemberId() %>"><%=board.getMemberId()%>님의<br>작성글 보기</a>
						</div>
					</div>
				</td>
				<td class="table__board-tr"><%=board.getRegDate() %></td>
				<td class="table__board-tr"><%=board.getHit() %></td>
			</tr>
			<% } %>
			<tr>
				<td colspan="5"><a href="boardWriteForm.jsp"><input type="button" value="글쓰기"></a></td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>