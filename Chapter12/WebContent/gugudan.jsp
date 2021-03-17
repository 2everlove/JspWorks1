<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>gugudan</title>
<style type="text/css">
	*{text-align: center;}
	table{width: 700px; margin: 0 auto;}
	table,td{border: 1px solid black; border-collapse: collapse;}
</style>
</head>
<body>
	<h2>구구단</h2>
	<table>
	<%	int j=2;
		for(int i=1; i<10; i++) { %>
		<tr>
	<% 		for(j=2;j<10; j++) {%>
			<td><%= j+"x"+i+"="+(i*j)%></td>
	<%		} %>
		</tr>
	<% } %>
	
	</table>
</body>
</html>