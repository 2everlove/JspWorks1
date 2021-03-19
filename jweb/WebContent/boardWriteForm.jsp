<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기 양식</title>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript" src="resources/js/checkBoard.js"></script>
</head>
<body>
	<c:if test="${empty sessionId}">
		<script type="text/javascript">
			alert('로그인을 해주세요.');
			location.href = "loginForm.do";
		</script>
	</c:if>
	<jsp:include page="menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>글쓰기</h1>
		</div>
		<form name ="writeForm" action="boardWriteAdd.do" method="post">
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
						<a href="boardList.jsp"><input type="button" value="목록"></a>
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>