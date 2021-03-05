<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href=css/address.css>
</head>
<body>

	<div id="container">
		<h2>로그인</h2>
		<hr>
		<form action="loginProcess.jsp" method="post">
			<table>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" maxlength=30 size=20 autofocus="autofocus"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>