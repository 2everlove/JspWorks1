<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠키 정보 가져오기</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		out.println("현재 설정된 쿠키의 개수=>" +cookies.length+"<br>");
		out.println("=================================<br>");
		for(int i=0; i<cookies.length; i++){
			out.println("쿠키의 속성 이름("+i+") ["+cookies[i].getName()+"]<br>");
			out.println("쿠키의 속성 값("+i+") ["+cookies[i].getValue()+"]<br>");
			out.println("=================================<br>");
		}
	%>
</body>
</html>