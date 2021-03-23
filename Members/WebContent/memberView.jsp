<%-- <%@page import="com.jweb.Member"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="menu.jsp"/>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO2" scope="application"/>
<jsp:useBean id="member" class="com.jweb.member.Member"/>
<jsp:useBean id="board" class="com.jweb.board.Board"/>
<jsp:setProperty property="bnum" name="board"/>
<jsp:setProperty property="memberId" name="board"/>
<jsp:useBean id="boardDAO" class="com.jweb.board.BoardDAO" scope="application"/>
<%
	String memberId = request.getParameter("memberId");
	member = memDAO.getOndDB(memberId);
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
<title><%=member.getMemberId() %>님의 상세보기</title>
<style type="text/css">
	input{text-align: center;}
</style>
</head>
<body>
	<div id="container">
		<div class="title">
			<h1>상세 보기</h1>
		</div>
		<table>
			<tr>
				<th colspan="2" id="memberForm__table-FstColumn"><%=member.getMemberId() %> (<span style="color: blue;"><%=member.getName() %></span>님)</th>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memberId" value="<%=member.getMemberId() %>" disabled></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" value="<%=member.getPasswd() %>" disabled></td>
			</tr>
		<%-- 	<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="passwd_confirm" value="<%=member.getPasswd() %>" disabled></td>
			</tr> --%>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=member.getName() %>" disabled></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<%if (member.getGender().equals("남")){ %>
				<label><input type="radio" name="gender" value="남" checked disabled>남</label>
				<label><input type="radio" name="gender" value="여" disabled>여</label>
				<%} else if (member.getGender().equals("여")){ %>
				<label><input type="radio" name="gender" value="남" disabled>남</label>
				<label><input type="radio" name="gender" value="여" checked disabled>여</label>
				<%} %>
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><input type="text" name="joinDate" value="<%=member.getJoinDate() %>" disabled></td>
			</tr>
			<tr>
				<th>작성글 수</th>
				<td><%=boardDAO.getOneBoardList(memberId).size() %> <a href="boardListOne.jsp?memberId=<%=board.getMemberId() %>" style="text-decoration: none;">[자세히 보기]</a></td>
			</tr>
			<tr>
				<td colspan="2">
			<%
				if(member.getMemberId().equals(sessionId)){
			%>
				<a href="memberList.jsp"><input type="button" value="목록"></a>
				<a href="memberUpdate.jsp?memberId=<%=member.getMemberId()%>"><input type="button" value="수정"></a>
				<a href="memberDelete.jsp?memberId=<%=member.getMemberId()%>" onclick="return confirm('탈퇴하시겠습니까?')"><input type="button" value="탈퇴"></a>
			<% } else { %>
				<a href="memberList.jsp"><input type="button" value="목록"></a>
			<% } %>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>