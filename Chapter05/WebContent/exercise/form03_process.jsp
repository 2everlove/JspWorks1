<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<h2>선택한 과일</h2>
	<br>
	<%
		String[] fruit = request.getParameterValues("fruit");
		
		if(fruit == null || fruit.length==0){
			out.println("X");
		}
		else {
			for(String f : fruit){
			out.println(f.toUpperCase());
			}
		}
	%>
</body>
</html>