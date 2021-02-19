<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<style>
	*{box-sizing: border-box;}
	#container{
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="container">
		<h2>로그인</h2>
		<hr>
		<form action="sellProduct.jsp" method="post">
			<p>
				<input type="text" name="username">
				<input type="submit" value="전송">
			</p>
		</form>
	</div>
</body>
</html>