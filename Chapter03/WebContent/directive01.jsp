<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive Tag</title>
</head>
<body>
	<%!
		//배열을 생성하고 출력하기
		int[] iArr = {1,2,3,10,200};
	%>
	<% out.println(Arrays.toString(iArr)+"<br>"); %>
	<%=Arrays.toString(iArr)%>
</body>
</html>