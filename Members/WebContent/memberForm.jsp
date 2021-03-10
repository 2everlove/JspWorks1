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
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
	function checkForm() {
	    const form = document.regForm;
	    const pwd = form.passwd.value;
	    const pwd_confirm = form.passwd_confirm.value;
		if(pwd!=pwd_confirm){
		    alert("비밀번호가 같지 않습니다.");
		    pwd.focus();
		    return false;
		} else
			form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="container">
		<div class="title">
			<h1>Welcome to World Job Friends</h1>
		</div>
		<form name ="regForm" action="memberAdd.jsp" method="post">
			<table>
				<tr>
					<th colspan="2" id="memberForm__table-FstColumn">회원가입</th>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" placeholder="id" required autofocus></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" placeholder="password" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="passwd_confirm" placeholder="password check" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="남" checked>남</label>
						<label><input type="radio" name="gender" value="여">여</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="checkForm()">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>