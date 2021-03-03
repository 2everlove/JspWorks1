<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<form action="j_security_check" method="post">
		<p><input type="text" name="j_username">
		<p><input type="password" name="j_password">
		<p><input type="submit" value="로그인">
	</form>
</body>
</html>