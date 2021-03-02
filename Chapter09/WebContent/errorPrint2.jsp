<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오류 처리</title>
</head>
<body>
	<p>오류가 발생했습니다.<br>
	관리자에게 문의바랍니다. (admin@test.com)</p>
	<p>예외 유형 : <%=exception.getClass().getName() %>
	<p>예외 메세지 : <%=exception.getMessage().toString() %>
</body>
</html>