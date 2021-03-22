<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="resources/css/style.css">

<title>${board.memberId}님의 글내용</title>
<script type="text/javascript">
	function checkForm(){
	    const form = document.boardForm;
	    const title = form.title.value;
	    const content = form.content.value
	    if(title == ""){
			alert("제목은 공백일 수 없습니다.");
			form.title.focuse();
			return false;
	    } else if (content == ""){
			alert("내용은 공백일 수 없습니다.");
			form.content.focuse();
			return false;
	    }
	    	form.submit();
	}

</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>글보기(<span style="color: blue;">${board.memberId}</span>님)</h1>
		</div>
		<div>
			<form name="boardForm" action="boardUpdate.do?bnum=${board.bnum}" method="post">
				<table class="table2">
					<tr>
						<th style="width: 80px">${board.bnum}</th>
						<td colspan="2" style="text-align: left;border-right:1px solid white; padding: 0 0"><input type="text" name="title" value="${board.title}" style="width: 400px; height: 40px; border: 1px solid white;"></td>
						<th style="border-left:1px solid white; width: 120px; text-align: right; padding-right: 25px;"><span style="font-size: 0.8em;">조회수 <fmt:formatNumber value="${board.hit}"/></span></th>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td style="border-right:1px solid white; text-align: left; width: 360px">
						<div class="dropdown"><button class="dropbtn">${board.memberId} (${member.name})</button>
							<div class="dropdown-content" style="left:0; border: 1px solid black;">
								<a href="memberView.do?memberId=${board.memberId}">${board.memberId}님의<br>정보 보기</a>
								<a href="boardListOne.do?memberId=${board.memberId}">${board.memberId}님의<br>작성글 보기</a>
							</div>
						</div>
						
						</td>
						<td colspan="2" style="text-align: right; padding-right: 25px;"><fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd a hh:mm:ss"/> </td>
					</tr>
					<tr>
						<th>글내용</th>
						<td colspan="3" style="padding: 10px 10px;"><textarea name="content" id="board__textarea" style="background-color: white; color: black;">${board.content}</textarea></td>
					</tr>
					<tr>
						<td colspan="4">
							<a href="boardList.do"><input type="button" value="목록"></a>
				<c:if test="${sessionId eq board.memberId}">
							<input type="button" value="수정" onclick="checkForm()">
							<a href="boardDelete.do?bnum=${board.bnum}" onclick="return confirm('게시글을 삭제하겠습니까?')"><input type="button" value="삭제"></a>
				</c:if>
				
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>