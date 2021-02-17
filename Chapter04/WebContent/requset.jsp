<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Request</title>
</head>
<body>
	<form action="process.jsp" method="post">
		<p>
			<label for="name">이름</label>
			<input type="text" id="name" name="name">
		</p>
		<p>
			<input type="submit" value="등록">
		</p>
	</form>
</body>
</html>