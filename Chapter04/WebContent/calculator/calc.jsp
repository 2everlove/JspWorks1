<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>calculator</title>
<link rel="stylesheet" href="calc.css">
</head>
<body>
	<div id="container">
		<h2>계산기</h2>
		<hr>
		<form action="result.jsp" method="post" name="form1">
			<input type="text" name="num1" autofocus="autofocus">
			<select name="op">
				<option>+</option>
				<option>-</option>
				<option>x</option>
				<option>/</option>
			</select>
			<input type="text" name="num2">
			<input type="submit" value="계산">
			<input type="reset" value="초기화">
		</form>
	</div>
</body>
</html>