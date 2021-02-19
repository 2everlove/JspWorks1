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
	<h3>구구단 출력하기</h3>
	<%	
		int dan = 4;
		/* for(int i=0; i<10; i++){
			out.println(dan+"*"+i+"="+dan*i+"<br>");
		} */
	%>
	<jsp:useBean id="gugu" class="ch04.com.dao.GuGuDan"></jsp:useBean>
	<jsp:setProperty property="result" name="gugu"/>
	
	<% 
	
		int d = Integer.parseInt(request.getParameter("dan"));
	 	
		for(String s: gugu.gugudan(d)){
			out.println(s);
		}
		
	 	/* gugu.showResult(); */
	%>
	<%-- <p> <%=gugu.getResult() %> --%>
 	<%-- <jsp:getProperty property="result" name="gugu"/> --%> 
</body>
</html>