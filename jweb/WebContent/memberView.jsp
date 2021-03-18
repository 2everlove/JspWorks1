<%-- <%@page import="com.jweb.Member"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="menu.jsp"/>
<%
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
<title>${member.memberId}님의 상세보기</title>
<style type="text/css">
	input{text-align: center;}
</style>
</head>
<body>
	<div id="container">
		<div class="title">
			<h1>상세 보기</h1>
		</div>
		<form action="memberUpdate.do?memberId=${member.memberId}" method="post">
			<table>
				<tr>
					<th colspan="2" id="memberForm__table-FstColumn">${member.memberId} (<span style="color: blue;">${member.name}</span>님)</th>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" value="${member.memberId}" disabled></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="passwd" value="${member.passwd}" disabled></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" name="passwd_confirm" placeholder="passwd_confirm"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${member.name}" disabled></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:if test="${member.gender eq '남'}">
							<label><input type="radio" name="gender" value="남" checked disabled>남</label>
							<label><input type="radio" name="gender" value="여" disabled>여</label>
						</c:if>
						<c:if test="${member.gender eq '여'}">
							<label><input type="radio" name="gender" value="남" disabled>남</label>
							<label><input type="radio" name="gender" value="여" checked disabled>여</label>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="text" name="joinDate" value="${member.joinDate}" disabled></td>
				</tr>
				<tr>
					<th>작성글 수</th>
					<td> ${boardNum} <a href="boardListOne.jsp?memberId=${member.memberId}" style="text-decoration: none;">[자세히 보기]</a></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" value="수정" onclick="checkForm">
					<a href="memberDelete.do?memberId=${member.memberId}" onclick="return confirm('탈퇴하시겠습니까?')"><input type="button" value="탈퇴"></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>