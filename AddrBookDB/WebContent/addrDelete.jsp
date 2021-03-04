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
	<jsp:useBean id="abBook" class="com.beans.AddrBookDAO" scope="application"></jsp:useBean>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		abBook.remobeAddress(num);
		response.sendRedirect("addrList.jsp");
	%>
</body>
</html>