<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>서블릿 예제</title>
</head>
<body>
	<%
		
	%>
	<form action="login2" method="post">
		<p>
			<label for="id">아이디</label>
			<input type="text" name="userid" autofocus>
		</p>
		<p>
			<label for="pwd">비밀번호</label>
			<input type="password" name="passwd">
		</p>
		<p><input type="hidden" name="phone" value="010-1234-1234"></p>
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>