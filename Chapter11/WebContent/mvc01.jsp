<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MVC 예제</title>
<!-- http://localhost:8081/Chapter11/mvc01.jsp?num=2 테스트 할 때 -->
</head>
<%	
	/* 컨트롤러 controller */
	int num = 0;
	if(request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
	} else if (request.getParameter("num") == null){
		num = 0;
	}
	String result = "";
	if(num%2 != 0)
		result = "홀수";
	else
		result = "짝수";
%>
<!-- 뷰 view -->
<body>
	<!-- 모델 model - 데이터 -->
	<p><%=result %> 입니다.</p>
</body>
</html>