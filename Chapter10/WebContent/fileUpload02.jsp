<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파일 업로드 예제</title>
</head>
<body>
	<form action="fileUpload02_process.jsp" method="post" enctype="multipart/form-data">
		<p>이 름1 : <input type="text" name="name1">
		<p>제 목1 : <input type="text" name="title1">
		<p>파 일1 : <input type="file" name="fileName1"></p>
		
		<p>이 름2 : <input type="text" name="name2">
		<p>제 목2 : <input type="text" name="title2">
		<p>파 일2 : <input type="file" name="fileName2"></p>
		
		<p>이 름3 : <input type="text" name="name3">
		<p>제 목3 : <input type="text" name="title3">
		<p>파 일3 : <input type="file" name="fileName3"></p>
		<p><input type="submit" value="파일올리기">	
	</form>
</body>
</html>