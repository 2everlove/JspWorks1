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
<jsp:useBean id="boardDAO" class="com.jweb.board.BoardDAO" scope="application"/>
<jsp:useBean id="member" class="com.jweb.member.Member"/>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>
<link rel="stylesheet" href="resources/css/style.css">
<%
	//자료 수집
	int bnum = 0;
	bnum = board.getBnum();
	/* if(request.getParameter("bnum") !=null){
		bnum = Integer.parseInt(request.getParameter("bnum"));
		} 
		Board board = boardDAO.getOneBoard(bnum); */
	
	//조회수 1증가
	boardDAO.updateHit(bnum);
		
	board = boardDAO.getOneBoard(bnum);
	member = memDAO.getOndDB(board.getMemberId());
	
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String) session.getAttribute("sessionId");
	}
%>
<title><%=board.getMemberId() %>님의 글내용</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="container">
		<div class="title">
			<h1>글보기(<span style="color: blue;"><%=member.getName() %></span>님)</h1>
		</div>
		<table class="table2">
			<tr>
				<th style="width: 80px"><%=board.getBnum() %></th>
				<td colspan="2" style="text-align: left;border-right:1px solid white;"><%=board.getTitle() %></td>
				<th style="border-left:1px solid white; width: 120px; text-align: right; padding-right: 25px;"><span style="font-size: 0.8em;">조회수 <%=board.getHit() %></span></th>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td style="border-right:1px solid white; text-align: left; width: 360px">
				<div class="dropdown"><button class="dropbtn"><%=board.getMemberId()+"("+member.getName()+")" %></button>
					<div class="dropdown-content" style="left:0; border: 1px solid black;">
						<a href="memberView.jsp?memberId=<%=board.getMemberId() %>"><%=board.getMemberId()%>님의<br>정보 보기</a>
						<a href="boardListOne.jsp?memberId=<%=board.getMemberId() %>"><%=board.getMemberId()%>님의<br>작성글 보기</a>
					</div>
				</div>
				
				</td>
				<td colspan="2" style="text-align: right; padding-right: 25px;"><%=board.getRegDate().toLocaleString() %></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3" style="padding: 10px 10px;"><textarea name="content" id="board__textarea" disabled style="background-color: white; color: black;"><%=board.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
		<%if(board.getMemberId().equals(sessionId)){ %>
					<a href="boardList.jsp"><input type="button" value="목록"></a>
					<a href="boardUpdate.jsp?bnum=<%=board.getBnum()%>"><input type="button" value="수정"></a>
					<a href="boardDelete.jsp?bnum=<%=board.getBnum()%>" onclick="return confirm('게시글을 삭제하겠습니까?')"><input type="button" value="삭제"></a>
		<%} else { %>
					<a href="boardList.jsp"><input type="button" value="목록"></a>
		<%} %>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>