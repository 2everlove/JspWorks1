<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿼리 스트링 예제</title>
</head>
<body>
	<%
		//String param = request.getParameter("cnt");
		int cnt = 10;
		//if(param!=null){
		if(request.getParameter("cnt")!=null){
			//cnt = Integer.parseInt(param);
			cnt = Integer.parseInt(request.getParameter("cnt"));
		}
		for(int i=0; i<cnt; i++){
			out.println("Hello~ JSP <br>");
		}
		
	%>
</body>
</html>