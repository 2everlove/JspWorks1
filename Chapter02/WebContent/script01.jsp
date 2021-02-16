<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그 예제</title>
</head>
<body>
	<!-- 0부터 10까지의 짝수 출력 /소스보기에서 안보이는 이유는 톰캣서버에서 처리해서 클라이언트에게 보여주므로/ -->
	<%  
		for(int i=0;i<=10; i++){
			if(i%2!=0)
				out.print(i+"<br>");
		}
	%>
</body>
</html>