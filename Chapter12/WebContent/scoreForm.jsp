<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>core 예제</title>
<style type="text/css">
	*{text-align: center;}
</style>
</head>
<body>
	<div id="container">
		<h2>학점 산출 프로그램</h2>
		<form action="scoreProcess.jsp" method="get">
			<p> 점수 : <input type="text" name="score"></p>
			<p><input type="submit" value="계산"></p>
		</form>
	</div>
</body>
</html>