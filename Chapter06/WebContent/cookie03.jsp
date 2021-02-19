<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠키 삭제</title>
</head>
<body>
	<%	
		//쿠키 정보 가져오기
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++){
			//쿠키 삭제
			cookies[i].setMaxAge(0);
			
			//서버 -> 클라이언트
			response.addCookie(cookies[i]);
		}
		
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>