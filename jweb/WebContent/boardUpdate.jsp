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
<script type="text/javascript" src="resources/js/checkBoard.js"></script>
<%
	//자료 수집
	int bnum = 0;
	bnum = board.getBnum();
	/* if(request.getParameter("bnum") !=null){
		bnum = Integer.parseInt(request.getParameter("bnum"));
		} 
		Board board = boardDAO.getOneBoard(bnum); */
	board = boardDAO.getOneBoard(bnum);
	member = memDAO.getOndDB(board.getMemberId());
	
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String) session.getAttribute("sessionId");
	} else {
		out.println("<script>");
		out.println("alert('로그인을 해주세요.')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>
<title><%=board.getMemberId() %>님 글수정</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
	<div id="container">
		<div class="title">
			<h1>게시글 수정(<span style="color: blue;"><%=member.getName() %></span>님)</h1>
		</div>
		<form name ="writeForm" action="boardUpdateProcess.jsp?bnum=<%=board.getBnum() %>" method="post">
			<table class="table2">
				<tr>
					<th style="width: 120px; padding: 0 0;"><%=board.getBnum() %></th>
					<td colspan="2" style="padding: 0 0;"><input type="text" name="title" placeholder="글제목" value="<%=board.getTitle() %>" required style="width: 100%; height: 40px; border:0px; text-indent: 10px "></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td style="border-right:1px solid white; text-align: left;"><%=board.getMemberId()+"("+member.getName()+")" %></td>
					<td style="text-align: right; padding-right: 25px;"><%=board.getRegDate().toLocaleString() %></td>
				</tr>
				<tr>
					<th style="padding: 0 0;">글내용</th>
					<td colspan="2" style="padding: 10px 10px;"><textarea name="content" id="board__textarea" placeholder="글내용" autofocus><%=board.getContent() %></textarea></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" value="저장" onclick="checkBoard()" >
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>