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
	<h2>수강 신청</h2>
	<form action="register" method="post">
		<p>
			<label for="id">아이디</label>
			<input type="text" name="userid" autofocus>
		</p>
		<p>
			<label for="pwd">비밀번호</label>
			<input type="password" name="passwd">
		</p>
		<p>과목
			<label><input type="checkbox" name="subject" value="java" checked="checked">Java</label>
			<label><input type="checkbox" name="subject" value="jsp">JSP</label>
			<label><input type="checkbox" name="subject" value="spring" >Spring</label>
			<label><input type="checkbox" name="subject" value="android" >Android</label>
		</p>
		<input type="submit" value="전송하기">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>