<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠키 생성</title>
</head>
<body>
	<form action="cookieProcess.jsp" method="post">
		<p>
			<label for="id">아이디</label>
			<input type="text" name="id">
		</p>
		<p>
			<label for="passwd">비밀번호</label>
			<input type="password" name="passwd">
		</p>
		<input type="submit" value="전송">
	</form>
</body>
</html>