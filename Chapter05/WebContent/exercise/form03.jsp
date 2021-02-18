<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Check Box</title>
</head>
<body>
	<form action="form03_process.jsp" method="post">
		<p>
			<label><input type="checkbox" name="fruit" value="orange" checked="checked">오렌지</label>
			<label><input type="checkbox" name="fruit" value="apple">사과</label>
			<label><input type="checkbox" name="fruit" value="banna">바나나</label>
			<button type="submit">전송</button>
		</p>
	</form>
</body>
</html>