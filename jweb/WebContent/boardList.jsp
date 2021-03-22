<%-- <%@page import="com.jweb.board.Board"%> --%>
<!-- 작성자 클릭시 팝업 - 작성한 글 보기, 회원 정보 보기(같은 세션 아이디 일때) -->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board List</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<c:if test="${alert=='update'}">
		<script type="text/javascript">
			alert("게시물이 수정되었습니다.");
			location.href="boardList.do"
		</script>
	</c:if>
	<jsp:include page="menu.jsp"/>
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
			<c:forEach var="board" items="${boardList}">			
				<tr class="table__board-tr">
					<td class="table__board-tr">${board.bnum}</td>
					<td class="table__board-tr"><a href="boardView.do?bnum=${board.bnum}" style="text-decoration: none; color: black;">${board.title}</a></td>
					<td class="table__board-tr">
						<div class="dropdown"><button class="dropbtn">${board.memberId}</button>
							<div class="dropdown-content" style="left:0; border: 1px solid black;">
								<a href="memberView.do?memberId=${board.memberId}">${board.memberId}님의<br>정보 보기</a>
								<a href="boardListOne.do?memberId=${board.memberId}">${board.memberId}님의<br>작성글 보기</a>
							</div>
						</div>
					</td>
					<td class="table__board-tr"><fmt:formatDate value="${board.regDate}" pattern="MM.dd"/> </td>
					<td class="table__board-tr"><fmt:formatNumber value="${board.hit}"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><a href="boardWriteForm.do"><input type="button" value="글쓰기"></a></td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>