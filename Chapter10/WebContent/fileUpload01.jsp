<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파일 업로드</title>
</head>
<body>
	<form action="fileUpload01_process.jsp" method="post" enctype="multipart/form-data">
		<p>이 름 : <input type="text" name="name">
		<p>제 목 : <input type="text" name="title">
		<p>파 일 : <input type="file" name="fileName">
		<p><input type="submit" value="파일올리기">		
	</form>
</body>
</html>