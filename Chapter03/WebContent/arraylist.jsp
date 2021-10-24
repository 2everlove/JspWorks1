<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%!
		ArrayList<String> fruit = new ArrayList<String>();
	%> --%>
	<%
		ArrayList<String> fruit = new ArrayList<String>();
/* 		ArrayList<String> fruit = new ArrayList<>(); */
		fruit.add("바나나");
		fruit.add("천혜향");
		fruit.add("오렌지");
		
		for(int i=0; i<fruit.size(); i++){
			String list = fruit.get(i);
			out.println(list);
		}
		out.println("<br>");
	%>
	<p>향상 for문 출력</p>
	<%
		for(String list : fruit){
			out.println(list);
		} 
	%>
</body>
</html>