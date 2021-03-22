<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="menu.jsp"/>
<title>${member.memberId}님의 상세보기</title>
<style type="text/css">
	input{text-align: center;}
</style>
</head>
<script type="text/javascript">
 function checkForm() {
     const form = document.updateForm;
     const pwd1 = form.passwd.value;
     const pwd2 = form.passwd_confirm.value;
     
     if(pwd1 == ""){
	 	alert("비밀번호는 비어있을 수 없습니다.");
	 	form.passwd.select();
	 	return false
     }else if (pwd.length<6 || pwd.length>15){
		alert("비밀번호는 비어있을 수 없습니다.");
		form.passwd.select();
		return false
     } else if (pwd2 == ""){
		 alert("비밀번호 확인을 입력해주세요.");
	 	form.passwd_confirm.select();
	 	return false
	 	
     } else if (pwd1 != pwd2){
	 	alert("비밀번호가 일치하지 않습니다.");
	 	form.passwd_confirm.select();
	 	return false
     }
     	form.submit();
 }
</script>
<body>
	<c:if test="${empty sessionId}">
	<script type="text/javascript">
		alert("로그인을 해주세요.");
		location.href="loginForm.do"
	</script>
	</c:if>
	<c:if test="${sessionId ne member.memberId}">
		alert("다른 회원의 정보를 볼 수 없습니다.");
		history.go.back();
	</c:if>
	<c:if test="${sessionId eq member.memberId}">
	<div id="container">
		<div class="title">
			<h1>상세 보기</h1>
		</div>
		<form name="updateForm" action="memberUpdate.do?memberId=${member.memberId}" method="post">
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
					<td><input type="text" name="passwd" value="${member.passwd}"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" name="passwd_confirm" placeholder="passwd_confirm"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${member.name}"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:if test="${member.gender eq '남'}">
							<label><input type="radio" name="gender" value="남" checked>남</label>
							<label><input type="radio" name="gender" value="여">여</label>
						</c:if>
						<c:if test="${member.gender eq '여'}">
							<label><input type="radio" name="gender" value="남">남</label>
							<label><input type="radio" name="gender" value="여" checked>여</label>
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
					<input type="button" value="수정" onclick="checkForm()">
					<a href="memberDelete.do?memberId=${member.memberId}" onclick="return confirm('탈퇴하시겠습니까?')"><input type="button" value="탈퇴"></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</c:if>
	<jsp:include page="footer.jsp"/>
</body>
</html>