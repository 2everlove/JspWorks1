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
		try{
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			
			int result = num1/num2;
			out.println(num1+"/"+ num2+" = "+ result);
		} catch (NumberFormatException e){
			/* e.printStackTrace(); */
			RequestDispatcher dispatch = request.getRequestDispatcher("tryCatchMessage.jsp");
			dispatch.forward(request, response);
		} 
		
	%>
</body>
</html>