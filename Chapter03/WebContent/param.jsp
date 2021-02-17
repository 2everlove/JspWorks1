<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Action Tag</title>
</head>
<body>
	<h2>param 액션 태그</h2>
	<jsp:forward page="param_data.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param value="1234" name="psw"/>
	</jsp:forward>
</body>
</html>