<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기 양식</title>
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
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript" src="resources/js/check.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="container">
		<div class="title">
			<h1>글쓰기</h1>
		</div>
		<form name ="writeForm" action="boardWriteProcess.jsp" method="post">
			<table class="table2">
				<tr>
					<td><input type="text" class="write__title" name="title" placeholder="글제목" required autofocus></td>
				</tr>
				<tr>
					<td><textarea name="content" placeholder="글내용"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글쓰기" onclick="checkBoard()" >
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>