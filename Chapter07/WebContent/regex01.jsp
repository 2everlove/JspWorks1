<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 폼</title>
</head>
<script type="text/javascript" src="js/regex.js">
</script>
<body>
	<div id="container">
		<form name ="Member" action="joinProcess.jsp" method="post">
			<p>
				<label for="id">아이디</label>
				<input type="text" name="userid" autofocus="autofocus">
			</p>
			<p>
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd">
			</p>
			<p>
				<label for="name">이름</label>
				<input type="text" name="name">
			</p>
			<p>
				<label for="phone">연락처</label>
				<select name = "phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="019">019</option>
				</select>
				- <input type="text" maxlength="4" size="4" name = "phone2" onkeyup="moveOnMax(this,'phone3')">
				- <input type="text" maxlength="4" size="4" name = "phone3" id="phone3" onkeypress="press(this.form)">
			</p>
			<p>
				<input type="button" value="전송" onclick="checkMember()">
			</p>
		</form>
	</div>

</body>
</html>