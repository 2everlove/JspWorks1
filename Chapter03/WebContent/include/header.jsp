<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>디렉티브 태그</title>
</head>
<body>
	<%!
		int pageCount =0; //전역변수
		
		void addCount(){ //전역메서드 (1증가)
			pageCount++;
		}
	%>
	
	<%
		addCount(); //addCount호출
	%>
	<p>이 사이틔의 방문은 <%=pageCount %> 번째 입니다.</p>
</body>
</html>