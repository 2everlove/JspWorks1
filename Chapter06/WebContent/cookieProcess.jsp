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
	<%
		String userID = request.getParameter("id");
		String userPW = request.getParameter("passwd");
		
		if(userID.equals("admin")&&userPW.equals("0000")){
										//쿠키이름, 	쿠키값
			Cookie cookieID = new Cookie("userID", userID);
			Cookie cookiePW = new Cookie("userPW", userPW);
			
			//서버-> 클라이언트로 응답
			response.addCookie(cookieID);
			response.addCookie(cookiePW);
			
			out.println("쿠키 생성이 성공했습니다.");
		} else {
			out.println("쿠기 생성이 실패했습니다.");
		}
		
	%>
</body>
</html>