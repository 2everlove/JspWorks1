<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오류 메시지</title>
</head>
<body>
	<p>잘못된 데이터가 입력되었습니다.</p>
	<p>숫자 1 : <%=request.getParameter("num1") %>
	<p>숫자 2 : <%=request.getParameter("num2") %>
</body>
</html>